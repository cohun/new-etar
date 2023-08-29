import 'package:flutter/material.dart';
import 'package:gotomoon/components/button.dart';
import 'package:gotomoon/theme/colors.dart';

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
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          "images/ETAR.png",
          width: 100,
        ),
      ),
      body: Column(
        children: [
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
          )
        ],
      ),
    );
  }
}
