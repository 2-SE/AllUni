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


/** This is an auto generated class representing the Todo type in your schema. */
@immutable
class Todo extends Model {
  static const classType = const _TodoModelType();
  final String id;
  final String? _UserID;
  final String? _MajeureID;
  final TemporalDateTime? _HeureDebut;
  final String? _CampusID;
  final String? _NomCours;
  final String? _Professeur;
  final String? _Salle;
  final String? _TypeBloc;
  final TemporalDateTime? _HeureFin;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get UserID {
    try {
      return _UserID!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get MajeureID {
    return _MajeureID;
  }
  
  TemporalDateTime? get HeureDebut {
    return _HeureDebut;
  }
  
  String? get CampusID {
    return _CampusID;
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
  
  TemporalDateTime? get HeureFin {
    return _HeureFin;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Todo._internal({required this.id, required UserID, MajeureID, HeureDebut, CampusID, NomCours, Professeur, Salle, TypeBloc, HeureFin, createdAt, updatedAt}): _UserID = UserID, _MajeureID = MajeureID, _HeureDebut = HeureDebut, _CampusID = CampusID, _NomCours = NomCours, _Professeur = Professeur, _Salle = Salle, _TypeBloc = TypeBloc, _HeureFin = HeureFin, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Todo({String? id, required String UserID, String? MajeureID, TemporalDateTime? HeureDebut, String? CampusID, String? NomCours, String? Professeur, String? Salle, String? TypeBloc, TemporalDateTime? HeureFin}) {
    return Todo._internal(
      id: id == null ? UUID.getUUID() : id,
      UserID: UserID,
      MajeureID: MajeureID,
      HeureDebut: HeureDebut,
      CampusID: CampusID,
      NomCours: NomCours,
      Professeur: Professeur,
      Salle: Salle,
      TypeBloc: TypeBloc,
      HeureFin: HeureFin);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Todo &&
      id == other.id &&
      _UserID == other._UserID &&
      _MajeureID == other._MajeureID &&
      _HeureDebut == other._HeureDebut &&
      _CampusID == other._CampusID &&
      _NomCours == other._NomCours &&
      _Professeur == other._Professeur &&
      _Salle == other._Salle &&
      _TypeBloc == other._TypeBloc &&
      _HeureFin == other._HeureFin;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Todo {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("UserID=" + "$_UserID" + ", ");
    buffer.write("MajeureID=" + "$_MajeureID" + ", ");
    buffer.write("HeureDebut=" + (_HeureDebut != null ? _HeureDebut!.format() : "null") + ", ");
    buffer.write("CampusID=" + "$_CampusID" + ", ");
    buffer.write("NomCours=" + "$_NomCours" + ", ");
    buffer.write("Professeur=" + "$_Professeur" + ", ");
    buffer.write("Salle=" + "$_Salle" + ", ");
    buffer.write("TypeBloc=" + "$_TypeBloc" + ", ");
    buffer.write("HeureFin=" + (_HeureFin != null ? _HeureFin!.format() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Todo copyWith({String? id, String? UserID, String? MajeureID, TemporalDateTime? HeureDebut, String? CampusID, String? NomCours, String? Professeur, String? Salle, String? TypeBloc, TemporalDateTime? HeureFin}) {
    return Todo._internal(
      id: id ?? this.id,
      UserID: UserID ?? this.UserID,
      MajeureID: MajeureID ?? this.MajeureID,
      HeureDebut: HeureDebut ?? this.HeureDebut,
      CampusID: CampusID ?? this.CampusID,
      NomCours: NomCours ?? this.NomCours,
      Professeur: Professeur ?? this.Professeur,
      Salle: Salle ?? this.Salle,
      TypeBloc: TypeBloc ?? this.TypeBloc,
      HeureFin: HeureFin ?? this.HeureFin);
  }
  
  Todo.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _UserID = json['UserID'],
      _MajeureID = json['MajeureID'],
      _HeureDebut = json['HeureDebut'] != null ? TemporalDateTime.fromString(json['HeureDebut']) : null,
      _CampusID = json['CampusID'],
      _NomCours = json['NomCours'],
      _Professeur = json['Professeur'],
      _Salle = json['Salle'],
      _TypeBloc = json['TypeBloc'],
      _HeureFin = json['HeureFin'] != null ? TemporalDateTime.fromString(json['HeureFin']) : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'UserID': _UserID, 'MajeureID': _MajeureID, 'HeureDebut': _HeureDebut?.format(), 'CampusID': _CampusID, 'NomCours': _NomCours, 'Professeur': _Professeur, 'Salle': _Salle, 'TypeBloc': _TypeBloc, 'HeureFin': _HeureFin?.format(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField USERID = QueryField(fieldName: "UserID");
  static final QueryField MAJEUREID = QueryField(fieldName: "MajeureID");
  static final QueryField HEUREDEBUT = QueryField(fieldName: "HeureDebut");
  static final QueryField CAMPUSID = QueryField(fieldName: "CampusID");
  static final QueryField NOMCOURS = QueryField(fieldName: "NomCours");
  static final QueryField PROFESSEUR = QueryField(fieldName: "Professeur");
  static final QueryField SALLE = QueryField(fieldName: "Salle");
  static final QueryField TYPEBLOC = QueryField(fieldName: "TypeBloc");
  static final QueryField HEUREFIN = QueryField(fieldName: "HeureFin");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Todo";
    modelSchemaDefinition.pluralName = "Todos";
    
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
      key: Todo.USERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.MAJEUREID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.HEUREDEBUT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.CAMPUSID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.NOMCOURS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.PROFESSEUR,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.SALLE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.TYPEBLOC,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.HEUREFIN,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
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

class _TodoModelType extends ModelType<Todo> {
  const _TodoModelType();
  
  @override
  Todo fromJson(Map<String, dynamic> jsonData) {
    return Todo.fromJson(jsonData);
  }
}