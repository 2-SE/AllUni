import 'package:AllUni/Calendars/DatabaseLoadPage.dart';
import 'package:AllUni/SignPages/ResetPasswordPage.dart';
import 'package:AllUni/SignPages/SignInUpTextField.dart';
import 'package:AllUni/SignPages/SignUpPage.dart';
import 'package:AllUni/Utils/SignUpInOut.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  String _email = "";
  String _password = "";
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
                      "Connectez-vous",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                    const SizedBox(height: 15),
                    SignInUpTextField(
                      labelText: "Mot de Passe",
                      data: _password,
                      isHidable: true,
                      onUpdate: (value) {
                        _password = value;
                      },
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              _email = "";
                              _password = "";
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpPage(),
                                ),
                              );
                            },
                            child: Text(
                              "S'incrire",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              _email = "";
                              _password = "";
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResetPasswordPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Mot de Passe Oublié ?",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () async {
                        if (_email != null && _password != null) {
                          try {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              SignUpInOut().SignIn(
                                _email!,
                                _password!,
                              );
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => DatabaseLoadPage(
                                    const [
                                      "1A"
                                    ], //TODO => Récup la majeure/promo de la personne qui vient de se connectée
                                    0,
                                    "Mon Calendrier",
                                  ),
                                ),
                                (route) => false,
                              );
                            });
                          } catch (e) {
                            print("error $e");
                          }
                        }
                      },
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
                              width: 2.5,
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
                              "Connexion",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 35,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/contactLogOut");
                        },
                        child: Text(
                          "Nous contacter",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    // ElevatedButton(
                    //     child: const Text("SignIn"),
                    //     onPressed: () async {
                    //       if (_username != null && _password != null) {
                    //         try {
                    //           WidgetsBinding.instance.addPostFrameCallback((_) {
                    //             SignUpInOut().SignIn(
                    //               _username!,
                    //               _password!,
                    //             );
                    //             Navigator.of(context).pushAndRemoveUntil(
                    //               MaterialPageRoute(
                    //                 builder: (context) => DatabaseLoadPage(
                    //                   const [
                    //                     "1A"
                    //                   ], //TODO => Récup la majeure/promo de la personne qui vient de se connectée
                    //                   0,
                    //                   "Mon Calendrier",
                    //                 ),
                    //               ),
                    //               (route) => false,
                    //             );
                    //           });
                    //         } catch (e) {
                    //           print("error $e");
                    //         }
                    //       }
                    //     }),
                    // TextButton(
                    //   onPressed: () async {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const SignUpPage(),
                    //       ),
                    //     );
                    //   },
                    //   style: TextButton.styleFrom(
                    //     backgroundColor: Colors.blue,
                    //     fixedSize: const Size.fromWidth(
                    //       100,
                    //     ),
                    //   ),
                    //   child: const Text(
                    //     "Sign Up",
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    // return Scaffold(
    //   body: Container(
    //     padding: const EdgeInsets.all(20.0),
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: <Widget>[
    //         const Text(
    //           "Sign In Information",
    //           style: TextStyle(fontSize: 20),
    //         ),
    //         TextField(
    //           controller: _usernameController,
    //           onChanged: (value) => _username = value.toString(),
    //           obscureText: false,
    //           decoration: const InputDecoration(
    //             labelText: "Username",
    //           ),
    //         ),
    //         TextField(
    //           controller: _passwordController,
    //           onChanged: (value) => _password = value.toString(),
    //           obscureText: true,
    //           decoration: const InputDecoration(
    //             labelText: "Password",
    //           ),
    //         ),
    //         ElevatedButton(
    //             child: const Text("SignIn"),
    //             onPressed: () async {
    //               if (_username != null && _password != null) {
    //                 try {
    //                   WidgetsBinding.instance.addPostFrameCallback((_) {
    //                     SignUpInOut().SignIn(
    //                       _username!,
    //                       _password!,
    //                     );
    //                     Navigator.of(context).pushAndRemoveUntil(
    //                       MaterialPageRoute(
    //                         builder: (context) => DatabaseLoadPage(
    //                           const [
    //                             "1A"
    //                           ], //TODO => Récup la majeure/promo de la personne qui vient de se connectée
    //                           0,
    //                           "Mon Calendrier",
    //                         ),
    //                       ),
    //                       (route) => false,
    //                     );
    //                   });
    //                 } catch (e) {
    //                   print("error $e");
    //                 }
    //               }
    //             }),
    //         TextButton(
    //           onPressed: () async {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                 builder: (context) => const SignUpPage(),
    //               ),
    //             );
    //           },
    //           style: TextButton.styleFrom(
    //             backgroundColor: Colors.blue,
    //             fixedSize: const Size.fromWidth(
    //               100,
    //             ),
    //           ),
    //           child: const Text(
    //             "Sign Up",
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
