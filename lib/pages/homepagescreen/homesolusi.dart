import 'package:flutter/material.dart';

import '../../model/newsmodel.dart';
import '../../widget/newscardwidget.dart';

class HomeSolusi extends StatelessWidget {
   HomeSolusi({Key? key}) : super(key: key);

  List<NewsModel> dataBerita = NewsData.listDataBerita;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
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
    );
  }
}
