import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';

import 'package:uuid/uuid.dart';

import 'package:all_uni_dev/models/Lesson.dart';
import 'package:all_uni_dev/models/LocalLesson.dart';



class LocalLessonHandler {

  LocalLesson LessonToLocalLesson(Lesson lesson){
    var uuid = Uuid();
      return LocalLesson(
          UserID: '',
          id: uuid.v1(),
          HeureDebut: TemporalDateTime(lesson.HeureDebut!),
          HeureFin: TemporalDateTime(lesson.HeureFin!),
          NomCours: lesson.NomCours,
          Professeur: lesson.Professeur,
          Salle: lesson.Salle,
          Tags: [""],

      );
  }

  Lesson LocalLessonToLesson(LocalLesson lesson){
  return Lesson(
    CampusID: "",
    MajeureID: "",
    HeureDebut: DateTime.parse(lesson.HeureDebut!.toString()),
    HeureFin: DateTime.parse(lesson.HeureFin!.toString()),
    NomCours: lesson.NomCours,
    Professeur: lesson.Professeur,
    Salle: lesson.Salle,
  );
  }

  Stream<GraphQLResponse<LocalLesson>> subscribe() {
    final subscriptionRequest = ModelSubscriptions.onCreate(LocalLesson.classType);
    final Stream<GraphQLResponse<LocalLesson>> operation = Amplify.API.subscribe(
      subscriptionRequest,
      onEstablished: () => print('Subscription established'),
    ).take(5) // Listens to only 5 elements
        .handleError((error) {
      print('Error in subscription stream: $error');
    },
    );
    return operation;
  }

  Future<List<LocalLesson>> fetchLocalLessons() async {
  final result =  await Amplify.DataStore.query(LocalLesson.classType);
  return result;
  }

  Future<List<Lesson>> fetchLocalLessonToLesson() async{
    List<Lesson> lessons = [];
    final llessons = await fetchLocalLessons();
    for(final lesson in llessons){
      lessons.add(LocalLessonToLesson(lesson));
    }
    return lessons;
  }

  Future<List<LocalLesson>> fetchLocalLessonsByReference(String reference, String referenceValue) async{
  List<LocalLesson> result = [];
  if(reference == "ID"){
    result = await Amplify.DataStore.query(LocalLesson.classType, where: LocalLesson.ID.eq(referenceValue));
  }else if(reference == "HEUREDEBUT"){
    result = await Amplify.DataStore.query(LocalLesson.classType, where: LocalLesson.HEUREDEBUT.eq(TemporalDateTime(toDateTime(referenceValue))));
  }else if(reference == "HEUREFIN"){
    result = await Amplify.DataStore.query(LocalLesson.classType, where: LocalLesson.HEUREFIN.eq(TemporalDateTime(toDateTime(referenceValue))));
  }else if(reference == "NOMCOURS"){
    result = await Amplify.DataStore.query(LocalLesson.classType, where: LocalLesson.NOMCOURS.eq(referenceValue));
  }else if(reference == "PROFESSEUR"){
    result = await Amplify.DataStore.query(LocalLesson.classType, where: LocalLesson.PROFESSEUR.eq(referenceValue));
  }else if(reference == "SALLE"){
    result = await Amplify.DataStore.query(LocalLesson.classType, where: LocalLesson.SALLE.eq(referenceValue));
  }else if(reference == "TYPEBLOC"){
    result = await Amplify.DataStore.query(LocalLesson.classType, where: LocalLesson.TYPEBLOC.eq(referenceValue));
  }
  return result;
  }

  Future<Map<UserAttributeKey, String>> fetchCurrentUserAttributes() async {
    Map<UserAttributeKey, String> _map = Map();
    try {
      final result = await Amplify.Auth.fetchUserAttributes();
      for (final element in result) {
        _map[element.userAttributeKey] = element.value;
      }
    } on AuthException catch (e) {
      print(e.message);
    }
    print(_map);
    return _map;
  }

  Future<void> createLocalLesson(LocalLesson lesson) async{
  var uuid = Uuid();
  late String UserId;
  final userAttributes = await fetchCurrentUserAttributes();
  UserId = userAttributes[CognitoUserAttributeKey.email]!;
  LocalLesson tlesson = lesson.copyWith(UserID: UserId, id: uuid.v1() );
  try{await Amplify.DataStore.save(tlesson);}catch(e){print("amplify ds $e");}
  }

  Future<void> updateLocalLesson(LocalLesson oldLesson, LocalLesson newLesson) async {
  final lessons = await Amplify.DataStore.query(LocalLesson.classType, where: LocalLesson.ID.eq(oldLesson.id));
  if(lessons.isNotEmpty){
    newLesson = newLesson.copyWith(id: oldLesson.id);
    await Amplify.DataStore.save(newLesson);
  }else{
    print("no oldLesson");
   }
  }

  Future<void> deleteLocalLesson(LocalLesson lesson) async {
    try {
      final test = await Amplify.DataStore.query(LocalLesson.classType,
          where: LocalLesson.NOMCOURS.eq(lesson.NomCours));
        final testF = test?.first;
        await Amplify.DataStore.delete(testF!);
    }catch(e){print("DStore error");}
  }

  }