// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ProfilesTable extends Profiles
    with TableInfo<$ProfilesTable, ProfileRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lifeMottoMeta = const VerificationMeta(
    'lifeMotto',
  );
  @override
  late final GeneratedColumn<String> lifeMotto = GeneratedColumn<String>(
    'life_motto',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _summaryMeta = const VerificationMeta(
    'summary',
  );
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
    'summary',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _appliedJobsStrMeta = const VerificationMeta(
    'appliedJobsStr',
  );
  @override
  late final GeneratedColumn<String> appliedJobsStr = GeneratedColumn<String>(
    'applied_jobs_str',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _personalDetailsStrMeta =
      const VerificationMeta('personalDetailsStr');
  @override
  late final GeneratedColumn<String> personalDetailsStr =
      GeneratedColumn<String>(
        'personal_details_str',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _configStrMeta = const VerificationMeta(
    'configStr',
  );
  @override
  late final GeneratedColumn<String> configStr = GeneratedColumn<String>(
    'config_str',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    fullName,
    lifeMotto,
    summary,
    appliedJobsStr,
    personalDetailsStr,
    configStr,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProfileRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('life_motto')) {
      context.handle(
        _lifeMottoMeta,
        lifeMotto.isAcceptableOrUnknown(data['life_motto']!, _lifeMottoMeta),
      );
    } else if (isInserting) {
      context.missing(_lifeMottoMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(
        _summaryMeta,
        summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta),
      );
    } else if (isInserting) {
      context.missing(_summaryMeta);
    }
    if (data.containsKey('applied_jobs_str')) {
      context.handle(
        _appliedJobsStrMeta,
        appliedJobsStr.isAcceptableOrUnknown(
          data['applied_jobs_str']!,
          _appliedJobsStrMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_appliedJobsStrMeta);
    }
    if (data.containsKey('personal_details_str')) {
      context.handle(
        _personalDetailsStrMeta,
        personalDetailsStr.isAcceptableOrUnknown(
          data['personal_details_str']!,
          _personalDetailsStrMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_personalDetailsStrMeta);
    }
    if (data.containsKey('config_str')) {
      context.handle(
        _configStrMeta,
        configStr.isAcceptableOrUnknown(data['config_str']!, _configStrMeta),
      );
    } else if (isInserting) {
      context.missing(_configStrMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProfileRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProfileRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      lifeMotto: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}life_motto'],
      )!,
      summary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}summary'],
      )!,
      appliedJobsStr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}applied_jobs_str'],
      )!,
      personalDetailsStr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}personal_details_str'],
      )!,
      configStr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}config_str'],
      )!,
    );
  }

  @override
  $ProfilesTable createAlias(String alias) {
    return $ProfilesTable(attachedDatabase, alias);
  }
}

class ProfileRow extends DataClass implements Insertable<ProfileRow> {
  final int id;
  final String fullName;
  final String lifeMotto;
  final String summary;
  final String appliedJobsStr;
  final String personalDetailsStr;
  final String configStr;
  const ProfileRow({
    required this.id,
    required this.fullName,
    required this.lifeMotto,
    required this.summary,
    required this.appliedJobsStr,
    required this.personalDetailsStr,
    required this.configStr,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['full_name'] = Variable<String>(fullName);
    map['life_motto'] = Variable<String>(lifeMotto);
    map['summary'] = Variable<String>(summary);
    map['applied_jobs_str'] = Variable<String>(appliedJobsStr);
    map['personal_details_str'] = Variable<String>(personalDetailsStr);
    map['config_str'] = Variable<String>(configStr);
    return map;
  }

  ProfilesCompanion toCompanion(bool nullToAbsent) {
    return ProfilesCompanion(
      id: Value(id),
      fullName: Value(fullName),
      lifeMotto: Value(lifeMotto),
      summary: Value(summary),
      appliedJobsStr: Value(appliedJobsStr),
      personalDetailsStr: Value(personalDetailsStr),
      configStr: Value(configStr),
    );
  }

  factory ProfileRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProfileRow(
      id: serializer.fromJson<int>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      lifeMotto: serializer.fromJson<String>(json['lifeMotto']),
      summary: serializer.fromJson<String>(json['summary']),
      appliedJobsStr: serializer.fromJson<String>(json['appliedJobsStr']),
      personalDetailsStr: serializer.fromJson<String>(
        json['personalDetailsStr'],
      ),
      configStr: serializer.fromJson<String>(json['configStr']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fullName': serializer.toJson<String>(fullName),
      'lifeMotto': serializer.toJson<String>(lifeMotto),
      'summary': serializer.toJson<String>(summary),
      'appliedJobsStr': serializer.toJson<String>(appliedJobsStr),
      'personalDetailsStr': serializer.toJson<String>(personalDetailsStr),
      'configStr': serializer.toJson<String>(configStr),
    };
  }

  ProfileRow copyWith({
    int? id,
    String? fullName,
    String? lifeMotto,
    String? summary,
    String? appliedJobsStr,
    String? personalDetailsStr,
    String? configStr,
  }) => ProfileRow(
    id: id ?? this.id,
    fullName: fullName ?? this.fullName,
    lifeMotto: lifeMotto ?? this.lifeMotto,
    summary: summary ?? this.summary,
    appliedJobsStr: appliedJobsStr ?? this.appliedJobsStr,
    personalDetailsStr: personalDetailsStr ?? this.personalDetailsStr,
    configStr: configStr ?? this.configStr,
  );
  ProfileRow copyWithCompanion(ProfilesCompanion data) {
    return ProfileRow(
      id: data.id.present ? data.id.value : this.id,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      lifeMotto: data.lifeMotto.present ? data.lifeMotto.value : this.lifeMotto,
      summary: data.summary.present ? data.summary.value : this.summary,
      appliedJobsStr: data.appliedJobsStr.present
          ? data.appliedJobsStr.value
          : this.appliedJobsStr,
      personalDetailsStr: data.personalDetailsStr.present
          ? data.personalDetailsStr.value
          : this.personalDetailsStr,
      configStr: data.configStr.present ? data.configStr.value : this.configStr,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProfileRow(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('lifeMotto: $lifeMotto, ')
          ..write('summary: $summary, ')
          ..write('appliedJobsStr: $appliedJobsStr, ')
          ..write('personalDetailsStr: $personalDetailsStr, ')
          ..write('configStr: $configStr')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    fullName,
    lifeMotto,
    summary,
    appliedJobsStr,
    personalDetailsStr,
    configStr,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfileRow &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.lifeMotto == this.lifeMotto &&
          other.summary == this.summary &&
          other.appliedJobsStr == this.appliedJobsStr &&
          other.personalDetailsStr == this.personalDetailsStr &&
          other.configStr == this.configStr);
}

class ProfilesCompanion extends UpdateCompanion<ProfileRow> {
  final Value<int> id;
  final Value<String> fullName;
  final Value<String> lifeMotto;
  final Value<String> summary;
  final Value<String> appliedJobsStr;
  final Value<String> personalDetailsStr;
  final Value<String> configStr;
  const ProfilesCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.lifeMotto = const Value.absent(),
    this.summary = const Value.absent(),
    this.appliedJobsStr = const Value.absent(),
    this.personalDetailsStr = const Value.absent(),
    this.configStr = const Value.absent(),
  });
  ProfilesCompanion.insert({
    this.id = const Value.absent(),
    required String fullName,
    required String lifeMotto,
    required String summary,
    required String appliedJobsStr,
    required String personalDetailsStr,
    required String configStr,
  }) : fullName = Value(fullName),
       lifeMotto = Value(lifeMotto),
       summary = Value(summary),
       appliedJobsStr = Value(appliedJobsStr),
       personalDetailsStr = Value(personalDetailsStr),
       configStr = Value(configStr);
  static Insertable<ProfileRow> custom({
    Expression<int>? id,
    Expression<String>? fullName,
    Expression<String>? lifeMotto,
    Expression<String>? summary,
    Expression<String>? appliedJobsStr,
    Expression<String>? personalDetailsStr,
    Expression<String>? configStr,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (lifeMotto != null) 'life_motto': lifeMotto,
      if (summary != null) 'summary': summary,
      if (appliedJobsStr != null) 'applied_jobs_str': appliedJobsStr,
      if (personalDetailsStr != null)
        'personal_details_str': personalDetailsStr,
      if (configStr != null) 'config_str': configStr,
    });
  }

