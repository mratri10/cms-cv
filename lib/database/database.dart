import 'package:drift/drift.dart';

part 'database.g.dart';

@DataClassName('ProfileRow')
class Profiles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fullName => text()();
  TextColumn get lifeMotto => text()();
  TextColumn get summary => text()();
  // We use JSON Strings to cheaply store embedded configs/arrays that don't need heavy relational linking
  TextColumn get appliedJobsStr => text()(); 
  TextColumn get personalDetailsStr => text()(); 
  TextColumn get configStr => text()(); 
}

@DataClassName('WorkExperienceRow')
class WorkExperiences extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get profileId => integer().references(Profiles, #id)();
  TextColumn get companyName => text()();
  TextColumn get phoneNumber => text()();
  TextColumn get officeImagesStr => text()();
}

@DataClassName('RoleRow')
class Roles extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get workExperienceId => integer().references(WorkExperiences, #id)();
  TextColumn get roleName => text()();
  TextColumn get supervisor => text()();
  IntColumn get salary => integer()();
  TextColumn get startDate => text()();
  TextColumn get endDate => text().nullable()();
  BoolColumn get isCurrent => boolean()();
}

@DataClassName('SkillCategoryRow')
class SkillCategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get profileId => integer().references(Profiles, #id)();
  TextColumn get categoryName => text()();
}

@DataClassName('SkillRow')
class Skills extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get categoryId => integer().references(SkillCategories, #id)();
  TextColumn get name => text()();
  TextColumn get description => text()();
  BoolColumn get isCertified => boolean()();
  TextColumn get certificateLink => text().nullable()();
  TextColumn get relatedCompanyIdsStr => text()();
}

@DataClassName('EducationHistoryRow')
class EducationHistories extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get profileId => integer().references(Profiles, #id)();
  TextColumn get schoolName => text()();
  TextColumn get major => text()();
  TextColumn get startDate => text()();
  TextColumn get endDate => text()();
}

@DriftDatabase(tables: [Profiles, WorkExperiences, Roles, SkillCategories, Skills, EducationHistories])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}
