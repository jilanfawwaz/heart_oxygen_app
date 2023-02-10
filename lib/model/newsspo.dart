// ignore_for_file: public_member_api_docs, sort_constructors_first
class NewsSPO {
  final String title;
  final String deskripsi;
  final String url;
  final String image;

  NewsSPO({
    required this.title,
    required this.deskripsi,
    required this.url,
    required this.image,
  });
}

class NewsSPOData {
  static List<NewsSPO> listDataBerita = [
    NewsSPO(
      title: 'Cara Meningkatkan Kadar Saturasi Oksigen',
      deskripsi:
          'Ketika saturasi oksigen rendah, kamu berisiko mengalami hipoksia. Saat mengalami hipoksia, darah tidak mampu membawa cukup oksigen ke setiap jaringan untuk memenuhi kebutuhan tubuh. Jika tidak cepat ditangani, hipoksia dapat menyebabkan kerusakan sel, jaringan, maupun organ. Untuk mencegah hipoksia, kamu perlu tahu cara menaikkan saturasi oksigen. Di bawah ini cara meningkatkan saturasi oksigen yang bisa kamu coba.',
      url:
          'https://www.klikdokter.com/info-sehat/covid-19/cara-meningkatkan-kadar-saturasi-oksigen',
      image:
          'https://img-cdn.medkomtek.com/ywxafJMdHYSwvEWJDIyl0J_yMto=/730x411/smart/filters:quality(75):strip_icc():format(webp)/article/nUiGFcvCZqaZkCqVHRYbB/original/064108100_1630479314-Cara-Meningkatkan-Kadar-Saturasi-Oksigen.jpg',
    ),
    NewsSPO(
      title:
          '25 Jenis Makanan Kaya Oksigen yang Baik Dikonsumsi, Ini Daftarnya',
      deskripsi:
          'Merdeka.com - Berikut ini adalah daftar jenis makanan kaya oksigen yang menarik untuk Anda ketahui. Oksigen merupakan hal paling vital yang dibutuhkan oleh manusia dan setiap makhluk hidup. Manusia dapat bertahan hidup tanpa makanan dan air selama beberapa hari tetapi kelangsungan hidup manusia tidak mungkin bertahan tanpa oksigen bahkan untuk beberapa menit. Konsentrasi oksigen dalam tubuh kita disebut tekanan parsial. Konsentrasi oksigen dalam tubuh manusia tak hanya bergantung pada faktor lingkungan. Bahkan jika atmosfer memiliki pasokan oksigen yang cukup, tubuh tidak dapat menyerap jumlah yang diperlukan dalam beberapa kasus.',
      url:
          'https://www.merdeka.com/jatim/25-jenis-makanan-kaya-oksigen-yang-baik-dikonsumsi-ini-daftarnya-kln.html',
      image:
          'https://cdns.klimg.com/merdeka.com/i/w/news/2022/07/01/1449237/670x335/25-jenis-makanan-kaya-oksigen-yang-baik-dikonsumsi-ini-daftarnya.jpg',
    ),
    NewsSPO(
      title: 'Prosedur Posisi Fowler dan Semi Fowler',
      deskripsi:
          'Hallo Sahabat WK... Dalam video kali ini, kita akan belajar tentang prosedur pemberian posisi fowler dan semi fowler.Yuk kita simak videonya... Tulis pertanyaan atau diskusi kamu di kolom komentar ya... Jangan lupa like dan subscribe :)',
      url:
          'https://www.youtube.com/watch?v=eWNdKhYqjxc&ab_channel=JurusanKeperawatanPolkesjasa',
      image: 'https://i.ibb.co/QKh5jLF/Screen-Shot-2023-02-10-at-22-57-00.jpg',
    ),
  ];
}
