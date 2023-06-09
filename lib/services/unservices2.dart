import 'dart:async';
import 'package:mirifanet/FirebaseCustom.dart';
class UsersServices2 {
  Future<bool> saveNota(String Nombre, String Apellido, String CI, String Tel, String Numero, String PP) async
  {
    try {
      await fire.database.ref("RifaDos").child('DatosC/Compradores').push().set({
        'Nombre': Nombre,
        'Apellido': Apellido,
        'CI': CI,
        'Tel': Tel,
        'Numero': Numero,
        'PP' : PP,
      });

      return true;
    }catch (e) {
      print(e);{
        return false;
      }
    }
  }

}





