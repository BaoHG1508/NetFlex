// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:netflex/Models/UserModel.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String email;
  var userName;
  String password;

  Future getUsername() async {
    var userNamee;
    await firestore.collection('user').doc(email).get().then((value) => userNamee = value.data().values);
    userName = userNamee.toString().replaceAll("(", "");
    userName = userName.toString().replaceAll(")", "");
  }

  void putUsername(String userName){
    UserModel userModel = UserModel(name: userName);
    firestore.doc('/user/${email}').set(userModel.toJSON());
  }

  Future login(String email, String password) async {

    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Lỗi đăng nhập', e.message.toString());
    }

  }

  void signOut() async {
    try{
      await auth.signOut();
    }
    on FirebaseAuthException catch(e) {
      Get.snackbar("Lỗi đăng xuất", e.message.toString());
    }
  }
  
}