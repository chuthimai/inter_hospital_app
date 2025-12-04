// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_record_db_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPatientRecordDbModelCollection on Isar {
  IsarCollection<PatientRecordDbModel> get patientRecordDbModels =>
      this.collection();
}

const PatientRecordDbModelSchema = CollectionSchema(
  name: r'PatientRecordDbModel',
  id: -4577667555804751938,
  properties: {
    r'createTime': PropertySchema(
      id: 0,
      name: r'createTime',
      type: IsarType.dateTime,
    ),
    r'pathFilePdf': PropertySchema(
      id: 1,
      name: r'pathFilePdf',
      type: IsarType.string,
    ),
    r'pathUrl': PropertySchema(
      id: 2,
      name: r'pathUrl',
      type: IsarType.string,
    )
  },
  estimateSize: _patientRecordDbModelEstimateSize,
  serialize: _patientRecordDbModelSerialize,
  deserialize: _patientRecordDbModelDeserialize,
  deserializeProp: _patientRecordDbModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'hospital': LinkSchema(
      id: -1565222280144211894,
      name: r'hospital',
      target: r'HospitalDbModel',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _patientRecordDbModelGetId,
  getLinks: _patientRecordDbModelGetLinks,
  attach: _patientRecordDbModelAttach,
  version: '3.1.0+1',
);

int _patientRecordDbModelEstimateSize(
  PatientRecordDbModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.pathFilePdf.length * 3;
  {
    final value = object.pathUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _patientRecordDbModelSerialize(
  PatientRecordDbModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createTime);
  writer.writeString(offsets[1], object.pathFilePdf);
  writer.writeString(offsets[2], object.pathUrl);
}

PatientRecordDbModel _patientRecordDbModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PatientRecordDbModel(
    createTime: reader.readDateTime(offsets[0]),
    id: id,
    pathFilePdf: reader.readString(offsets[1]),
    pathUrl: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _patientRecordDbModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _patientRecordDbModelGetId(PatientRecordDbModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _patientRecordDbModelGetLinks(
    PatientRecordDbModel object) {
  return [object.hospital];
}

void _patientRecordDbModelAttach(
    IsarCollection<dynamic> col, Id id, PatientRecordDbModel object) {
  object.id = id;
  object.hospital
      .attach(col, col.isar.collection<HospitalDbModel>(), r'hospital', id);
}

extension PatientRecordDbModelQueryWhereSort
    on QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QWhere> {
  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PatientRecordDbModelQueryWhere
    on QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QWhereClause> {
  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PatientRecordDbModelQueryFilter on QueryBuilder<PatientRecordDbModel,
    PatientRecordDbModel, QFilterCondition> {
  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> createTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> createTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> createTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> createTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> pathFilePdfEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pathFilePdf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> pathFilePdfGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pathFilePdf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> pathFilePdfLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pathFilePdf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> pathFilePdfBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pathFilePdf',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> pathFilePdfStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pathFilePdf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> pathFilePdfEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pathFilePdf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
          QAfterFilterCondition>
      pathFilePdfContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pathFilePdf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
          QAfterFilterCondition>
      pathFilePdfMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pathFilePdf',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> pathFilePdfIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pathFilePdf',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> pathFilePdfIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pathFilePdf',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> pathUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pathUrl',
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> pathUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pathUrl',
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> pathUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pathUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> pathUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pathUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> pathUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pathUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> pathUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pathUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> pathUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pathUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> pathUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pathUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
          QAfterFilterCondition>
      pathUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pathUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
          QAfterFilterCondition>
      pathUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pathUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> pathUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pathUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> pathUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pathUrl',
        value: '',
      ));
    });
  }
}

extension PatientRecordDbModelQueryObject on QueryBuilder<PatientRecordDbModel,
    PatientRecordDbModel, QFilterCondition> {}

extension PatientRecordDbModelQueryLinks on QueryBuilder<PatientRecordDbModel,
    PatientRecordDbModel, QFilterCondition> {
  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> hospital(FilterQuery<HospitalDbModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'hospital');
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel,
      QAfterFilterCondition> hospitalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'hospital', 0, true, 0, true);
    });
  }
}

extension PatientRecordDbModelQuerySortBy
    on QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QSortBy> {
  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QAfterSortBy>
      sortByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.asc);
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QAfterSortBy>
      sortByCreateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.desc);
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QAfterSortBy>
      sortByPathFilePdf() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathFilePdf', Sort.asc);
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QAfterSortBy>
      sortByPathFilePdfDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathFilePdf', Sort.desc);
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QAfterSortBy>
      sortByPathUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathUrl', Sort.asc);
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QAfterSortBy>
      sortByPathUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathUrl', Sort.desc);
    });
  }
}

extension PatientRecordDbModelQuerySortThenBy
    on QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QSortThenBy> {
  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QAfterSortBy>
      thenByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.asc);
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QAfterSortBy>
      thenByCreateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.desc);
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QAfterSortBy>
      thenByPathFilePdf() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathFilePdf', Sort.asc);
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QAfterSortBy>
      thenByPathFilePdfDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathFilePdf', Sort.desc);
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QAfterSortBy>
      thenByPathUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathUrl', Sort.asc);
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QAfterSortBy>
      thenByPathUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathUrl', Sort.desc);
    });
  }
}

extension PatientRecordDbModelQueryWhereDistinct
    on QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QDistinct> {
  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QDistinct>
      distinctByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createTime');
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QDistinct>
      distinctByPathFilePdf({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pathFilePdf', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PatientRecordDbModel, PatientRecordDbModel, QDistinct>
      distinctByPathUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pathUrl', caseSensitive: caseSensitive);
    });
  }
}

extension PatientRecordDbModelQueryProperty on QueryBuilder<
    PatientRecordDbModel, PatientRecordDbModel, QQueryProperty> {
  QueryBuilder<PatientRecordDbModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PatientRecordDbModel, DateTime, QQueryOperations>
      createTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createTime');
    });
  }

  QueryBuilder<PatientRecordDbModel, String, QQueryOperations>
      pathFilePdfProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pathFilePdf');
    });
  }

  QueryBuilder<PatientRecordDbModel, String?, QQueryOperations>
      pathUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pathUrl');
    });
  }
}
