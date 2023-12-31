import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gotomoon/app_state.dart';

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
          Consumer<ApplicationState>(
            builder: (context, appState, _) => appState.loggedIn
                ? Image.asset(
                    "images/image.jpg",
                    height: 200,
                  )
                : Image.asset(
                    "images/anonymous.png",
                    height: 200,
                  ),
          ),
          const SizedBox(height: 28),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => appState.loggedIn
                ? IconAndDetail(Icons.account_box,
                    FirebaseAuth.instance.currentUser!.displayName ?? '')
                : const IconAndDetail(Icons.account_box, 'Felhasználó '),
          ),
          const IconAndDetail(Icons.location_city, 'Cégnév'),
          const SizedBox(height: 28),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => AuthFunc(
                loggedIn: appState.loggedIn,
                signOut: () {
                  FirebaseAuth.instance.signOut();
                }),
          ),
          const SizedBox(height: 28),
          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          const Header("Bejelentkezés után..."),
          const Paragraph(
            'A felhasználói fiókhoz meg kell adni a saját nevet és a cégnevét, amelynek adatain dolgozni szeretnénk.',
          ),
          SizedBox(height: 32,),
          Center(
            child: Consumer<ApplicationState>(
            builder: (context, appState, _) =>  (appState.loggedIn == true) ?
             
              Row(
                
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 28, bottom: 8),
                    child: FilledButton(onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Jelentkezz be először!")));
                    }, child: Text("Meglévő cég"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28, bottom: 8),
                    child: ElevatedButton(onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Jelentkezz be először!")));
                    }, child: Text("Új cég"),
                    ),
                  ),
                ],
              ) : Text("Hi"),
            ),
          ),
          
        ],
      ),
    );
  }
}
