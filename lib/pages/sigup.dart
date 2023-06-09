

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mirifanet/pages/utils.dart';
import 'dart:html' as html;
import '../Home.dart';




class SignUpWidget extends StatefulWidget {
  final Function()  onClickedSignIn;

  const SignUpWidget({
    Key key,
    this.onClickedSignIn,
  }) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}
class _SignUpWidgetState extends State<SignUpWidget> {
  void webWhatsapp() async {
    await html.window.open("https://wa.me/59892995038,", 'MercadoPago');
  }
  // final controller = SplashController();
  final formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) =>
      SingleChildScrollView(
        padding:  const EdgeInsets.all(16),
        child: Form(
          key: formKey,
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
              const SizedBox(height: 25),
              Icon(Icons.whatsapp, color: Colors.green ),
              const SizedBox(height: 15),
              ElevatedButton(onPressed: webWhatsapp,

                  child: Text('Contacta con nuestro equipo' )),


              SizedBox(height: 40),
              TextFormField(
                controller: emailcontroller,
                cursorColor:  Colors.white,
                textInputAction: TextInputAction.next,
                decoration:  InputDecoration(labelText: 'Correo'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                email != null && !EmailValidator.validate(email)
                  ? 'Ingrese un email Valido'
                    : null,

              ),
               const SizedBox(height: 40),
              TextFormField(
                controller: passwordController,
                cursorColor:  Colors.white,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value)=> value != null && value.length < 6
                    ?'Ingrese Minimo 6 Caracteres'
                : null,
                obscureText: true,
              ),
               const SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize:  const Size.fromHeight(50),
                ),
                icon:  const Icon(Icons.arrow_forward, size: 32),
                label:  const Text(
                  'Registro',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: signUp,
              ),
               const SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black45,fontSize: 24),
                  text:'Ya tienes cuenta?',
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        .. onTap = widget.onClickedSignIn,
                      text: ' Inicio',
                      style: TextStyle(
                        fontSize: 24,
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),


                  ],
                ),

              ),
            ],
          ),
        ),


      );
  Future signUp() async{
    final isValid = formKey.currentState?.validate();
    if(!isValid) return;
   // showDialog(
     // context: context,
     // barrierDismissible: false,
     // builder: (context) =>  const Center(child: CircularProgressIndicator()),

    //);
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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