import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:async';
import 'package:mirifanet/FirebaseCustom.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:html' as html;

import '../Home.dart';
import '../pages/confirmaypaga/CyPDCuatro.dart';
import '../pages/login_page.dart';
import '../services/unservices4.dart';
import '../services/userservices.dart';

class scrRifaCuatro extends StatelessWidget {
  const scrRifaCuatro();
  @override
  Widget build(BuildContext context) {
    void webWhatsapp() async {
      await html.window.open("https://wa.me/59892995038,", 'MercadoPago');
    }
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
            icon: Icon(Icons.whatsapp),
            tooltip: 'Habla con nosotros',
            onPressed: webWhatsapp,
          ),
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
          IconButton(
            onPressed: () => FirebaseAuth.instance.signOut(),
            tooltip: "Salir de la Cuenta",
            icon: Icon(Icons.close),
          ),
        ],
        elevation: 5,
        centerTitle: true,
        title: const Text('Mi Rifa Uruuay'),
      ),
      body: SingleChildScrollView(
        child: ContentWidget(
          child: Column(
            children: <Widget>[
              ImagenProducto(),
              Descripcion(),
              Numeros(),
              Descripcion1(),
              //MenuInferior(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.share,
            semanticLabel: 'Compartir', color: Colors.amberAccent),
        onPressed: () {
          Share.share('Mi Rifa Uruguay: https://mirifa.net/');
        },
      ),
    );
  }
}

//contenedor Principal de la pantalla
class ContentWidget extends StatelessWidget {
  final Widget child;
  const ContentWidget({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: screenSize.width < 1424 ? screenSize.width : 1424,
            child: child),
      ],
    );
  }
}

// Imagen principal

class ImagenProducto extends StatefulWidget {
  @override
  State<ImagenProducto> createState() => _ImagenProducto();
}

class _ImagenProducto extends State<ImagenProducto> {
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 650,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Image(fit: BoxFit.cover, image: AssetImage('assets/Iphone.jpeg')),
      ),
    );
  }
}

//datos descriptivos de rifa

class Descripcion1 extends StatefulWidget {
  @override
  State<Descripcion1> createState() => _Descripcion1();
}

class _Descripcion1 extends State<Descripcion1> {
  //llamo base de datos

  //variable para colocar en texto
  String APText4 = 'Sin Conexion';
  String Vendedor4 = 'Sin conexion';
  String FechaSorteo4 = 'Sin conexion';
  String MasInfo4 = 'Sin conexion';

  @override
  void initState() {
    super.initState();
    RealtimeUpdate41();
    RealtimeUpdate42();
    RealtimeUpdate43();
    RealtimeUpdate44();
  }

