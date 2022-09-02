/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';
import 'package:navigation_drawer_test/models/ModelProvider.dart';


/** This is an auto generated class representing the Todo type in your schema. */
@immutable
class localLesson extends Model {
  static const classType = const _localLessonModelType();
  final String id;
  final String? _CampusID;
  final String? _MajeureID;
  final TemporalDateTime? _HeureDebut;
  final TemporalDateTime? _HeureFin;
  final String? _NomCours;
  final String? _Professeur;
  final String? _Salle;
  final String? _TypeBloc;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get CampusID {
    return _CampusID;
  }
  
  String? get MajeureID {
    return _MajeureID;
  }
  
  TemporalDateTime? get HeureDebut {
    return _HeureDebut;
  }
  
  TemporalDateTime? get HeureFin {
    return _HeureFin;
  }
  
  String? get NomCours {
    return _NomCours;
  }
  
  String? get Professeur {
    return _Professeur;
  }
  
  String? get Salle {
    return _Salle;
  }
  
  String? get TypeBloc {
    return _TypeBloc;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const localLesson._internal({required this.id, CampusID, MajeureID, HeureDebut, HeureFin, NomCours, Professeur, Salle, TypeBloc, createdAt, updatedAt}): _CampusID = CampusID, _MajeureID = MajeureID, _HeureDebut = HeureDebut, _HeureFin = HeureFin, _NomCours = NomCours, _Professeur = Professeur, _Salle = Salle, _TypeBloc = TypeBloc, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory localLesson({String? id, String? CampusID, String? MajeureID, TemporalDateTime? HeureDebut, TemporalDateTime? HeureFin, String? NomCours, String? Professeur, String? Salle, String? TypeBloc}) {
    return localLesson._internal(
      id: id == null ? UUID.getUUID() : id,
      CampusID: CampusID,
      MajeureID: MajeureID,
      HeureDebut: HeureDebut,
      HeureFin: HeureFin,
      NomCours: NomCours,
      Professeur: Professeur,
      Salle: Salle,
      TypeBloc: TypeBloc);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is localLesson &&
      id == other.id &&
      _CampusID == other._CampusID &&
      _MajeureID == other._MajeureID &&
      _HeureDebut == other._HeureDebut &&
      _HeureFin == other._HeureFin &&
      _NomCours == other._NomCours &&
      _Professeur == other._Professeur &&
      _Salle == other._Salle &&
      _TypeBloc == other._TypeBloc;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("localLesson {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("CampusID=" + "$_CampusID" + ", ");
    buffer.write("MajeureID=" + "$_MajeureID" + ", ");
    buffer.write("HeureDebut=" + (_HeureDebut != null ? _HeureDebut!.format() : "null") + ", ");
    buffer.write("HeureFin=" + (_HeureFin != null ? _HeureFin!.format() : "null") + ", ");
    buffer.write("NomCours=" + "$_NomCours" + ", ");
    buffer.write("Professeur=" + "$_Professeur" + ", ");
    buffer.write("Salle=" + "$_Salle" + ", ");
    buffer.write("TypeBloc=" + "$_TypeBloc" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  localLesson copyWith({String? id, String? CampusID, String? MajeureID, TemporalDateTime? HeureDebut, TemporalDateTime? HeureFin, String? NomCours, String? Professeur, String? Salle, String? TypeBloc}) {
    return localLesson._internal(
      id: id ?? this.id,
      CampusID: CampusID ?? this.CampusID,
      MajeureID: MajeureID ?? this.MajeureID,
      HeureDebut: HeureDebut ?? this.HeureDebut,
      HeureFin: HeureFin ?? this.HeureFin,
      NomCours: NomCours ?? this.NomCours,
      Professeur: Professeur ?? this.Professeur,
      Salle: Salle ?? this.Salle,
      TypeBloc: TypeBloc ?? this.TypeBloc);
  }
  
  localLesson.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      _CampusID = json['CampusID'],
      _MajeureID = json['MajeureID'],
      _HeureDebut = json['HeureDebut'] != null ? TemporalDateTime.fromString(json['HeureDebut']) : null,
      _HeureFin = json['HeureFin'] != null ? TemporalDateTime.fromString(json['HeureFin']) : null,
      _NomCours = json['NomCours'],
      _Professeur = json['Professeur'],
      _Salle = json['Salle'],
      _TypeBloc = json['TypeBloc'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'CampusID': _CampusID, 'MajeureID': _MajeureID, 'HeureDebut': _HeureDebut?.format(), 'HeureFin': _HeureFin?.format(), 'NomCours': _NomCours, 'Professeur': _Professeur, 'Salle': _Salle, 'TypeBloc': _TypeBloc, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField CAMPUSID = QueryField(fieldName: "CampusID");
  static final QueryField MAJEUREID = QueryField(fieldName: "MajeureID");
  static final QueryField HEUREDEBUT = QueryField(fieldName: "HeureDebut");
  static final QueryField HEUREFIN = QueryField(fieldName: "HeureFin");
  static final QueryField NOMCOURS = QueryField(fieldName: "NomCours");
  static final QueryField PROFESSEUR = QueryField(fieldName: "Professeur");
  static final QueryField SALLE = QueryField(fieldName: "Salle");
  static final QueryField TYPEBLOC = QueryField(fieldName: "TypeBloc");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "localLesson";
    modelSchemaDefinition.pluralName = "localLessons";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PRIVATE,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: localLesson.CAMPUSID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: localLesson.MAJEUREID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: localLesson.HEUREDEBUT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: localLesson.HEUREFIN,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: localLesson.NOMCOURS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: localLesson.PROFESSEUR,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: localLesson.SALLE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: localLesson.TYPEBLOC,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _localLessonModelType extends ModelType<localLesson> {
  const _localLessonModelType();
  
  @override
  localLesson fromJson(Map<String, dynamic> jsonData) {
    return localLesson.fromJson(jsonData);
  }
}