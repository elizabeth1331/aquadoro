import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:aquiadoro/goal_card.dart';



class GoalsPage extends StatefulWidget {


  @override
  GoalsPageState createState() => GoalsPageState();

}

class GoalsPageState extends State <GoalsPage> with TickerProviderStateMixin {

  //mixin doble herencia que combina lo que extiende de la primera clase
  //de GoalPage y ahora se agrega una nueva herencia de mixin 

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
                      itemBuilder: (_ , int index ) { 
                        return Dismissible(
                          key: new UniqueKey(),
                         child: _metas[index],
                         background: Container(
                           margin: EdgeInsets.all(10),
                           padding: EdgeInsets.only(left: 10),
                           alignment: AlignmentDirectional.centerStart,// ase alinea al centro del inicio de container
                           color: Colors.deepOrange[700],
                           child: Icon(Icons.delete_outline),

                         ),

                         onDismissed: (direccion) {
                           setState(() {
                             print(_metas[index].actividad);
                             
                             _metas.removeAt(index);
                             print("Despues de eliminar");
                             print(_metas[index].actividad);
                             
                           });
                         },

                      );
                       },//=> _metas[index],
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
     final animacionCards= new AnimationController(
       vsync: this, 
       duration: Duration(milliseconds: 600),
       );
     GoalCard meta= new GoalCard(
       animationController: animacionCards,
     );
     setState(() {
       _metas.insert(_metas.length, meta); //se agrega en la ultima posicion de la lista una nueva meta
     });
     meta.animationController.forward();//para evitar que use tanta memoria forward()
   

  }
  @override
 void dispose(){
   for (GoalCard meta in _metas)meta.animationController.dispose();
   super.dispose();
 }
   //sobre escribir para obtimizar memoria y recursos

}