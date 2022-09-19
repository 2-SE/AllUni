import 'dart:convert';

class Lesson {
  late String? id;
  late String? CoursID;
  late String? CampusID;
  late String? MajeureID;
  late DateTime? HeureDebut;
  late DateTime? HeureFin;
  late String? NomCours;
  late String? Professeur;
  late String? Salle;
  late String? TypeBloc;

  Lesson({
    this.id,
    this.CampusID,
    this.MajeureID,
    this.HeureDebut,
    this.HeureFin,
    this.NomCours,
    this.Professeur,
    this.Salle,
    this.TypeBloc,
    this.CoursID,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      // BDD - RECUPERATION SCRAPPING
      id: "",
      CoursID: utf8.decode(json['CoursID'].codeUnits),
      CampusID: utf8.decode(json['CampusID'].codeUnits),
      MajeureID: utf8.decode(json['MajeureID'].codeUnits),
      HeureDebut: TemporalDateTime_To_DateTime(json['HeureDebut']),
      HeureFin: TemporalDateTime_To_DateTime(json['HeureFin']),
      NomCours: utf8.decode(json['NomCours'].codeUnits),
      Professeur: utf8.decode(json['Professeur'].codeUnits),
      Salle: utf8.decode(json['Salle'].codeUnits),
      TypeBloc: utf8.decode(json['TypeBloc'].codeUnits),
    );
  }
}

DateTime TemporalDateTime_To_DateTime(String? _datetime) {
  if (_datetime != null) {
    final dt = _datetime.split("-");
    final dtParse = DateTime.parse(dt[0] + dt[1] + dt[2] + "T" + dt[3] + dt[4]);
    return dtParse;
  } else {
    return DateTime(DateTime.now().year, 01, 01);
  }
}
