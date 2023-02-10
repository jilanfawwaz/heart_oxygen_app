import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../model/usermodel.dart';
import '../../services/authservice.dart';
import '../../services/userservice.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  signUp({
    required String name,
    required String username,
    required String email,
    required String password,
    required String date,
  }) async {
    try {
      emit(AuthLoading());

      UserModel user = await AuthService().signUp(
          name: name,
          email: email,
          username: username,
          password: password,
          date: date);

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
      //print(e.toString());
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());
      await AuthService()
          .signOut(); // memanggil fungsi sigOut di AuthServices untuk mengakhiri session
      emit(AuthInitial()); //kondisi dikembalikan ke initial
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void getCurrentUser(String id) async {
    //dipanggil di halaman splashPage, kalau app direstart, mengambil data dari firebase berdasarkan id yang aktif
    try {
      UserModel user = await UserService().getUserById(id);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signIn({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService().signIn(
          email: email,
          password:
              password); //mengambil data user dari proses di authService, kemudian data ini diinisialisasi ke userModel untuk dimasukkan ke authSuccess
      emit(AuthSuccess(user)); //data signIn dimasukkan ke state success
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void updateData({
    required String id,
    required String name,
    required String username,
    required String email,
    required String date,
  }) async {
    try {
      emit(AuthLoading()); //state diubah menjadi loading

      UserModel user = UserModel(
        id: id,
        name: name,
        email: email,
        username: username,
        date: date,
      );

      await UserService().setUser(
          //ketika state masih loading,disini akan dilakukan inisialisasi VariabelObject UserModel(untuk dimasukkan ke AuthSuccess) sekaligus pembuatan akun di AuthService signUp dan memasukkan data ke firebase
          user);

      emit(AuthSuccess(
          user)); //nilai UserModel dimasukkan ke sini, nanti di Page akan ada pengkondisian yang memanggil data berdasarkan data yang disimpan state success
    } catch (e) {
      emit(AuthFailed(e
          .toString())); //memasukkan pesan error, ketika state error, maka pesan string error yang ditampilkan di state ini akan ditampilkan
    }
  }
}
