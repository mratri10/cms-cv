import 'package:cms_cv/util/const.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:html' as html;
import '../models/cv_model.dart';
import '../repositories/cv_repository.dart';

class CvController extends ChangeNotifier {
  CvRepository? repository;
  CvData _data = CvData.empty();

  CvData get data => _data;

  // --- Database Persistence ---
  Future<void> initFromDb() async {
    if (repository != null) {
      final loaded = await repository!.loadLatestCv();
      if (loaded != null) {
        _data = loaded;
        notifyListeners();
      }
    }
  }

  Future<void> saveToDb() async {
    if (repository != null) {
      await repository!.saveCvData(_data);
    }
  }

  void exportBackupJson() {
    final jsonData = jsonEncode(_data.toJson());
    final bytes = utf8.encode(jsonData);
    final blob = html.Blob([bytes], 'application/json');
    final url = html.Url.createObjectUrlFromBlob(blob);

    final timestamp =
        "${DateTime.now().year}${DateTime.now().month.toString().padLeft(2, '0')}${DateTime.now().day.toString().padLeft(2, '0')}";
    final anchor = html.AnchorElement(href: url)
      ..target = 'blank'
      ..download = 'my_cv_backup_$timestamp.json';

    html.document.body?.append(anchor);
    anchor.click();
    anchor.remove();
    html.Url.revokeObjectUrl(url);
  }

  // Initialize state directly from an entire JSON payload block
  void loadFromJson(String jsonString) {
    try {
      final Map<String, dynamic> parsed = jsonDecode(jsonString);
      _data = CvData.fromJson(parsed);
      notifyListeners();
    } catch (e) {
      debugPrint("Error parsing json: $e");
    }
  }

  // --- Configuration & Profile Base ---
  void updateLanguage(String lang) {
    if (_data.config.currentLanguage != lang) {
      _data.config.currentLanguage = lang;
      notifyListeners();
    }
  }

  void updateCvFormat(String format) {
    if (_data.config.cvFormat != format) {
      _data.config.cvFormat = format;
      notifyListeners();
    }
  }

  void updateName(String newName) {
    _data.profile.fullName = newName;
    notifyListeners();
  }

  void updateMotto(String newMotto) {
    _data.profile.lifeMotto = newMotto;
    notifyListeners();
  }

  void addAppliedJob(String job) {
    if (job.trim().isNotEmpty &&
        !_data.profile.appliedJobs.contains(job.trim())) {
      _data.profile.appliedJobs.add(job.trim());
      notifyListeners();
    }
  }

  void removeAppliedJob(String job) {
    _data.profile.appliedJobs.remove(job);
    notifyListeners();
  }

  // --- Work Experience Architecture ---
  void addWorkExperience(String companyName) {
    if (companyName.trim().isNotEmpty) {
      _data.workExperience.add(
        WorkExperience(
          id: DateTime.now().millisecondsSinceEpoch, // Generate pseudo-ID
          companyName: companyName.trim(),
          phoneNumber: '',
          officeImages: [],
          roles: [],
        ),
      );
      notifyListeners();
    }
  }

  void removeWorkExperience(int index) {
    if (index >= 0 && index < _data.workExperience.length) {
      _data.workExperience.removeAt(index);
      notifyListeners();
    }
  }

  void addRole(int workIndex, String roleName, String supervisor, {bool isCurrent = true, String? endDate}) {
    if (workIndex >= 0 &&
        workIndex < _data.workExperience.length &&
        roleName.trim().isNotEmpty) {
      _data.workExperience[workIndex].roles.add(
        Role(
          roleName: roleName.trim(),
          supervisor: supervisor.trim(),
          salary: 0,
          startDate: DateTime.now().toIso8601String().split('T').first,
          endDate: endDate,
          isCurrent: isCurrent,
        ),
      );
      notifyListeners();
    }
  }

