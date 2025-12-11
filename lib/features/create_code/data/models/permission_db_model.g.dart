// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_db_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPermissionDbModelCollection on Isar {
  IsarCollection<PermissionDbModel> get permissionDbModels => this.collection();
}

const PermissionDbModelSchema = CollectionSchema(
  name: r'PermissionDbModel',
  id: 3244676839406029283,
  properties: {
    r'expiredTime': PropertySchema(
      id: 0,
      name: r'expiredTime',
      type: IsarType.dateTime,
    ),
    r'type': PropertySchema(
      id: 1,
      name: r'type',
      type: IsarType.byte,
      enumMap: _PermissionDbModeltypeEnumValueMap,
    ),
    r'userId': PropertySchema(
      id: 2,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _permissionDbModelEstimateSize,
  serialize: _permissionDbModelSerialize,
  deserialize: _permissionDbModelDeserialize,
  deserializeProp: _permissionDbModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'hospital': LinkSchema(
      id: -3869869870502534225,
      name: r'hospital',
      target: r'HospitalDbModel',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _permissionDbModelGetId,
  getLinks: _permissionDbModelGetLinks,
  attach: _permissionDbModelAttach,
  version: '3.1.0+1',
);

int _permissionDbModelEstimateSize(
  PermissionDbModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _permissionDbModelSerialize(
  PermissionDbModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.expiredTime);
  writer.writeByte(offsets[1], object.type.index);
  writer.writeLong(offsets[2], object.userId);
}

PermissionDbModel _permissionDbModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PermissionDbModel(
    expiredTime: reader.readDateTime(offsets[0]),
    id: id,
    type:
        _PermissionDbModeltypeValueEnumMap[reader.readByteOrNull(offsets[1])] ??
            PermissionType.readPatientRecord,
    userId: reader.readLong(offsets[2]),
  );
  return object;
}

P _permissionDbModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (_PermissionDbModeltypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          PermissionType.readPatientRecord) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PermissionDbModeltypeEnumValueMap = {
  'readPatientRecord': 0,
  'unknow': 1,
};
const _PermissionDbModeltypeValueEnumMap = {
  0: PermissionType.readPatientRecord,
  1: PermissionType.unknow,
};

Id _permissionDbModelGetId(PermissionDbModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _permissionDbModelGetLinks(
    PermissionDbModel object) {
  return [object.hospital];
}

void _permissionDbModelAttach(
    IsarCollection<dynamic> col, Id id, PermissionDbModel object) {
  object.id = id;
  object.hospital
      .attach(col, col.isar.collection<HospitalDbModel>(), r'hospital', id);
}

extension PermissionDbModelQueryWhereSort
    on QueryBuilder<PermissionDbModel, PermissionDbModel, QWhere> {
  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PermissionDbModelQueryWhere
    on QueryBuilder<PermissionDbModel, PermissionDbModel, QWhereClause> {
  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterWhereClause>
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

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterWhereClause>
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

extension PermissionDbModelQueryFilter
    on QueryBuilder<PermissionDbModel, PermissionDbModel, QFilterCondition> {
  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterFilterCondition>
      expiredTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiredTime',
        value: value,
      ));
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterFilterCondition>
      expiredTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiredTime',
        value: value,
      ));
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterFilterCondition>
      expiredTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiredTime',
        value: value,
      ));
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterFilterCondition>
      expiredTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiredTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterFilterCondition>
      typeEqualTo(PermissionType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterFilterCondition>
      typeGreaterThan(
    PermissionType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterFilterCondition>
      typeLessThan(
    PermissionType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterFilterCondition>
      typeBetween(
    PermissionType lower,
    PermissionType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterFilterCondition>
      userIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterFilterCondition>
      userIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterFilterCondition>
      userIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterFilterCondition>
      userIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PermissionDbModelQueryObject
    on QueryBuilder<PermissionDbModel, PermissionDbModel, QFilterCondition> {}

extension PermissionDbModelQueryLinks
    on QueryBuilder<PermissionDbModel, PermissionDbModel, QFilterCondition> {
  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterFilterCondition>
      hospital(FilterQuery<HospitalDbModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'hospital');
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterFilterCondition>
      hospitalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'hospital', 0, true, 0, true);
    });
  }
}

extension PermissionDbModelQuerySortBy
    on QueryBuilder<PermissionDbModel, PermissionDbModel, QSortBy> {
  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterSortBy>
      sortByExpiredTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiredTime', Sort.asc);
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterSortBy>
      sortByExpiredTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiredTime', Sort.desc);
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension PermissionDbModelQuerySortThenBy
    on QueryBuilder<PermissionDbModel, PermissionDbModel, QSortThenBy> {
  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterSortBy>
      thenByExpiredTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiredTime', Sort.asc);
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterSortBy>
      thenByExpiredTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiredTime', Sort.desc);
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension PermissionDbModelQueryWhereDistinct
    on QueryBuilder<PermissionDbModel, PermissionDbModel, QDistinct> {
  QueryBuilder<PermissionDbModel, PermissionDbModel, QDistinct>
      distinctByExpiredTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiredTime');
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QDistinct>
      distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<PermissionDbModel, PermissionDbModel, QDistinct>
      distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension PermissionDbModelQueryProperty
    on QueryBuilder<PermissionDbModel, PermissionDbModel, QQueryProperty> {
  QueryBuilder<PermissionDbModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PermissionDbModel, DateTime, QQueryOperations>
      expiredTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiredTime');
    });
  }

  QueryBuilder<PermissionDbModel, PermissionType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<PermissionDbModel, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
