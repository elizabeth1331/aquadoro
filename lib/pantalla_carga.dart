import 'package:aquiadoro/goals_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';

class PantallaDeCarga extends StatefulWidget {
  PantallaDeCarga({Key key}) : super(key: key);

  @override
  _PantallaDeCargaState createState() => _PantallaDeCargaState();
}

class _PantallaDeCargaState extends State<PantallaDeCarga> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: GoalsPage(),
      title: Text('Acuadoro',
      style:   GoogleFonts.mansalva(
      fontWeight: FontWeight.bold,
      fontSize: 60.0, 
      color: Colors.blueGrey[100]),
      ),

      image: Image.asset('assets/Acuadoro.png'),
      photoSize: 120.0,
      backgroundColor: Colors.blueAccent,
    );
  }
}