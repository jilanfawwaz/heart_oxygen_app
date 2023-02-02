import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_oxygen_alarm/cubit/auth/auth_cubit.dart';
import 'package:intl/intl.dart';
// import 'package:flutter_blue_plus/gen/flutterblueplus.pbserver.dart';

import '../../services/audiocontroller.dart';
import '../../services/localnotificationservice.dart';
import '../../shared/theme.dart';
import '../../widget/customform.dart';

class HomeUtama extends StatefulWidget {
  const HomeUtama({
    required this.nama,
    required this.id,
    required this.listStream,
    super.key,
  });
  final String nama;
  final String id;
  // final List<BluetoothService> services;
  // final Stream<List<int>>? listStream;
  final int listStream;

  @override
  State<HomeUtama> createState() => _HomeUtamaState();
}

// Stream<int> dummyData() async* {
//   for (int i = 0; i <= 5; i++) {
//     await Future.delayed(const Duration(seconds: 1));
//     yield i;
//   }
// }

class _HomeUtamaState extends State<HomeUtama> {
  
  int umur = -1;
  bool isRendah = false;
  bool isTinggi = false;
  AudioController soundAlarm = AudioController(namaSound: 'suaraalarm');
  TextEditingController spoController =
      TextEditingController(); //! Local Notification 11.1 : instansiasi object LocalNotificaitionService
  late final LocalNotificationService service;
  /*Stream dummyData = Stream.periodic(
    const Duration(seconds: 1),
    ((i) {
      int rand = Random().nextInt(10);

      if (rand > 0 && rand < 2) {
        int randDouble = Random().nextInt(30);
        return randDouble + 20;
      } else if (rand > 9 && rand < 10) {
        int randDouble = Random().nextInt(30);
        return randDouble + 80;
      } else {
        int randDouble = Random().nextInt(30);
        return randDouble + 50;
      }
    }),
  );*/
  int dummyValue = Random().nextInt(50) + 30;
  // late StreamSubscription _sub;

  @override
  void initState() {
    super.initState();
    //! Local Notification 11.2 : inisialisasi LocalNotificaitionService
    service = LocalNotificationService();
    service.initialize();
  }
  /* @override
  void initState() {
    super.initState();
    _sub = dummyData.listen((event) {
      if (mounted) {
        setState(() {
          dummyValue = event;
        });
      }
    });

    _sub.resume();
  }*/

