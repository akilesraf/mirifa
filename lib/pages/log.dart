
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:mirifanet/pages/auth_with_facebook.dart';
import 'package:mirifanet/pages/auth_with_google.dart';
import 'package:mirifanet/pages/password_page.dart';
import 'package:mirifanet/pages/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:html' as html;


import '../Home.dart';


class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSingUp;
   const LoginWidget({
    Key key,
    this.onClickedSingUp,
}) : super(key: key);
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {





  void webWhatsapp() async {
    await html.window.open("https://wa.me/59892995038,", 'MercadoPago');
  }
  // final controller = SplashController();
  final emailcontroller = TextEditingController();
  final passwordController = TextEditingController();
  final AuthServiceFacebook auth = AuthServiceFacebook();
  final AuthServiceGoogle _auth = AuthServiceGoogle();
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) =>

      SingleChildScrollView(
          padding: const EdgeInsets.only(top: 26, right: 26, left: 26),
        child: Column(
          children: [
             const SizedBox(height: 10),
             const Text('Mi Rifa Uruguay',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),

             const SizedBox(height: 24),
            TextField(
              controller: emailcontroller,
              cursorColor:  Colors.white,
              textInputAction: TextInputAction.next,
              decoration:  const InputDecoration(labelText: 'Correo'),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: passwordController,
              cursorColor:  Colors.white,
              textInputAction: TextInputAction.next,
              decoration:  const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
             const SizedBox(height: 24),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              icon:  const Icon(Icons.lock_open, size: 32),
              label:  const Text(
                'Ingresar',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: signIn,
            ),
            const SizedBox(height: 24),
            GestureDetector(
              child:  Text(
                'Olvide mi contraseña',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 24,
                    ),
                  ),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=> ForgotPasswordPage(),
                ) ),

            ),
             const SizedBox(height: 24),
            RichText(
              text: TextSpan(
              style: const TextStyle(color: Colors.black45,fontSize: 24, ),
                text:'No tienes cuenta?',

                children: [
                  TextSpan(

                    recognizer: TapGestureRecognizer()
                    ..onTap = widget.onClickedSingUp,
                    text: ' Registro',
                    style: TextStyle(
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                          color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),

            ),
            SizedBox(
              height: 10,
            ),
/*
            Center(
             child: Image(
               height: 56,
                width: 56,
                image: AssetImage('assets/iconogoogle.png')
              ),
            ),


            SizedBox(
              height: 15,
            ),

            Center(
              child: ElevatedButton( onPressed: ()async{
                await _auth.signInWithGoogle();
              },
                child: Text ('Inicio con Google',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),), ),
            ),
*/

             Icon(Icons.facebook_rounded, color: Colors.blueAccent, size: 65, ),
            FacebookSignInButton(
              borderRadius: 25,
              text: "Continue con facebook",
              textStyle:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white),
              onPressed: ()async{
                await auth.signInWithFacebook();
              },
            ),



            SizedBox(
              height: 20,
            ),
            const SizedBox(height: 15),
            Icon(Icons.whatsapp, color: Colors.green ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: webWhatsapp,

                child: Text('Contacta con nuestro equipo' )),

            SizedBox(
              height: 15,
            ),

            SizedBox(
              height: 40,
            ),


          ],
        ),


      );
  Future signIn() async{
    //showDialog(
       // context: context,
       // barrierDismissible: false,
   // builder: (context) =>  const Center(child: CircularProgressIndicator()),

   // );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordController.text.trim(),
      );
    }on FirebaseAuthException catch (e){
      print(e);
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState?.popUntil((route) => route.isFirst);

  }
}


