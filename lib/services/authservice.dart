import 'package:firebase_auth/firebase_auth.dart';
import 'package:heart_oxygen_alarm/services/userservice.dart';

import '../model/usermodel.dart';

class AuthService {
  // * Authservice untuk mengatur autentikasi, sedangkan UserService untuk mengatur penyimpanan data ke firebase

  //! NOTE: Langkah 7:
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /*Stream<User?> streamAuthStatus() {
    return _auth.authStateChanges();
  }*/

  /*Stream<User?> get streamAuthStatus => _auth.authstate*/

  //! NOTE: Langkah 8:
  Future<UserModel> signUp({
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      //! NOTE: Langkah 9:
      UserCredential _userCreate = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //! NOTE: Langkah 10:
      UserModel _userData = UserModel(
        id: _userCreate.user!.uid,
        username: username,
        email: email,
      );

      //! NOTE: Langkah 11:
      UserService().setUser(_userData);

      return _userData;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        //memanggil fungsi signin firebase berdasarkan email dan password
        // session _auth diaktifkan
        email: email,
        password: password,
      );

      UserModel user = await UserService()
          .getUserById(userCredential.user!.uid); //mengambil data dari firebase

      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut(); // session _auth di firebase berakhir
    } catch (e) {
      rethrow;
    }
  }
}