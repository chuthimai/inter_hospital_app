// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_contract_db_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSmartContractDbModelCollection on Isar {
  IsarCollection<SmartContractDbModel> get smartContractDbModels =>
      this.collection();
}

const SmartContractDbModelSchema = CollectionSchema(
  name: r'SmartContractDbModel',
  id: 7813905200094708631,
  properties: {
    r'key': PropertySchema(
      id: 0,
      name: r'key',
      type: IsarType.string,
    ),
    r'permission': PropertySchema(
      id: 1,
      name: r'permission',
      type: IsarType.string,
    ),
    r'validFrom': PropertySchema(
      id: 2,
      name: r'validFrom',
      type: IsarType.dateTime,
    ),
    r'validTo': PropertySchema(
      id: 3,
      name: r'validTo',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _smartContractDbModelEstimateSize,
  serialize: _smartContractDbModelSerialize,
  deserialize: _smartContractDbModelDeserialize,
  deserializeProp: _smartContractDbModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'validTo_validFrom': IndexSchema(
      id: -4202243181980390460,
      name: r'validTo_validFrom',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'validTo',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'validFrom',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'subject': LinkSchema(
      id: 7304345237651417955,
      name: r'subject',
      target: r'HospitalDbModel',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _smartContractDbModelGetId,
  getLinks: _smartContractDbModelGetLinks,
  attach: _smartContractDbModelAttach,
  version: '3.1.0+1',
);

int _smartContractDbModelEstimateSize(
  SmartContractDbModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.key.length * 3;
  bytesCount += 3 + object.permission.length * 3;
  return bytesCount;
}

void _smartContractDbModelSerialize(
  SmartContractDbModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.key);
  writer.writeString(offsets[1], object.permission);
  writer.writeDateTime(offsets[2], object.validFrom);
  writer.writeDateTime(offsets[3], object.validTo);
}

SmartContractDbModel _smartContractDbModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SmartContractDbModel(
    id: id,
    key: reader.readString(offsets[0]),
    permission: reader.readString(offsets[1]),
    validFrom: reader.readDateTime(offsets[2]),
    validTo: reader.readDateTime(offsets[3]),
  );
  return object;
}

P _smartContractDbModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _smartContractDbModelGetId(SmartContractDbModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _smartContractDbModelGetLinks(
    SmartContractDbModel object) {
  return [object.subject];
}

void _smartContractDbModelAttach(
    IsarCollection<dynamic> col, Id id, SmartContractDbModel object) {
  object.id = id;
  object.subject
      .attach(col, col.isar.collection<HospitalDbModel>(), r'subject', id);
}

extension SmartContractDbModelQueryWhereSort
    on QueryBuilder<SmartContractDbModel, SmartContractDbModel, QWhere> {
  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterWhere>
      anyValidToValidFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'validTo_validFrom'),
      );
    });
  }
}