  void removeRole(int workIndex, int roleIndex) {
    if (workIndex >= 0 && workIndex < _data.workExperience.length) {
      if (roleIndex >= 0 &&
          roleIndex < _data.workExperience[workIndex].roles.length) {
        _data.workExperience[workIndex].roles.removeAt(roleIndex);
        notifyListeners();
      }
    }
  }

  void addSkill(SkillEnum category, String skillName, String description) {
    List<Skill> skillsList;
    switch (category) {
      case SkillEnum.language:
        skillsList = _data.languageSkills;
        break;
      case SkillEnum.hard:
        skillsList = _data.hardSkills;
        break;
      case SkillEnum.soft:
        skillsList = _data.softSkills;
        break;
    }

    if (skillName.trim().isNotEmpty) {
      skillsList.add(
        Skill(
          id: DateTime.now().millisecondsSinceEpoch,
          name: skillName.trim(),
          description: description.trim(),
          isCertified: false,
          certificateLink: '',
          relatedCompanyIds: [],
        ),
      );
      notifyListeners();
    }
  }

  void removeSkill(SkillEnum category, int skillIndex) {
    List<Skill> skillsList;
    switch (category) {
      case SkillEnum.language:
        skillsList = _data.languageSkills;
        break;
      case SkillEnum.hard:
        skillsList = _data.hardSkills;
        break;
      case SkillEnum.soft:
        skillsList = _data.softSkills;
        break;
    }

    if (skillIndex >= 0 && skillIndex < skillsList.length) {
      skillsList.removeAt(skillIndex);
      notifyListeners();
    }
  }

  void toggleSkillCompany(SkillEnum category, int skillIndex, int companyId) {
    List<Skill> skillsList;
    switch (category) {
      case SkillEnum.language:
        skillsList = _data.languageSkills;
        break;
      case SkillEnum.hard:
        skillsList = _data.hardSkills;
        break;
      case SkillEnum.soft:
        skillsList = _data.softSkills;
        break;
    }

    if (skillIndex >= 0 && skillIndex < skillsList.length) {
      final skill = skillsList[skillIndex];
      if (skill.relatedCompanyIds.contains(companyId)) {
        skill.relatedCompanyIds.remove(companyId);
      } else {
        skill.relatedCompanyIds.add(companyId);
      }
      notifyListeners();
    }
  }

  // --- Dynamic Updates & Validation ---
  void updateRoleSalary(int workIndex, int roleIndex, int salary) {
    _data.workExperience[workIndex].roles[roleIndex].salary = salary;
    notifyListeners();
  }

  void updateRoleDate(int workIndex, int roleIndex, bool isStart, String date) {
    if (isStart) {
      _data.workExperience[workIndex].roles[roleIndex].startDate = date;
    } else {
      _data.workExperience[workIndex].roles[roleIndex].endDate = date;
    }
    notifyListeners();
  }

  // --- Education Architecture ---
  void addEducation(String schoolName, String major) {
    if (schoolName.trim().isNotEmpty) {
      _data.educationHistory.add(
        EducationHistory(
          schoolName: schoolName.trim(),
          major: major.trim(),
          startDate: DateTime.now().toIso8601String().split('T').first,
          endDate: '',
        ),
      );
      notifyListeners();
    }
  }

  void removeEducation(int index) {
    if (index >= 0 && index < _data.educationHistory.length) {
      _data.educationHistory.removeAt(index);
      notifyListeners();
    }
  }

  void updateEducationDate(int eduIndex, bool isStart, String date) {
    if (isStart) {
      _data.educationHistory[eduIndex].startDate = date;
    } else {
      _data.educationHistory[eduIndex].endDate = date;
    }
    notifyListeners();
  }

  // --- Localization ---
  String loc(String key, {String fallback = ""}) {
    final lang = _data.config.currentLanguage;
    final map = _data.localization[lang] as Map<String, dynamic>?;
    return map?[key]?.toString() ?? fallback;
  }
}
