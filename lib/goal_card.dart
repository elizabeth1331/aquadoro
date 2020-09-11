import 'package:flutter/material.dart';

class GoalCard extends StatefulWidget {
  @override
  _GoalCardState createState() => _GoalCardState();
}

class _GoalCardState extends State<GoalCard> {
  @override
  Widget build(BuildContext context) {
    double anchoPantalla= MediaQuery.of(context).size.width;
    return Container(
    child: Center(
        child: Container(
          margin: EdgeInsets.all(10),//todas las direcciones
          //height: 80, no es necesario por defecto te da la altura
          width: anchoPantalla * 0.9,
          decoration:BoxDecoration(
            color: Color.fromRGBO(223, 255, 255, 1),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start, //se acomode al inicio del renglon
            children: [
              Container(
                padding: EdgeInsets.only(left:10, bottom:13),//para poner margen interior
                child: _actividadInput(),
                width: anchoPantalla* 0.45,
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.only(left:10, bottom:13),//para poner margen interior
                child: _inputConcentracion(),
                width: anchoPantalla* 0.15,
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.only(left:10, bottom:13),//para poner margen interior
                child: _inputDescanso(),
                width: anchoPantalla* 0.15,
              )

            ],
          ),
        ),
      ),
     
    );
  }//build
 Widget _actividadInput(){
   return TextFormField(
     decoration: InputDecoration(
       labelText: " Actividad",
       labelStyle: TextStyle(fontSize: 13),
       
     ),
     onChanged: (activity){
         print(activity);
       } //cuando exista cambio en el tecto se crea un parametro que es la variable activity, la cual se usa en la funcion
       //Recibe entradas de texto y las muestra en terminal 

   );
 
 } //actividadInput

 Widget _inputConcentracion(){
   return TextFormField(
     keyboardType: TextInputType.numberWithOptions(decimal: true),//al moemtno de seleccionarlo te muestra el teclado numerido de Android o IOS
     decoration: InputDecoration(
       labelText: " Focus",
       labelStyle: TextStyle(fontSize: 13),
       
     ),
     onChanged: (tiempoConcentracion){
         print(tiempoConcentracion);
       } //cuando exista cambio en el tecto se crea un parametro que es la variable activity, la cual se usa en la funcion
       //Recibe entradas de texto y las muestra en terminal 

   );
 }
 Widget _inputDescanso(){
   return TextFormField(
     keyboardType: TextInputType.numberWithOptions(decimal: true),//al moemtno de seleccionarlo te muestra el teclado numerido de Android o IOS
     decoration: InputDecoration(
       labelText: " Relax",
       labelStyle: TextStyle(fontSize: 13),
       
     ),
     onChanged: (tiempoDescanso){
         print(tiempoDescanso);
       } //cuando exista cambio en el tecto se crea un parametro que es la variable activity, la cual se usa en la funcion
       //Recibe entradas de texto y las muestra en terminal 

   );
 }
}