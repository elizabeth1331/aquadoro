import 'package:aquiadoro/pantalla_carga.dart';
import 'package:flutter/material.dart';
import 'package:aquiadoro/goals_page.dart';
import 'package:aquiadoro/aquadoro.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: { //recibe un mapa o un diccionario 
        'pantallaCarga' : (BuildContext context) =>PantallaDeCarga(),
        'goalsPage': (BuildContext context) =>GoalsPage(),
        'aquadoro': (BuildContext context) =>Aquadoro(),
        
      },
      initialRoute: 'pantallaCarga',
    );
  }
}