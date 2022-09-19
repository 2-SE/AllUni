import 'package:AllUni/SignPages/SignInPage.dart';
import 'package:AllUni/Utils/SignUpInOut.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String? _password;
  String? _username;
  String? _email;
  String? _confCode;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _confCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey, // for validating the fields
          child: Column(
            children: <Widget>[
              const Text(
                'Sign Up Information',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TextField(
                controller: _usernameController,
                onChanged: (value) => _username = value.toString(),
                obscureText: false,
                decoration: const InputDecoration(
                  labelText: "Username",
                ),
              ),
              TextField(
                controller: _passwordController,
                onChanged: (value) => _password = value.toString(),
                obscureText: true,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
              ),
              TextField(
                controller: _emailController,
                onChanged: (value) => _email = value.toString(),
                obscureText: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "email",
                ),
              ),
              ElevatedButton(
                  child: const Text("Sign Up"),
                  onPressed: () async {
                    final _domain =
                        _email!.trim().substring(_email!.length - 7);
                    if (_domain != "esme.fr") {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Invalid email'),
                          content: const Text(
                              'email adress must be esme.fr domain name'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    } else if (_username != null && _password != null) {
                      SignUpInOut().SignUp(_username!.trim(), _password!,
                          _email!.toLowerCase().trim());
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Enter Confirmation Code'),
                          actions: <Widget>[
                            Column(
                              children: [
                                TextField(
                                    controller: _confCodeController,
                                    onChanged: (value) =>
                                        _confCode = value.toString(),
                                    obscureText: false,
                                    decoration: const InputDecoration(
                                        labelText: "Confirmation Code")),
                                TextButton(
                                  child: const Text("Confirm Sign Up"),
                                  onPressed: (() {
                                    SignUpInOut().ConfirmSignUp(
                                        _username!, _confCode!.trim());
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SignInPage(),
                                      ),
                                    );
                                  }),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
