// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'medication_item_dto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMedicationItemDtoCollection on Isar {
  IsarCollection<MedicationItemDto> get medicationItemDtos => this.collection();
}

const MedicationItemDtoSchema = CollectionSchema(
  name: r'MedicationItemDto',
  id: 1273270412298182278,
  properties: {
    r'dosage': PropertySchema(
      id: 0,
      name: r'dosage',
      type: IsarType.long,
    ),
    r'dosageFrequency': PropertySchema(
      id: 1,
      name: r'dosageFrequency',
      type: IsarType.long,
    ),
    r'dosingPeriod': PropertySchema(
      id: 2,
      name: r'dosingPeriod',
      type: IsarType.dateTime,
    ),
    r'isCompleted': PropertySchema(
      id: 3,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _medicationItemDtoEstimateSize,
  serialize: _medicationItemDtoSerialize,
  deserialize: _medicationItemDtoDeserialize,
  deserializeProp: _medicationItemDtoDeserializeProp,
  idName: r'id',
  indexes: {
    r'isCompleted': IndexSchema(
      id: -7936144632215868537,
      name: r'isCompleted',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isCompleted',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _medicationItemDtoGetId,
  getLinks: _medicationItemDtoGetLinks,
  attach: _medicationItemDtoAttach,
  version: '3.1.0+1',
);

int _medicationItemDtoEstimateSize(
  MedicationItemDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _medicationItemDtoSerialize(
  MedicationItemDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.dosage);
  writer.writeLong(offsets[1], object.dosageFrequency);
  writer.writeDateTime(offsets[2], object.dosingPeriod);
  writer.writeBool(offsets[3], object.isCompleted);
  writer.writeString(offsets[4], object.name);
}

MedicationItemDto _medicationItemDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MedicationItemDto(
    dosage: reader.readLong(offsets[0]),
    dosageFrequency: reader.readLong(offsets[1]),
    dosingPeriod: reader.readDateTime(offsets[2]),
    id: id,
    isCompleted: reader.readBoolOrNull(offsets[3]) ?? false,
    name: reader.readString(offsets[4]),
  );
  return object;
}

P _medicationItemDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _medicationItemDtoGetId(MedicationItemDto object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _medicationItemDtoGetLinks(
    MedicationItemDto object) {
  return [];
}

void _medicationItemDtoAttach(
    IsarCollection<dynamic> col, Id id, MedicationItemDto object) {
  object.id = id;
}

extension MedicationItemDtoQueryWhereSort
    on QueryBuilder<MedicationItemDto, MedicationItemDto, QWhere> {
  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterWhere>
      anyIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isCompleted'),
      );
    });
  }
}

extension MedicationItemDtoQueryWhere
    on QueryBuilder<MedicationItemDto, MedicationItemDto, QWhereClause> {
  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterWhereClause>
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

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterWhereClause>
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

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterWhereClause>
      isCompletedEqualTo(bool isCompleted) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isCompleted',
        value: [isCompleted],
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterWhereClause>
      isCompletedNotEqualTo(bool isCompleted) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isCompleted',
              lower: [],
              upper: [isCompleted],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isCompleted',
              lower: [isCompleted],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isCompleted',
              lower: [isCompleted],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isCompleted',
              lower: [],
              upper: [isCompleted],
              includeUpper: false,
            ));
      }
    });
  }
}

extension MedicationItemDtoQueryFilter
    on QueryBuilder<MedicationItemDto, MedicationItemDto, QFilterCondition> {
  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      dosageEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dosage',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      dosageGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dosage',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      dosageLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dosage',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      dosageBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dosage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      dosageFrequencyEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dosageFrequency',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      dosageFrequencyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dosageFrequency',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      dosageFrequencyLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dosageFrequency',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      dosageFrequencyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dosageFrequency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      dosingPeriodEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dosingPeriod',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      dosingPeriodGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dosingPeriod',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      dosingPeriodLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dosingPeriod',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      dosingPeriodBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dosingPeriod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
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

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      idLessThan(
    Id? value, {
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

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension MedicationItemDtoQueryObject
    on QueryBuilder<MedicationItemDto, MedicationItemDto, QFilterCondition> {}

extension MedicationItemDtoQueryLinks
    on QueryBuilder<MedicationItemDto, MedicationItemDto, QFilterCondition> {}

extension MedicationItemDtoQuerySortBy
    on QueryBuilder<MedicationItemDto, MedicationItemDto, QSortBy> {
  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterSortBy>
      sortByDosage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosage', Sort.asc);
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterSortBy>
      sortByDosageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosage', Sort.desc);
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterSortBy>
      sortByDosageFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosageFrequency', Sort.asc);
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterSortBy>
      sortByDosageFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosageFrequency', Sort.desc);
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterSortBy>
      sortByDosingPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosingPeriod', Sort.asc);
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterSortBy>
      sortByDosingPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosingPeriod', Sort.desc);
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterSortBy>
      sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterSortBy>
      sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension MedicationItemDtoQuerySortThenBy
    on QueryBuilder<MedicationItemDto, MedicationItemDto, QSortThenBy> {
  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterSortBy>
      thenByDosage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosage', Sort.asc);
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterSortBy>
      thenByDosageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosage', Sort.desc);
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterSortBy>
      thenByDosageFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosageFrequency', Sort.asc);
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterSortBy>
      thenByDosageFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosageFrequency', Sort.desc);
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterSortBy>
      thenByDosingPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosingPeriod', Sort.asc);
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterSortBy>
      thenByDosingPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosingPeriod', Sort.desc);
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterSortBy>
      thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterSortBy>
      thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension MedicationItemDtoQueryWhereDistinct
    on QueryBuilder<MedicationItemDto, MedicationItemDto, QDistinct> {
  QueryBuilder<MedicationItemDto, MedicationItemDto, QDistinct>
      distinctByDosage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dosage');
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QDistinct>
      distinctByDosageFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dosageFrequency');
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QDistinct>
      distinctByDosingPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dosingPeriod');
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QDistinct>
      distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<MedicationItemDto, MedicationItemDto, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension MedicationItemDtoQueryProperty
    on QueryBuilder<MedicationItemDto, MedicationItemDto, QQueryProperty> {
  QueryBuilder<MedicationItemDto, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MedicationItemDto, int, QQueryOperations> dosageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dosage');
    });
  }

  QueryBuilder<MedicationItemDto, int, QQueryOperations>
      dosageFrequencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dosageFrequency');
    });
  }

  QueryBuilder<MedicationItemDto, DateTime, QQueryOperations>
      dosingPeriodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dosingPeriod');
    });
  }

  QueryBuilder<MedicationItemDto, bool, QQueryOperations>
      isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<MedicationItemDto, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
