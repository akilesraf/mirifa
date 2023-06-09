import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mirifanet/FirebaseCustom.dart';

import 'package:flutter/material.dart';
import 'package:mirifanet/pages/login_page.dart';

import 'package:share_plus/share_plus.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;
import 'PaginasDeRifas/scrRifaCinco.dart';
import 'PaginasDeRifas/scrRifaDos.dart';
import 'PaginasDeRifas/scrRifaSeis.dart';
import 'PaginasDeRifas/scrRifaTres.dart';
import 'PaginasDeRifas/scrRifaUno.dart';
import 'PaginasDeRifas/scrRifacuatro.dart';

final navigatorKey = GlobalKey<NavigatorState>();
//final reg2 =FirebaseAuth.instance.currentUser?.uid;
//final user = FirebaseAuth.instance.currentUser.email;
class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //print(user.uid.isEmpty);
    void webWhatsapp() async {
      await html.window.open("https://wa.me/59892995038,", 'MI RIFA');
    }


    return Scaffold(
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.all(0), children: [
          Center(
            child: const UserAccountsDrawerHeader(

              currentAccountPicture: Image(image: AssetImage('assets/mirifaNaranja.jpeg')),
              accountName: Text("MI RIFA URUGUAY"),
              accountEmail: Text('contacto@mirifa.net'),
              //currentAccountPicture: Image.asset('assets/portada.jpg'),
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          ListTile(
            title: Text("Bases y Condiciones"),
            leading: Icon(Icons.list),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(
                  context, '/PaginasMenuInferior/TerminosYCondiciones');
            },
          ),
          ListTile(
            title: Text("Como Funciona"),
            leading: Icon(Icons.list),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/PaginasMenuInferior/QuienesSomos');
            },
          ),
          ListTile(
            title: Text("Quiero Rifar"),
            leading: Icon(Icons.list),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/PaginasMenuInferior/Quiero_rifar');
            },
          ),
          ListTile(
            title: Text("+59892995038"),
            leading: const Icon(
              Icons.whatsapp,
              color: Colors.green,
            ),
            onTap: webWhatsapp,
          ),
          ListTile(
            title: Text("contacto@mirifa.net"),
            leading: const Icon(
              Icons.email,
              color: Colors.indigo,
            ),

          ),
          ListTile(
              title: Text("Salir de la Cuenta"),
              leading: Icon(Icons.close),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pop();
              }),
          const Divider(
            height: 150,
          ),
          ListTile(
            title: Text("Salir del Menú"),
            leading: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ]),
      ),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.whatsapp),
            tooltip: 'Habla con nosotros',
            onPressed: webWhatsapp,
          ),
        ],
        elevation: 5,
        centerTitle: true,
        title: const Text('Mi Rifa Uruguay'),
      ),
      body: SingleChildScrollView(
        child: ContentWidget(
          child: Column(
            children: <Widget>[
              HederWidget(),
              ImagenesC(),
              ImageGaleri(),

              RifasImagenesUno(),
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

//contenedor principal de la app

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

//imagen principal de la app
class HederWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      //color: Colors.amber[600],
      height: 180,
      child: const Center(
          child: Image(
            fit: BoxFit.cover,
              //width: 800,
             // height: 300,
              image: AssetImage('assets/mirifa.jpeg'))),
    );
  }
}

class ImageGaleri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(15),
            width: 650,
            height: 100,
            //color: Colors.amber[600],
            child: const Center(
              child: Text(
                'Todos los sorteos promocionados en este sito, son registrados en la Dirección Nacional de Loterias y Quinielas del Estado ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  //color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImagenesC extends StatefulWidget {
  @override
  State<ImagenesC> createState() => _ImagenesC();
}

class _ImagenesC extends State<ImagenesC> {
  final imagess = [

    'assets/tvPortada.jpeg',
    'assets/ProximoSorteo.png',

  ];
  final urlImagenes = [

    'assets/tvPortada.jpeg',
    'assets/ProximoSorteo.png',

  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Center(
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  height: 350,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  viewportFraction: 1,
                ),
                itemCount: urlImagenes.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = urlImagenes[index];
                  return buildImage(urlImage, index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(String imageness, int index) => Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.grey,
      child: Image(
        fit: BoxFit.fill,
        image: AssetImage(imageness),
      ));
}

class RifasImagenesUno extends StatefulWidget {
  @override
  State<RifasImagenesUno> createState() => _RifasImagenesUno();
}

class _RifasImagenesUno extends State<RifasImagenesUno> {
  //inicio baseImg de datos

  //variable para colocar en texto

  String TituloText1 = 'Sin Conexion';
  String TNumerosText1 = 'Sin Conexion';
  String DNumerosText1 = 'Sin Conexion';
  String VNumerosText1 = 'Sin Conexion';
  String APText1 = 'Sin Conexion';
  //string rifa dos
  String TituloText2 = 'Sin Conexion';
  String TNumerosText2 = 'Sin Conexion';
  String DNumerosText2 = 'Sin Conexion';
  String VNumerosText2 = 'Sin Conexion';
  String APText2 = 'Sin Conexion';
  // string rifa tres
  String TituloText3 = 'Sin Conexion';
  String TNumerosText3 = 'Sin Conexion';
  String DNumerosText3 = 'Sin Conexion';
  String VNumerosText3 = 'Sin Conexion';
  String APText3 = 'Sin Conexion';
  // string rifa cuatro
  String TituloText4 = 'Sin Conexion';
  String TNumerosText4 = 'Sin Conexion';
  String DNumerosText4 = 'Sin Conexion';
  String VNumerosText4 = 'Sin Conexion';
  String APText4 = 'Sin Conexion';
  // string rifa cinco
  String TituloText5 = 'Sin Conexion';
  String TNumerosText5 = 'Sin Conexion';
  String DNumerosText5 = 'Sin Conexion';
  String VNumerosText5 = 'Sin Conexion';
  String APText5 = 'Sin Conexion';
  // string rifa seis
  String TituloText6 = 'Sin Conexion';
  String TNumerosText6 = 'Sin Conexion';
  String DNumerosText6 = 'Sin Conexion';
  String VNumerosText6 = 'Sin Conexion';
  String APText6 = "Sin Conexion";

  void initState() {
    super.initState();

    RealtimeUpdate1();
    RealtimeUpdate2();
    RealtimeUpdate3();
    RealtimeUpdate4();
    RealtimeUpdate5();

    RealtimeUpdate21();
    RealtimeUpdate22();
    RealtimeUpdate23();
    RealtimeUpdate24();
    RealtimeUpdate25();

    RealtimeUpdate31();
    RealtimeUpdate32();
    RealtimeUpdate33();
    RealtimeUpdate34();
    RealtimeUpdate35();

    RealtimeUpdate41();
    RealtimeUpdate42();
    RealtimeUpdate43();
    RealtimeUpdate44();
    RealtimeUpdate45();

    RealtimeUpdate51();
    RealtimeUpdate52();
    RealtimeUpdate53();
    RealtimeUpdate54();
    RealtimeUpdate55();

    RealtimeUpdate61();
    RealtimeUpdate62();
    RealtimeUpdate63();
    RealtimeUpdate64();
    RealtimeUpdate65();
  }

// consulta base de datos y gurda el resultado abajo de setState
  //bd 1
  void RealtimeUpdate1() {
    DatabaseReference DataRef = fire.database.ref('RifaUno').child('Titulo');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        TituloText1 = "$a";
      });
    });
  }

  void RealtimeUpdate2() {
    DatabaseReference DataRef =
        fire.database.ref('RifaUno/Descripcion').child('Valor');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        VNumerosText1 = "$a";
      });
    });
  }

  void RealtimeUpdate3() {
    DatabaseReference DataRef =
        fire.database.ref('RifaUno/Descripcion').child('Total');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        TNumerosText1 = "$a";
      });
    });
  }

  void RealtimeUpdate4() {
    DatabaseReference DataRef =
        fire.database.ref('RifaUno/Descripcion').child('Restantes');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        DNumerosText1 = "$a";
      });
    });
  }

  void RealtimeUpdate5() {
    DatabaseReference DataRef =
        fire.database.ref('RifaUno/Descripcion').child('AP');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        APText1 = "$a";
      });
    });
  }

  //bd 2
  void RealtimeUpdate21() {
    DatabaseReference DataRef = fire.database.ref('RifaDos').child('Titulo');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        TituloText2 = "$a";
      });
    });
  }

  void RealtimeUpdate22() {
    DatabaseReference DataRef =
        fire.database.ref('RifaDos/Descripcion').child('Valor');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        VNumerosText2 = "$a";
      });
    });
  }

  void RealtimeUpdate23() {
    DatabaseReference DataRef =
        fire.database.ref('RifaDos/Descripcion').child('Total');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        TNumerosText2 = "$a";
      });
    });
  }

  void RealtimeUpdate24() {
    DatabaseReference DataRef =
        fire.database.ref('RifaDos/Descripcion').child('Restantes');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        DNumerosText2 = "$a";
      });
    });
  }

  void RealtimeUpdate25() {
    DatabaseReference DataRef =
        fire.database.ref('RifaDos/Descripcion').child('AP');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        APText2 = "$a";
      });
    });
  }

