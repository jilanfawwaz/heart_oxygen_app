import 'package:audioplayers/audioplayers.dart';

class AudioController {
  final String namaSound;
  AudioController({
    required this.namaSound,
  });
  AudioPlayer sound = AudioPlayer();

  setAudio() {
    sound.setSourceAsset('audio/$namaSound.mp3');
    sound.setReleaseMode(ReleaseMode.loop);
  }

  playAudio() {
    sound.play(AssetSource('audio/$namaSound.mp3'));
  }

  stopAudio() {
    sound.stop();
  }

  dispose() {
    sound.dispose();
  }
}
