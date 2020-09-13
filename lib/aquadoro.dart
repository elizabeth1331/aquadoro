import 'package:flutter/material.dart';
import 'dart:async';

class Aquadoro extends StatefulWidget {
  
  Aquadoro({
    this.actividad,
    this.tConcentracion,
    this.tDescanso,
  });//metodo constructor de la clase


  final String actividad;
  final int tConcentracion;
  final int tDescanso;
  


  @override
  _AquadoroState createState() => _AquadoroState();
}

class _AquadoroState extends State<Aquadoro> {
  String tipoActividad = "focus";
  String tiempoPantalla;
  int contador;

  bool kindActivity = false;
  //Aqui se van a declarar para la funcionalidad del pomodoro
  int startState=1;
  int tConcentracionSeg=0;
  int tDescansoSeg=0;

  bool revisarTiempoCon= false;
  bool revisarTiempoDes= false;
  //variables para desactivar los botones
  bool botonDeshabilitado=false;
  bool resetDeshabilitado=false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tiempoPantalla= '${widget.tConcentracion.toString()}:00';
    resetDeshabilitado=true;
  }

  @override
  Widget build(BuildContext context) {
    double ancho= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Aquadoro'),// manda a llamar el texto 
        backgroundColor: Colors.cyan[600],
      ),
      body: Stack(
        children: [
          Container(color: Colors.cyan[600]),


         Center(
           child: Column(
             children: <Widget> [
               SizedBox(height:40),
               _contadorAcuadoro(),
               SizedBox( height: 20,),
                _aquadoroStack(ancho),
                Expanded(child: Container()), //misma funcion que un SizeBox

               _butones(),
               Expanded(child: Container()), 
             ],

           ),
         ),

        ],

      ),

    );
  }
  Widget _contadorAcuadoro(){
    switch(contador){
      case 1:

      return Row(
        mainAxisAlignment:  MainAxisAlignment.spaceAround,
        children: <Widget> [
          Icon(Icons.av_timer, 
          color: Colors.teal[100],
           size:45,)
        ]
      );
      break;

      case 2:

      return Row(
        mainAxisAlignment:  MainAxisAlignment.spaceAround,
        children: <Widget> [
          Icon(Icons.av_timer, 
          color: Colors.teal[100],
           size:45,),
           Icon(Icons.av_timer, 
          color: Colors.teal[100],
           size:45,)
        ]
      );
      break;

      case 3:

      return Row(
        mainAxisAlignment:  MainAxisAlignment.spaceAround,
        children: <Widget> [
          Icon(Icons.av_timer, 
          color: Colors.teal[100],
           size:45,),
           Icon(Icons.av_timer, 
          color: Colors.teal[100],
           size:45,),
           Icon(Icons.av_timer, 
          color: Colors.teal[100],
           size:45,),
        ]
      );
      break;

      case 4:

      return Row(
        mainAxisAlignment:  MainAxisAlignment.spaceAround,
        children: <Widget> [
          Icon(Icons.av_timer, 
          color: Colors.teal[100],
           size:45,),
           Icon(Icons.av_timer, 
          color: Colors.teal[100],
           size:45,),
           Icon(Icons.av_timer, 
          color: Colors.teal[100],
           size:45,),
           Icon(Icons.av_timer, 
          color: Colors.teal[100],
           size:45,),
        ]
      );
      break;

      case 5:

      return Row(
        mainAxisAlignment:  MainAxisAlignment.spaceAround,
        children: <Widget> [
          Icon(Icons.av_timer, 
          color: Colors.teal[100],
           size:45,),
           Icon(Icons.av_timer, 
          color: Colors.teal[100],
           size:45,),
           Icon(Icons.av_timer, 
          color: Colors.teal[100],
           size:45,),
           Icon(Icons.av_timer, 
          color: Colors.teal[100],
           size:45,),
           Icon(Icons.av_timer, 
          color: Colors.teal[100],
           size:45,),
        ]
      );
      break;

      default: 
      return Container(height: 45,);


    }

  }

  Widget _aquadoroStack(double ancho){

    return Stack(
      children: [
        Container(
          width: 357,
          height: 357,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(image: AssetImage('assets/Acuadoro.png'), fit: BoxFit.cover),
          ),

        ),

        Positioned(
          top: 160,
          left: ancho * 0.25,
                  child: Container(
                      height: 100,
                      width: 170,
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Text(
                              tipoActividad,
                              style:  TextStyle(fontSize: 25, color: Colors.blueGrey[100]),
                            ),
                          ),
                          Center(
                            child: Text(
                              tiempoPantalla, 
                              style:  TextStyle(fontSize: 25, color: Colors.blueGrey[100]),
                            ),
                          )
                        ]
                   ),
                 ),
               ),

      ],
    );
  }

  Widget _butones(){
    return Row(

      mainAxisAlignment:  MainAxisAlignment.spaceAround,

      children: <Widget> [

        AbsorbPointer(// lo que hace es deshabilitar lo que esta dentro de el 
          absorbing: resetDeshabilitado, //para indicar si se habilita o deshabilita
                  child: RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.cyan[200],
            child: Row(
              children: <Widget>[
                Text(
                  'Reset',
                    style: TextStyle(fontSize:25, color: Colors.teal[900]),
                ),
                Icon(
                  Icons.rotate_left, 
                  size:25, 
                  color: Colors.teal[900],
                ),


              ]
            ),
            onPressed: () {
              if(tConcentracionSeg>1){
                revisarTiempoCon=true;
                startState=1;
                print('Le diste en reset de focus');

              }else if(tDescansoSeg>1){
                revisarTiempoDes=true;
              //indica que reset fue precionado mientras Descanso estaba corriendo
              startState= 1;
              kindActivity=false;
              tipoActividad="focus";
              tiempoPantalla='${widget.tConcentracion.toString()}:00';
              print('Le diste en reset de relax y te regresa a focus');
      
              }


            },
            ),
        ),




        AbsorbPointer(// lo que hace es deshabilitar lo que esta dentro de el 
              absorbing: botonDeshabilitado,
              child: OutlineButton(
               borderSide: BorderSide(width: 4, color:  Colors.blue[900], style: BorderStyle.solid),
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
               // contorno en el exterior
                child: Row(
                 children: <Widget>[ 
                   Text(
                     tipoActividad,
                     style: TextStyle(fontSize: 25, color: Colors.indigo[800]),
                   ),
                   Icon(
                     (kindActivity ) ? Icons.adjust: Icons.album,
                    size: 25,
                    color: Colors.blue[900],),
                 ],
               ),
               onPressed: () {
   
                 switch(startState){
                   case 1:
                   //Tiempo de Focus
                   {


                     setState(() {
                       botonDeshabilitado=true;
                       resetDeshabilitado=false;

                     });
                     tConcentracionSeg=(widget.tConcentracion*60);
                     Timer.periodic(Duration(seconds: 1), (t) {
                       setState(() {
                         if(tConcentracionSeg<1 || revisarTiempoCon==true ){
                           t.cancel(); //se detiene el temporizador
                           revisarTiempoCon=false;//el boton de reset no fue presionado
                           tiempoPantalla= '${widget.tConcentracion.toString()}:00';//concatenar

                           botonDeshabilitado=false;
                           resetDeshabilitado=true;

                           if (tConcentracionSeg<1){
                             startState=2;
                             tipoActividad ='Relax';
                             kindActivity=true;
                             tiempoPantalla = '${widget.tDescanso.toString()}:00';
   
                           }
                         }else if (tConcentracionSeg <60){
                           tiempoPantalla='$tConcentracionSeg';
                           tConcentracionSeg--;
   
                         }else{
                           int m=tConcentracionSeg ~/ 60;
                           int s= tConcentracionSeg -(60*m);
                           if(s<10){
                             tiempoPantalla='$m:0$s';
   
                           }else{
                             tiempoPantalla= '$m:$s';
                             
                           }
                           tConcentracionSeg--;
                         }
                         
                       }); //se refresque cada que el contador disminuye
   
   
                      });
                   }
   
                   break;
   
                   case 2:
                   {
                     setState(() {
                       botonDeshabilitado=true;
                       resetDeshabilitado=false;
                     });
                     tDescansoSeg=(widget.tDescanso*60);
                     Timer.periodic(Duration(seconds: 1), (t) {
                       setState(() {
                         if(tDescansoSeg<1 || revisarTiempoDes==true ){
                           t.cancel(); //se detiene el temporizador
                           revisarTiempoDes=false;//el boton de reset no fue presionado
                           tiempoPantalla= '${widget.tConcentracion.toString()}:00';//concatenar

                           botonDeshabilitado=false;
                           resetDeshabilitado=true;

                           if (tDescansoSeg<1){
                             startState=1;
                             tipoActividad ='Focus';
                             kindActivity=false;
                             tiempoPantalla = '${widget.tDescanso.toString()}:00';
   
                           }
                         }else if (tDescansoSeg <60){
                           tiempoPantalla='$tDescansoSeg';
                           tDescansoSeg--;
   
                         }else{
                           int m=tDescansoSeg ~/ 60;
                           int s= tDescansoSeg -(60*m);
                           if(s<10){
                             tiempoPantalla='$m:0$s';
   
                           }else{
                             tiempoPantalla= '$m:$s';
                             
                           }
                           tDescansoSeg--;
                         }
                         
                       }); //se refresque cada que el contador disminuye
   
   
                      });
                   }
   
                   break;
   
                   case 3:
                   {

                     setState(() {
                       botonDeshabilitado=true;
                       resetDeshabilitado=false;
                     });//funcion para habilitar y seahabilitar

                     tDescansoSeg=(30 * 60);
                     Timer.periodic(Duration(seconds: 1), (t) {
                       setState(() {
                         if(tDescansoSeg<1 || revisarTiempoDes==true ){
                           t.cancel(); //se detiene el temporizador
                           revisarTiempoDes=false;//el boton de reset no fue presionado
                           tiempoPantalla= '${widget.tConcentracion.toString()}:00';//concatenar

                           botonDeshabilitado=false;
                           resetDeshabilitado=true;

                           if (tDescansoSeg<1){
                             startState=1;
                             tipoActividad ='Focus';
                             kindActivity=false;
                             tiempoPantalla = '${widget.tDescanso.toString()}:00';
   
                           }
                         }else if (tDescansoSeg <60){
                           tiempoPantalla='$tDescansoSeg';
                           tDescansoSeg--;
   
                         }else{
                           int m=tDescansoSeg ~/ 60;
                           int s= tDescansoSeg -(60*m);
                           if(s<10){
                             tiempoPantalla='$m:0$s';
   
                           }else{
                             tiempoPantalla= '$m:$s';
                             
                           }
                           tDescansoSeg--;
                         }
                         
                       }); //se refresque cada que el contador disminuye
   
   
                      });
                   }
   
                   break;
                   default:
                 }
               }, 
               ),
           ),
         ],
   
       );
  }   
   
}   