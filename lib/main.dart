import 'package:flutter/material.dart';
import 'package:aquiadoro/goals_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: { //recibe un mapa o un diccionario 
        'goalsPage': (BuildContext context) =>GoalsPage(),
        
      },
      initialRoute: 'goalsPage',
    );
  }
}