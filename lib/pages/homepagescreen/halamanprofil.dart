import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_oxygen_alarm/cubit/auth/auth_cubit.dart';
import 'package:heart_oxygen_alarm/shared/theme.dart';
import 'package:intl/intl.dart';

class HalamanProfile extends StatelessWidget {
  const HalamanProfile({super.key});

  static const nameRoute = '/halamanprofile';
  // ignore: prefer_final_fields
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
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
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Nama : '),
                            Text('Username : '),
                            Text('Email : '),
                            Text('Tanggal Lahir :'),
                            Text('Umur :'),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${state.user.name}'),
                            Text('${state.user.username}'),
                            Text('${state.user.email}'),
                            Text(
                              DateFormat('EEE, d MMMM yyyy').format(
                                DateTime.parse(state.user.date),
                              ),
                            ),
                            Text(
                                '${((DateTime.now().difference(DateTime.parse(state.user.date)).inDays) / 360).floor()} tahun'),
                          ],
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
