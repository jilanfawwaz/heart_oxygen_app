// ignore_for_file: public_member_api_docs, sort_constructors_first
class NewsMakananOlahragaModel {
  final String title;
  final String deskripsi;
  final String url;
  final String image;

  NewsMakananOlahragaModel({
    required this.title,
    required this.deskripsi,
    required this.url,
    required this.image,
  });
}

class NewsMakananOlahragaData {
  static List<NewsMakananOlahragaModel> listDataBerita = [
    NewsMakananOlahragaModel(
      title:
          '18 Menu Makanan Sehat Bergizi agar Bugar dan Kebal Penyakit',
      deskripsi:
          'Menjaga gaya hidup sehat bisa dilakukan tidak hanya dengan olahraga saja, tetapi juga dengan memperhatikan pola makan dan apa saja yang dikonsumsi sehari-hari. Kamu perlu mengkonsumsi buah-buahan, sayuran hijau, dan mengurangi makanan dengan pengawet atau bahan buatan yang tidak alami agar badan terasa sehat dan tidak sering jatuh sakit ....',
      url:
          'https://www.tokopedia.com/blog/menu-makanan-sehat-bergizi-hlt/?utm_source=google&utm_medium=organic',
      image:
          'https://images.tokopedia.net/img/KRMmCm/2022/7/13/be1f5715-32af-4c66-bec7-8c8c3b57d6a2.jpg',
    ),

    NewsMakananOlahragaModel(
      title:
          '20 Pilihan Makanan Sehat Bergizi yang Baik Dikonsumsi Setiap Hari',
      deskripsi:
          'Manusia tentu membutuhkan asupan makanan setiap hari. Jika manusia tidak makan, maka tubuh akan lemas dan akhirnya menimbulkan sejumlah efek samping seperti pusing, lemas, hingga sulit konsentrasi. Makanan yang dikonsumsi setiap ....',
      url:
          'https://www.detik.com/bali/berita/d-6489715/20-pilihan-makanan-sehat-bergizi-yang-baik-dikonsumsi-setiap-hari',
      image:
          'https://akcdn.detik.net.id/community/media/visual/2022/07/29/ilustrasi-makanan-sehat_169.jpeg?w=700&q=90',
    ),

    NewsMakananOlahragaModel(
      title:
          'Memulai Olahraga, Apa yang Harus Dilakukan Lebih Dulu?',
      deskripsi:
          'Anda yang selama ini jarang atau tidak pernah olahraga dalam waktu lama mungkin bingung harus memulai dari mana. Apa pun yang jadi alasan Anda untuk mulai hidup lebih aktif, sebaiknya jangan langsung melakukan latihan berat yang berintensitas tinggi jika lama tidak berolahraga.....',
      url:
          'https://hellosehat.com/kebugaran/tips-olahraga/cara-untuk-memulai-olahraga/',
      image:
          'https://cdn.hellosehat.com/wp-content/uploads/2017/09/9005ac92-memulai-olahraga.jpg',
    ),

    NewsMakananOlahragaModel(
      title:
          'Tips Olahraga di Rumah agar Efektif, Jaga Kebugaran Fisik',
      deskripsi:
          'Merdeka.com - Untuk menjaga kebugaran tubuh, seseorang perlu memasukkan olahraga dalam jadwal hariannya. Tapi, bagaimana dengan orang yang sibuk dan tidak memiliki waktu untuk pergi ke gym? Berolahraga di rumah adalah jawabannya. Berolahraga di rumah adalah pilihan .....',
      url:
          'https://www.merdeka.com/jabar/tips-olahraga-di-rumah-agar-efektif-jaga-kebugaran-fisik-kln.html',
      image:
          'https://cdns.klimg.com/merdeka.com/i/w/news/2022/11/11/1491197/670x335/tips-olahraga-di-rumah-agar-efektif-jaga-kebugaran-fisik.jpg',
    ),
    
  ];
}