extension SmartContractDbModelQueryWhere
    on QueryBuilder<SmartContractDbModel, SmartContractDbModel, QWhereClause> {
  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterWhereClause>
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

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterWhereClause>
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

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterWhereClause>
      validToEqualToAnyValidFrom(DateTime validTo) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'validTo_validFrom',
        value: [validTo],
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterWhereClause>
      validToNotEqualToAnyValidFrom(DateTime validTo) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'validTo_validFrom',
              lower: [],
              upper: [validTo],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'validTo_validFrom',
              lower: [validTo],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'validTo_validFrom',
              lower: [validTo],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'validTo_validFrom',
              lower: [],
              upper: [validTo],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterWhereClause>
      validToGreaterThanAnyValidFrom(
    DateTime validTo, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'validTo_validFrom',
        lower: [validTo],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterWhereClause>
      validToLessThanAnyValidFrom(
    DateTime validTo, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'validTo_validFrom',
        lower: [],
        upper: [validTo],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterWhereClause>
      validToBetweenAnyValidFrom(
    DateTime lowerValidTo,
    DateTime upperValidTo, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'validTo_validFrom',
        lower: [lowerValidTo],
        includeLower: includeLower,
        upper: [upperValidTo],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterWhereClause>
      validToValidFromEqualTo(DateTime validTo, DateTime validFrom) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'validTo_validFrom',
        value: [validTo, validFrom],
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterWhereClause>
      validToEqualToValidFromNotEqualTo(DateTime validTo, DateTime validFrom) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'validTo_validFrom',
              lower: [validTo],
              upper: [validTo, validFrom],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'validTo_validFrom',
              lower: [validTo, validFrom],
              includeLower: false,
              upper: [validTo],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'validTo_validFrom',
              lower: [validTo, validFrom],
              includeLower: false,
              upper: [validTo],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'validTo_validFrom',
              lower: [validTo],
              upper: [validTo, validFrom],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterWhereClause>
      validToEqualToValidFromGreaterThan(
    DateTime validTo,
    DateTime validFrom, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'validTo_validFrom',
        lower: [validTo, validFrom],
        includeLower: include,
        upper: [validTo],
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterWhereClause>
      validToEqualToValidFromLessThan(
    DateTime validTo,
    DateTime validFrom, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'validTo_validFrom',
        lower: [validTo],
        upper: [validTo, validFrom],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterWhereClause>
      validToEqualToValidFromBetween(
    DateTime validTo,
    DateTime lowerValidFrom,
    DateTime upperValidFrom, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'validTo_validFrom',
        lower: [validTo, lowerValidFrom],
        includeLower: includeLower,
        upper: [validTo, upperValidFrom],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SmartContractDbModelQueryFilter on QueryBuilder<SmartContractDbModel,
    SmartContractDbModel, QFilterCondition> {
  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
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

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
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

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
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

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> keyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> keyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> keyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> keyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'key',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> keyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> keyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
          QAfterFilterCondition>
      keyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
          QAfterFilterCondition>
      keyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'key',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> keyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'key',
        value: '',
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> keyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'key',
        value: '',
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> permissionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'permission',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> permissionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'permission',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> permissionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'permission',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> permissionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'permission',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> permissionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'permission',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> permissionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'permission',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
          QAfterFilterCondition>
      permissionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'permission',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
          QAfterFilterCondition>
      permissionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'permission',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> permissionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'permission',
        value: '',
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> permissionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'permission',
        value: '',
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> validFromEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'validFrom',
        value: value,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> validFromGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'validFrom',
        value: value,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> validFromLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'validFrom',
        value: value,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> validFromBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'validFrom',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> validToEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'validTo',
        value: value,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> validToGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'validTo',
        value: value,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> validToLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'validTo',
        value: value,
      ));
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> validToBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'validTo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SmartContractDbModelQueryObject on QueryBuilder<SmartContractDbModel,
    SmartContractDbModel, QFilterCondition> {}

extension SmartContractDbModelQueryLinks on QueryBuilder<SmartContractDbModel,
    SmartContractDbModel, QFilterCondition> {
  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> subject(FilterQuery<HospitalDbModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'subject');
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel,
      QAfterFilterCondition> subjectIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'subject', 0, true, 0, true);
    });
  }
}

extension SmartContractDbModelQuerySortBy
    on QueryBuilder<SmartContractDbModel, SmartContractDbModel, QSortBy> {
  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterSortBy>
      sortByKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.asc);
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterSortBy>
      sortByKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.desc);
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterSortBy>
      sortByPermission() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permission', Sort.asc);
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterSortBy>
      sortByPermissionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permission', Sort.desc);
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterSortBy>
      sortByValidFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validFrom', Sort.asc);
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterSortBy>
      sortByValidFromDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validFrom', Sort.desc);
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterSortBy>
      sortByValidTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validTo', Sort.asc);
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterSortBy>
      sortByValidToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validTo', Sort.desc);
    });
  }
}

extension SmartContractDbModelQuerySortThenBy
    on QueryBuilder<SmartContractDbModel, SmartContractDbModel, QSortThenBy> {
  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterSortBy>
      thenByKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.asc);
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterSortBy>
      thenByKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.desc);
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterSortBy>
      thenByPermission() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permission', Sort.asc);
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterSortBy>
      thenByPermissionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permission', Sort.desc);
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterSortBy>
      thenByValidFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validFrom', Sort.asc);
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterSortBy>
      thenByValidFromDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validFrom', Sort.desc);
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterSortBy>
      thenByValidTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validTo', Sort.asc);
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QAfterSortBy>
      thenByValidToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validTo', Sort.desc);
    });
  }
}

extension SmartContractDbModelQueryWhereDistinct
    on QueryBuilder<SmartContractDbModel, SmartContractDbModel, QDistinct> {
  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QDistinct>
      distinctByKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'key', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QDistinct>
      distinctByPermission({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'permission', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QDistinct>
      distinctByValidFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'validFrom');
    });
  }

  QueryBuilder<SmartContractDbModel, SmartContractDbModel, QDistinct>
      distinctByValidTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'validTo');
    });
  }
}

extension SmartContractDbModelQueryProperty on QueryBuilder<
    SmartContractDbModel, SmartContractDbModel, QQueryProperty> {
  QueryBuilder<SmartContractDbModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SmartContractDbModel, String, QQueryOperations> keyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'key');
    });
  }

  QueryBuilder<SmartContractDbModel, String, QQueryOperations>
      permissionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'permission');
    });
  }

  QueryBuilder<SmartContractDbModel, DateTime, QQueryOperations>
      validFromProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'validFrom');
    });
  }

  QueryBuilder<SmartContractDbModel, DateTime, QQueryOperations>
      validToProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'validTo');
    });
  }
}
