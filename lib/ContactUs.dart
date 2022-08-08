import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  //const NewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200.0,
            stretch: true,
            backgroundColor: Color(0xFF4C75A0),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Nous Contacter', style: TextStyle(color: Colors.white)),
              background: Padding(
                padding: const EdgeInsets.only(top: 25.0),
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
              Center(
                child: Text("Test"),
              ),
            ]),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Center(
                child: RaisedButton(
                  color: Colors.white,
                  textColor: Colors.indigo,
                  shape: StadiumBorder(
                    side: BorderSide(color: Colors.indigo, width: 1),
                  ),
                  onPressed: () {},
                  child: Text("     Envoyer     ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo)),
                ),
              ),
              Container(height: 20, color: Colors.transparent),
            ]),
          ),
        ],
      ),
    );
  }
}