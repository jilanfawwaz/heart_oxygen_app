import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_oxygen_alarm/cubit/auth/auth_cubit.dart';
import 'package:heart_oxygen_alarm/shared/theme.dart';
import 'package:intl/intl.dart';

class HalamanProfile extends StatefulWidget {
  HalamanProfile({super.key});

  static const nameRoute = '/halamanprofile';

  @override
  State<HalamanProfile> createState() => _HalamanProfileState();
}

class _HalamanProfileState extends State<HalamanProfile> {
  TextEditingController nameController = TextEditingController();

  TextEditingController usernameController = TextEditingController();

  DateTime? _dateTime;

  // ignore: prefer_final_fields
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              print('masuksl3 $_dateTime');
              nameController = TextEditingController(text: state.user.name);
              usernameController =
                  TextEditingController(text: state.user.username);
              if (_dateTime == null) {
                _dateTime = DateTime.parse(state.user.date);
              }

              print('masuksl4 $_dateTime');
              return SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Profile Anda',
                      style: cLatosBlackSemibold18,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        const Text('Nama'),
                        TextFormField(
                          controller: nameController,
                          enableSuggestions: false,
                          autocorrect: false,
                          textAlign: TextAlign.center,
                          onChanged: (value) {},
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.grey.shade300,
                              ),
                            ),
                            hintText: 'Masukkan SPO anda',
                            hintStyle: cTextButtonBlack,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 2,
                                color: cPurpleColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 3,
                                color: cPurpleDarkColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text('Username'),
                        TextFormField(
                          controller: usernameController,
                          enableSuggestions: false,
                          autocorrect: false,
                          textAlign: TextAlign.center,
                          onChanged: (value) {},
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.grey.shade300,
                              ),
                            ),
                            hintText: 'Masukkan SPO anda',
                            hintStyle: cTextButtonBlack,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 2,
                                color: cPurpleColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 3,
                                color: cPurpleDarkColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          (_dateTime == null)
                              ? "Tanggal Lahir?"
                              : "Tanggal Lahir : ${DateFormat('EEE, d MMMM yyyy').format(_dateTime!)}",
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
                                print('masuksl $value');
                                _dateTime = value;
                                print('masuksl2 $_dateTime');
                              });
                            });
                          },
                          child: Text("Pilih Tanggal"),
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Email : '),
                                Text('Umur :'),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${state.user.email}'),
                                Text(
                                    '${((DateTime.now().difference(DateTime.parse(state.user.date)).inDays) / 360).floor()} tahun'),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: cPurpleDarkColor,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {
                            context.read<AuthCubit>().updateData(
                                  id: state.user.id,
                                  name: nameController.text,
                                  username: usernameController.text,
                                  email: state.user.email,
                                  date: _dateTime.toString(),
                                  stat: state.user.stat,
                                );
                            Navigator.pop(context);
                          },
                          child: const Text('EDIT'),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
