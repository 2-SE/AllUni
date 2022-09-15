import 'package:flutter/foundation.dart';

class CustomTag {
  late String label;
  CustomTag({
    required this.label,
  });
}

class CustomTagProvider with ChangeNotifier, DiagnosticableTreeMixin {
  late List<CustomTag> _tags = [];

  List<CustomTag> get tags => _tags;

  void addTagValue(CustomTag tag) {
    _tags.add(tag);
    notifyListeners();
  }

  void deleteTagValue() {
    _tags = [];
    notifyListeners();
  }

  void editTagValue(
      CustomTag newTag,
      CustomTag oldTag,
      ) {
    final index = _tags.indexOf(oldTag);
    _tags[index] = newTag;
    notifyListeners();
  }

  //List<String> get customActivatedTagsTag => _tags.map((t) => t.label).toList();
  String get customActivatedTag => _tags[0].label.toString();
  int get getCustomTagLength => _tags.length;
}