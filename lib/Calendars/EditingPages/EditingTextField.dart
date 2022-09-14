import 'package:flutter/material.dart';

Widget EditingTextField({
  required String labelText,
  required String data,
  required Function onUpdate,
}) {
  return TextFormField(
    decoration: InputDecoration(
      border: const UnderlineInputBorder(),
      hintText: (labelText == "Titre")
          ? "Titre"
          : (labelText == "Description")
              ? "Description"
              : (labelText == "Localisation")
                  ? "Localisation"
                  : "",
    ),
    style: TextStyle(
      fontSize: (labelText == "Titre") ? 28 : 18,
    ),
    autocorrect: true,
    maxLength: (labelText == "Titre")
        ? 50
        : (labelText == "Description")
            ? 250
            : null,
    minLines: 1,
    maxLines: (labelText == "Titre") ? 2 : 8,
    initialValue: data,
    onChanged: (value) => onUpdate(value),
    validator: (String? value) {
      if (labelText != "Titre") {
        return null;
      }
      if (value == null || value.isEmpty || value.trim() == "") {
        return "Le titre ne peut pas être vide";
      }
      return null;
    },
  );
}
