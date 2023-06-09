
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirifanet/pages/register_page.dart';
import 'package:mirifanet/pages/verify_email_page.dart';


import '../../Home.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) =>
      Scaffold(
          body: StreamBuilder<User>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot){
              if (snapshot.connectionState == ConnectionState.waiting){
                return  const Center(child: CircularProgressIndicator());
              }else if(snapshot.hasError){
                return const Center(child: Text('A ocurrido un error !!!'));
              }
              else if (snapshot.hasData){
                return VerifyEmailPage();
              }else{
                return AuthPage();
              }
            },

      ),
      );
}