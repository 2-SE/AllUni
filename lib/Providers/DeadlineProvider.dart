// import 'package:AllUni/Models/DeadlinesModel.dart';
// import 'package:flutter/cupertino.dart';
//
// class DeadlineProvider extends ChangeNotifier {
//   final List<Deadline> _deadlines = [];
//
//   List<Deadline> get deadlines => _deadlines;
//
//   void addDeadline(Deadline deadline) {
//     _deadlines.add(deadline);
//     notifyListeners();
//   }
//
//   void deleteDeadline(Deadline deadline) {
//     _deadlines.remove(deadline);
//     notifyListeners();
//   }
//
//   void editDeadline(
//     Deadline newDeadline,
//     Deadline oldDeadline,
//   ) {
//     final index = _deadlines.indexOf(oldDeadline);
//     _deadlines[index] = newDeadline;
//     notifyListeners();
//   }
// }