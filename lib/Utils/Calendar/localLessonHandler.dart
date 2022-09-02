import 'package:amplify_flutter/amplify_flutter.dart';

import 'package:uuid/uuid.dart';

import 'package:navigation_drawer_test/models/Lesson.dart';
import 'package:navigation_drawer_test/models/localLesson.dart';



class localLessonHandler {

  localLesson LessonToLocalLesson(Lesson lesson){
    var uuid = Uuid();
      return localLesson(
          id: uuid.v1(),
          CampusID: lesson.CampusID,
          MajeureID: lesson.MajeureID,
          HeureDebut: TemporalDateTime(lesson.HeureDebut!),
          HeureFin: TemporalDateTime(lesson.HeureFin!),
          NomCours: lesson.NomCours,
          Professeur: lesson.Professeur,
          Salle: lesson.Salle,
      );
  }

  Lesson localLessonToLesson(localLesson lesson){
  return Lesson(
    CampusID: lesson.CampusID,
    MajeureID: lesson.MajeureID,
    HeureDebut: DateTime.parse(lesson.HeureDebut!.toString()),
    HeureFin: DateTime.parse(lesson.HeureFin!.toString()),
    NomCours: lesson.NomCours,
    Professeur: lesson.Professeur,
    Salle: lesson.Salle,
  );
  }


  Future<List<localLesson>> fetchLocalLessons() async {
  final result =  await Amplify.DataStore.query(localLesson.classType);
  return result;
  }

  Future<List<localLesson>> fetchLocalLessonsByReference(String reference, String referenceValue) async{

  List<localLesson> result = [];
  if(reference == "ID"){
    result = await Amplify.DataStore.query(localLesson.classType, where: localLesson.ID.eq(referenceValue));
  }else if(reference == "CAMPUSID"){
    result = await Amplify.DataStore.query(localLesson.classType, where: localLesson.CAMPUSID.eq(referenceValue));
  }else if(reference == "MAJEUREID"){
    result = await Amplify.DataStore.query(localLesson.classType, where: localLesson.MAJEUREID.eq(referenceValue));
  }else if(reference == "HEUREDEBUT"){
    result = await Amplify.DataStore.query(localLesson.classType, where: localLesson.HEUREDEBUT.eq(TemporalDateTime(toDateTime(referenceValue))));
  }else if(reference == "HEUREFIN"){
    result = await Amplify.DataStore.query(localLesson.classType, where: localLesson.HEUREFIN.eq(TemporalDateTime(toDateTime(referenceValue))));
  }else if(reference == "NOMCOURS"){
    result = await Amplify.DataStore.query(localLesson.classType, where: localLesson.NOMCOURS.eq(referenceValue));
  }else if(reference == "PROFESSEUR"){
    result = await Amplify.DataStore.query(localLesson.classType, where: localLesson.PROFESSEUR.eq(referenceValue));
  }else if(reference == "SALLE"){
    result = await Amplify.DataStore.query(localLesson.classType, where: localLesson.SALLE.eq(referenceValue));
  }else if(reference == "TYPEBLOC"){
    result = await Amplify.DataStore.query(localLesson.classType, where: localLesson.TYPEBLOC.eq(referenceValue));
  }
  return result;
  }

  Future<void> createLocalLesson(localLesson lesson) async{
  late String id;
  final userAttributes = await Amplify.Auth.fetchUserAttributes();
  for(final keys in userAttributes){if(keys.userAttributeKey == "sub"){id = keys.value;}}
  localLesson tlesson = lesson.copyWith(id: id);
  await Amplify.DataStore.save(tlesson);
  }

  Future<void> updateLocalLesson(localLesson oldLesson, localLesson newLesson) async {
  final lessons = await Amplify.DataStore.query(localLesson.classType, where: localLesson.ID.eq(oldLesson.id));
  if(lessons.isNotEmpty){
    newLesson = newLesson.copyWith(id: oldLesson.id);
    await Amplify.DataStore.save(newLesson);
  }else{
    print("no oldLesson");
   }
  }

  Future<void> deleteLocalLesson(localLesson lesson) async {
  await Amplify.DataStore.delete(lesson);
  }


  }