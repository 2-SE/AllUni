/*
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

@immutable
class Event extends Model {
  static const classType = const _EventModelType();
  final String id;
  final String? _CampusID;
  final String? _MajeureID;
  final String? _CoursID;
  final List<String>? _UserID;
  final String? _Hote;
  final String? _Position;
  final String? _Type;
  final String? _Titre;
  final TemporalDateTime? _HeureFin;
  final TemporalDateTime? _HeureDebut;
  final String? _TypeCours;
  final String? _Description;
  final String? _Comments;
  final bool? _isAllDay;
  final List<String>? _Tag;

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

  String? get CoursID {
    return _CoursID;
  }

  List<String>? get UserID {
    return _UserID;
  }

  String? get Hote {
    return _Hote;
  }

  String? get Position {
    return _Position;
  }

  String get Type {
    try {
      return _Type!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
      );
    }
  }

  String get Titre {
    try {
      return _Titre!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
      );
    }
  }

  TemporalDateTime? get HeureFin {
    return _HeureFin;
  }

  TemporalDateTime get HeureDebut {
    try {
      return _HeureDebut!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
      );
    }
  }

  String? get TypeCours {
    return _TypeCours;
  }

  String? get Description {
    return _Description;
  }

  String? get Comments {
    return _Comments;
  }

  bool? get isAllDay {
    return _isAllDay;
  }

  List<String>? get Tag {
    return _Tag;
  }

  const Event._internal({required this.id, CampusID, MajeureID, CoursID, UserID, Hote, Position, required Type, required Titre, HeureFin, required HeureDebut, TypeCours, Description, Comments, isAllDay, Tag}): _CampusID = CampusID, _MajeureID = MajeureID, _CoursID = CoursID, _UserID = UserID, _Hote = Hote, _Position = Position, _Type = Type, _Titre = Titre, _HeureFin = HeureFin, _HeureDebut = HeureDebut, _TypeCours = TypeCours, _Description = Description, _Comments = Comments, _isAllDay = isAllDay, _Tag = Tag;

  factory Event({String? id, String? CampusID, String? MajeureID, String? CoursID, List<String>? UserID, String? Hote, String? Position, required String Type, required String Titre, TemporalDateTime? HeureFin, required TemporalDateTime HeureDebut, String? TypeCours, String? Description, String? Comments, bool? isAllDay, List<String>? Tag}) {
    return Event._internal(
        id: id == null ? UUID.getUUID() : id,
        CampusID: CampusID,
        MajeureID: MajeureID,
        CoursID: CoursID,
        UserID: UserID != null ? List<String>.unmodifiable(UserID) : UserID,
        Hote: Hote,
        Position: Position,
        Type: Type,
        Titre: Titre,
        HeureFin: HeureFin,
        HeureDebut: HeureDebut,
        TypeCours: TypeCours,
        Description: Description,
        Comments: Comments,
        isAllDay: isAllDay,
        Tag: Tag != null ? List<String>.unmodifiable(Tag) : Tag);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Event &&
        id == other.id &&
        _CampusID == other._CampusID &&
        _MajeureID == other._MajeureID &&
        _CoursID == other._CoursID &&
        DeepCollectionEquality().equals(_UserID, other._UserID) &&
        _Hote == other._Hote &&
        _Position == other._Position &&
        _Type == other._Type &&
        _Titre == other._Titre &&
        _HeureFin == other._HeureFin &&
        _HeureDebut == other._HeureDebut &&
        _TypeCours == other._TypeCours &&
        _Description == other._Description &&
        _Comments == other._Comments &&
        _isAllDay == other._isAllDay &&
        DeepCollectionEquality().equals(_Tag, other._Tag);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Event {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("CampusID=" + "$_CampusID" + ", ");
    buffer.write("MajeureID=" + "$_MajeureID" + ", ");
    buffer.write("CoursID=" + "$_CoursID" + ", ");
    buffer.write("UserID=" + (_UserID != null ? _UserID!.toString() : "null") + ", ");
    buffer.write("Hote=" + "$_Hote" + ", ");
    buffer.write("Position=" + "$_Position" + ", ");
    buffer.write("Type=" + "$_Type" + ", ");
    buffer.write("Titre=" + "$_Titre" + ", ");
    buffer.write("HeureFin=" + (_HeureFin != null ? _HeureFin!.format() : "null") + ", ");
    buffer.write("HeureDebut=" + (_HeureDebut != null ? _HeureDebut!.format() : "null") + ", ");
    buffer.write("TypeCours=" + "$_TypeCours" + ", ");
    buffer.write("Description=" + "$_Description" + ", ");
    buffer.write("Comments=" + "$_Comments" + ", ");
    buffer.write("isAllDay=" + (_isAllDay != null ? _isAllDay!.toString() : "null") + ", ");
    buffer.write("Tag=" + (_Tag != null ? _Tag!.toString() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Event copyWith({String? id, String? CampusID, String? MajeureID, String? CoursID, List<String>? UserID, String? Hote, String? Position, String? Type, String? Titre, TemporalDateTime? HeureFin, TemporalDateTime? HeureDebut, String? TypeCours, String? Description, String? Comments, bool? isAllDay, List<String>? Tag}) {
    return Event(
        id: id ?? this.id,
        CampusID: CampusID ?? this.CampusID,
        MajeureID: MajeureID ?? this.MajeureID,
        CoursID: CoursID ?? this.CoursID,
        UserID: UserID ?? this.UserID,
        Hote: Hote ?? this.Hote,
        Position: Position ?? this.Position,
        Type: Type ?? this.Type,
        Titre: Titre ?? this.Titre,
        HeureFin: HeureFin ?? this.HeureFin,
        HeureDebut: HeureDebut ?? this.HeureDebut,
        TypeCours: TypeCours ?? this.TypeCours,
        Description: Description ?? this.Description,
        Comments: Comments ?? this.Comments,
        isAllDay: isAllDay ?? this.isAllDay,
        Tag: Tag ?? this.Tag);
  }

  Event.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _CampusID = json['CampusID'],
        _MajeureID = json['MajeureID'],
        _CoursID = json['CoursID'],
        _UserID = json['UserID']?.cast<String>(),
        _Hote = json['Hote'],
        _Position = json['Position'],
        _Type = json['Type'],
        _Titre = json['Titre'],
        _HeureFin = json['HeureFin'] != null ? TemporalDateTime.fromString(json['HeureFin']) : null,
        _HeureDebut = json['HeureDebut'] != null ? TemporalDateTime.fromString(json['HeureDebut']) : null,
        _TypeCours = json['TypeCours'],
        _Description = json['Description'],
        _Comments = json['Comments'],
        _isAllDay = json['isAllDay'],
        _Tag = json['Tag']?.cast<String>();

  Map<String, dynamic> toJson() => {
    'id': id, 'CampusID': _CampusID, 'MajeureID': _MajeureID, 'CoursID': _CoursID, 'UserID': _UserID, 'Hote': _Hote, 'Position': _Position, 'Type': _Type, 'Titre': _Titre, 'HeureFin': _HeureFin?.format(), 'HeureDebut': _HeureDebut?.format(), 'TypeCours': _TypeCours, 'Description': _Description, 'Comments': _Comments, 'isAllDay': _isAllDay, 'Tag': _Tag
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField CAMPUSID = QueryField(fieldName: "CampusID");
  static final QueryField MAJEUREID = QueryField(fieldName: "MajeureID");
  static final QueryField COURSID = QueryField(fieldName: "CoursID");
  static final QueryField USERID = QueryField(fieldName: "UserID");
  static final QueryField HOTE = QueryField(fieldName: "Hote");
  static final QueryField POSITION = QueryField(fieldName: "Position");
  static final QueryField TYPE = QueryField(fieldName: "Type");
  static final QueryField TITRE = QueryField(fieldName: "Titre");
  static final QueryField HEUREFIN = QueryField(fieldName: "HeureFin");
  static final QueryField HEUREDEBUT = QueryField(fieldName: "HeureDebut");
  static final QueryField TYPECOURS = QueryField(fieldName: "TypeCours");
  static final QueryField DESCRIPTION = QueryField(fieldName: "Description");
  static final QueryField COMMENTS = QueryField(fieldName: "Comments");
  static final QueryField ISALLDAY = QueryField(fieldName: "isAllDay");
  static final QueryField TAG = QueryField(fieldName: "Tag");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Event";
    modelSchemaDefinition.pluralName = "Events";

    modelSchemaDefinition.authRules = [
      AuthRule(
          authStrategy: AuthStrategy.PUBLIC,
          operations: [
            ModelOperation.CREATE,
            ModelOperation.UPDATE,
            ModelOperation.DELETE,
            ModelOperation.READ
          ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Event.CAMPUSID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Event.MAJEUREID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Event.COURSID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Event.USERID,
        isRequired: false,
        isArray: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Event.HOTE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Event.POSITION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Event.TYPE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Event.TITRE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Event.HEUREFIN,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Event.HEUREDEBUT,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Event.TYPECOURS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Event.DESCRIPTION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Event.COMMENTS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Event.ISALLDAY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Event.TAG,
        isRequired: false,
        isArray: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
  });
}

class _EventModelType extends ModelType<Event> {
  const _EventModelType();

  @override
  Event fromJson(Map<String, dynamic> jsonData) {
    return Event.fromJson(jsonData);
  }
}
 */

import 'package:flutter/material.dart';

class Event {
  final String title;
  final String description;
  final DateTime fromDate;
  final DateTime toDate;
  final String tag;
  final Color backgroundColor;
  //final bool isAllDay;

  const Event({
    required this.title,
    this.description = "",
    required this.fromDate,
    required this.toDate,
    this.tag = "",
    this.backgroundColor = Colors.green,
    //this.isAllDay = false,
  });
}
