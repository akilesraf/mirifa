import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:firebase/firebase.dart';
import 'package:mirifanet/FirebaseCustom.dart';

import '../login_page.dart';

class PagoR5 extends StatefulWidget {
  @override
  _PagoR5State createState() => _PagoR5State();
}

class _PagoR5State extends State<PagoR5> {
  @override
  void initState() {
    super.initState();
    //items.addAll(numSel);
    LKP5();
  }

  void web() async {
    var CodigoId = Linkp5;
    await html.window.open(
        "https://www.mercadopago.com.uy/$CodigoId",
        'MercadoPago');
  }

  var Linkp5 = '';

  void LKP5() {
    DatabaseReference DataRef = fire.database.ref('RifaCinco').child('LinkP');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        Linkp5 = "$a";
      });
    });
  }

  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: Text('Mi Rifa'),
        ),
        body: SingleChildScrollView(
          child: Center(

            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(

                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text('Mi Rifa Uruguay',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text('Sus datos fueron enviados. \n Validez de reserva: 24hs',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.amber,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Despúes de 24 hs, si el pago no se encuentra registrado en nuestra base de datos,\n el número vulve a estar disponible nuevamente en lista.\n Para gurdar su número abone el costo de participación, en los plazos establecidos.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                      child: const Text(
                        'Pagar',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: web,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  }
}
