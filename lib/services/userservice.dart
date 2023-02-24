import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heart_oxygen_alarm/model/useridmodel.dart';
import '../model/diagrammodelheartrate.dart';
import '../model/usermodel.dart';

class UserService {
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'name': user.name,
        'username': user.username,
        'email': user.email,
        'date': user.date,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future updateUser(UserModel user) async {
    try {
      _userReference.doc(user.id).update({
        'name': user.name,
        'username': user.username,
        'date': user.date,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future updateUserStat(UserModel user) async {
    try {
      _userReference.doc(user.id).update({
        'stat': user.stat,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUserById(String id) async {
    DocumentSnapshot snapshot = await _userReference
        .doc(id)
        .get(); //snapshot adalah object dari firebase cloud firestore, untuk mengambil data dari field berdasarkan id di collection 'users'

    try {
      UserModel user = UserModel(
        id: id,
        username: snapshot[
            'username'], //memanggil field 'name' di id yang ada di collection 'users'
        email: snapshot['email'],
        name: snapshot['name'],
        date: snapshot['date'],
        stat: snapshot['stat'] as List<dynamic>,
      );

      HeartRateModel.heartRateValue = user.stat.cast();
      UserIDModel.id = id;
      UserIDModel.name = user.name;
      UserIDModel.username = user.username;
      UserIDModel.email = user.email;
      UserIDModel.date = user.date;

      return user;
    } catch (e) {
      rethrow;
    }
  }
}
