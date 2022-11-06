import 'dart:async';

import 'package:faircomputation/packages.dart';
import 'package:faircomputation/main.dart';

class Authentication extends GetxController {
  final TextEditingController name = TextEditingController();
  final TextEditingController contact = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  RxString updateAccountStatusMessage = ''.obs;

  final String weekPasswordException = 'The password provided is too weak.';
  final String emailAlreadyExistException =
      'The account already exists for that email.';
  final String emailInvalidException = "Email is invalid";

  Rxn<UserModel>? userModel = Rxn<UserModel>(null).obs();
  RxString exception = ''.obs;

  @override
  void onInit() {
    super.onInit();
    auth.authStateChanges().listen((user) {
      if (user != null) {
        try {
          Get.put(DashboardController());
          Timer(const Duration(seconds: 2), () => Get.toNamed('/dashboard'));
        } catch (e) {
          exception.value = e.toString();
        }
      } else {
        Get.toNamed('/landing');
      }
    });
  }

  void signin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      getUserData();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        exception.value = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        exception.value = 'Wrong password provided for that user.';
      }
    }
  }

  void signup() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      bool status = await postUserData();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        exception.value = emailInvalidException;
      } else if (e.code == 'weak-password') {
        exception.value = weekPasswordException;
      } else if (e.code == 'email-already-in-use') {
        exception.value = emailAlreadyExistException;
      }
    } catch (e) {
      exception.value = e.toString();
    }
  }

  void signout() {
    try {
      auth.signOut();
    } catch (e) {
      exception.value = e.toString();
    }
  }

  Future<bool> sendEmailVerifaction() async {
    try {
      await auth.sendPasswordResetEmail(email: userModel!.value!.userEmail!);

      updateAccountStatusMessage.value = 'Please check your email.';
      return true;
    } catch (e) {
      exception.value = e.toString();
    }
    return false;
  }

  Future<bool> getUserData() async {
    try {
      DocumentSnapshot docs = await firestore
          .collection(userCollection)
          .doc(auth.currentUser!.uid)
          .get();

      userModel!.value = UserModel.getDocumentSnapshot(docs);
      return true;
    } catch (e) {
      exception.value = e.toString();
    }
    return false;
  }

  Future<bool> postUserData() async {
    try {
      await firestore
          .collection(userCollection)
          .doc(auth.currentUser!.uid)
          .set({
        "name": name.text,
        "contact": contact.text,
        "address": address.text,
        "role": 1,
      });

      return true;
    } catch (e) {
      exception.value = e.toString();
    }

    return false;
  }

  Future<bool> putUserData() async {
    try {
      await firestore
          .collection(userCollection)
          .doc(userModel!.value!.userID!)
          .update({
        "name": name.text,
        "address": address.text,
        "contact": contact.text
      });

      updateAccountStatusMessage.value = 'Account Updated';
      return true;
    } catch (e) {
      exception.value = e.toString();
    }
    return false;
  }

  Future<bool> changePassword() async {
    try {
      auth.currentUser!.updatePassword(password.text);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.toString().toLowerCase().contains('weak-password')) {
        exception.value = 'Weak Password';
      }
      exception.value = e.toString();
    } catch (e) {
      exception.value = e.toString();
    }

    return false;
  }
}
