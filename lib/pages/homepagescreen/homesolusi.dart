import 'package:flutter/material.dart';
import 'package:heart_oxygen_alarm/shared/theme.dart';

import '../../model/newsmodel.dart';
import '../../widget/newscardwidget.dart';

class HomeSolusi extends StatelessWidget {
  HomeSolusi({Key? key}) : super(key: key);

  List<NewsModel> dataBerita = NewsData.listDataBerita;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Text(
            'Solusi untuk jantung dan SPO',
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
