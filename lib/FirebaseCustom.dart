import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firebase.dart';


//Replace These Values With Yours
class FirebaseHelper  {
  static fb.Database initDatabase() {
    try {
      if (fb.apps.isEmpty) {
        fb.initializeApp(
            apiKey: "AIzaSyBY5BlR3IQpozBbr_THFrW5-VPJHCS7LxQ",
            authDomain: "miriffa-59185.firebaseapp.com",
            databaseURL: "https://miriffa-59185-default-rtdb.firebaseio.com",
            projectId: "miriffa-59185",
            storageBucket: "miriffa-59185.appspot.com",
            messagingSenderId: "123320079693",
            appId: "1:123320079693:web:453641a99177698957d304",
            measurementId: "G-BH6L4PQF0Y"
        );
      }
    } on fb.FirebaseJsNotLoadedException catch (e) {
      print(e);
    }
    return fb.database();
  }
}

class fire{
  static fb.Database database = FirebaseHelper.initDatabase();
}


Future<String> getOnce(fb.DatabaseReference AdsRef) async {
  String a;
  await AdsRef.once('value').then((value) => {a = value.snapshot.val()});
  return a;
}

Future<List> getList(fb.DatabaseReference AdsRef) async {
  List list = [""];
  await AdsRef.once('value').then((value) => {
    list = result(value.snapshot, list)
  });
  return list;
}

List result(DataSnapshot dp,List list){
  list.clear();
  dp.forEach((v) {
    list.add(v);
  });
  return list;
}

