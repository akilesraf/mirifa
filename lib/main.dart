import 'package:flutter/material.dart';
import 'package:mirifanet/FirebaseCustom.dart';
import 'package:mirifanet/pages/login_page.dart';

import 'package:mirifanet/pages/utils.dart';
import 'package:mirifanet/pages/verify_email_page.dart';

import 'Home.dart';
import 'PaginasDeRifas/scrRifaCinco.dart';
import 'PaginasDeRifas/scrRifaDos.dart';
import 'PaginasDeRifas/scrRifaSeis.dart';
import 'PaginasDeRifas/scrRifaTres.dart';
import 'PaginasDeRifas/scrRifaUno.dart';
import 'PaginasDeRifas/scrRifacuatro.dart';
import 'PaginasMenuInferior/QuienesSomos.dart';
import 'PaginasMenuInferior/TerminosYCondiciones.dart';
import 'PaginasMenuInferior/quiero_rifar.dart';

void main() async {

  await FirebaseHelper.initDatabase();



final navigatorKey = GlobalKey<NavigatorState>();

    runApp(MaterialApp(
        scaffoldMessengerKey: messengerkey,
        title: 'Mi Rifa',
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: '/Home',
        routes: <String, WidgetBuilder>{
          '/pages/login_page': (context) => LoginPage(),
          '/Home': (context) => MyHome(),
          '/PaginasDeRifas/scrRifaCinco.dart': (context) => scrRifaCinco(),
          '/PaginasDeRifas/scrRifaDos.dart': (context) => scrRifaDos(),
          '/PaginasDeRifas/scrRifaSeis.dart': (context) => scrRifaSeis(),
          '/PaginasDeRifas/scrRifaTres.dart': (context) => scrRifaTres(),
          '/PaginasDeRifas/scrRifaUno.dart': (context) => scrRifaUno(),
          '/PaginasDeRifas/scrRifacuatro.dart': (context) => scrRifaCuatro(),
          '/PaginasMenuInferior/QuienesSomos': (context) => QuienesSomos(),
          '/PaginasMenuInferior/TerminosYCondiciones': (context) => TerminosYCondiciones(),
          '/PaginasMenuInferior/Quiero_rifar': (context) => QuieroRifar(),
        },
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: MyHome()
        //
        ));
  }

