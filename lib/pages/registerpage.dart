import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_oxygen_alarm/pages/homepage.dart';
import 'package:intl/intl.dart';

import '../cubit/auth/auth_cubit.dart';
import '../shared/theme.dart';
import '../widget/custombutton.dart';
import '../widget/customform.dart';

class RegisterPage extends StatefulWidget {
  static const nameRoute = '/registerpage';
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController birthdayController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  DateTime? _dateTime;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 35,
            vertical: 62,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gabung dan \nnikmati hidup sehat',
                style: cHeader1Style,
              ),
              const SizedBox(
                height: 31,
              ),
              Image.asset('assets/images/runheader.png'),
              // const Spacer(),
              const SizedBox(
                height: 40,
              ),
              //
              //
              //
              CustomForm(
                textController: nameController,
                hintText: 'Nama',
                margin: const EdgeInsets.only(bottom: 15),
              ),
              CustomForm(
                textController: usernameController,
                hintText: 'Username',
                margin: const EdgeInsets.only(bottom: 15),
              ),

              CustomForm(
                textController: emailController,
                hintText: 'Email',
                margin: const EdgeInsets.only(bottom: 15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    (_dateTime == null)
                        ? "Tanggal Lahir?"
                        : DateFormat('EEE, d MMMM yyyy').format(_dateTime!),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      //TIPS: padding atas bawah kosong on ElevatedButton
                      //minimumSize: Size.zero,

                      //TIPS: padding kiri kanan kosong on ElevatedButton
                      //padding: EdgeInsets.all(0),

                      foregroundColor: Colors.blue,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2025),
                      ).then((value) {
                        setState(() {
                          _dateTime = value;
                        });
                      });
                    },
                    child: Text("Pilih Tanggal"),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomForm(
                textController: passwordController,
                hintText: 'Kata Sandi',
                margin: const EdgeInsets.only(bottom: 15),
                isPassword: true,
              ),
              CustomForm(
                textController: confirmPasswordController,
                hintText: 'Konfirmasi Kata Sandi',
                margin: const EdgeInsets.only(bottom: 5),
                isPassword: true,
              ),

              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, FindDevicesScreen.nameRoute, (route) => false);
                  } else if (state is AuthFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        content: Text(state.error),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return Container(
                      margin: const EdgeInsets.only(
                        top: 37,
                        bottom: 58,
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return CustomButton(
                    text: 'Daftar',
                    margin: const EdgeInsets.only(
                      top: 37,
                      bottom: 30,
                    ),
                    onPressed: () {
                      if (nameController.text == '' ||
                          usernameController.text == '' ||
                          emailController.text == '' ||
                          passwordController.text == '' ||
                          confirmPasswordController.text == '' ||
                          _dateTime == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: cRedColor,
                            duration: Duration(milliseconds: 200),
                            content: Text(
                              'Pastikan Form Tidak Kosong',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(emailController.text)) {
                        //NOTE:EMAIL VALIDATION menggunakan RegExp
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: cRedColor,
                            duration: Duration(milliseconds: 200),
                            content: Text(
                              'Cek Penulisan Email Anda',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else if (passwordController.text.length < 8) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: cRedColor,
                            duration: Duration(milliseconds: 200),
                            content: Text(
                              'Password Minimal 8 Karakter',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else if (passwordController.text !=
                          confirmPasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: cRedColor,
                            duration: Duration(milliseconds: 200),
                            content: Text(
                              'Konfirmasi Password Tidak Sesuai',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else {
                        context.read<AuthCubit>().signUp(
                              name: nameController.text,
                              username: usernameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              date: _dateTime.toString(),
                            );
                      }
                    },
                  );
                },
              ),

              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sudah punya akun? Login Disini',
                          style: cTextButtonBlack,
                        ),
                        TextSpan(
                          text: ' Login disini',
                          style: cTextButtonBlack.copyWith(fontWeight: bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
