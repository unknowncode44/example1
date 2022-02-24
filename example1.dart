import 'package:flutter/material.dart';

class Example1 extends StatefulWidget {
  Example1({Key? key}) : super(key: key);
  @override
  State<Example1> createState() => _Example1State();
}

class _Example1State extends State<Example1> {
  // booleana que dispara la expansion del widget
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // funcion para obtener el tamano de pantalla
    Size displaySize(BuildContext context) {
      return MediaQuery.of(context).size;
    }

    // obtenemos el alto y ancho de la pantalla para pasarlos cuando se dispare el evento
    double screenWidth = displaySize(context).width; // ancho
    double screenHeight = displaySize(context).height; // alto

    return Scaffold(
      // este boton dispara el evento
      floatingActionButton: FloatingActionButton(
        // mini: true,
        onPressed: () {
          setState(() {
            // cuando tocamos el boton la booleana cambia y eso hace que se expanda o se contraiga
            isExpanded = !isExpanded;
          });
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add_circle),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedContainer(
          // animatedContainer necesita si o si una duracion para la animacion
          duration: Duration(
            milliseconds: 200,
          ),

          // aca sucede la magia, decimos que si la booleana es verdadera el ancho y alto sera el mismo que el de la pantalla
          // si es falsa (el ancho es 200 en alto y ancho)
          height: isExpanded ? screenHeight : 200,
          width: isExpanded ? screenWidth : 200,
          decoration: BoxDecoration(
            // lo mismo, si la booleana es verdadera el radius sera 0, y si es falsa sera 300, para que parezca una esfera
            borderRadius: BorderRadius.circular(
              isExpanded ? 0 : 300,
            ),
            color: isExpanded ? Colors.blueAccent : Colors.greenAccent,
          ),
        ),
      ),
    );
  }
}
