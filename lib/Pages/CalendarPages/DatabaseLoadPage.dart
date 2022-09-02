import 'dart:convert';
import 'dart:io';

import 'package:jwt_decode/jwt_decode.dart';
import 'package:http/http.dart' as http;

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

import 'package:flutter/material.dart';

import '../../Calendars/Calendar.dart';
import '../../models/Lesson.dart';
import 'package:navigation_drawer_test/Utils/Calendar/localLessonHandler.dart';

class DatabaseLoadPage extends StatefulWidget{
  List<String> promotions;
  int CalendarFormatIndex;
  String currentView;

  DatabaseLoadPage(this.promotions, this.CalendarFormatIndex, this.currentView, {super.key});

  @override
   _DatabaseLoadPageState createState() =>  _DatabaseLoadPageState(promotions, CalendarFormatIndex, currentView);
}

class _DatabaseLoadPageState extends State<DatabaseLoadPage> {

  List<String> promotions;
  int CalendarFormatIndex;
  String currentView;

  _DatabaseLoadPageState(this.promotions, this.CalendarFormatIndex, this.currentView);

  late bool _isLoading = true;
  late Future<List<Lesson>> futureObject;

  Future<List<Lesson>> fetchLessonFromLambda() async {
    List<Lesson> Lessons =[];
    final response = await http.get(
        Uri.parse('https://7z7gj5ro64.execute-api.eu-west-3.amazonaws.com/prod/lessonget'),
        headers: {HttpHeaders.authorizationHeader : await _getIdToken()});
   print("response status: ${response.statusCode}");
    if(response.statusCode == 200){
      try{
        final lessons = json.decode(json.decode(response.body)["body"]);
        for(var lesson in lessons) {
          Lessons.add(Lesson.fromJson(lesson));
        }
        return Lessons;
      }catch(e){rethrow;}
    }else {
      throw Exception('Failed to load lessons');
    }
  }

  Future _getIdToken() async {
    final authSession = (await Amplify.Auth.fetchAuthSession(
      options: CognitoSessionOptions(getAWSCredentials: true),
    )) as CognitoAuthSession;
    final idToken = authSession.userPoolTokens?.idToken;
    Map<String, dynamic> payload = Jwt.parseJwt(idToken!);
    return idToken;
  }


  Future<List<Lesson>> readLessonByReference(String reference,String referenceValue) async{

    List<Lesson> targetLessons = [];
    List<Lesson> lessons = await fetchLessonFromLambda();

    if(reference == "CoursID"){
      for(Lesson lesson in lessons){
        if(lesson.CoursID == referenceValue){targetLessons.add(lesson);}}

    }else if(reference == "CampusID"){
      for(Lesson lesson in lessons){
        if(lesson.CampusID == referenceValue){targetLessons.add(lesson);}}

    }else if(reference == "HeureDebut"){
      for(Lesson lesson in lessons){
        if(lesson.HeureDebut == toDateTime(referenceValue)){targetLessons.add(lesson);}}

    }else if(reference == "HeureFin"){
      for(Lesson lesson in lessons){
        if(lesson.HeureFin == toDateTime(referenceValue)){targetLessons.add(lesson);}}

    }else if(reference == "MajeureID"){
      for(Lesson lesson in lessons){
        if(lesson.MajeureID == referenceValue){targetLessons.add(lesson);}}

    }else if(reference == "NomCours"){
      for(Lesson lesson in lessons){
        if(lesson. NomCours == referenceValue){targetLessons.add(lesson);}}

    }else if(reference == "Professeur"){
      for(Lesson lesson in lessons){
        if(lesson.Professeur == referenceValue){targetLessons.add(lesson);}}

    }else if(reference == "Salle"){
      for(Lesson lesson in lessons){
        if(lesson.Salle == referenceValue){targetLessons.add(lesson);}}

    }else if(reference == "TypeBloc"){
      for(Lesson lesson in lessons){
        if(lesson.TypeBloc == referenceValue){targetLessons.add(lesson);}}

    }else {
      print("invalid reference");
    }
    return targetLessons;
  }

  Future<List<Lesson>> readLessonsByPromotions(List<String> promotions) async{
    List<Lesson> lessons = [];
    for(final promo in promotions){
      final lesson = await readLessonByReference("MajeureID", promo);
      lessons.addAll(lesson);
    }
    return lessons;
  }

  @override
  void initState()  {
    super.initState();
    futureObject = readLessonsByPromotions(["1A","1C"]);
    setState(() {
      _isLoading = false; // important to set the state!
    });
  }

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: futureObject,
      builder: (context, AsyncSnapshot snapshot) {
        print(snapshot.data);
        List<Lesson> lessons = snapshot.data;
        Navigator.push(context, MaterialPageRoute(builder: (context) => Calendar("Mon Calendrier", 0, lessons)));
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      }
    );
  }
}
