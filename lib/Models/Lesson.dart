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
      CoursID: json['CoursID'],
      CampusID: json['CampusID'],
      MajeureID: json['MajeureID'],
      HeureDebut: toDateTime(json['HeureDebut']),
      HeureFin: toDateTime(json['HeureFin']),
      NomCours: json['NomCours'],
      Professeur: json['Professeur'],
      Salle: json['Salle'],
      TypeBloc: json['TypeBloc'],
    );
  }
}

DateTime toDateTime(String? _datetime) {
  if (_datetime != null) {
    final dt = _datetime!.split("-");
    return DateTime.parse(dt[0] + dt[1] + dt[2] + "T" + dt[3] + dt[4]);
  } else {
    return DateTime(DateTime.now().year, 01, 01);
  }
}
