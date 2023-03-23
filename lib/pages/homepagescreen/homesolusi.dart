import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:heart_oxygen_alarm/shared/theme.dart';

import '../../cubit/news/news_cubit.dart';
import '../../model/newsmodel.dart';
import '../../widget/newscardwidget.dart';

class HomeSolusi extends StatefulWidget {
  HomeSolusi({Key? key}) : super(key: key);

  @override
  State<HomeSolusi> createState() => _HomeSolusiState();
}

class _HomeSolusiState extends State<HomeSolusi> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NewsCubit>().fetchNewsModel();
  }

  // List<NewsModel> dataBerita = NewsData.listDataBerita;
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
          BlocBuilder<NewsCubit, NewsState>(
            builder: (context, dataBerita) {
              if (dataBerita is NewsSuccess) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: dataBerita.newsModel.length,
                    itemBuilder: (BuildContext context, int i) {
                      return NewsCardWidget(
                        title: dataBerita.newsModel[i].title,
                        deskripsi: dataBerita.newsModel[i].deskripsi,
                        image: dataBerita.newsModel[i].image,
                        url: dataBerita.newsModel[i].url,
                      );
                    },
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
