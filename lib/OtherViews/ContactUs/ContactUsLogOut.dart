import 'dart:convert';

import 'package:AllUni/Utils/DateHourUtils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ContactUsLogOutPage extends StatefulWidget {
  const ContactUsLogOutPage({Key? key}) : super(key: key);
  @override
  _ContactUsLogOutPageState createState() => _ContactUsLogOutPageState();
}

class _ContactUsLogOutPageState extends State<ContactUsLogOutPage> {
  final _formKey = GlobalKey<FormState>();

  String ContactUsName = "";
  String ContactUsEmail = "";
  String ContactUsTitle = "";
  String ContactUsMessage = "";

  TextEditingController senderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    senderController.dispose();
    emailController.dispose();
    titleController.dispose();
    messageController.dispose();
  }

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
            backgroundColor: const Color(0xFF4C75A0),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Nous Contacter',
                  style: TextStyle(color: Colors.white)),
              background: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Image.asset("assets/images/ContactUs.png"),
              ),
              stretchModes: const [
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
                            controller: senderController,
                            onChanged: (value) {
                              ContactUsName = value;
                            },
                            maxLines: 1,
                            autocorrect: false,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.person),
                              labelText: "Nom",
                              labelStyle: TextStyle(color: Color(0xFF4C75A0)),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "Votre nom est requis";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: emailController,
                            onChanged: (value) {
                              ContactUsEmail = value;
                            },
                            maxLines: 1,
                            autocorrect: false,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.email_rounded),
                              labelText: "Adresse Email",
                              labelStyle: TextStyle(color: Color(0xFF4C75A0)),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "Votre adresse email est requise";
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value.toString())) {
                                return "Le format de votre adresse email est invalide";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: titleController,
                            onChanged: (value) {
                              ContactUsTitle = value;
                            },
                            maxLength: 64,
                            minLines: 1,
                            maxLines: 2,
                            autocorrect: true,
                            decoration: const InputDecoration(
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
                            controller: messageController,
                            onChanged: (value) {
                              ContactUsMessage = value;
                            },
                            maxLength: 2048,
                            minLines: 2,
                            maxLines: 30,
                            autocorrect: true,
                            decoration: const InputDecoration(
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
                              shape: const StadiumBorder(
                                side:
                                    BorderSide(color: Colors.indigo, width: 1),
                              ),
                              onPressed: () async {
                                /*
                                  print("Name :  " + ContactUsName);
                                  print("Email :  " + ContactUsEmail);
                                  print("Title :  " + ContactUsTitle);
                                  print("Msg :  " + ContactUsMessage);
                                */

                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState?.save();
                                  var response = await Dio()
                                      .post(
                                        "https://discord.com/api/webhooks/1011653493439860797/jGX9AE2EAVJVeYwZjdI07lx0EVFjQZLc5cxEssBap8yf57uEYM2YEdnh6xfC4CoDDyYc",
                                        data: json.encode({
                                          'content': 'In-App : Contact Us',
                                          'embeds': [
                                            {
                                              "title": ContactUsTitle,
                                              "description": ContactUsMessage,
                                              'color': int.parse('4C75A0',
                                                  radix: 16),
                                              'fields': [
                                                {
                                                  "name": "Nom",
                                                  "value": ContactUsName,
                                                  "inline": "true"
                                                },
                                                {
                                                  "name": "Email",
                                                  "value": ContactUsEmail,
                                                  "inline": "true"
                                                },
                                                {
                                                  "name": "Date",
                                                  "value":
                                                      DateHourUtils.toDateTime(
                                                          DateTime.now()),
                                                  "inline": "true"
                                                }
                                              ],
                                            }
                                          ]
                                        }),
                                      )
                                      .then(
                                        (value) => Navigator.of(context).pop(),
                                      )
                                      .then(
                                        (value) => Navigator.of(context).pop(),
                                      )
                                      .then(
                                        (value) => {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                "Le message a bien été envoyé.",
                                              ),
                                            ),
                                          ),
                                        },
                                      );
                                }
                              },
                              child: const Text("     Envoyer     ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo)),
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