//bd 3
  void RealtimeUpdate31() {
    DatabaseReference DataRef = fire.database.ref('RifaTres').child('Titulo');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        TituloText3 = "$a";
      });
    });
  }

  void RealtimeUpdate32() {
    DatabaseReference DataRef =
        fire.database.ref('RifaTres/Descripcion').child('Valor');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        VNumerosText3 = "$a";
      });
    });
  }

  void RealtimeUpdate33() {
    DatabaseReference DataRef =
        fire.database.ref('RifaTres/Descripcion').child('Total');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        TNumerosText3 = "$a";
      });
    });
  }

  void RealtimeUpdate34() {
    DatabaseReference DataRef =
        fire.database.ref('RifaTres/Descripcion').child('Restantes');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        DNumerosText3 = "$a";
      });
    });
  }

  void RealtimeUpdate35() {
    DatabaseReference DataRef =
        fire.database.ref('RifaTres/Descripcion').child('AP');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        APText3 = "$a";
      });
    });
  }

//bd 4
  void RealtimeUpdate41() {
    DatabaseReference DataRef = fire.database.ref('RifaCuatro').child('Titulo');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        TituloText4 = "$a";
      });
    });
  }

  void RealtimeUpdate42() {
    DatabaseReference DataRef =
        fire.database.ref('RifaCuatro/Descripcion').child('Valor');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        VNumerosText4 = "$a";
      });
    });
  }

  void RealtimeUpdate43() {
    DatabaseReference DataRef =
        fire.database.ref('RifaCuatro/Descripcion').child('Total');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        TNumerosText4 = "$a";
      });
    });
  }

  void RealtimeUpdate44() {
    DatabaseReference DataRef =
        fire.database.ref('RifaCuatro/Descripcion').child('Restantes');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        DNumerosText4 = "$a";
      });
    });
  }

  void RealtimeUpdate45() {
    DatabaseReference DataRef =
        fire.database.ref('RifaCuatro/Descripcion').child('AP');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        APText4 = "$a";
      });
    });
  }

  //bd 5
  void RealtimeUpdate51() {
    DatabaseReference DataRef = fire.database.ref('RifaCinco').child('Titulo');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        TituloText5 = "$a";
      });
    });
  }

  void RealtimeUpdate52() {
    DatabaseReference DataRef =
        fire.database.ref('RifaCinco/Descripcion').child('Valor');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        VNumerosText5 = "$a";
      });
    });
  }

  void RealtimeUpdate53() {
    DatabaseReference DataRef =
        fire.database.ref('RifaCinco/Descripcion').child('Total');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        TNumerosText5 = "$a";
      });
    });
  }

  void RealtimeUpdate54() {
    DatabaseReference DataRef =
        fire.database.ref('RifaCinco/Descripcion').child('Restantes');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        DNumerosText5 = "$a";
      });
    });
  }

  void RealtimeUpdate55() {
    DatabaseReference DataRef =
        fire.database.ref('RifaCinco/Descripcion').child('AP');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        APText5 = "$a";
      });
    });
  }

  //bd 6
  void RealtimeUpdate61() {
    DatabaseReference DataRef = fire.database.ref('RifaSeis').child('Titulo');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        TituloText6 = "$a";
      });
    });
  }

  void RealtimeUpdate62() {
    DatabaseReference DataRef =
        fire.database.ref('RifaSeis/Descripcion').child('Valor');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        VNumerosText6 = "$a";
      });
    });
  }

  void RealtimeUpdate63() {
    DatabaseReference DataRef =
        fire.database.ref('RifaSeis/Descripcion').child('Total');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        TNumerosText6 = "$a";
      });
    });
  }

  void RealtimeUpdate64() {
    DatabaseReference DataRef =
        fire.database.ref('RifaSeis/Descripcion').child('Restantes');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        DNumerosText6 = "$a";
      });
    });
  }

  void RealtimeUpdate65() {
    DatabaseReference DataRef =
        fire.database.ref('RifaSeis/Descripcion').child('AP');

    DataRef.onValue.listen((event) {
      String a = event.snapshot.val();
      setState(() {
        APText6 = "$a";
      });
    });
  }

  final images = [

    'assets/tvPortada.jpeg',
    'assets/ProximoSorteo.png',

  ];

  Widget build(BuildContext context) {
    if (images == ErrorWidget.builder)
      Center(
        child: CircularProgressIndicator(),
      );
    return Column(
      children: [
        Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/tvPortada.jpeg',)),
              ),
              const Divider(
                height: 4,
              ),
              Text(
                //trae datos de la base de datos y los refleja aca como text
                TituloText1,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.orange),
              ),
              const Divider(
                height: 5,
              ),
              Text(
                'Valor: $VNumerosText1 uyu',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'Números: $TNumerosText1',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'Disponibles: $DNumerosText1',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Divider(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: Text(
                      "$APText1 $TituloText1 ",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    onPressed: () async {
                      // bool reg2 = false,
                      final reg2 = FirebaseAuth.instance.currentUser?.uid;
                      final reg3 = FirebaseAuth.instance.currentUser?.email;
                      //print( FirebaseAuth.instance.currentUser?.uid);
                      if (reg2 != null || reg3 != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => scrRifaUno()),
                        );
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Mi Rifa.net'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      Text(
                                          'Iniciar Sesión o Regístrate, para ver los números disponibles y más información sobre esta Rifa.')
                                    ],
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    child: Text('Iiciar Sesión'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                      );
                                    },
                                  ),
                                ],
                              );
                            });
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                    fit: BoxFit.cover, image: AssetImage('assets/ProximoSorteo.png',)),
              ),
              const Divider(
                height: 1.5,
              ),
              Text(
                //trae datos de la base de datos y los refleja aca como text
                TituloText2,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.orange),
              ),
              const Divider(
                height: 5,
              ),
              Text(
                'Valor: $VNumerosText2 uyu',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'Números: $TNumerosText2',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'Disponibles: $DNumerosText2',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Divider(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: Text(
                      "$APText2 $TituloText2",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    onPressed: () async {
                      final reg2 = FirebaseAuth.instance.currentUser?.uid;
                      final reg3 = FirebaseAuth.instance.currentUser?.email;
                      //print( FirebaseAuth.instance.currentUser?.uid);
                      if (reg2 != null || reg3 != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => scrRifaDos()),
                        );
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Mi Rifa.net'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      Text(
                                          'Iniciar Sesión o Regístrate, para ver los números disponibles y más información sobre esta Rifa.')
                                    ],
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    child: Text('Iiciar Sesión'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                      );
                                    },
                                  ),
                                ],
                              );
                            });
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/ProximoSorteo.png',
                    )),
              ),
              const Divider(
                height: 4,
              ),
              Text(
                //trae datos de la base de datos y los refleja aca como text
                TituloText3,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.orange),
              ),
              const Divider(
                height: 5,
              ),
              Text(
                'Valor: $VNumerosText3 uyu',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'Números: $TNumerosText3',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'Disponibles: $DNumerosText3',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Divider(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: Text(
                      "$APText3 $TituloText3",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    onPressed: () async {
                      final reg2 = FirebaseAuth.instance.currentUser?.uid;

                      // print( FirebaseAuth.instance.currentUser?.uid);
                      if (reg2 != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => scrRifaTres()),
                        );
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Mi Rifa.net'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      Text(
                                          'Iniciar Sesión o Regístrate, para ver los números disponibles y más información sobre esta Rifa.')
                                    ],
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    child: Text('Iiciar Sesión'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                      );
                                    },
                                  ),
                                ],
                              );
                            });
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                    fit: BoxFit.cover, image: AssetImage('assets/ProximoSorteo.png',)),
              ),
              const Divider(
                height: 4,
              ),
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
              Text(
                'Números: $TNumerosText4',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'Disponibles: $DNumerosText4',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Divider(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: Text(
                      "$APText4 $TituloText4",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    onPressed: () async {
                      final reg2 = FirebaseAuth.instance.currentUser?.uid;
                      final reg3 = FirebaseAuth.instance.currentUser?.email;
                      //print( FirebaseAuth.instance.currentUser?.uid);
                      if (reg2 != null || reg3 != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => scrRifaCuatro()),
                        );
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Mi Rifa.net'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      Text(
                                          'Iniciar Sesión o Regístrate, para ver los números disponibles y más información sobre esta Rifa.')
                                    ],
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    child: Text('Iiciar Sesión'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                      );
                                    },
                                  ),
                                ],
                              );
                            });
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/ProximoSorteo.png')),
              ),
              const Divider(
                height: 4,
              ),
              Text(
                //trae datos de la base de datos y los refleja aca como text
                TituloText5,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.orange),
              ),
              const Divider(
                height: 5,
              ),
              Text(
                'Valor: $VNumerosText5 uyu',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'Números: $TNumerosText5',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'Disponibles: $DNumerosText5',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Divider(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: Text(
                      "$APText5 $TituloText5",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    onPressed: () async {
                      final reg2 = FirebaseAuth.instance.currentUser?.uid;
                      final reg3 = FirebaseAuth.instance.currentUser?.email;
                      //print( FirebaseAuth.instance.currentUser?.uid);
                      if (reg2 != null || reg3 != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => scrRifaCinco()),
                        );
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Mi Rifa.net'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      Text(
                                          'Iniciar Sesión o Regístrate, para ver los números disponibles y más información sobre esta Rifa.')
                                    ],
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    child: Text('Iiciar Sesión'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                      );
                                    },
                                  ),
                                ],
                              );
                            });
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/ProximoSorteo.png')),
              ),
              const Divider(
                height: 4,
              ),
              Text(
                //trae datos de la base de datos y los refleja aca como text
                TituloText6,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.orange),
              ),
              const Divider(
                height: 5,
              ),
              Text(
                'Valor: $VNumerosText6 uyu',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'Números: $TNumerosText6',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'Disponibles: $DNumerosText6',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Divider(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: Text(
                      "$APText6 $TituloText6",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    onPressed: () async {
                      final reg2 = FirebaseAuth.instance.currentUser?.uid;
                      final reg3 = FirebaseAuth.instance.currentUser?.email;
                      //print( FirebaseAuth.instance.currentUser?.uid);
                      if (reg2 != null || reg3 != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => scrRifaSeis()),
                        );
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Mi Rifa.net'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      Text(
                                          'Iniciar Sesión o Regístrate, para ver los números disponibles y más información sobre esta Rifa.')
                                    ],
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    child: Text('Iiciar Sesión'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                      );
                                    },
                                  ),
                                ],
                              );
                            });
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
