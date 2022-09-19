import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:AllUni/Calendars/Calendar.dart';
import 'package:AllUni/Models/CalendarAppointmentsModel.dart';
import 'package:AllUni/Models/Lesson.dart';
import 'package:AllUni/Models/LocalLesson.dart';
import 'package:AllUni/Utils/Calendar/localLessonHandler.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';

class DatabaseLoadPage extends StatefulWidget {
  List<String> promotions;
  int CalendarFormatIndex;
  String currentView;

  DatabaseLoadPage(this.promotions, this.CalendarFormatIndex, this.currentView,
      {super.key});

  @override
  _DatabaseLoadPageState createState() =>
      _DatabaseLoadPageState(promotions, CalendarFormatIndex, currentView);
}

class _DatabaseLoadPageState extends State<DatabaseLoadPage> {
  List<String> promotions;
  int CalendarFormatIndex;
  String currentView;

  _DatabaseLoadPageState(
      this.promotions, this.CalendarFormatIndex, this.currentView);

  late bool _isLoading = true;
  late Future<List<CalendarAppointment>> futureObject;

  StreamSubscription<QuerySnapshot<LocalLesson>>? _stream;

  List<LocalLesson> _lessons = [];

  bool _isSynced = false;

  Future<List<Lesson>> fetchLessonFromLambda() async {
    // RÉCUPERE VIA CALL HTTP (API Gateway)
    List<Lesson> Lessons = [];
    final response = await http.get(
      Uri.parse(
          'https://7z7gj5ro64.execute-api.eu-west-3.amazonaws.com/prod/lessonget'),
      headers: {
        HttpHeaders.authorizationHeader: await _getIdToken(),
      },
    );
    print("response status: ${response.statusCode}");
    if (response.statusCode == 200) {
      // SI USER = CONNECTÉ
      try {
        final lessons = json.decode(json.decode(response.body)["body"]);
        for (var lesson in lessons) {
          Lessons.add(Lesson.fromJson(lesson));
        }
        return Lessons;
      } catch (e) {
        rethrow;
      }
    } else {
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

  Future<List<Lesson>> readLessonByReference(
      String reference, String referenceValue) async {
    List<Lesson> targetLessons = [];
    List<Lesson> lessons = await fetchLessonFromLambda();

    if (reference == "CoursID") {
      for (Lesson lesson in lessons) {
        if (lesson.CoursID == referenceValue) {
          targetLessons.add(lesson);
        }
      }
    } else if (reference == "CampusID") {
      for (Lesson lesson in lessons) {
        if (lesson.CampusID == referenceValue) {
          targetLessons.add(lesson);
        }
      }
    } else if (reference == "HeureDebut") {
      for (Lesson lesson in lessons) {
        if (lesson.HeureDebut == toDateTime(referenceValue)) {
          targetLessons.add(lesson);
        }
      }
    } else if (reference == "HeureFin") {
      for (Lesson lesson in lessons) {
        if (lesson.HeureFin == toDateTime(referenceValue)) {
          targetLessons.add(lesson);
        }
      }
    } else if (reference == "MajeureID") {
      for (Lesson lesson in lessons) {
        if (lesson.MajeureID == referenceValue) {
          targetLessons.add(lesson);
        }
      }
    } else if (reference == "NomCours") {
      for (Lesson lesson in lessons) {
        if (lesson.NomCours == referenceValue) {
          targetLessons.add(lesson);
        }
      }
    } else if (reference == "Professeur") {
      for (Lesson lesson in lessons) {
        if (lesson.Professeur == referenceValue) {
          targetLessons.add(lesson);
        }
      }
    } else if (reference == "Salle") {
      for (Lesson lesson in lessons) {
        if (lesson.Salle == referenceValue) {
          targetLessons.add(lesson);
        }
      }
    } else if (reference == "TypeBloc") {
      for (Lesson lesson in lessons) {
        if (lesson.TypeBloc == referenceValue) {
          targetLessons.add(lesson);
        }
      }
    } else {
      print("invalid reference");
    }
    return targetLessons;
  }

  Future<List<CalendarAppointment>> readLessonsByPromotions(
      List<String> promotions) async {
    List<LocalLesson> lessons = [];
    for (final promo in promotions) {
      final lesson = await readLessonByReference("MajeureID", promo);
      // lessons.addAll(lesson);
      for (final key in lesson) {
        lessons.add(LocalLessonHandler().LessonToLocalLesson(key));
      }
    }

    final tlessons = await LocalLessonHandler().fetchLocalLessons();
    observeQuery();
    lessons.addAll(tlessons);

    if (lessons != []) {
      setState(() {
        Future.delayed(const Duration(seconds: 5));
        _isLoading = false;
      });
    }

    List<CalendarAppointment> appointments = [];
    for (final lesson in lessons) {
      appointments.add(LocalLessonHandler().LocalLessonToAppointment(lesson));
    }
    return appointments;
  }

  void observeQuery() {
    _stream = Amplify.DataStore.observeQuery(LocalLesson.classType)
        .listen((QuerySnapshot<LocalLesson> snapshot) {
      setState(() {
        _lessons = snapshot.items;
        _isSynced = snapshot.isSynced;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    futureObject = readLessonsByPromotions(widget.promotions);
    print("future:: $futureObject");
    Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : FutureBuilder(
            future: futureObject,
            builder: (context, AsyncSnapshot snapshot) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Calendar(
                      widget.currentView,
                      widget.CalendarFormatIndex,
                      widget.promotions,
                      snapshot.data,
                    ),
                  ),
                );
              });
              return Container();
            });
  }
}
