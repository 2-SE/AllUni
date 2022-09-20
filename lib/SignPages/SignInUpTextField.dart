import 'package:flutter/material.dart';

class SignInUpTextField extends StatefulWidget {
  final String labelText;
  final String data;
  late bool isHidable;
  final Function onUpdate;
  SignInUpTextField(
      {Key? key,
      required this.labelText,
      required this.data,
      required this.isHidable,
      required this.onUpdate})
      : super(key: key);

  @override
  State<SignInUpTextField> createState() => _SignInUpTextFieldState();
}

class _SignInUpTextFieldState extends State<SignInUpTextField> {
  late bool isObscure = (widget.isHidable) ? true : false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            10,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x604C75A0),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(2, 3),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextFormField(
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            hintText: widget.labelText,
            suffixIcon: (widget.isHidable)
                ? IconButton(
                    icon: Icon(
                      (isObscure) ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    })
                : null,
            // suffix: (isObscure == false && data.trim() == "")
            //     ? ClipRRect(
            //         child: Container(
            //           decoration: BoxDecoration(
            //             borderRadius: const BorderRadius.only(
            //               topLeft: Radius.circular(8),
            //               topRight: Radius.circular(8),
            //               bottomLeft: Radius.circular(12),
            //               bottomRight: Radius.circular(12),
            //             ),
            //             border: Border.all(width: 1, color: Colors.grey),
            //           ),
            //           child: const Padding(
            //             padding: EdgeInsets.symmetric(horizontal: 8),
            //             child: Text("@esme.fr"),
            //           ),
            //         ),
            //       )
            //     : null,
          ),
          style: const TextStyle(
            fontSize: 18,
          ),
          autocorrect: false,
          maxLines: 1,
          obscureText: isObscure,
          initialValue: widget.data,
          onChanged: (value) => widget.onUpdate(value),
          validator: (String? value) {
            if (value == null || value.isEmpty || value.trim() == "") {
              return "Le champ ne peut pas être vide";
            }
            return null;
          },
        ),
      ),
    );
  }
}

/*
Widget SignInUpTextField({
  required String labelText,
  required String data,
  required bool isObscure,
  required Function onUpdate,
}) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x604C75A0),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(2, 3),
          )
        ]),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          hintText: labelText,
          // suffixIcon: (isObscure)
          //     ? IconButton(
          //         icon:
          //             Icon(isObscure ? Icons.visibility : Icons.visibility_off),
          //         onPressed: () {
          //           isObscure = !isObscure;
          //         })
          //     : null,
// ----------------
          // suffix: (isObscure == false && data.trim() == "")
          //     ? ClipRRect(
          //         child: Container(
          //           decoration: BoxDecoration(
          //             borderRadius: const BorderRadius.only(
          //               topLeft: Radius.circular(8),
          //               topRight: Radius.circular(8),
          //               bottomLeft: Radius.circular(12),
          //               bottomRight: Radius.circular(12),
          //             ),
          //             border: Border.all(width: 1, color: Colors.grey),
          //           ),
          //           child: const Padding(
          //             padding: EdgeInsets.symmetric(horizontal: 8),
          //             child: Text("@esme.fr"),
          //           ),
          //         ),
          //       )
          //     : null,
        ),
        style: const TextStyle(
          fontSize: 18,
        ),
        autocorrect: false,
        maxLines: 1,
        obscureText: isObscure,
        initialValue: data,
        onChanged: (value) => onUpdate(value),
        validator: (String? value) {
          if (value == null || value.isEmpty || value.trim() == "") {
            return "Le champ ne peut pas être vide";
          }
          return null;
        },
      ),
    ),
  );
}
*/
