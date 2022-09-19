import 'package:AllUni/Models/CalendarAppointmentsModel.dart';
import 'package:AllUni/Models/Lesson.dart';
import 'package:AllUni/Models/LocalLesson.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:uuid/uuid.dart';

class LocalLessonHandler {
  LocalLesson LessonToLocalLesson(Lesson lesson) {
    var uuid = Uuid();
    return LocalLesson(
      UserID: '',
      id: uuid.v1(),
      FromTime: TemporalDateTime(lesson.HeureDebut!),
      ToTime: TemporalDateTime(lesson.HeureFin!),
      Titre: lesson.NomCours!,
      Professor: lesson.Professeur,
      Location: lesson.Salle,
      Tags: const [],
    );
  }

  Lesson LocalLessonToLesson(LocalLesson lesson) {
    return Lesson(
      CampusID: "",
      MajeureID: "",
      HeureDebut: DateTime.parse(lesson.FromTime!.toString()),
      HeureFin: DateTime.parse(lesson.ToTime!.toString()),
      NomCours: lesson.Titre,
      Professeur: lesson.Professor,
      Salle: lesson.Location,
    );
  }

  // Lesson AppointmentToLesson(CalendarAppointment appointment) {
  //   return Lesson(
  //     id: appointment.id,
  //     HeureFin: TemporalDateTime(appointment.fromDate),
  //     HeureDebut: TemporalDateTime(appointment.toDate),
  //     NomCours: appointment.title,
  //     Professeur: "",
  //     Description: appointment.description,
  //     Salle: appointment.localization,
  //     TypeBloc: "",
  //     Tags: appointment.tagsNames,
  //   );
  // }

  CalendarAppointment LocalLessonToAppointment(LocalLesson lesson) {
    return CalendarAppointment(
      id: lesson.id,
      appointmentType: lesson.TypeBloc ?? "",
      title: lesson.Titre,
      description: lesson.Description ?? "",
      fromDate: DateTime.parse(lesson.FromTime!.toString()),
      toDate: DateTime.parse(lesson.ToTime!.toString()),
      deadlineDate: DateTime.parse(lesson.ToTime!.toString()),
      localization: lesson.Location!,
      tagsNames: lesson.Tags!,
    );
  }

  Stream<GraphQLResponse<LocalLesson>> subscribe() {
    final subscriptionRequest =
        ModelSubscriptions.onCreate(LocalLesson.classType);
    final Stream<GraphQLResponse<LocalLesson>> operation = Amplify.API
        .subscribe(
          subscriptionRequest,
          onEstablished: () => print('Subscription established'),
        )
        .take(5) // Listens to only 5 elements
        .handleError(
      (error) {
        print('Error in subscription stream: $error');
      },
    );
    return operation;
  }

  Future<List<LocalLesson>> fetchLocalLessons() async {
    final result = await Amplify.DataStore.query(LocalLesson.classType);
    return result;
  }

  Future<List<Lesson>> fetchLocalLessonToLesson() async {
    List<Lesson> lessons = [];
    final llessons = await fetchLocalLessons();
    for (final lesson in llessons) {
      lessons.add(LocalLessonToLesson(lesson));
    }
    return lessons;
  }

  Future<List<LocalLesson>> fetchLocalLessonsByReference(
      String reference, String referenceValue) async {
    List<LocalLesson> result = [];
    if (reference == "ID") {
      result = await Amplify.DataStore.query(LocalLesson.classType,
          where: LocalLesson.ID.eq(referenceValue));
    } else if (reference == "FROMTIME") {
      result = await Amplify.DataStore.query(LocalLesson.classType,
          where: LocalLesson.FROMTIME
              .eq(TemporalDateTime(toDateTime(referenceValue))));
    } else if (reference == "TOTIME") {
      result = await Amplify.DataStore.query(LocalLesson.classType,
          where: LocalLesson.TOTIME
              .eq(TemporalDateTime(toDateTime(referenceValue))));
    } else if (reference == "TITRE") {
      result = await Amplify.DataStore.query(LocalLesson.classType,
          where: LocalLesson.TITRE.eq(referenceValue));
    } else if (reference == "DESCRIPTION") {
      result = await Amplify.DataStore.query(LocalLesson.classType,
          where: LocalLesson.DESCRIPTION.eq(referenceValue));
    } else if (reference == "PROFESSOR") {
      result = await Amplify.DataStore.query(LocalLesson.classType,
          where: LocalLesson.PROFESSOR.eq(referenceValue));
    } else if (reference == "LOCATION") {
      result = await Amplify.DataStore.query(LocalLesson.classType,
          where: LocalLesson.LOCATION.eq(referenceValue));
    } else if (reference == "TYPEBLOC") {
      result = await Amplify.DataStore.query(LocalLesson.classType,
          where: LocalLesson.TYPEBLOC.eq(referenceValue));
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

  Future<void> createLocalLesson(LocalLesson lesson) async {
    var uuid = Uuid();
    late String UserId;
    final userAttributes = await fetchCurrentUserAttributes();
    UserId = userAttributes[CognitoUserAttributeKey.email]!;
    LocalLesson tlesson = lesson.copyWith(UserID: UserId, id: uuid.v1());
    try {
      await Amplify.DataStore.save(tlesson);
    } catch (e) {
      print("Amplify ds $e");
    }
  }

  Future<void> updateLocalLesson(
      LocalLesson oldLesson, LocalLesson newLesson) async {
    final lessons = await Amplify.DataStore.query(LocalLesson.classType,
        where: LocalLesson.ID.eq(oldLesson.id));
    if (lessons.isNotEmpty) {
      newLesson = newLesson.copyWith(id: oldLesson.id);
      await Amplify.DataStore.save(newLesson);
    } else {
      print("No oldLesson");
    }
  }

  Future<void> deleteLocalLesson(LocalLesson lesson) async {
    try {
      final test = await Amplify.DataStore.query(LocalLesson.classType,
          where: LocalLesson.TITRE.eq(lesson.Titre));
      final testF = test.first;
      await Amplify.DataStore.delete(testF);
    } catch (e) {
      print("DStore error");
    }
  }
}
