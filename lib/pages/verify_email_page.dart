
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirifanet/pages/utils.dart';

import '../Home.dart';


class VerifyEmailPage extends StatefulWidget{
@override
_VerifyEmailPageState createState() => _VerifyEmailPageState();

}
class  _VerifyEmailPageState extends State<VerifyEmailPage>{
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer timer;
  @override
  void initState(){
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser?.emailVerified;
    if (!isEmailVerified){
      sendVerificationEmail();

     timer =  Timer.periodic(
        Duration(seconds: 3),
          (_) => checkEmailVerified(),
      );

    }
  }
  @override
  void dispose(){
    timer?.cancel();
  super.dispose();
}

Future checkEmailVerified() async{
    await FirebaseAuth.instance.currentUser.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser.emailVerified;

    });
    if(isEmailVerified) timer?.cancel();
}

  Future sendVerificationEmail() async{
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 5));
      setState(()=> canResendEmail = true);

    }catch (e){
      Utils.showSnackBar(e.toString());
    }
  }
  @override
  Widget build(BuildContext context)=> isEmailVerified
  ? MyHome()
  : Scaffold(
    appBar: AppBar(
      title: Text(' Correo Verificado'),
    ),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          const Text('Mi Rifa Uruguay',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
          Text(' Email verificado ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
              ),
              onPressed: canResendEmail ? sendVerificationEmail: null,
              icon: Icon(Icons.email, size: 32,),
              label: Text(
                'Renviar email',
                style: TextStyle(fontSize: 24),
              )),
          SizedBox(height: 8),
          TextButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
            ),
              child: Text('Cancelar',
              style: TextStyle(fontSize: 24),
              ),
              onPressed: () => FirebaseAuth.instance.signOut(),
              ),
          SizedBox(height: 8),
          Text(' Revise su casilla de correo para validar su email.\nEl email puede estar en la casilla de spam y/o correo no deseado. ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
    ),
  );


}


