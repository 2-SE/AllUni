import 'package:AllUni/Models/ModelProvider.dart';
import 'package:AllUni/SignPages/SignInPage.dart';
import 'package:AllUni/amplifyconfiguration.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool _isLoading = false;

  Future<void> _configureAmplify() async {
    final Auth = AmplifyAuthCognito();
    final DS = AmplifyDataStore(modelProvider: ModelProvider.instance);
    try {
      await Future.wait([
        Amplify.addPlugins([Auth, DS])
      ]);
      if (!Amplify.isConfigured) {
        print("!alreadyconfig");
        await Amplify.configure(amplifyconfig);
      }
    } on Exception catch (e) {
      return print("config except ------------- $e");
    }
    print("config success");
  }

  @override
  void initState() {
    super.initState();
    _configureAmplify();
    setState(() {
      _isLoading = true;
    });
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SignInPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Image.asset(
                  "assets/images/calligraphy/DarkBlueAllUniCalligraphy.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
