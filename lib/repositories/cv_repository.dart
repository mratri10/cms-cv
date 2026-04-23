import 'dart:convert';
import 'package:drift/drift.dart';
import '../models/cv_model.dart';
import '../database/database.dart';

class CvRepository {
  final AppDatabase db;

  CvRepository(this.db);

  // Singleton approach: We always read the profile at ID: 1
  Future<CvData?> loadLatestCv() async {
    final profileQuery = db.select(db.profiles)..where((t) => t.id.equals(1));
    final ProfileRow? profileRow = await profileQuery.getSingleOrNull();

    if (profileRow == null) return null;

    final data = CvData.empty();

    // 1. Rebuild Base Elements (Parsing JSON Configs)
    data.profile.fullName = profileRow.fullName;
    data.profile.lifeMotto = profileRow.lifeMotto;
    data.profile.summary = profileRow.summary;

    try {
      if (profileRow.appliedJobsStr.isNotEmpty) {
        data.profile.appliedJobs = List<String>.from(
          jsonDecode(profileRow.appliedJobsStr),
        );
      }
      if (profileRow.personalDetailsStr.isNotEmpty) {
        data.profile.personalDetails = PersonalDetails.fromJson(
          jsonDecode(profileRow.personalDetailsStr),
        );
      }
      if (profileRow.configStr.isNotEmpty) {
        data.config = Config.fromJson(jsonDecode(profileRow.configStr));
      }
    } catch (e) {
      print("Warning: JSON decode fail during Web DB load ($e)");
    }

    // 2. Rebuild Work Experience + Roles
    final works = await (db.select(
      db.workExperiences,
    )..where((t) => t.profileId.equals(1))).get();
    for (var w in works) {
      final workModel = WorkExperience(
        id: w.id,
        companyName: w.companyName,
        phoneNumber: w.phoneNumber,
        officeImages: w.officeImagesStr.isNotEmpty
            ? List<String>.from(jsonDecode(w.officeImagesStr))
            : [],
        roles: [],
      );

      final roles = await (db.select(
        db.roles,
      )..where((t) => t.workExperienceId.equals(w.id))).get();
      workModel.roles = roles
          .map(
            (r) => Role(
              roleName: r.roleName,
              supervisor: r.supervisor,
              salary: r.salary,
              startDate: r.startDate,
              endDate: r.endDate,
              isCurrent: r.isCurrent,
            ),
          )
          .toList();

      data.workExperience.add(workModel);
    }

    // 3. Rebuild Education
    final edus = await (db.select(
      db.educationHistories,
    )..where((t) => t.profileId.equals(1))).get();
    data.educationHistory = edus
        .map(
          (e) => EducationHistory(
            schoolName: e.schoolName,
            major: e.major,
            startDate: e.startDate,
            endDate: e.endDate,
          ),
        )
        .toList();

    // 4. Rebuild Skills
    final allSkills = await db.select(db.skills).get();

    data.languageSkills = allSkills
        .where((s) => s.categoryId == 0)
        .map(
          (s) => Skill(
            id: s.id,
            name: s.name,
            description: s.description,
            isCertified: s.isCertified,
            certificateLink: s.certificateLink ?? '',
            relatedCompanyIds: s.relatedCompanyIdsStr.isNotEmpty
                ? List<int>.from(jsonDecode(s.relatedCompanyIdsStr))
                : [],
          ),
        )
        .toList();

    data.hardSkills = allSkills
        .where((s) => s.categoryId == 1)
        .map(
          (s) => Skill(
            id: s.id,
            name: s.name,
            description: s.description,
            isCertified: s.isCertified,
            certificateLink: s.certificateLink ?? '',
            relatedCompanyIds: s.relatedCompanyIdsStr.isNotEmpty
                ? List<int>.from(jsonDecode(s.relatedCompanyIdsStr))
                : [],
          ),
        )
        .toList();

    data.softSkills = allSkills
        .where((s) => s.categoryId == 2)
        .map(
          (s) => Skill(
            id: s.id,
            name: s.name,
            description: s.description,
            isCertified: s.isCertified,
            certificateLink: s.certificateLink ?? '',
            relatedCompanyIds: s.relatedCompanyIdsStr.isNotEmpty
                ? List<int>.from(jsonDecode(s.relatedCompanyIdsStr))
                : [],
          ),
        )
        .toList();

    return data;
  }