  ProfilesCompanion copyWith({
    Value<int>? id,
    Value<String>? fullName,
    Value<String>? lifeMotto,
    Value<String>? summary,
    Value<String>? appliedJobsStr,
    Value<String>? personalDetailsStr,
    Value<String>? configStr,
  }) {
    return ProfilesCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      lifeMotto: lifeMotto ?? this.lifeMotto,
      summary: summary ?? this.summary,
      appliedJobsStr: appliedJobsStr ?? this.appliedJobsStr,
      personalDetailsStr: personalDetailsStr ?? this.personalDetailsStr,
      configStr: configStr ?? this.configStr,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (lifeMotto.present) {
      map['life_motto'] = Variable<String>(lifeMotto.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (appliedJobsStr.present) {
      map['applied_jobs_str'] = Variable<String>(appliedJobsStr.value);
    }
    if (personalDetailsStr.present) {
      map['personal_details_str'] = Variable<String>(personalDetailsStr.value);
    }
    if (configStr.present) {
      map['config_str'] = Variable<String>(configStr.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfilesCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('lifeMotto: $lifeMotto, ')
          ..write('summary: $summary, ')
          ..write('appliedJobsStr: $appliedJobsStr, ')
          ..write('personalDetailsStr: $personalDetailsStr, ')
          ..write('configStr: $configStr')
          ..write(')'))
        .toString();
  }
}

class $WorkExperiencesTable extends WorkExperiences
    with TableInfo<$WorkExperiencesTable, WorkExperienceRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkExperiencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES profiles (id)',
    ),
  );
  static const VerificationMeta _companyNameMeta = const VerificationMeta(
    'companyName',
  );
  @override
  late final GeneratedColumn<String> companyName = GeneratedColumn<String>(
    'company_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _officeImagesStrMeta = const VerificationMeta(
    'officeImagesStr',
  );
  @override
  late final GeneratedColumn<String> officeImagesStr = GeneratedColumn<String>(
    'office_images_str',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    companyName,
    phoneNumber,
    officeImagesStr,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'work_experiences';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkExperienceRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('company_name')) {
      context.handle(
        _companyNameMeta,
        companyName.isAcceptableOrUnknown(
          data['company_name']!,
          _companyNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_companyNameMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('office_images_str')) {
      context.handle(
        _officeImagesStrMeta,
        officeImagesStr.isAcceptableOrUnknown(
          data['office_images_str']!,
          _officeImagesStrMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_officeImagesStrMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkExperienceRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkExperienceRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}profile_id'],
      )!,
      companyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company_name'],
      )!,
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_number'],
      )!,
      officeImagesStr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}office_images_str'],
      )!,
    );
  }

  @override
  $WorkExperiencesTable createAlias(String alias) {
    return $WorkExperiencesTable(attachedDatabase, alias);
  }
}

class WorkExperienceRow extends DataClass
    implements Insertable<WorkExperienceRow> {
  final int id;
  final int profileId;
  final String companyName;
  final String phoneNumber;
  final String officeImagesStr;
  const WorkExperienceRow({
    required this.id,
    required this.profileId,
    required this.companyName,
    required this.phoneNumber,
    required this.officeImagesStr,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<int>(profileId);
    map['company_name'] = Variable<String>(companyName);
    map['phone_number'] = Variable<String>(phoneNumber);
    map['office_images_str'] = Variable<String>(officeImagesStr);
    return map;
  }

  WorkExperiencesCompanion toCompanion(bool nullToAbsent) {
    return WorkExperiencesCompanion(
      id: Value(id),
      profileId: Value(profileId),
      companyName: Value(companyName),
      phoneNumber: Value(phoneNumber),
      officeImagesStr: Value(officeImagesStr),
    );
  }

  factory WorkExperienceRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkExperienceRow(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<int>(json['profileId']),
      companyName: serializer.fromJson<String>(json['companyName']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      officeImagesStr: serializer.fromJson<String>(json['officeImagesStr']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<int>(profileId),
      'companyName': serializer.toJson<String>(companyName),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'officeImagesStr': serializer.toJson<String>(officeImagesStr),
    };
  }

  WorkExperienceRow copyWith({
    int? id,
    int? profileId,
    String? companyName,
    String? phoneNumber,
    String? officeImagesStr,
  }) => WorkExperienceRow(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    companyName: companyName ?? this.companyName,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    officeImagesStr: officeImagesStr ?? this.officeImagesStr,
  );
  WorkExperienceRow copyWithCompanion(WorkExperiencesCompanion data) {
    return WorkExperienceRow(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      companyName: data.companyName.present
          ? data.companyName.value
          : this.companyName,
      phoneNumber: data.phoneNumber.present
          ? data.phoneNumber.value
          : this.phoneNumber,
      officeImagesStr: data.officeImagesStr.present
          ? data.officeImagesStr.value
          : this.officeImagesStr,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkExperienceRow(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('companyName: $companyName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('officeImagesStr: $officeImagesStr')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, profileId, companyName, phoneNumber, officeImagesStr);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkExperienceRow &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.companyName == this.companyName &&
          other.phoneNumber == this.phoneNumber &&
          other.officeImagesStr == this.officeImagesStr);
}

class WorkExperiencesCompanion extends UpdateCompanion<WorkExperienceRow> {
  final Value<int> id;
  final Value<int> profileId;
  final Value<String> companyName;
  final Value<String> phoneNumber;
  final Value<String> officeImagesStr;
  const WorkExperiencesCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.companyName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.officeImagesStr = const Value.absent(),
  });
  WorkExperiencesCompanion.insert({
    this.id = const Value.absent(),
    required int profileId,
    required String companyName,
    required String phoneNumber,
    required String officeImagesStr,
  }) : profileId = Value(profileId),
       companyName = Value(companyName),
       phoneNumber = Value(phoneNumber),
       officeImagesStr = Value(officeImagesStr);
  static Insertable<WorkExperienceRow> custom({
    Expression<int>? id,
    Expression<int>? profileId,
    Expression<String>? companyName,
    Expression<String>? phoneNumber,
    Expression<String>? officeImagesStr,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (companyName != null) 'company_name': companyName,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (officeImagesStr != null) 'office_images_str': officeImagesStr,
    });
  }

  WorkExperiencesCompanion copyWith({
    Value<int>? id,
    Value<int>? profileId,
    Value<String>? companyName,
    Value<String>? phoneNumber,
    Value<String>? officeImagesStr,
  }) {
    return WorkExperiencesCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      companyName: companyName ?? this.companyName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      officeImagesStr: officeImagesStr ?? this.officeImagesStr,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<int>(profileId.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (officeImagesStr.present) {
      map['office_images_str'] = Variable<String>(officeImagesStr.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkExperiencesCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('companyName: $companyName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('officeImagesStr: $officeImagesStr')
          ..write(')'))
        .toString();
  }
}

class $RolesTable extends Roles with TableInfo<$RolesTable, RoleRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RolesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _workExperienceIdMeta = const VerificationMeta(
    'workExperienceId',
  );
  @override
  late final GeneratedColumn<int> workExperienceId = GeneratedColumn<int>(
    'work_experience_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES work_experiences (id)',
    ),
  );
  static const VerificationMeta _roleNameMeta = const VerificationMeta(
    'roleName',
  );
  @override
  late final GeneratedColumn<String> roleName = GeneratedColumn<String>(
    'role_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _supervisorMeta = const VerificationMeta(
    'supervisor',
  );
  @override
  late final GeneratedColumn<String> supervisor = GeneratedColumn<String>(
    'supervisor',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _salaryMeta = const VerificationMeta('salary');
  @override
  late final GeneratedColumn<int> salary = GeneratedColumn<int>(
    'salary',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<String> startDate = GeneratedColumn<String>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<String> endDate = GeneratedColumn<String>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isCurrentMeta = const VerificationMeta(
    'isCurrent',
  );
  @override
  late final GeneratedColumn<bool> isCurrent = GeneratedColumn<bool>(
    'is_current',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_current" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    workExperienceId,
    roleName,
    supervisor,
    salary,
    startDate,
    endDate,
    isCurrent,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'roles';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoleRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('work_experience_id')) {
      context.handle(
        _workExperienceIdMeta,
        workExperienceId.isAcceptableOrUnknown(
          data['work_experience_id']!,
          _workExperienceIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_workExperienceIdMeta);
    }
    if (data.containsKey('role_name')) {
      context.handle(
        _roleNameMeta,
        roleName.isAcceptableOrUnknown(data['role_name']!, _roleNameMeta),
      );
    } else if (isInserting) {
      context.missing(_roleNameMeta);
    }
    if (data.containsKey('supervisor')) {
      context.handle(
        _supervisorMeta,
        supervisor.isAcceptableOrUnknown(data['supervisor']!, _supervisorMeta),
      );
    } else if (isInserting) {
      context.missing(_supervisorMeta);
    }
    if (data.containsKey('salary')) {
      context.handle(
        _salaryMeta,
        salary.isAcceptableOrUnknown(data['salary']!, _salaryMeta),
      );
    } else if (isInserting) {
      context.missing(_salaryMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('is_current')) {
      context.handle(
        _isCurrentMeta,
        isCurrent.isAcceptableOrUnknown(data['is_current']!, _isCurrentMeta),
      );
    } else if (isInserting) {
      context.missing(_isCurrentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoleRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoleRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      workExperienceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}work_experience_id'],
      )!,
      roleName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role_name'],
      )!,
      supervisor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}supervisor'],
      )!,
      salary: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}salary'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}end_date'],
      ),
      isCurrent: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_current'],
      )!,
    );
  }

  @override
  $RolesTable createAlias(String alias) {
    return $RolesTable(attachedDatabase, alias);
  }
}

