
import 'dart:html' as html;
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirifanet/pages/utils.dart';


class ForgotPasswordPage extends StatefulWidget{
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();

}
class  _ForgotPasswordPageState extends State<ForgotPasswordPage>{
  void webWhatsapp() async {
    await html.window.open("https://wa.me/59892995038,", 'MercadoPago');
  }
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    super.dispose();
  }
 @override
  Widget build(BuildContext context) => Scaffold(
   appBar: AppBar(
     backgroundColor:  Colors.transparent,
     elevation: 0,
     title: Text('Cambio Contraseña '),

   ),
   body: Padding(
     padding:  EdgeInsets.all(16),
     child: Form(
       key: formKey,
       child: Column(
         mainAxisAlignment:  MainAxisAlignment.center,
         children: [
           const SizedBox(height: 40),
           const Text('Mi Rifa Uruguay',
             style: TextStyle(
               fontSize: 28,
               fontWeight: FontWeight.bold,
               color: Colors.amber,
             ),
           ),const SizedBox(height: 25),
           Icon(Icons.whatsapp, color: Colors.green ),
           const SizedBox(height: 15),
           ElevatedButton(onPressed: webWhatsapp,

               child: Text('Contacta con nuestro equipo' )),
           const SizedBox(height: 25),
           Text(
             'Recivira un email para \n cambiar la contraseña',
             textAlign: TextAlign.center,
             style:  TextStyle(fontSize: 24),
           ),
           SizedBox(height: 20),
           TextFormField(
             controller: emailController,
             cursorColor: Colors.black,
             textInputAction: TextInputAction.done,
             decoration: InputDecoration(labelText: 'Email'),
             autovalidateMode: AutovalidateMode.onUserInteraction,
             validator: (email)=> email != null && !EmailValidator.validate(email)
             ?'Ingrese un email valido'
               : null,
           ),
           SizedBox(height: 20),
           ElevatedButton.icon(
             style: ElevatedButton.styleFrom(
               minimumSize: Size.fromHeight(50),
             ),
               onPressed: verifyEmail,
               icon: Icon(Icons.email_outlined),
               label: Text(
                 'Cambiar contraseña',
                 style: TextStyle(fontSize: 24),
               ))
         ],
       ),
     ),
   ),
 );
  Future verifyEmail() async{
    showDialog(
        context: context,
        barrierDismissible: false,
       builder: (context) =>  const Center(child: CircularProgressIndicator()),
   );
        try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      Utils.showSnackBar('Contraseña enviada');
      Navigator.of(context).popUntil((route) => route.isFirst);
    }on FirebaseAuthException catch (e){
      Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }
}