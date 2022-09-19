import 'package:AllUni/Calendars/DatabaseLoadPage.dart';
import 'package:AllUni/SignPages/SignUpPage.dart';
import 'package:AllUni/Utils/SignUpInOut.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? _password = '';
  String? _username = '';
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Sign In Information',
              style: TextStyle(fontSize: 20),
            ),
            TextField(
                controller: _usernameController,
                onChanged: (value) => _username = value.toString(),
                obscureText: false,
                decoration: const InputDecoration(labelText: "Username")),
            TextField(
                controller: _passwordController,
                onChanged: (value) => _password = value.toString(),
                obscureText: true,
                decoration: const InputDecoration(labelText: "Password")),
            ElevatedButton(
                child: const Text("SignIn"),
                onPressed: () async {
                  if (_username != null && _password != null) {
                    try {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        SignUpInOut().SignIn(_username!, _password!);

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DatabaseLoadPage([
                                  "1A",
                                  "1B",
                                  "1C",
                                  "1D",
                                  "1E",
                                  "1F",
                                  "1G",
                                  "1H"
                                ], 0, "Mon Calendrier")));
                      });
                    } catch (e) {
                      print("error $e");
                    }
                  }
                }),
            TextButton(
                child: Text("Sign Up"),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    fixedSize: Size.fromWidth(100)),
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                }),
          ],
        ),
      ),
    );
  }
}
