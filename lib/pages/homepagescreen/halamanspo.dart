import 'package:flutter/material.dart';
import 'package:heart_oxygen_alarm/model/newsmakananolahraga.dart';
import 'package:heart_oxygen_alarm/model/newsspo.dart';

import '../../model/newsmodel.dart';
import '../../shared/theme.dart';
import '../../widget/newscardwidget.dart';

class HalamanSPO extends StatelessWidget {
  HalamanSPO({super.key});

  static const nameRoute = '/halamanspo';

  final List<NewsSPO> dataBerita = NewsSPOData.listDataBerita;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Text(
            'Tips SPO',
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
