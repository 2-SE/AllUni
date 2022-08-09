import 'package:flutter/material.dart';


class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}


class _ContactUsPageState extends State<ContactUsPage> {
  //const ContactUsPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  String ContactUsTitle = "";
  String ContactUsMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _formKey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 240.0,
            stretch: true,
            backgroundColor: Color(0xFF4C75A0),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Nous Contacter', style: TextStyle(color: Colors.white)),
              background: Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Image(
                  image: AssetImage("images/logo_ContactUs.png"),
                  //image: AssetImage("images/BannerLogoApp.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,/*BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/BannerLogoApp.png"),
                  fit: BoxFit.cover,*/
                ),
              ),
              stretchModes: [
                StretchMode.zoomBackground,
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(color: Colors.transparent),
                  ),
                  Flexible(
                    flex: 20,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(height: 5, color: Colors.transparent),
                          TextFormField(
                            onChanged: (value) {
                              ContactUsTitle = value;
                            },
                            maxLength: 64,
                            minLines: 1,
                            maxLines: 2,
                            autocorrect: true,
                            decoration: InputDecoration(
                              icon: Icon(Icons.subject),
                              labelText: "Objet du message",
                              labelStyle: TextStyle(color: Color(0xFF4C75A0)),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "L'objet du message est requis";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            onChanged: (value) {
                              ContactUsMessage = value;
                            },
                            maxLength: 2048,
                            minLines: 2,
                            maxLines: 17,
                            autocorrect: true,
                            decoration: InputDecoration(
                              labelText: "Votre message",
                              labelStyle: TextStyle(color: Color(0xFF4C75A0)),
                              errorStyle: TextStyle(color: Colors.red),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "Contenu du message manquant";
                              }
                              return null;
                            },
                          ),
                          Container(height: 20, color: Colors.transparent),
                          Center(
                            child: RaisedButton(
                              color: Colors.white,
                              textColor: Colors.indigo,
                              shape: StadiumBorder(
                                side: BorderSide(color: Colors.indigo, width: 1),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Message envoyé.\nUn récapitulatif de votre message a été envoyé à votre adresse email.")),
                                  );
                                  //SEND EMAIL TO pickassos2se@gmail.com;
                                  Navigator.of(context).pop();
                                }
                              },
                              child: Text("     Envoyer     ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo)),
                            ),
                          ),
                          Container(height: 20, color: Colors.transparent),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(color: Colors.transparent),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}