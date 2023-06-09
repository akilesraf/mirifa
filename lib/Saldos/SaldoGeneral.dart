import 'package:firebase/firebase.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:flutter/cupertino.dart';
import 'package:mirifanet/Home.dart';
import 'dart:async';
import 'package:mirifanet/FirebaseCustom.dart';
import 'dart:html' as html;
import 'package:flutter/material.dart';

class SaldoGeneral extends StatefulWidget {
  @override
  State<SaldoGeneral> createState() => _SaldoGeneral();
}

class _SaldoGeneral extends State<SaldoGeneral> {
  //datos que agrga el usuario
  final TextEditingController editingController = TextEditingController();
  final TextEditingController _controlerEmail = TextEditingController();
  @override
  void initState() {
    _saldo1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //String Em1 = _controlerEmail as String;
    return Scaffold(
      appBar: AppBar(
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
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            tooltip: 'Inicio',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHome()),
              );
            },
          ),
        ],
        title: const Text('Mi Rifa'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(26),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Mi Rifa Uruguay',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
              SizedBox(height: 40),
              Card(
                child: TextField(
                  controller: _controlerEmail,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search_rounded),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0))),
                    hintText: 'Ingresar numero de Telefono, psara ver su saldo',
                  ),
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  child: const Text(
                    'Ver saldo',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  onPressed: _saldo1,
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Su saldo es:  $Saldo1 uyu',
                style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 40),

            ],
          ),
        ),
      ),
    );
  }

  //Future<String> Em  =  Em1;
  var Saldo1 ="0";

  Future<void> _saldo1() async {
    if(_controlerEmail != null){

      var EmailM = await _controlerEmail.text;
      String Email = EmailM.toString();
      DatabaseReference storageRef =
      await fire.database.ref('SaldosG').child(Email);
      storageRef.onValue.listen((event) {
        String a = event.snapshot.val();
        setState(() {
          Saldo1 = "$a";

        });

      });
    }
  }
}

