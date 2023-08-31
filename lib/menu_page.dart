import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gotomoon/app_state.dart';
import 'package:gotomoon/components/button.dart';
import 'package:gotomoon/src/authentication.dart';
import 'package:gotomoon/src/widgets.dart';
import 'package:gotomoon/theme/colors.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.transparent,
        foregroundColor: Color.fromARGB(255, 199, 179, 119),
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          "images/ETAR.png",
          width: 100,
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 32),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Image.asset(
                      "images/anonymous.png",
                      width: 200,
                    ),
                    SizedBox(
                      height: 65,
                    ),
                    MyButton(
                      text: "Bejelentkezés",
                      onTap: () {},
                      buttonBackground: const Color.fromARGB(255, 4, 70, 63),
                      buttonText: Color.fromARGB(255, 199, 179, 119),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          const IconAndDetail(Icons.calendar_today, 'October 30'),
          const IconAndDetail(Icons.location_city, 'San Francisco'),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => AuthFunc(
                loggedIn: appState.loggedIn,
                signOut: () {
                  FirebaseAuth.instance.signOut();
                }),
          ),
          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          const Header("What we'll be doing"),
          const Paragraph(
            'Join us for a day full of Firebase Workshops and Pizza!',
          ),
        ],
      ),
    );
  }
}