  @override
  void dispose() {
    // _sub.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    if (umur != -1) {
      //? umur dibawah 2 tahun, HR 80-160
      if (umur < 2) {
        //? heart rate rendah
        if ((widget.listStream < 80) && (widget.listStream > 0)) {
          if (!isRendah) {
            setState(() {
              isRendah = true;
              soundAlarm.stopAudio();
              soundAlarm.playAudio();
            });

            service.showNotification(
              id: 0,
              title: 'Heart Rate kamu rendah nih !!',
              body: 'Ayo bergerak untuk meningkatkan Heart Rate kamu !!!',
            );
          }
          //? heart rate tinggi
        } else if (widget.listStream > 160) {
          if (!isTinggi) {
            setState(() {
              isTinggi = true;
              soundAlarm.stopAudio();
              soundAlarm.playAudio();
            });
            service.showNotification(
              id: 0,
              title: 'Heart Rate kamu tinggi nih !!',
              body:
                  'Ayo istirahat sebentar untuk menurunkan Heart Rate kamu !!!',
            );
          }
          //? heart rate normal
        } else {
          setState(() {
            if (isRendah || isTinggi) {
              service.showNotification(
                id: 0,
                title: 'Yeayy! Heart Rate kamu sudah balik ke normal nih !!',
                body:
                    'Untuk selalu menjaga kesehatan jantung, jangan lupa untuk selalu rutin berolahraga!',
              );
            }
            isRendah = false;
            isTinggi = false;
            soundAlarm.stopAudio();
          });
        }
      }
      //? umur 2-10 tahun, HR 70-120
      else if (umur >= 2 && umur <= 10) {
        //? heart rate rendah
        if ((widget.listStream < 70) && (widget.listStream > 0)) {
          if (!isRendah) {
            setState(() {
              isRendah = true;
              soundAlarm.stopAudio();
              soundAlarm.playAudio();
            });

            service.showNotification(
              id: 0,
              title: 'Heart Rate kamu rendah nih !!',
              body: 'Ayo bergerak untuk meningkatkan Heart Rate kamu !!!',
            );
          }
          //? heart rate tinggi
        } else if (widget.listStream > 120) {
          if (!isTinggi) {
            setState(() {
              isTinggi = true;
              soundAlarm.stopAudio();
              soundAlarm.playAudio();
            });
            service.showNotification(
              id: 0,
              title: 'Heart Rate kamu tinggi nih !!',
              body:
                  'Ayo istirahat sebentar untuk menurunkan Heart Rate kamu !!!',
            );
          }
          //? heart rate normal
        } else {
          if (isRendah || isTinggi) {
            service.showNotification(
              id: 0,
              title: 'Yeayy! Heart Rate kamu sudah balik ke normal nih !!',
              body:
                  'Untuk selalu menjaga kesehatan jantung, jangan lupa untuk selalu rutin berolahraga!',
            );
          }
          setState(() {
            isRendah = false;
            isTinggi = false;
            soundAlarm.stopAudio();
          });
        }
      }
      //? umur 11 tahun keatas, HR 60-100
      else {
        //? heart rate rendah
        if ((widget.listStream < 60) && (widget.listStream > 0)) {
          if (!isRendah) {
            setState(() {
              isRendah = true;
              soundAlarm.stopAudio();
              soundAlarm.playAudio();
            });

            service.showNotification(
              id: 0,
              title: 'Heart Rate kamu rendah nih !!',
              body: 'Ayo bergerak untuk meningkatkan Heart Rate kamu !!!',
            );
          }
          //? heart rate tinggi
        } else if (widget.listStream > 100) {
          if (!isTinggi) {
            setState(() {
              isTinggi = true;
              soundAlarm.stopAudio();
              soundAlarm.playAudio();
            });
            service.showNotification(
              id: 0,
              title: 'Heart Rate kamu tinggi nih !!',
              body:
                  'Ayo istirahat sebentar untuk menurunkan Heart Rate kamu !!!',
            );
          }
          //? heart rate normal
        } else {
          if (isRendah || isTinggi) {
            service.showNotification(
              id: 0,
              title: 'Yeayy! Heart Rate kamu sudah balik ke normal nih !!',
              body:
                  'Untuk selalu menjaga kesehatan jantung, jangan lupa untuk selalu rutin berolahraga!',
            );
          }
          setState(() {
            isRendah = false;
            isTinggi = false;
            soundAlarm.stopAudio();
          });
        }
      }
    }

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          umur = ((DateTime.now()
                      .difference(DateTime.parse(state.user.date))
                      .inDays) /
                  360)
              .floor();