  Future<void> saveCvData(CvData data) async {
    // Utilize Wasm local transaction locking to ensure if multiple saves trigger, we don't corrupt RAM mapping
    await db.transaction(() async {
      // CLEAR EVERYTHING for singleton operation (Profile ID 1 constraint)
      await db.delete(db.skills).go();
      await db.delete(db.educationHistories).go();
      await db.delete(db.roles).go();
      await db.delete(db.workExperiences).go();
      await db.delete(db.profiles).go();

      // INSERT Priority Root Node
      await db
          .into(db.profiles)
          .insert(
            ProfilesCompanion.insert(
              id: const Value(1),
              fullName: data.profile.fullName,
              lifeMotto: data.profile.lifeMotto,
              summary: data.profile.summary,
              appliedJobsStr: jsonEncode(data.profile.appliedJobs),
              personalDetailsStr: jsonEncode(
                data.profile.personalDetails.toJson(),
              ),
              configStr: jsonEncode(data.config.toJson()),
            ),
          );

      // RELATIONAL INSERT Work Experiences -> Roles
      for (var work in data.workExperience) {
        final workId = await db
            .into(db.workExperiences)
            .insert(
              WorkExperiencesCompanion.insert(
                profileId: 1,
                companyName: work.companyName,
                phoneNumber: work.phoneNumber,
                officeImagesStr: jsonEncode(work.officeImages),
              ),
            );

        for (var role in work.roles) {
          await db
              .into(db.roles)
              .insert(
                RolesCompanion.insert(
                  workExperienceId: workId,
                  roleName: role.roleName,
                  supervisor: role.supervisor,
                  salary: role.salary,
                  startDate: role.startDate,
                  endDate: Value(role.endDate),
                  isCurrent: role.isCurrent,
                ),
              );
        }
      }

      // RELATIONAL INSERT Education
      for (var edu in data.educationHistory) {
        await db
            .into(db.educationHistories)
            .insert(
              EducationHistoriesCompanion.insert(
                profileId: 1,
                schoolName: edu.schoolName,
                major: edu.major,
                startDate: edu.startDate,
                endDate: edu.endDate,
              ),
            );
      }
      var languageSkills = data.languageSkills;
      for (var skill in languageSkills) {
        await db
            .into(db.skills)
            .insert(
              SkillsCompanion.insert(
                categoryId: 0,
                name: skill.name,
                description: skill.description,
                isCertified: skill.isCertified,
                certificateLink: Value(skill.certificateLink),
                relatedCompanyIdsStr: jsonEncode(skill.relatedCompanyIds),
              ),
            );
      }
      var hardSkills = data.hardSkills;
      for (var skill in hardSkills) {
        await db
            .into(db.skills)
            .insert(
              SkillsCompanion.insert(
                categoryId: 1,
                name: skill.name,
                description: skill.description,
                isCertified: skill.isCertified,
                certificateLink: Value(skill.certificateLink),
                relatedCompanyIdsStr: jsonEncode(skill.relatedCompanyIds),
              ),
            );
      }
      var softSkills = data.softSkills;
      for (var skill in softSkills) {
        await db
            .into(db.skills)
            .insert(
              SkillsCompanion.insert(
                categoryId: 2,
                name: skill.name,
                description: skill.description,
                isCertified: skill.isCertified,
                certificateLink: Value(skill.certificateLink),
                relatedCompanyIdsStr: jsonEncode(skill.relatedCompanyIds),
              ),
            );
      }
    }); // Commit safely executed
  }
}
