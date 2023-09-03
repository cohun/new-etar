import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gotomoon/theme/colors.dart';

import '../components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 37, 65),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            Text(
              "Etar.app",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.lime,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Image.asset("images/ETAR_H.png"),
            SizedBox(
              height: 25,
            ),
            Text(
              "Elektronikus Termék Azonosító Rendszer",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.lime,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Üzemeltetői feladatok szakszerű ellátása az "
              "Emelőgép Biztonsági Szabályzat előírásainak megfelelően, az ETAR applikácó "
              "segítségével.",
              style: TextStyle(
                  color: Colors.grey.shade200, fontSize: 13, height: 2),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 25,
            ),
            MyButton(
              text: "Kezdés",
              buttonBackground: limeBackgroundButton,
              buttonText: redTextButton,
              onTap: () {
                context.push('/menupage');
              },
            )
          ],
        ),
      ),
    );
  }
}