class RoleRow extends DataClass implements Insertable<RoleRow> {
  final int id;
  final int workExperienceId;
  final String roleName;
  final String supervisor;
  final int salary;
  final String startDate;
  final String? endDate;
  final bool isCurrent;
  const RoleRow({
    required this.id,
    required this.workExperienceId,
    required this.roleName,
    required this.supervisor,
    required this.salary,
    required this.startDate,
    this.endDate,
    required this.isCurrent,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['work_experience_id'] = Variable<int>(workExperienceId);
    map['role_name'] = Variable<String>(roleName);
    map['supervisor'] = Variable<String>(supervisor);
    map['salary'] = Variable<int>(salary);
    map['start_date'] = Variable<String>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<String>(endDate);
    }
    map['is_current'] = Variable<bool>(isCurrent);
    return map;
  }

  RolesCompanion toCompanion(bool nullToAbsent) {
    return RolesCompanion(
      id: Value(id),
      workExperienceId: Value(workExperienceId),
      roleName: Value(roleName),
      supervisor: Value(supervisor),
      salary: Value(salary),
      startDate: Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      isCurrent: Value(isCurrent),
    );
  }

  factory RoleRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoleRow(
      id: serializer.fromJson<int>(json['id']),
      workExperienceId: serializer.fromJson<int>(json['workExperienceId']),
      roleName: serializer.fromJson<String>(json['roleName']),
      supervisor: serializer.fromJson<String>(json['supervisor']),
      salary: serializer.fromJson<int>(json['salary']),
      startDate: serializer.fromJson<String>(json['startDate']),
      endDate: serializer.fromJson<String?>(json['endDate']),
      isCurrent: serializer.fromJson<bool>(json['isCurrent']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'workExperienceId': serializer.toJson<int>(workExperienceId),
      'roleName': serializer.toJson<String>(roleName),
      'supervisor': serializer.toJson<String>(supervisor),
      'salary': serializer.toJson<int>(salary),
      'startDate': serializer.toJson<String>(startDate),
      'endDate': serializer.toJson<String?>(endDate),
      'isCurrent': serializer.toJson<bool>(isCurrent),
    };
  }