  // consulta base de datosy gurda el resultado abajo de setState
  void RealtimeUpdate41() {
    DatabaseReference DataRef =
        fire.database.ref('RifaCuatro/Descripcion').child('AP');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        APText4 = "$a";
      });
    });
  }

  void RealtimeUpdate42() {
    DatabaseReference DataRef =
        fire.database.ref('RifaCuatro').child('Vendedor');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        Vendedor4 = "$a";
      });
    });
  }

  void RealtimeUpdate43() {
    DatabaseReference DataRef =
        fire.database.ref('RifaCuatro').child('DesGeneral');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        MasInfo4 = "$a";
      });
    });
  }

  void RealtimeUpdate44() {
    DatabaseReference DataRef =
        fire.database.ref('RifaCuatro').child('FechaSorteo');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        FechaSorteo4 = "$a";
      });
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsetsDirectional.all(10),
          //elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            children: <Widget>[
              const Text(
                //trae datos de la base de datos y los refleja aca como text
                'Datos Adicionales',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.orange),
              ),
              const Divider(
                height: 5,
              ),
              Text(
                'Beneficiario: $Vendedor4 ',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Divider(
                height: 6,
              ),
              Text(
                'Fecha Sorteo: $FechaSorteo4',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Divider(
                height: 6,
              ),
              const Text(
                '+ Info',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Divider(
                height: 6,
              ),
              Text(
                ' $MasInfo4',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const Divider(
                height: 6,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Numeros de la rifa

class Numeros extends StatefulWidget {
  @override
  State<Numeros> createState() => _Numeros();
}

class _Numeros extends State<Numeros> {
  final databaseNum = fire.database.ref('RifaCuatro');
  var numSel = "";
  var numPos = "";
  var numSelKey;
  var PP  = "Reciente";

  // final duplicateItems =  toString(numSel);

  final TextEditingController editingController = TextEditingController();
  final TextEditingController _controlNombre = TextEditingController();
  final TextEditingController _controlApellido = TextEditingController();
  final TextEditingController _controlCI = TextEditingController();
  final TextEditingController _controlTel = TextEditingController();
  final GlobalKey<FormState> _formulariokey = GlobalKey<FormState>();
  final TextEditingController _texto = TextEditingController();
  StreamSubscription _iniciopeticiones;

  @override
  void initState() {
    super.initState();
    //items.addAll(numSel);
    _activateListeners441();
  }

  void _activateListeners441() {
    DatabaseReference DataRef =
        fire.database.ref('RifaCuatro').child('Numeros').child("0");

    DataRef.onValue.listen((event) {
      var titulo = event.snapshot.val();
      // var misnota = '$titulo';
      setState(() {
        // numSel = misnota;
        misnotas.clear();
        misnotas.addAll(titulo);
        print(misnotas);
      });
    });
  }

  List misnotas = [];

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: Column(
        children: <Widget>[
          const Divider(
            height: 6,
          ),
          TextField(
            onChanged: (value) async {
              String v = await value;
              _activateListeners441();
              List vList = await [v];
              if (misnotas.contains(v)) {
                setState(() {
                  misnotas = vList.toList();
                });
              } else {
                setState(() {
                  _activateListeners441();
                });
              }
            },

            autofillHints: [misnotas.toString()],
            //controller: editingController,
            controller: _texto,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search_rounded),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0))),
              hintText: 'Buscar en la Lista de Números',
            ),
          ),
          const Divider(
            height: 8,
          ),
          SizedBox(
              height: 350,
              width: 650,
              child: GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 3,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(
                  misnotas.length,
                  (index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 3),
                        color: Colors.amber,
                      ),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              numSel = misnotas[index];
                              numPos = misnotas[index];
                            });

                            //print(misnotas[index]);
                          },
                          child: Text(
                            misnotas[index],
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            //Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )),
          Container(
            child: Column(
              children: [
                const Text(
                  'Su elecion es: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.amber,
                  child: Center(
                    child: Text(
                      numPos,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Card(
                margin: const EdgeInsetsDirectional.all(10),
                // elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child: Form(
                  key: _formulariokey,
                  child: Column(
                    children: <Widget>[
                      const Divider(
                        height: 12,
                      ),
                      TextFormField(
                        validator: (String dato) {
                          if (dato.isEmpty) {
                            return 'Campo Obligatorio';
                          }
                        },
                        controller: _controlNombre,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Ingresar Nombre',
                        ),
                      ),
                      const Divider(
                        height: 5,
                      ),
                      TextFormField(
                        validator: (String dato) {
                          if (dato.isEmpty) {
                            return 'Campo Obligatorio';
                          }
                        },
                        controller: _controlApellido,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Ingresar Apellido',
                        ),
                      ),
                      const Divider(
                        height: 5,
                      ),
                      TextFormField(
                        maxLength: 8,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (String dato) {
                          if (dato.isEmpty) {
                            return 'Campo Obligatorio';
                          }
                        },
                        controller: _controlCI,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Ingresar CI',
                        ),
                      ),
                      const Divider(
                        height: 5,
                      ),
                      TextFormField(
                        maxLength: 9,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (String dato) {
                          if (dato.isEmpty) {
                            return 'Campo Obligatorio';
                          }
                        },
                        controller: _controlTel,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Ingresar Telefono',
                        ),
                      ),
                      const Divider(
                        height: 5,
                      ),
                      TextFormField(
                        validator: (String dato) {
                          if (dato.isNotEmpty) {
                            return 'Campo Obligatorio';
                          }
                        },
                        enabled: false,
                        initialValue: numSel,
                        //controller: numSel,
                        //trae datos de la base de datos y los refleja aca como text
                      ),
                      const Divider(
                        height: 5,
                      ),
                      Container(
                        color: Colors.amber[600],
                        child: const Text(
                          "Luego de completar datos, Verifique que su numero esta en lista y no fue adquirido por alguien mas ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ElevatedButton(
                        child: const Text(
                          'Enviar',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () async {
                          bool reg = await FirebaseAuth
                              .instance.currentUser.uid.isNotEmpty;
                          if (reg == true) {
                            if (_formulariokey.currentState.validate()) {
                              bool respuesta = await UsersServices4().saveNota(
                                _controlNombre.text,
                                _controlApellido.text,
                                _controlCI.text,
                                _controlTel.text,
                                numPos,
                                PP,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PagoR4()),
                              );
                              //envia numero si completo datos
                              await databaseNum
                                  .child('Numeros')
                                  .child("0")
                                  .update({numPos: ""});
                              // me lleva a pagina de pagos
                              //Navigator.pushNamed(context, '/ui/MercadoPago/mercadopago_page');

                              if (respuesta) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'el ultimo paso es pagar y a Participar!!!'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('A ocurrido un error'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('A ocurrido un error'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                      ),
                      Divider(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void deactivate() {
    _iniciopeticiones.cancel();
    super.deactivate();
  }
}

// Descripcion y Datos Adicionales

class Descripcion extends StatefulWidget {
  @override
  State<Descripcion> createState() => _Descripcion();
}

class _Descripcion extends State<Descripcion> {
  //llamo base de datos

  //variable para colocar en texto
  String TituloText4 = 'Sin Conexion';
  String TNumerosText4 = 'Sin Conexion';
  String DNumerosText4 = 'Sin Conexion';
  String VNumerosText4 = 'Sin Conexion';
  String APText4 = 'Sin Conexion';
  String CMiniText4 = 'Sin Conexion';
  StreamSubscription _iniciopeticiones;
  @override
  void initState() {
    super.initState();
    RealtimeUpdate44441();
    RealtimeUpdate44442();
    RealtimeUpdate44443();
    RealtimeUpdate44444();
    RealtimeUpdate44445();
    RealtimeUpdate44446();
  }

  // consulta base de datos y gurda el resultado abajo de setState
  //bd 1
  void RealtimeUpdate44441() {
    DatabaseReference DataRef = fire.database.ref('RifaCuatro').child('Titulo');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        TituloText4 = "$a";
      });
    });
  }

  void RealtimeUpdate44442() {
    DatabaseReference DataRef =
        fire.database.ref('RifaCuatro/Descripcion').child('Valor');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        VNumerosText4 = "$a";
      });
    });
  }

  void RealtimeUpdate44443() {
    DatabaseReference DataRef =
        fire.database.ref('RifaCuatro/Descripcion').child('Total');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        TNumerosText4 = "$a";
      });
    });
  }

  void RealtimeUpdate44444() {
    DatabaseReference DataRef =
        fire.database.ref('RifaCuatro/Descripcion').child('Restantes');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        DNumerosText4 = "$a";
      });
    });
  }

  void RealtimeUpdate44445() {
    DatabaseReference DataRef =
        fire.database.ref('RifaCuatro/Descripcion').child('AP');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        APText4 = "$a";
      });
    });
  }

  void RealtimeUpdate44446() {
    DatabaseReference DataRef =
        fire.database.ref('RifaCuatro/Descripcion').child('CMini');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        CMiniText4 = "$a";
      });
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsetsDirectional.all(10),
          //elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            children: <Widget>[
              Text(
                //trae datos de la base de datos y los refleja aca como text
                TituloText4,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.orange),
              ),
              const Divider(
                height: 5,
              ),
              Text(
                'Valor: $VNumerosText4 uyu',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Divider(
                height: 6,
              ),
              Text(
                'Números: $TNumerosText4',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Divider(
                height: 6,
              ),
              Text(
                'Disponibles: $DNumerosText4',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'Cantidad min. para realizar el sorteo: $CMiniText4',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void deactivate() {
    _iniciopeticiones.cancel();
    super.deactivate();
  }
}
