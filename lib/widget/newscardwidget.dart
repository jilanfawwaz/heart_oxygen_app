import 'package:flutter/material.dart';
import 'package:heart_oxygen_alarm/shared/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCardWidget extends StatelessWidget {
  final String title;
  final String deskripsi;
  final String image;
  final String url;
  const NewsCardWidget({
    required this.title,
    required this.deskripsi,
    required this.image,
    required this.url,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(
        20,
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.8),
          blurRadius: 10,
          spreadRadius: 3,
          offset: const Offset(0, 6),
        ),
      ]),
      child: GestureDetector(
        onTap: () async {
          print('masukkks');
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url));
          } else {
            // can't launch url, there is some error
            throw "Could not launch $url";
          }
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 100,
            height: 300,
            color: Colors.white,
            child: Stack(
              children: [
                Image.network(
                  image,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: cLatosBlackSemibold18,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          deskripsi,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
