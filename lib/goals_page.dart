import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:aquiadoro/goal_card.dart';



class GoalsPage extends StatefulWidget {


  @override
  GoalsPageState createState() => GoalsPageState();
}

class GoalsPageState extends State <GoalsPage> {

  final List<GoalCard> _metas=[];
  int index;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _fadeText(),// manda a llamar el texto 
        backgroundColor: Colors.cyan[600],
      ),
      body: Stack(
        children: [
          Container(color: Colors.cyan[600]),
          Column(
              children: [
                Flexible(
                  child: 
                    ListView.builder(
                      itemBuilder: (_ , int index)=> _metas[index],
                      itemCount: _metas.length,
                      )),

              //  Expanded(child: Container(), ),//sirve para que ocupe el resto de la pantalla
                  FloatingActionButton(
                   onPressed: (){
                      _agregarCard();

                    },
                    child: Icon(
                    Icons.add_circle_outline,
                    color:  Colors.cyan[100],
                    size: 50,
                    ),

                  ),

                  Container( height:30, ),
                  
               
              ],
          ),
        ],

      ),

    ); 
  }

 

  Widget _fadeText(){
    return Container(
      margin: EdgeInsets.only(top:5),
       child: SizedBox(
            width: 350.0,
            child: FadeAnimatedTextKit(
              repeatForever: true,
              text: [
                "¿Què es lo realmente",
                " importante?",
                "Vamos a hacerlo :3",
                "¿Què has estado... ",
                "dejado pendiente?"
              ],
              textStyle: TextStyle(
                  fontSize: 25.0, 
                  color:Colors.blueGrey[50],
                  fontWeight: FontWeight.w600
              ),
              textAlign: TextAlign.center,
              alignment: AlignmentDirectional.bottomCenter  // or Alignment.topLeft
            ),
       ),    
    );

  }

   
   
   void _agregarCard(){
     GoalCard meta= new GoalCard();
     setState(() {
       _metas.insert(_metas.length, meta); //se agrega en la ultima posicion de la lista una nueva meta
     });
   

  }
}