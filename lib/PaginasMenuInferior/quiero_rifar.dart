
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:html' as html;
import '../Home.dart';

class QuieroRifar extends StatelessWidget{
  const QuieroRifar();

  @override
  Widget build(BuildContext context) {
    void webWhatsapp() async {
      await html.window.open("https://wa.me/59892995038,", 'MercadoPago');
    }

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.whatsapp),
            tooltip: 'Habla con nosotros',
            onPressed: webWhatsapp,
          ),
        ],
        leading: IconButton(
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

              child: const Text('Quiero Rifar' ,style: TextStyle(
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
                child: Column(
                  children: [
                    const Text("Mirifa.net es una plataforma que te permite rifar tus productos y obtener un mayor beneficio con respectos a los canales de venta tradicionales.\nSegún la reglamentación vigente de la Dirección Nacional de Loterías y Quinielas en Uruguay (ver reglamentación) una persona puede ser beneficiaria de una rifa una única vez al año. Los requisitos para ello son:\nEn caso de haber sido beneficiario de una rifa anteriormente, la finalización de la misma tiene que haber sido al menos un año atrás.\n    La emisión total del monto a vender de rifa no puede superar las 2000 UR (rifas mayores a esta cifra no están contempladas por esta plataforma).\n    El premio a entregar no debe consistir en dinero.\n    Todas las rifas validadas en nuestra plataforma son notificadas a Loterías y Quinielas.\n    En cuanto a los sorteos existen dos modalidades:\n    Para rifas hasta mil números, los sorteos se realizan con la Quiniela del día y hora indicado en la rifa.\n    Para rifas mayores a mil números, los sorteos son realizados por mirifa.net con bolillero y en presencia de Escribano público.\n\nSi estas interesado en vender algo a través de una rifa contáctanos",
                       style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                ),
                    SizedBox(
                      height: 30,
                    ),
                      Text("Click en el boton, para ver reglamentación actual de la Dirección Nacional Loterías y Quinielas del Uruguay",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //textAlign: TextAlign.center,
                    ElevatedButton(
                      child: Text("Reglamentacion Actual"),
                      onPressed:(){
                        launch('https://www.loteria.gub.uy/Juego_Rifas.php');
                      } ,
                    )
                  ],
                ),
              ) ,
            ),

          ],
        ),
      ),
    );
  }
}
