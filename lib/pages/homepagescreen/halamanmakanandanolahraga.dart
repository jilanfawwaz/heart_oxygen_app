import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_oxygen_alarm/cubit/newsmakananolahraga/newsmakananolahraga_cubit.dart';
import 'package:heart_oxygen_alarm/model/newsmakananolahraga.dart';

import '../../model/newsmodel.dart';
import '../../shared/theme.dart';
import '../../widget/newscardwidget.dart';

class HalamanMakananDanOlahraga extends StatelessWidget {
  HalamanMakananDanOlahraga({super.key});

  static const nameRoute = '/halamanmakanandanminuman';

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
          BlocBuilder<NewsMakananOlahragaCubit, NewsMakananOlahragaState>(
            builder: (context, dataBerita) {
              if (dataBerita is NewsMakananOlahragaSuccess) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: dataBerita.newsMakananOlahragaModel.length,
                    itemBuilder: (BuildContext context, int i) {
                      return NewsCardWidget(
                        title: dataBerita.newsMakananOlahragaModel[i].title,
                        deskripsi:
                            dataBerita.newsMakananOlahragaModel[i].deskripsi,
                        image: dataBerita.newsMakananOlahragaModel[i].image,
                        url: dataBerita.newsMakananOlahragaModel[i].url,
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
