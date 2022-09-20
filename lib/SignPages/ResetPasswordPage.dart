import 'package:AllUni/SignPages/SignInUpTextField.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({Key? key}) : super(key: key);

  String _email = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 90,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/images/logos/LogoOpacity10.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Image.asset(
                        "assets/images/calligraphy/BlueAllUniCalligraphy.png",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      "Créer un compte",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      "Merci de rentrer votre email pour recevoir le message de récupération",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),
                    SignInUpTextField(
                      labelText: "Email",
                      data: _email,
                      isHidable: false,
                      onUpdate: (value) {
                        _email = value;
                      },
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith(
                          (states) => const Color(0xFFFFFFFF).withOpacity(0.15),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xFF4C75A0),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      child: SizedBox(
                        height: 30,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Center(
                            child: Text(
                              "Envoyer",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:AllUni/SignPages/SignInPage.dart';
// import 'package:AllUni/Utils/SignUpInOut.dart';
// import 'package:flutter/material.dart';
//
// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});
//
//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }
//
// class _SignUpPageState extends State<SignUpPage> {
//   final _formKey = GlobalKey<FormState>();
//   String? _password;
//   String? _username;
//   String? _email;
//   String? _confCode;
//   TextEditingController _passwordController = TextEditingController();
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _confCodeController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.all(20.0),
//         child: Form(
//           key: _formKey, // for validating the fields
//           child: Column(
//             children: <Widget>[
//               const Text(
//                 "Sign Up Information",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               TextField(
//                 controller: _usernameController,
//                 onChanged: (value) => _username = value.toString(),
//                 obscureText: false,
//                 decoration: const InputDecoration(
//                   labelText: "Username",
//                 ),
//               ),
//               TextField(
//                 controller: _passwordController,
//                 onChanged: (value) => _password = value.toString(),
//                 obscureText: true,
//                 autocorrect: false,
//                 decoration: const InputDecoration(
//                   labelText: "Password",
//                 ),
//               ),
//               TextField(
//                 controller: _emailController,
//                 onChanged: (value) => _email = value.toString(),
//                 obscureText: false,
//                 autocorrect: false,
//                 decoration: const InputDecoration(
//                   labelText: "email",
//                 ),
//               ),
//               ElevatedButton(
//                   child: const Text("Sign Up"),
//                   onPressed: () async {
//                     final _domain =
//                         _email!.trim().substring(_email!.length - 7);
//                     if (_domain != "esme.fr") {
//                       showDialog<String>(
//                         context: context,
//                         builder: (BuildContext context) => AlertDialog(
//                           title: const Text('Invalid email'),
//                           content: const Text(
//                               'email adress must be esme.fr domain name'),
//                           actions: <Widget>[
//                             TextButton(
//                               onPressed: () => Navigator.pop(context, 'OK'),
//                               child: const Text('OK'),
//                             ),
//                           ],
//                         ),
//                       );
//                     } else if (_username != null && _password != null) {
//                       SignUpInOut().SignUp(_username!.trim(), _password!,
//                           _email!.toLowerCase().trim());
//                       showDialog<String>(
//                         context: context,
//                         builder: (BuildContext context) => AlertDialog(
//                           title: const Text('Enter Confirmation Code'),
//                           actions: <Widget>[
//                             Column(
//                               children: [
//                                 TextField(
//                                     controller: _confCodeController,
//                                     onChanged: (value) =>
//                                         _confCode = value.toString(),
//                                     obscureText: false,
//                                     decoration: const InputDecoration(
//                                         labelText: "Confirmation Code")),
//                                 TextButton(
//                                   child: const Text("Confirm Sign Up"),
//                                   onPressed: (() {
//                                     SignUpInOut().ConfirmSignUp(
//                                         _username!, _confCode!.trim());
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (_) => SignInPage(),
//                                       ),
//                                     );
//                                   }),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     }
//                   }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