  RoleRow copyWith({
    int? id,
    int? workExperienceId,
    String? roleName,
    String? supervisor,
    int? salary,
    String? startDate,
    Value<String?> endDate = const Value.absent(),
    bool? isCurrent,
  }) => RoleRow(
    id: id ?? this.id,
    workExperienceId: workExperienceId ?? this.workExperienceId,
    roleName: roleName ?? this.roleName,
    supervisor: supervisor ?? this.supervisor,
    salary: salary ?? this.salary,
    startDate: startDate ?? this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    isCurrent: isCurrent ?? this.isCurrent,
  );
  RoleRow copyWithCompanion(RolesCompanion data) {
    return RoleRow(
      id: data.id.present ? data.id.value : this.id,
      workExperienceId: data.workExperienceId.present
          ? data.workExperienceId.value
          : this.workExperienceId,
      roleName: data.roleName.present ? data.roleName.value : this.roleName,
      supervisor: data.supervisor.present
          ? data.supervisor.value
          : this.supervisor,
      salary: data.salary.present ? data.salary.value : this.salary,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      isCurrent: data.isCurrent.present ? data.isCurrent.value : this.isCurrent,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoleRow(')
          ..write('id: $id, ')
          ..write('workExperienceId: $workExperienceId, ')
          ..write('roleName: $roleName, ')
          ..write('supervisor: $supervisor, ')
          ..write('salary: $salary, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isCurrent: $isCurrent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    workExperienceId,
    roleName,
    supervisor,
    salary,
    startDate,
    endDate,
    isCurrent,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoleRow &&
          other.id == this.id &&
          other.workExperienceId == this.workExperienceId &&
          other.roleName == this.roleName &&
          other.supervisor == this.supervisor &&
          other.salary == this.salary &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.isCurrent == this.isCurrent);
}

class RolesCompanion extends UpdateCompanion<RoleRow> {
  final Value<int> id;
  final Value<int> workExperienceId;
  final Value<String> roleName;
  final Value<String> supervisor;
  final Value<int> salary;
  final Value<String> startDate;
  final Value<String?> endDate;
  final Value<bool> isCurrent;
  const RolesCompanion({
    this.id = const Value.absent(),
    this.workExperienceId = const Value.absent(),
    this.roleName = const Value.absent(),
    this.supervisor = const Value.absent(),
    this.salary = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.isCurrent = const Value.absent(),
  });
  RolesCompanion.insert({
    this.id = const Value.absent(),
    required int workExperienceId,
    required String roleName,
    required String supervisor,
    required int salary,
    required String startDate,
    this.endDate = const Value.absent(),
    required bool isCurrent,
  }) : workExperienceId = Value(workExperienceId),
       roleName = Value(roleName),
       supervisor = Value(supervisor),
       salary = Value(salary),
       startDate = Value(startDate),
       isCurrent = Value(isCurrent);
  static Insertable<RoleRow> custom({
    Expression<int>? id,
    Expression<int>? workExperienceId,
    Expression<String>? roleName,
    Expression<String>? supervisor,
    Expression<int>? salary,
    Expression<String>? startDate,
    Expression<String>? endDate,
    Expression<bool>? isCurrent,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workExperienceId != null) 'work_experience_id': workExperienceId,
      if (roleName != null) 'role_name': roleName,
      if (supervisor != null) 'supervisor': supervisor,
      if (salary != null) 'salary': salary,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (isCurrent != null) 'is_current': isCurrent,
    });
  }

  RolesCompanion copyWith({
    Value<int>? id,
    Value<int>? workExperienceId,
    Value<String>? roleName,
    Value<String>? supervisor,
    Value<int>? salary,
    Value<String>? startDate,
    Value<String?>? endDate,
    Value<bool>? isCurrent,
  }) {
    return RolesCompanion(
      id: id ?? this.id,
      workExperienceId: workExperienceId ?? this.workExperienceId,
      roleName: roleName ?? this.roleName,
      supervisor: supervisor ?? this.supervisor,
      salary: salary ?? this.salary,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isCurrent: isCurrent ?? this.isCurrent,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (workExperienceId.present) {
      map['work_experience_id'] = Variable<int>(workExperienceId.value);
    }
    if (roleName.present) {
      map['role_name'] = Variable<String>(roleName.value);
    }
    if (supervisor.present) {
      map['supervisor'] = Variable<String>(supervisor.value);
    }
    if (salary.present) {
      map['salary'] = Variable<int>(salary.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<String>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<String>(endDate.value);
    }
    if (isCurrent.present) {
      map['is_current'] = Variable<bool>(isCurrent.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RolesCompanion(')
          ..write('id: $id, ')
          ..write('workExperienceId: $workExperienceId, ')
          ..write('roleName: $roleName, ')
          ..write('supervisor: $supervisor, ')
          ..write('salary: $salary, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isCurrent: $isCurrent')
          ..write(')'))
        .toString();
  }
}

class $SkillsTable extends Skills with TableInfo<$SkillsTable, SkillRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SkillsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCertifiedMeta = const VerificationMeta(
    'isCertified',
  );
  @override
  late final GeneratedColumn<bool> isCertified = GeneratedColumn<bool>(
    'is_certified',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_certified" IN (0, 1))',
    ),
  );
  static const VerificationMeta _certificateLinkMeta = const VerificationMeta(
    'certificateLink',
  );
  @override
  late final GeneratedColumn<String> certificateLink = GeneratedColumn<String>(
    'certificate_link',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _relatedCompanyIdsStrMeta =
      const VerificationMeta('relatedCompanyIdsStr');
  @override
  late final GeneratedColumn<String> relatedCompanyIdsStr =
      GeneratedColumn<String>(
        'related_company_ids_str',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    categoryId,
    name,
    description,
    isCertified,
    certificateLink,
    relatedCompanyIdsStr,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'skills';
  @override
  VerificationContext validateIntegrity(
    Insertable<SkillRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('is_certified')) {
      context.handle(
        _isCertifiedMeta,
        isCertified.isAcceptableOrUnknown(
          data['is_certified']!,
          _isCertifiedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_isCertifiedMeta);
    }
    if (data.containsKey('certificate_link')) {
      context.handle(
        _certificateLinkMeta,
        certificateLink.isAcceptableOrUnknown(
          data['certificate_link']!,
          _certificateLinkMeta,
        ),
      );
    }
    if (data.containsKey('related_company_ids_str')) {
      context.handle(
        _relatedCompanyIdsStrMeta,
        relatedCompanyIdsStr.isAcceptableOrUnknown(
          data['related_company_ids_str']!,
          _relatedCompanyIdsStrMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relatedCompanyIdsStrMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SkillRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SkillRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      isCertified: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_certified'],
      )!,
      certificateLink: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}certificate_link'],
      ),
      relatedCompanyIdsStr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}related_company_ids_str'],
      )!,
    );
  }

  @override
  $SkillsTable createAlias(String alias) {
    return $SkillsTable(attachedDatabase, alias);
  }
}

class SkillRow extends DataClass implements Insertable<SkillRow> {
  final int id;
  final int categoryId;
  final String name;
  final String description;
  final bool isCertified;
  final String? certificateLink;
  final String relatedCompanyIdsStr;
  const SkillRow({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.isCertified,
    this.certificateLink,
    required this.relatedCompanyIdsStr,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category_id'] = Variable<int>(categoryId);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['is_certified'] = Variable<bool>(isCertified);
    if (!nullToAbsent || certificateLink != null) {
      map['certificate_link'] = Variable<String>(certificateLink);
    }
    map['related_company_ids_str'] = Variable<String>(relatedCompanyIdsStr);
    return map;
  }

  SkillsCompanion toCompanion(bool nullToAbsent) {
    return SkillsCompanion(
      id: Value(id),
      categoryId: Value(categoryId),
      name: Value(name),
      description: Value(description),
      isCertified: Value(isCertified),
      certificateLink: certificateLink == null && nullToAbsent
          ? const Value.absent()
          : Value(certificateLink),
      relatedCompanyIdsStr: Value(relatedCompanyIdsStr),
    );
  }

  factory SkillRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SkillRow(
      id: serializer.fromJson<int>(json['id']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      isCertified: serializer.fromJson<bool>(json['isCertified']),
      certificateLink: serializer.fromJson<String?>(json['certificateLink']),
      relatedCompanyIdsStr: serializer.fromJson<String>(
        json['relatedCompanyIdsStr'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryId': serializer.toJson<int>(categoryId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'isCertified': serializer.toJson<bool>(isCertified),
      'certificateLink': serializer.toJson<String?>(certificateLink),
      'relatedCompanyIdsStr': serializer.toJson<String>(relatedCompanyIdsStr),
    };
  }

  SkillRow copyWith({
    int? id,
    int? categoryId,
    String? name,
    String? description,
    bool? isCertified,
    Value<String?> certificateLink = const Value.absent(),
    String? relatedCompanyIdsStr,
  }) => SkillRow(
    id: id ?? this.id,
    categoryId: categoryId ?? this.categoryId,
    name: name ?? this.name,
    description: description ?? this.description,
    isCertified: isCertified ?? this.isCertified,
    certificateLink: certificateLink.present
        ? certificateLink.value
        : this.certificateLink,
    relatedCompanyIdsStr: relatedCompanyIdsStr ?? this.relatedCompanyIdsStr,
  );
  SkillRow copyWithCompanion(SkillsCompanion data) {
    return SkillRow(
      id: data.id.present ? data.id.value : this.id,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      isCertified: data.isCertified.present
          ? data.isCertified.value
          : this.isCertified,
      certificateLink: data.certificateLink.present
          ? data.certificateLink.value
          : this.certificateLink,
      relatedCompanyIdsStr: data.relatedCompanyIdsStr.present
          ? data.relatedCompanyIdsStr.value
          : this.relatedCompanyIdsStr,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SkillRow(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isCertified: $isCertified, ')
          ..write('certificateLink: $certificateLink, ')
          ..write('relatedCompanyIdsStr: $relatedCompanyIdsStr')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    categoryId,
    name,
    description,
    isCertified,
    certificateLink,
    relatedCompanyIdsStr,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SkillRow &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.name == this.name &&
          other.description == this.description &&
          other.isCertified == this.isCertified &&
          other.certificateLink == this.certificateLink &&
          other.relatedCompanyIdsStr == this.relatedCompanyIdsStr);
}

class SkillsCompanion extends UpdateCompanion<SkillRow> {
  final Value<int> id;
  final Value<int> categoryId;
  final Value<String> name;
  final Value<String> description;
  final Value<bool> isCertified;
  final Value<String?> certificateLink;
  final Value<String> relatedCompanyIdsStr;
  const SkillsCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.isCertified = const Value.absent(),
    this.certificateLink = const Value.absent(),
    this.relatedCompanyIdsStr = const Value.absent(),
  });
  SkillsCompanion.insert({
    this.id = const Value.absent(),
    required int categoryId,
    required String name,
    required String description,
    required bool isCertified,
    this.certificateLink = const Value.absent(),
    required String relatedCompanyIdsStr,
  }) : categoryId = Value(categoryId),
       name = Value(name),
       description = Value(description),
       isCertified = Value(isCertified),
       relatedCompanyIdsStr = Value(relatedCompanyIdsStr);
  static Insertable<SkillRow> custom({
    Expression<int>? id,
    Expression<int>? categoryId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<bool>? isCertified,
    Expression<String>? certificateLink,
    Expression<String>? relatedCompanyIdsStr,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (isCertified != null) 'is_certified': isCertified,
      if (certificateLink != null) 'certificate_link': certificateLink,
      if (relatedCompanyIdsStr != null)
        'related_company_ids_str': relatedCompanyIdsStr,
    });
  }

  SkillsCompanion copyWith({
    Value<int>? id,
    Value<int>? categoryId,
    Value<String>? name,
    Value<String>? description,
    Value<bool>? isCertified,
    Value<String?>? certificateLink,
    Value<String>? relatedCompanyIdsStr,
  }) {
    return SkillsCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      description: description ?? this.description,
      isCertified: isCertified ?? this.isCertified,
      certificateLink: certificateLink ?? this.certificateLink,
      relatedCompanyIdsStr: relatedCompanyIdsStr ?? this.relatedCompanyIdsStr,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isCertified.present) {
      map['is_certified'] = Variable<bool>(isCertified.value);
    }
    if (certificateLink.present) {
      map['certificate_link'] = Variable<String>(certificateLink.value);
    }
    if (relatedCompanyIdsStr.present) {
      map['related_company_ids_str'] = Variable<String>(
        relatedCompanyIdsStr.value,
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SkillsCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isCertified: $isCertified, ')
          ..write('certificateLink: $certificateLink, ')
          ..write('relatedCompanyIdsStr: $relatedCompanyIdsStr')
          ..write(')'))
        .toString();
  }
}

class $EducationHistoriesTable extends EducationHistories
    with TableInfo<$EducationHistoriesTable, EducationHistoryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EducationHistoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES profiles (id)',
    ),
  );
  static const VerificationMeta _schoolNameMeta = const VerificationMeta(
    'schoolName',
  );
  @override
  late final GeneratedColumn<String> schoolName = GeneratedColumn<String>(
    'school_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _majorMeta = const VerificationMeta('major');
  @override
  late final GeneratedColumn<String> major = GeneratedColumn<String>(
    'major',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<String> startDate = GeneratedColumn<String>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<String> endDate = GeneratedColumn<String>(
    'end_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    schoolName,
    major,
    startDate,
    endDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'education_histories';
  @override
  VerificationContext validateIntegrity(
    Insertable<EducationHistoryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('school_name')) {
      context.handle(
        _schoolNameMeta,
        schoolName.isAcceptableOrUnknown(data['school_name']!, _schoolNameMeta),
      );
    } else if (isInserting) {
      context.missing(_schoolNameMeta);
    }
    if (data.containsKey('major')) {
      context.handle(
        _majorMeta,
        major.isAcceptableOrUnknown(data['major']!, _majorMeta),
      );
    } else if (isInserting) {
      context.missing(_majorMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EducationHistoryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EducationHistoryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}profile_id'],
      )!,
      schoolName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}school_name'],
      )!,
      major: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}major'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}end_date'],
      )!,
    );
  }

  @override
  $EducationHistoriesTable createAlias(String alias) {
    return $EducationHistoriesTable(attachedDatabase, alias);
  }
}

