class CvData {
  Config config;
  Profile profile;
  List<Skill> languageSkills;
  List<Skill> softSkills;
  List<Skill> hardSkills;
  List<WorkExperience> workExperience;
  List<EducationHistory> educationHistory;
  Map<String, dynamic> localization;

  CvData({
    required this.config,
    required this.profile,
    required this.languageSkills,
    required this.softSkills,
    required this.hardSkills,
    required this.workExperience,
    required this.educationHistory,
    required this.localization,
  });

  factory CvData.fromJson(Map<String, dynamic> json) {
    return CvData(
      config: Config.fromJson(json['config'] ?? {}),
      profile: Profile.fromJson(json['profile'] ?? {}),
      languageSkills:
          (json['language_skills'] as List?)
              ?.map((e) => Skill.fromJson(e))
              .toList() ??
          [],
      softSkills:
          (json['soft_skills'] as List?)
              ?.map((e) => Skill.fromJson(e))
              .toList() ??
          [],
      hardSkills:
          (json['hard_skills'] as List?)
              ?.map((e) => Skill.fromJson(e))
              .toList() ??
          [],
      workExperience:
          (json['work_experience'] as List?)
              ?.map((e) => WorkExperience.fromJson(e))
              .toList() ??
          [],
      educationHistory:
          (json['education_history'] as List?)
              ?.map((e) => EducationHistory.fromJson(e))
              .toList() ??
          [],
      localization: json['localization'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'config': config.toJson(),
      'profile': profile.toJson(),
      'language_skills': languageSkills.map((e) => e.toJson()).toList(),
      'soft_skills': softSkills.map((e) => e.toJson()).toList(),
      'hard_skills': hardSkills.map((e) => e.toJson()).toList(),
      'work_experience': workExperience.map((e) => e.toJson()).toList(),
      'education_history': educationHistory.map((e) => e.toJson()).toList(),
      'localization': localization,
    };
  }

  factory CvData.empty() {
    return CvData(
      config: Config(
        currentLanguage: 'en',
        cvFormat: 'international',
        availableFormats: ['international'],
        themeColor: '#6200EA',
        fontFamily: 'Inter',
      ),
      profile: Profile(
        fullName: '',
        appliedJobs: [],
        lifeMotto: '',
        summary: '',
        personalDetails: PersonalDetails.empty(),
      ),
      languageSkills: [],
      softSkills: [],
      hardSkills: [],
      workExperience: [],
      educationHistory: [],
      localization: {},
    );
  }
}

class Config {
  String currentLanguage;
  String cvFormat;
  List<String> availableFormats;
  String themeColor;
  String fontFamily;

  Config({
    required this.currentLanguage,
    required this.cvFormat,
    required this.availableFormats,
    required this.themeColor,
    required this.fontFamily,
  });

  factory Config.fromJson(Map<String, dynamic> json) {
    return Config(
      currentLanguage: json['current_language'] ?? 'en',
      cvFormat: json['cv_format'] ?? 'international',
      availableFormats: List<String>.from(json['available_formats'] ?? []),
      themeColor: json['theme_color'] ?? '#2196F3',
      fontFamily: json['font_family'] ?? 'Roboto',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_language': currentLanguage,
      'cv_format': cvFormat,
      'available_formats': availableFormats,
      'theme_color': themeColor,
      'font_family': fontFamily,
    };
  }
}

class Profile {
  String fullName;
  List<String> appliedJobs;
  String lifeMotto;
  String summary;
  PersonalDetails personalDetails;

  Profile({
    required this.fullName,
    required this.appliedJobs,
    required this.lifeMotto,
    required this.summary,
    required this.personalDetails,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      fullName: json['full_name'] ?? '',
      appliedJobs: List<String>.from(json['applied_jobs'] ?? []),
      lifeMotto: json['life_motto'] ?? '',
      summary: json['summary'] ?? '',
      personalDetails: PersonalDetails.fromJson(json['personal_details'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'applied_jobs': appliedJobs,
      'life_motto': lifeMotto,
      'summary': summary,
      'personal_details': personalDetails.toJson(),
    };
  }
}

class PersonalDetails {
  String birthDate;
  String gender;
  String address;
  String nationality;
  String maritalStatus;

  PersonalDetails({
    required this.birthDate,
    required this.gender,
    required this.address,
    required this.nationality,
    required this.maritalStatus,
  });

  factory PersonalDetails.fromJson(Map<String, dynamic> json) {
    return PersonalDetails(
      birthDate: json['birth_date'] ?? '',
      gender: json['gender'] ?? '',
      address: json['address'] ?? '',
      nationality: json['nationality'] ?? '',
      maritalStatus: json['marital_status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'birth_date': birthDate,
      'gender': gender,
      'address': address,
      'nationality': nationality,
      'marital_status': maritalStatus,
    };
  }

  factory PersonalDetails.empty() => PersonalDetails(
    birthDate: '',
    gender: '',
    address: '',
    nationality: '',
    maritalStatus: '',
  );
}

class Skill {
  int id;
  String name;
  String description;
  bool isCertified;
  String certificateLink;
  List<int> relatedCompanyIds;

  Skill({
    required this.id,
    required this.name,
    required this.description,
    required this.isCertified,
    required this.certificateLink,
    required this.relatedCompanyIds,
  });

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      isCertified: json['is_certified'] ?? false,
      certificateLink: json['certificate_link'] ?? '',
      relatedCompanyIds: List<int>.from(json['related_company_ids'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'is_certified': isCertified,
      'certificate_link': certificateLink,
      'related_company_ids': relatedCompanyIds,
    };
  }
}

class WorkExperience {
  int id;
  String companyName;
  String phoneNumber;
  List<String> officeImages;
  List<Role> roles;

  WorkExperience({
    required this.id,
    required this.companyName,
    required this.phoneNumber,
    required this.officeImages,
    required this.roles,
  });

  factory WorkExperience.fromJson(Map<String, dynamic> json) {
    return WorkExperience(
      id: json['id'] ?? 0,
      companyName: json['company_name'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      officeImages: List<String>.from(json['office_images'] ?? []),
      roles:
          (json['roles'] as List?)?.map((e) => Role.fromJson(e)).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company_name': companyName,
      'phone_number': phoneNumber,
      'office_images': officeImages,
      'roles': roles.map((e) => e.toJson()).toList(),
    };
  }
}

class Role {
  String roleName;
  String supervisor;
  int salary;
  String startDate;
  String? endDate;
  bool isCurrent;

  Role({
    required this.roleName,
    required this.supervisor,
    required this.salary,
    required this.startDate,
    this.endDate,
    required this.isCurrent,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      roleName: json['role_name'] ?? '',
      supervisor: json['supervisor'] ?? '',
      salary: json['salary'] ?? 0,
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'],
      isCurrent: json['is_current'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role_name': roleName,
      'supervisor': supervisor,
      'salary': salary,
      'start_date': startDate,
      'end_date': endDate,
      'is_current': isCurrent,
    };
  }
}

class EducationHistory {
  String schoolName;
  String startDate;
  String endDate;
  String major;

  EducationHistory({
    required this.schoolName,
    required this.startDate,
    required this.endDate,
    required this.major,
  });

  factory EducationHistory.fromJson(Map<String, dynamic> json) {
    return EducationHistory(
      schoolName: json['school_name'] ?? '',
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
      major: json['major'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'school_name': schoolName,
      'start_date': startDate,
      'end_date': endDate,
      'major': major,
    };
  }
}
