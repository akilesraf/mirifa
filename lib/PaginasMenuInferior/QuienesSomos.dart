

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Home.dart';

class QuienesSomos extends StatelessWidget{
  const QuienesSomos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(
        icon: Icon(Icons.arrow_back),
        alignment: Alignment.centerRight,
        tooltip: 'Regresar',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHome()),
          );
        },
      ),
        title: const Text('Mi Rifa'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text('Mi Rifa Uruguay',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(

              child: const Text('Como Funciona' ,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),) ,
            ),
              const SizedBox(
                width: 20,
              ),
              const Divider(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Center(
                  child: const Text("Mirifa.net te da la posibilidad de ganar lo que tanto queres, a un bajo costo y con altas probabilidades.\nLa plataforma verifica que la rifa sea posible.\nUna vez verificada comienza la recolección de interesados, los cuales reservan los números.\nLa rifa cuenta con una cantidad mínima de números reservados para ser validada.\nUna vez validada se registra en la Dirección Nacional de Loterías y Quinielas y se dispara la venta de números y la confirmación de las reservas realizadas previamente.\nLos sorteos menores a mil números se realizan con el juego 'La Quiniela' de la Dirección Nacional de loterías y Quinielas.\nAquellos sorteos que superen los mil números se realizan con escribano público presente, dando como ganador en ambos casos a un usuario de mirifa.site.\nPor último, el ganador de la rifa recibe su premio y el beneficiario de la misma recibe su pago",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    //textAlign: TextAlign.center,
                  ),
                ) ,
              ),

          ],
        ),
      ),
    );
  }
}