          return isRendah || isTinggi
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: cPurpleColor,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          isRendah
                              ? 'assets/images/sports-running-icon-2.png'
                              : 'assets/images/dudukistirahat.png',
                          width: 100,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          isRendah
                              ? 'Heart Rate kamu ${widget.listStream} terlalu rendah, ayo bergerak !!!'
                              : 'Heart Rate kamu ${widget.listStream} terlalu tinggi, ayo istirahat sebentar !!!',
                          textAlign: TextAlign.center,
                          style: cTextButtonWhite,
                        ),
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /*ElevatedButton(
                  onPressed: () async {
                    soundAlarm.stopAudio();
                  },
                  child: const Text(
                    'Notification with Payload',
                  ),
                ),*/
                      /* ElevatedButton(
                  onPressed: () async {
                    //! Local Notification 12 : tinggal panggil deh di button
                    await service.showNotification(
                      id: 0,
                      title: 'Heart Rate kamu rendah nih !!',
                      body:
                          'Ayo bergerak untuk meningkatkan Heart Rate kamu !!!',
                    );
                  },
                  child: const Text(
                    'Show Local Notification',
                  ),
                ),*/
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 25,
                            color: Colors.white,
                          ),
                          Text(
                            'Halo : ${state.user.name} !',
                            style: cNavBarText.copyWith(
                              fontSize: 20,
                              color: cPurpleDarkColor,
                            ),
                          ),
                        ],
                      ),
                      //? konversi selisih tanggal lahir dan hari ini, lalu dapat hari dan dikonversi ke umur
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 20,
                            color: Colors.white,
                          ),
                          Text(
                            'Umur kamu saat ini : ${((DateTime.now().difference(DateTime.parse(state.user.date)).inDays) / 360).floor()} Tahun',
                            style: cNavBarText.copyWith(
                              fontSize: 13,
                              color: cPurpleDarkColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Connected to ${widget.nama}',
                        style: cNavBarText.copyWith(
                          fontSize: 10,
                          color: cPurpleDarkColor,
                        ),
                      ),
                      Text(
                        widget.id,
                        style: cNavBarText.copyWith(
                          fontSize: 10,
                          color: cPurpleDarkColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              color: cGreyColor,
                              height: 2,
                              margin: const EdgeInsets.only(
                                right: 10,
                              ),
                            ),
                          ),
                          Text(
                            'Status Kamu',
                            style: cNavBarText.copyWith(
                              fontSize: 20,
                              color: cPurpleDarkColor,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: cGreyColor,
                              height: 2,
                              margin: const EdgeInsets.only(
                                left: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //
                      //
                      Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.favorite,
                                size: 50,
                                color: cRedColor,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              /*StreamBuilder<List<int>>(
                                  stream:
                                      widget.listStream, //here we're using our char's value
                                  initialData: [],
                                  builder: (BuildContext context,
                                      AsyncSnapshot<List<int>> snapshot) {
                                    if (snapshot.connectionState == ConnectionState.active) {
                                      //In this method we'll interpret received data
                                      // interpretReceivedData(currentValue);

                                      return Text(
                                        snapshot.data.toString() + ' DPM',
                                        style: cHeader1Style.copyWith(
                                          color: cBlackColor,
                                        ),
                                      );
                                    } else {
                                      return SizedBox();
                                    }
                                  },
                                ),*/
                              Text(
                                widget.listStream == 0
                                    ? 'Lakukan Scanning!'
                                    : '${widget.listStream} DPM',
                                style: cHeader1Style.copyWith(
                                  color: cBlackColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),

                          //? TextField untuk input SPO
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  enabled: widget.listStream != 0,
                                  controller: spoController,
                                  keyboardType: TextInputType.number,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  textAlign: TextAlign.center,
                                  onChanged: (value) {
                                    setState(() {
                                      if (spoController.text != '') {
                                        if (int.parse(spoController.text) >
                                            100) {
                                          spoController.text = '100';
                                        }
                                      }
                                    });
                                  },
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
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 15),
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
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                '%',
                                style: cHeader1Style.copyWith(
                                  color: widget.listStream == 0
                                      ? Colors.grey.shade300
                                      : cBlackColor,
                                ),
                              ),
                            ],
                          ),
                          /*Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.favorite,
                                size: 50,
                                color: cRedColor,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                '${dummyValue + Random().nextInt(7)} %',
                                style: cHeader1Style.copyWith(
                                  color: cBlackColor,
                                ),
                              ),
                            ],
                          )*/
                        ],
                      ),
                      //
                      //
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        spoController.text == ''
                            ? 'Masukkan Nilai SPO'
                            //? kalau umur di atas 5 tahun, spo kisaran 95-100
                            : (((DateTime.now()
                                                .difference(DateTime.parse(
                                                    state.user.date))
                                                .inDays) /
                                            360)
                                        .floor() >=
                                    5)
                                ? int.parse(spoController.text) < 95
                                    ? 'SPO Rendah'
                                    : 'SPO Normal'
                                //? kalau umur di bawah 5 tahun, spo kisaran 93-100
                                : int.parse(spoController.text) < 93
                                    ? 'SPO Rendah'
                                    : 'SPO Normal',
                        style: cNavBarText.copyWith(
                          fontSize: 20,
                          color: spoController.text == ''
                              ? cPurpleColor
                              : (((DateTime.now()
                                                  .difference(DateTime.parse(
                                                      state.user.date))
                                                  .inDays) /
                                              360)
                                          .floor() >=
                                      5)
                                  ? int.parse(spoController.text) < 95
                                      ? cRedColor
                                      : cPurpleColor
                                  : int.parse(spoController.text) < 93
                                      ? cRedColor
                                      : cPurpleColor,
                        ),
                      ),
                      //? untuk menampilkan status heartrate rendah/normal/tinggi, tapi karena sudah ada alarm, jadi ini gakepake
                      /*Text(
                        widget.listStream < 60
                            ? 'HeartRate Rendah'
                            : widget.listStream > 100
                                ? 'HeartRate Tinggi'
                                : 'Normal',
                        style: cNavBarText.copyWith(
                          fontSize: 20,
                          color: cPurpleDarkColor,
                        ),
                      ),*/

                      // Text(widget.debugAngka),
                      /*ElevatedButton(
            onPressed: () {
              _sub.pause();
            },
            child: const Text('pause'),
            ),*/
                    ],
                  ),
                );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