class EducationHistoryRow extends DataClass
    implements Insertable<EducationHistoryRow> {
  final int id;
  final int profileId;
  final String schoolName;
  final String major;
  final String startDate;
  final String endDate;
  const EducationHistoryRow({
    required this.id,
    required this.profileId,
    required this.schoolName,
    required this.major,
    required this.startDate,
    required this.endDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<int>(profileId);
    map['school_name'] = Variable<String>(schoolName);
    map['major'] = Variable<String>(major);
    map['start_date'] = Variable<String>(startDate);
    map['end_date'] = Variable<String>(endDate);
    return map;
  }

  EducationHistoriesCompanion toCompanion(bool nullToAbsent) {
    return EducationHistoriesCompanion(
      id: Value(id),
      profileId: Value(profileId),
      schoolName: Value(schoolName),
      major: Value(major),
      startDate: Value(startDate),
      endDate: Value(endDate),
    );
  }

  factory EducationHistoryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EducationHistoryRow(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<int>(json['profileId']),
      schoolName: serializer.fromJson<String>(json['schoolName']),
      major: serializer.fromJson<String>(json['major']),
      startDate: serializer.fromJson<String>(json['startDate']),
      endDate: serializer.fromJson<String>(json['endDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<int>(profileId),
      'schoolName': serializer.toJson<String>(schoolName),
      'major': serializer.toJson<String>(major),
      'startDate': serializer.toJson<String>(startDate),
      'endDate': serializer.toJson<String>(endDate),
    };
  }

  EducationHistoryRow copyWith({
    int? id,
    int? profileId,
    String? schoolName,
    String? major,
    String? startDate,
    String? endDate,
  }) => EducationHistoryRow(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    schoolName: schoolName ?? this.schoolName,
    major: major ?? this.major,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
  );
  EducationHistoryRow copyWithCompanion(EducationHistoriesCompanion data) {
    return EducationHistoryRow(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      schoolName: data.schoolName.present
          ? data.schoolName.value
          : this.schoolName,
      major: data.major.present ? data.major.value : this.major,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EducationHistoryRow(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('schoolName: $schoolName, ')
          ..write('major: $major, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, profileId, schoolName, major, startDate, endDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EducationHistoryRow &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.schoolName == this.schoolName &&
          other.major == this.major &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate);
}

class EducationHistoriesCompanion extends UpdateCompanion<EducationHistoryRow> {
  final Value<int> id;
  final Value<int> profileId;
  final Value<String> schoolName;
  final Value<String> major;
  final Value<String> startDate;
  final Value<String> endDate;
  const EducationHistoriesCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.schoolName = const Value.absent(),
    this.major = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
  });
  EducationHistoriesCompanion.insert({
    this.id = const Value.absent(),
    required int profileId,
    required String schoolName,
    required String major,
    required String startDate,
    required String endDate,
  }) : profileId = Value(profileId),
       schoolName = Value(schoolName),
       major = Value(major),
       startDate = Value(startDate),
       endDate = Value(endDate);
  static Insertable<EducationHistoryRow> custom({
    Expression<int>? id,
    Expression<int>? profileId,
    Expression<String>? schoolName,
    Expression<String>? major,
    Expression<String>? startDate,
    Expression<String>? endDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (schoolName != null) 'school_name': schoolName,
      if (major != null) 'major': major,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
    });
  }

  EducationHistoriesCompanion copyWith({
    Value<int>? id,
    Value<int>? profileId,
    Value<String>? schoolName,
    Value<String>? major,
    Value<String>? startDate,
    Value<String>? endDate,
  }) {
    return EducationHistoriesCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      schoolName: schoolName ?? this.schoolName,
      major: major ?? this.major,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<int>(profileId.value);
    }
    if (schoolName.present) {
      map['school_name'] = Variable<String>(schoolName.value);
    }
    if (major.present) {
      map['major'] = Variable<String>(major.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<String>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<String>(endDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EducationHistoriesCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('schoolName: $schoolName, ')
          ..write('major: $major, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProfilesTable profiles = $ProfilesTable(this);
  late final $WorkExperiencesTable workExperiences = $WorkExperiencesTable(
    this,
  );
  late final $RolesTable roles = $RolesTable(this);
  late final $SkillsTable skills = $SkillsTable(this);
  late final $EducationHistoriesTable educationHistories =
      $EducationHistoriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    profiles,
    workExperiences,
    roles,
    skills,
    educationHistories,
  ];
}

typedef $$ProfilesTableCreateCompanionBuilder =
    ProfilesCompanion Function({
      Value<int> id,
      required String fullName,
      required String lifeMotto,
      required String summary,
      required String appliedJobsStr,
      required String personalDetailsStr,
      required String configStr,
    });
typedef $$ProfilesTableUpdateCompanionBuilder =
    ProfilesCompanion Function({
      Value<int> id,
      Value<String> fullName,
      Value<String> lifeMotto,
      Value<String> summary,
      Value<String> appliedJobsStr,
      Value<String> personalDetailsStr,
      Value<String> configStr,
    });

final class $$ProfilesTableReferences
    extends BaseReferences<_$AppDatabase, $ProfilesTable, ProfileRow> {
  $$ProfilesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$WorkExperiencesTable, List<WorkExperienceRow>>
  _workExperiencesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workExperiences,
    aliasName: $_aliasNameGenerator(
      db.profiles.id,
      db.workExperiences.profileId,
    ),
  );

  $$WorkExperiencesTableProcessedTableManager get workExperiencesRefs {
    final manager = $$WorkExperiencesTableTableManager(
      $_db,
      $_db.workExperiences,
    ).filter((f) => f.profileId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _workExperiencesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $EducationHistoriesTable,
    List<EducationHistoryRow>
  >
  _educationHistoriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.educationHistories,
        aliasName: $_aliasNameGenerator(
          db.profiles.id,
          db.educationHistories.profileId,
        ),
      );

  $$EducationHistoriesTableProcessedTableManager get educationHistoriesRefs {
    final manager = $$EducationHistoriesTableTableManager(
      $_db,
      $_db.educationHistories,
    ).filter((f) => f.profileId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _educationHistoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lifeMotto => $composableBuilder(
    column: $table.lifeMotto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get appliedJobsStr => $composableBuilder(
    column: $table.appliedJobsStr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personalDetailsStr => $composableBuilder(
    column: $table.personalDetailsStr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get configStr => $composableBuilder(
    column: $table.configStr,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> workExperiencesRefs(
    Expression<bool> Function($$WorkExperiencesTableFilterComposer f) f,
  ) {
    final $$WorkExperiencesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workExperiences,
      getReferencedColumn: (t) => t.profileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkExperiencesTableFilterComposer(
            $db: $db,
            $table: $db.workExperiences,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> educationHistoriesRefs(
    Expression<bool> Function($$EducationHistoriesTableFilterComposer f) f,
  ) {
    final $$EducationHistoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.educationHistories,
      getReferencedColumn: (t) => t.profileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EducationHistoriesTableFilterComposer(
            $db: $db,
            $table: $db.educationHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lifeMotto => $composableBuilder(
    column: $table.lifeMotto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get appliedJobsStr => $composableBuilder(
    column: $table.appliedJobsStr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personalDetailsStr => $composableBuilder(
    column: $table.personalDetailsStr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get configStr => $composableBuilder(
    column: $table.configStr,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get lifeMotto =>
      $composableBuilder(column: $table.lifeMotto, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<String> get appliedJobsStr => $composableBuilder(
    column: $table.appliedJobsStr,
    builder: (column) => column,
  );

  GeneratedColumn<String> get personalDetailsStr => $composableBuilder(
    column: $table.personalDetailsStr,
    builder: (column) => column,
  );

  GeneratedColumn<String> get configStr =>
      $composableBuilder(column: $table.configStr, builder: (column) => column);

  Expression<T> workExperiencesRefs<T extends Object>(
    Expression<T> Function($$WorkExperiencesTableAnnotationComposer a) f,
  ) {
    final $$WorkExperiencesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workExperiences,
      getReferencedColumn: (t) => t.profileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkExperiencesTableAnnotationComposer(
            $db: $db,
            $table: $db.workExperiences,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> educationHistoriesRefs<T extends Object>(
    Expression<T> Function($$EducationHistoriesTableAnnotationComposer a) f,
  ) {
    final $$EducationHistoriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.educationHistories,
          getReferencedColumn: (t) => t.profileId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EducationHistoriesTableAnnotationComposer(
                $db: $db,
                $table: $db.educationHistories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProfilesTable,
          ProfileRow,
          $$ProfilesTableFilterComposer,
          $$ProfilesTableOrderingComposer,
          $$ProfilesTableAnnotationComposer,
          $$ProfilesTableCreateCompanionBuilder,
          $$ProfilesTableUpdateCompanionBuilder,
          (ProfileRow, $$ProfilesTableReferences),
          ProfileRow,
          PrefetchHooks Function({
            bool workExperiencesRefs,
            bool educationHistoriesRefs,
          })
        > {
  $$ProfilesTableTableManager(_$AppDatabase db, $ProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String> lifeMotto = const Value.absent(),
                Value<String> summary = const Value.absent(),
                Value<String> appliedJobsStr = const Value.absent(),
                Value<String> personalDetailsStr = const Value.absent(),
                Value<String> configStr = const Value.absent(),
              }) => ProfilesCompanion(
                id: id,
                fullName: fullName,
                lifeMotto: lifeMotto,
                summary: summary,
                appliedJobsStr: appliedJobsStr,
                personalDetailsStr: personalDetailsStr,
                configStr: configStr,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String fullName,
                required String lifeMotto,
                required String summary,
                required String appliedJobsStr,
                required String personalDetailsStr,
                required String configStr,
              }) => ProfilesCompanion.insert(
                id: id,
                fullName: fullName,
                lifeMotto: lifeMotto,
                summary: summary,
                appliedJobsStr: appliedJobsStr,
                personalDetailsStr: personalDetailsStr,
                configStr: configStr,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProfilesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({workExperiencesRefs = false, educationHistoriesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (workExperiencesRefs) db.workExperiences,
                    if (educationHistoriesRefs) db.educationHistories,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (workExperiencesRefs)
                        await $_getPrefetchedData<
                          ProfileRow,
                          $ProfilesTable,
                          WorkExperienceRow
                        >(
                          currentTable: table,
                          referencedTable: $$ProfilesTableReferences
                              ._workExperiencesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).workExperiencesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.profileId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (educationHistoriesRefs)
                        await $_getPrefetchedData<
                          ProfileRow,
                          $ProfilesTable,
                          EducationHistoryRow
                        >(
                          currentTable: table,
                          referencedTable: $$ProfilesTableReferences
                              ._educationHistoriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).educationHistoriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.profileId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProfilesTable,
      ProfileRow,
      $$ProfilesTableFilterComposer,
      $$ProfilesTableOrderingComposer,
      $$ProfilesTableAnnotationComposer,
      $$ProfilesTableCreateCompanionBuilder,
      $$ProfilesTableUpdateCompanionBuilder,
      (ProfileRow, $$ProfilesTableReferences),
      ProfileRow,
      PrefetchHooks Function({
        bool workExperiencesRefs,
        bool educationHistoriesRefs,
      })
    >;
typedef $$WorkExperiencesTableCreateCompanionBuilder =
    WorkExperiencesCompanion Function({
      Value<int> id,
      required int profileId,
      required String companyName,
      required String phoneNumber,
      required String officeImagesStr,
    });
typedef $$WorkExperiencesTableUpdateCompanionBuilder =
    WorkExperiencesCompanion Function({
      Value<int> id,
      Value<int> profileId,
      Value<String> companyName,
      Value<String> phoneNumber,
      Value<String> officeImagesStr,
    });

final class $$WorkExperiencesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $WorkExperiencesTable,
          WorkExperienceRow
        > {
  $$WorkExperiencesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProfilesTable _profileIdTable(_$AppDatabase db) =>
      db.profiles.createAlias(
        $_aliasNameGenerator(db.workExperiences.profileId, db.profiles.id),
      );

  $$ProfilesTableProcessedTableManager get profileId {
    final $_column = $_itemColumn<int>('profile_id')!;

    final manager = $$ProfilesTableTableManager(
      $_db,
      $_db.profiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_profileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$RolesTable, List<RoleRow>> _rolesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.roles,
    aliasName: $_aliasNameGenerator(
      db.workExperiences.id,
      db.roles.workExperienceId,
    ),
  );

  $$RolesTableProcessedTableManager get rolesRefs {
    final manager = $$RolesTableTableManager(
      $_db,
      $_db.roles,
    ).filter((f) => f.workExperienceId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_rolesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$WorkExperiencesTableFilterComposer
    extends Composer<_$AppDatabase, $WorkExperiencesTable> {
  $$WorkExperiencesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get officeImagesStr => $composableBuilder(
    column: $table.officeImagesStr,
    builder: (column) => ColumnFilters(column),
  );

  $$ProfilesTableFilterComposer get profileId {
    final $$ProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableFilterComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> rolesRefs(
    Expression<bool> Function($$RolesTableFilterComposer f) f,
  ) {
    final $$RolesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.roles,
      getReferencedColumn: (t) => t.workExperienceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RolesTableFilterComposer(
            $db: $db,
            $table: $db.roles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorkExperiencesTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkExperiencesTable> {
  $$WorkExperiencesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get officeImagesStr => $composableBuilder(
    column: $table.officeImagesStr,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProfilesTableOrderingComposer get profileId {
    final $$ProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkExperiencesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkExperiencesTable> {
  $$WorkExperiencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get officeImagesStr => $composableBuilder(
    column: $table.officeImagesStr,
    builder: (column) => column,
  );

  $$ProfilesTableAnnotationComposer get profileId {
    final $$ProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> rolesRefs<T extends Object>(
    Expression<T> Function($$RolesTableAnnotationComposer a) f,
  ) {
    final $$RolesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.roles,
      getReferencedColumn: (t) => t.workExperienceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RolesTableAnnotationComposer(
            $db: $db,
            $table: $db.roles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorkExperiencesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkExperiencesTable,
          WorkExperienceRow,
          $$WorkExperiencesTableFilterComposer,
          $$WorkExperiencesTableOrderingComposer,
          $$WorkExperiencesTableAnnotationComposer,
          $$WorkExperiencesTableCreateCompanionBuilder,
          $$WorkExperiencesTableUpdateCompanionBuilder,
          (WorkExperienceRow, $$WorkExperiencesTableReferences),
          WorkExperienceRow,
          PrefetchHooks Function({bool profileId, bool rolesRefs})
        > {
  $$WorkExperiencesTableTableManager(
    _$AppDatabase db,
    $WorkExperiencesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkExperiencesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkExperiencesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkExperiencesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> profileId = const Value.absent(),
                Value<String> companyName = const Value.absent(),
                Value<String> phoneNumber = const Value.absent(),
                Value<String> officeImagesStr = const Value.absent(),
              }) => WorkExperiencesCompanion(
                id: id,
                profileId: profileId,
                companyName: companyName,
                phoneNumber: phoneNumber,
                officeImagesStr: officeImagesStr,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int profileId,
                required String companyName,
                required String phoneNumber,
                required String officeImagesStr,
              }) => WorkExperiencesCompanion.insert(
                id: id,
                profileId: profileId,
                companyName: companyName,
                phoneNumber: phoneNumber,
                officeImagesStr: officeImagesStr,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WorkExperiencesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({profileId = false, rolesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (rolesRefs) db.roles],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (profileId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.profileId,
                                referencedTable:
                                    $$WorkExperiencesTableReferences
                                        ._profileIdTable(db),
                                referencedColumn:
                                    $$WorkExperiencesTableReferences
                                        ._profileIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (rolesRefs)
                    await $_getPrefetchedData<
                      WorkExperienceRow,
                      $WorkExperiencesTable,
                      RoleRow
                    >(
                      currentTable: table,
                      referencedTable: $$WorkExperiencesTableReferences
                          ._rolesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$WorkExperiencesTableReferences(
                            db,
                            table,
                            p0,
                          ).rolesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.workExperienceId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$WorkExperiencesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkExperiencesTable,
      WorkExperienceRow,
      $$WorkExperiencesTableFilterComposer,
      $$WorkExperiencesTableOrderingComposer,
      $$WorkExperiencesTableAnnotationComposer,
      $$WorkExperiencesTableCreateCompanionBuilder,
      $$WorkExperiencesTableUpdateCompanionBuilder,
      (WorkExperienceRow, $$WorkExperiencesTableReferences),
      WorkExperienceRow,
      PrefetchHooks Function({bool profileId, bool rolesRefs})
    >;
typedef $$RolesTableCreateCompanionBuilder =
    RolesCompanion Function({
      Value<int> id,
      required int workExperienceId,
      required String roleName,
      required String supervisor,
      required int salary,
      required String startDate,
      Value<String?> endDate,
      required bool isCurrent,
    });
typedef $$RolesTableUpdateCompanionBuilder =
    RolesCompanion Function({
      Value<int> id,
      Value<int> workExperienceId,
      Value<String> roleName,
      Value<String> supervisor,
      Value<int> salary,
      Value<String> startDate,
      Value<String?> endDate,
      Value<bool> isCurrent,
    });

final class $$RolesTableReferences
    extends BaseReferences<_$AppDatabase, $RolesTable, RoleRow> {
  $$RolesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $WorkExperiencesTable _workExperienceIdTable(_$AppDatabase db) =>
      db.workExperiences.createAlias(
        $_aliasNameGenerator(db.roles.workExperienceId, db.workExperiences.id),
      );

  $$WorkExperiencesTableProcessedTableManager get workExperienceId {
    final $_column = $_itemColumn<int>('work_experience_id')!;

    final manager = $$WorkExperiencesTableTableManager(
      $_db,
      $_db.workExperiences,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workExperienceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RolesTableFilterComposer extends Composer<_$AppDatabase, $RolesTable> {
  $$RolesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get roleName => $composableBuilder(
    column: $table.roleName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get supervisor => $composableBuilder(
    column: $table.supervisor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get salary => $composableBuilder(
    column: $table.salary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCurrent => $composableBuilder(
    column: $table.isCurrent,
    builder: (column) => ColumnFilters(column),
  );

  $$WorkExperiencesTableFilterComposer get workExperienceId {
    final $$WorkExperiencesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workExperienceId,
      referencedTable: $db.workExperiences,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkExperiencesTableFilterComposer(
            $db: $db,
            $table: $db.workExperiences,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RolesTableOrderingComposer
    extends Composer<_$AppDatabase, $RolesTable> {
  $$RolesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get roleName => $composableBuilder(
    column: $table.roleName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get supervisor => $composableBuilder(
    column: $table.supervisor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get salary => $composableBuilder(
    column: $table.salary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCurrent => $composableBuilder(
    column: $table.isCurrent,
    builder: (column) => ColumnOrderings(column),
  );

  $$WorkExperiencesTableOrderingComposer get workExperienceId {
    final $$WorkExperiencesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workExperienceId,
      referencedTable: $db.workExperiences,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkExperiencesTableOrderingComposer(
            $db: $db,
            $table: $db.workExperiences,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RolesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RolesTable> {
  $$RolesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get roleName =>
      $composableBuilder(column: $table.roleName, builder: (column) => column);

  GeneratedColumn<String> get supervisor => $composableBuilder(
    column: $table.supervisor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get salary =>
      $composableBuilder(column: $table.salary, builder: (column) => column);

  GeneratedColumn<String> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<String> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<bool> get isCurrent =>
      $composableBuilder(column: $table.isCurrent, builder: (column) => column);

  $$WorkExperiencesTableAnnotationComposer get workExperienceId {
    final $$WorkExperiencesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workExperienceId,
      referencedTable: $db.workExperiences,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkExperiencesTableAnnotationComposer(
            $db: $db,
            $table: $db.workExperiences,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RolesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RolesTable,
          RoleRow,
          $$RolesTableFilterComposer,
          $$RolesTableOrderingComposer,
          $$RolesTableAnnotationComposer,
          $$RolesTableCreateCompanionBuilder,
          $$RolesTableUpdateCompanionBuilder,
          (RoleRow, $$RolesTableReferences),
          RoleRow,
          PrefetchHooks Function({bool workExperienceId})
        > {
  $$RolesTableTableManager(_$AppDatabase db, $RolesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RolesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RolesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RolesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> workExperienceId = const Value.absent(),
                Value<String> roleName = const Value.absent(),
                Value<String> supervisor = const Value.absent(),
                Value<int> salary = const Value.absent(),
                Value<String> startDate = const Value.absent(),
                Value<String?> endDate = const Value.absent(),
                Value<bool> isCurrent = const Value.absent(),
              }) => RolesCompanion(
                id: id,
                workExperienceId: workExperienceId,
                roleName: roleName,
                supervisor: supervisor,
                salary: salary,
                startDate: startDate,
                endDate: endDate,
                isCurrent: isCurrent,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int workExperienceId,
                required String roleName,
                required String supervisor,
                required int salary,
                required String startDate,
                Value<String?> endDate = const Value.absent(),
                required bool isCurrent,
              }) => RolesCompanion.insert(
                id: id,
                workExperienceId: workExperienceId,
                roleName: roleName,
                supervisor: supervisor,
                salary: salary,
                startDate: startDate,
                endDate: endDate,
                isCurrent: isCurrent,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$RolesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({workExperienceId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (workExperienceId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.workExperienceId,
                                referencedTable: $$RolesTableReferences
                                    ._workExperienceIdTable(db),
                                referencedColumn: $$RolesTableReferences
                                    ._workExperienceIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RolesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RolesTable,
      RoleRow,
      $$RolesTableFilterComposer,
      $$RolesTableOrderingComposer,
      $$RolesTableAnnotationComposer,
      $$RolesTableCreateCompanionBuilder,
      $$RolesTableUpdateCompanionBuilder,
      (RoleRow, $$RolesTableReferences),
      RoleRow,
      PrefetchHooks Function({bool workExperienceId})
    >;
typedef $$SkillsTableCreateCompanionBuilder =
    SkillsCompanion Function({
      Value<int> id,
      required int categoryId,
      required String name,
      required String description,
      required bool isCertified,
      Value<String?> certificateLink,
      required String relatedCompanyIdsStr,
    });
typedef $$SkillsTableUpdateCompanionBuilder =
    SkillsCompanion Function({
      Value<int> id,
      Value<int> categoryId,
      Value<String> name,
      Value<String> description,
      Value<bool> isCertified,
      Value<String?> certificateLink,
      Value<String> relatedCompanyIdsStr,
    });

class $$SkillsTableFilterComposer
    extends Composer<_$AppDatabase, $SkillsTable> {
  $$SkillsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCertified => $composableBuilder(
    column: $table.isCertified,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get certificateLink => $composableBuilder(
    column: $table.certificateLink,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relatedCompanyIdsStr => $composableBuilder(
    column: $table.relatedCompanyIdsStr,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SkillsTableOrderingComposer
    extends Composer<_$AppDatabase, $SkillsTable> {
  $$SkillsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCertified => $composableBuilder(
    column: $table.isCertified,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get certificateLink => $composableBuilder(
    column: $table.certificateLink,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relatedCompanyIdsStr => $composableBuilder(
    column: $table.relatedCompanyIdsStr,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SkillsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SkillsTable> {
  $$SkillsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCertified => $composableBuilder(
    column: $table.isCertified,
    builder: (column) => column,
  );

  GeneratedColumn<String> get certificateLink => $composableBuilder(
    column: $table.certificateLink,
    builder: (column) => column,
  );

  GeneratedColumn<String> get relatedCompanyIdsStr => $composableBuilder(
    column: $table.relatedCompanyIdsStr,
    builder: (column) => column,
  );
}

class $$SkillsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SkillsTable,
          SkillRow,
          $$SkillsTableFilterComposer,
          $$SkillsTableOrderingComposer,
          $$SkillsTableAnnotationComposer,
          $$SkillsTableCreateCompanionBuilder,
          $$SkillsTableUpdateCompanionBuilder,
          (SkillRow, BaseReferences<_$AppDatabase, $SkillsTable, SkillRow>),
          SkillRow,
          PrefetchHooks Function()
        > {
  $$SkillsTableTableManager(_$AppDatabase db, $SkillsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SkillsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SkillsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SkillsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<bool> isCertified = const Value.absent(),
                Value<String?> certificateLink = const Value.absent(),
                Value<String> relatedCompanyIdsStr = const Value.absent(),
              }) => SkillsCompanion(
                id: id,
                categoryId: categoryId,
                name: name,
                description: description,
                isCertified: isCertified,
                certificateLink: certificateLink,
                relatedCompanyIdsStr: relatedCompanyIdsStr,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int categoryId,
                required String name,
                required String description,
                required bool isCertified,
                Value<String?> certificateLink = const Value.absent(),
                required String relatedCompanyIdsStr,
              }) => SkillsCompanion.insert(
                id: id,
                categoryId: categoryId,
                name: name,
                description: description,
                isCertified: isCertified,
                certificateLink: certificateLink,
                relatedCompanyIdsStr: relatedCompanyIdsStr,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SkillsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SkillsTable,
      SkillRow,
      $$SkillsTableFilterComposer,
      $$SkillsTableOrderingComposer,
      $$SkillsTableAnnotationComposer,
      $$SkillsTableCreateCompanionBuilder,
      $$SkillsTableUpdateCompanionBuilder,
      (SkillRow, BaseReferences<_$AppDatabase, $SkillsTable, SkillRow>),
      SkillRow,
      PrefetchHooks Function()
    >;
typedef $$EducationHistoriesTableCreateCompanionBuilder =
    EducationHistoriesCompanion Function({
      Value<int> id,
      required int profileId,
      required String schoolName,
      required String major,
      required String startDate,
      required String endDate,
    });
typedef $$EducationHistoriesTableUpdateCompanionBuilder =
    EducationHistoriesCompanion Function({
      Value<int> id,
      Value<int> profileId,
      Value<String> schoolName,
      Value<String> major,
      Value<String> startDate,
      Value<String> endDate,
    });

final class $$EducationHistoriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $EducationHistoriesTable,
          EducationHistoryRow
        > {
  $$EducationHistoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProfilesTable _profileIdTable(_$AppDatabase db) =>
      db.profiles.createAlias(
        $_aliasNameGenerator(db.educationHistories.profileId, db.profiles.id),
      );

  $$ProfilesTableProcessedTableManager get profileId {
    final $_column = $_itemColumn<int>('profile_id')!;

    final manager = $$ProfilesTableTableManager(
      $_db,
      $_db.profiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_profileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EducationHistoriesTableFilterComposer
    extends Composer<_$AppDatabase, $EducationHistoriesTable> {
  $$EducationHistoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get schoolName => $composableBuilder(
    column: $table.schoolName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get major => $composableBuilder(
    column: $table.major,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  $$ProfilesTableFilterComposer get profileId {
    final $$ProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableFilterComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EducationHistoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $EducationHistoriesTable> {
  $$EducationHistoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get schoolName => $composableBuilder(
    column: $table.schoolName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get major => $composableBuilder(
    column: $table.major,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProfilesTableOrderingComposer get profileId {
    final $$ProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EducationHistoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $EducationHistoriesTable> {
  $$EducationHistoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get schoolName => $composableBuilder(
    column: $table.schoolName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get major =>
      $composableBuilder(column: $table.major, builder: (column) => column);

  GeneratedColumn<String> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<String> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  $$ProfilesTableAnnotationComposer get profileId {
    final $$ProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EducationHistoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EducationHistoriesTable,
          EducationHistoryRow,
          $$EducationHistoriesTableFilterComposer,
          $$EducationHistoriesTableOrderingComposer,
          $$EducationHistoriesTableAnnotationComposer,
          $$EducationHistoriesTableCreateCompanionBuilder,
          $$EducationHistoriesTableUpdateCompanionBuilder,
          (EducationHistoryRow, $$EducationHistoriesTableReferences),
          EducationHistoryRow,
          PrefetchHooks Function({bool profileId})
        > {
  $$EducationHistoriesTableTableManager(
    _$AppDatabase db,
    $EducationHistoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EducationHistoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EducationHistoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EducationHistoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> profileId = const Value.absent(),
                Value<String> schoolName = const Value.absent(),
                Value<String> major = const Value.absent(),
                Value<String> startDate = const Value.absent(),
                Value<String> endDate = const Value.absent(),
              }) => EducationHistoriesCompanion(
                id: id,
                profileId: profileId,
                schoolName: schoolName,
                major: major,
                startDate: startDate,
                endDate: endDate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int profileId,
                required String schoolName,
                required String major,
                required String startDate,
                required String endDate,
              }) => EducationHistoriesCompanion.insert(
                id: id,
                profileId: profileId,
                schoolName: schoolName,
                major: major,
                startDate: startDate,
                endDate: endDate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EducationHistoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({profileId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (profileId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.profileId,
                                referencedTable:
                                    $$EducationHistoriesTableReferences
                                        ._profileIdTable(db),
                                referencedColumn:
                                    $$EducationHistoriesTableReferences
                                        ._profileIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$EducationHistoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EducationHistoriesTable,
      EducationHistoryRow,
      $$EducationHistoriesTableFilterComposer,
      $$EducationHistoriesTableOrderingComposer,
      $$EducationHistoriesTableAnnotationComposer,
      $$EducationHistoriesTableCreateCompanionBuilder,
      $$EducationHistoriesTableUpdateCompanionBuilder,
      (EducationHistoryRow, $$EducationHistoriesTableReferences),
      EducationHistoryRow,
      PrefetchHooks Function({bool profileId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProfilesTableTableManager get profiles =>
      $$ProfilesTableTableManager(_db, _db.profiles);
  $$WorkExperiencesTableTableManager get workExperiences =>
      $$WorkExperiencesTableTableManager(_db, _db.workExperiences);
  $$RolesTableTableManager get roles =>
      $$RolesTableTableManager(_db, _db.roles);
  $$SkillsTableTableManager get skills =>
      $$SkillsTableTableManager(_db, _db.skills);
  $$EducationHistoriesTableTableManager get educationHistories =>
      $$EducationHistoriesTableTableManager(_db, _db.educationHistories);
}
