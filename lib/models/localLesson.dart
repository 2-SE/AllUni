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
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the LocalLesson type in your schema. */
@immutable
class LocalLesson extends Model {
  static const classType = const _LocalLessonModelType();
  final String id;
  final String? _UserID;
  final TemporalDateTime? _HeureDebut;
  final TemporalDateTime? _HeureFin;
  final String? _NomCours;
  final String? _Professeur;
  final String? _Salle;
  final String? _TypeBloc;
  final List<String>? _Tags;
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
  
  List<String>? get Tags {
    return _Tags;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const LocalLesson._internal({required this.id, required UserID, HeureDebut, HeureFin, NomCours, Professeur, Salle, TypeBloc, Tags, createdAt, updatedAt}): _UserID = UserID, _HeureDebut = HeureDebut, _HeureFin = HeureFin, _NomCours = NomCours, _Professeur = Professeur, _Salle = Salle, _TypeBloc = TypeBloc, _Tags = Tags, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory LocalLesson({String? id, required String UserID, TemporalDateTime? HeureDebut, TemporalDateTime? HeureFin, String? NomCours, String? Professeur, String? Salle, String? TypeBloc, List<String>? Tags}) {
    return LocalLesson._internal(
      id: id == null ? UUID.getUUID() : id,
      UserID: UserID,
      HeureDebut: HeureDebut,
      HeureFin: HeureFin,
      NomCours: NomCours,
      Professeur: Professeur,
      Salle: Salle,
      TypeBloc: TypeBloc,
      Tags: Tags != null ? List<String>.unmodifiable(Tags) : Tags);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LocalLesson &&
      id == other.id &&
      _UserID == other._UserID &&
      _HeureDebut == other._HeureDebut &&
      _HeureFin == other._HeureFin &&
      _NomCours == other._NomCours &&
      _Professeur == other._Professeur &&
      _Salle == other._Salle &&
      _TypeBloc == other._TypeBloc &&
      DeepCollectionEquality().equals(_Tags, other._Tags);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("LocalLesson {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("UserID=" + "$_UserID" + ", ");
    buffer.write("HeureDebut=" + (_HeureDebut != null ? _HeureDebut!.format() : "null") + ", ");
    buffer.write("HeureFin=" + (_HeureFin != null ? _HeureFin!.format() : "null") + ", ");
    buffer.write("NomCours=" + "$_NomCours" + ", ");
    buffer.write("Professeur=" + "$_Professeur" + ", ");
    buffer.write("Salle=" + "$_Salle" + ", ");
    buffer.write("TypeBloc=" + "$_TypeBloc" + ", ");
    buffer.write("Tags=" + (_Tags != null ? _Tags!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  LocalLesson copyWith({String? id, String? UserID, TemporalDateTime? HeureDebut, TemporalDateTime? HeureFin, String? NomCours, String? Professeur, String? Salle, String? TypeBloc, List<String>? Tags}) {
    return LocalLesson._internal(
      id: id ?? this.id,
      UserID: UserID ?? this.UserID,
      HeureDebut: HeureDebut ?? this.HeureDebut,
      HeureFin: HeureFin ?? this.HeureFin,
      NomCours: NomCours ?? this.NomCours,
      Professeur: Professeur ?? this.Professeur,
      Salle: Salle ?? this.Salle,
      TypeBloc: TypeBloc ?? this.TypeBloc,
      Tags: Tags ?? this.Tags);
  }
  
  LocalLesson.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _UserID = json['UserID'],
      _HeureDebut = json['HeureDebut'] != null ? TemporalDateTime.fromString(json['HeureDebut']) : null,
      _HeureFin = json['HeureFin'] != null ? TemporalDateTime.fromString(json['HeureFin']) : null,
      _NomCours = json['NomCours'],
      _Professeur = json['Professeur'],
      _Salle = json['Salle'],
      _TypeBloc = json['TypeBloc'],
      _Tags = json['Tags']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'UserID': _UserID, 'HeureDebut': _HeureDebut?.format(), 'HeureFin': _HeureFin?.format(), 'NomCours': _NomCours, 'Professeur': _Professeur, 'Salle': _Salle, 'TypeBloc': _TypeBloc, 'Tags': _Tags, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField USERID = QueryField(fieldName: "UserID");
  static final QueryField HEUREDEBUT = QueryField(fieldName: "HeureDebut");
  static final QueryField HEUREFIN = QueryField(fieldName: "HeureFin");
  static final QueryField NOMCOURS = QueryField(fieldName: "NomCours");
  static final QueryField PROFESSEUR = QueryField(fieldName: "Professeur");
  static final QueryField SALLE = QueryField(fieldName: "Salle");
  static final QueryField TYPEBLOC = QueryField(fieldName: "TypeBloc");
  static final QueryField TAGS = QueryField(fieldName: "Tags");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "LocalLesson";
    modelSchemaDefinition.pluralName = "LocalLessons";
    
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
      key: LocalLesson.USERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: LocalLesson.HEUREDEBUT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: LocalLesson.HEUREFIN,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: LocalLesson.NOMCOURS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: LocalLesson.PROFESSEUR,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: LocalLesson.SALLE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: LocalLesson.TYPEBLOC,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: LocalLesson.TAGS,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
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

class _LocalLessonModelType extends ModelType<LocalLesson> {
  const _LocalLessonModelType();
  
  @override
  LocalLesson fromJson(Map<String, dynamic> jsonData) {
    return LocalLesson.fromJson(jsonData);
  }
}