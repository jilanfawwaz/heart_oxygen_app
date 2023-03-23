import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_oxygen_alarm/cubit/newsspo/newsspo_cubit.dart';
import 'package:heart_oxygen_alarm/model/newsmakananolahraga.dart';
import 'package:heart_oxygen_alarm/model/newsspo.dart';

import '../../model/newsmodel.dart';
import '../../shared/theme.dart';
import '../../widget/newscardwidget.dart';

class HalamanSPO extends StatelessWidget {
  HalamanSPO({super.key});

  static const nameRoute = '/halamanspo';

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
          BlocBuilder<NewsSpoCubit, NewsSpoState>(
            builder: (context, dataBerita) {
              if (dataBerita is NewsSpoSuccess) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: dataBerita.newsSpoModel.length,
                    itemBuilder: (BuildContext context, int i) {
                      return NewsCardWidget(
                        title: dataBerita.newsSpoModel[i].title,
                        deskripsi: dataBerita.newsSpoModel[i].deskripsi,
                        image: dataBerita.newsSpoModel[i].image,
                        url: dataBerita.newsSpoModel[i].url,
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
