import 'package:faircomputation/packages.dart';

class UserModel {
  String? userID;
  String? userName;
  String? userEmail;
  String? userContact;
  RxString exception = ''.obs;

  UserModel();

  UserModel.getDocumentSnapshot(DocumentSnapshot document) {
    try {
      userID = document.id;
      userName = document.get('user_name');
      userEmail = document.get('user_email');
      userContact = document.get('user_contact');
    } catch (e) {
      exception.value = e.toString();
    }
  }

  UserModel.getQueryDocumentSnapshot(QueryDocumentSnapshot document) {
    try {
      userID = document.id;
      userName = document.get('user_name');
      userEmail = document.get('user_email');
      userContact = document.get('user_contact');
    } catch (e) {
      exception.value = e.toString();
    }
  }
}
