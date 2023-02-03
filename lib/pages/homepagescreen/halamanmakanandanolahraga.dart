import 'package:flutter/material.dart';
import 'package:heart_oxygen_alarm/model/newsmakananolahraga.dart';

import '../../model/newsmodel.dart';
import '../../shared/theme.dart';
import '../../widget/newscardwidget.dart';

class HalamanMakananDanOlahraga extends StatelessWidget {
  HalamanMakananDanOlahraga({super.key});

  static const nameRoute = '/halamanmakanandanminuman';

  final List<NewsMakananOlahragaModel> dataBerita =
      NewsMakananOlahragaData.listDataBerita;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Text(
            'Tips Makanan dan Olahraga',
            style: cLatosBlackSemibold18,
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dataBerita.length,
              itemBuilder: (BuildContext context, int i) {
                return NewsCardWidget(
                  title: dataBerita[i].title,
                  deskripsi: dataBerita[i].deskripsi,
                  image: dataBerita[i].image,
                  url: dataBerita[i].url,
                );
              },
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
