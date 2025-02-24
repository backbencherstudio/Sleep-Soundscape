import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../model/music_model.dart';

class SoundScreenProvider with ChangeNotifier{
  SoundScreenProvider(){
    getMusics();
  }
  final Map<String,dynamic> _musicsList = {
    "musicList":[
      {
        "title":"Ocean Waves",
        "subtitle":"Singer Nahidul Islam",
        "imagePath":"assets/images/musics/ocean_waves.png",
        "audioPath":"musics/ocean-waves.mp3"
      },
      {
        "title":"Rain Sounds",
        "subtitle":"Singer Shakin",
        "imagePath":"assets/images/musics/rain.png",
        "audioPath":"musics/rain-sound.mp3"
      }
    ]
  };

  MusicModel? _musicModel;
  MusicModel? get musicModel => _musicModel;

  void getMusics(){
    _musicModel = MusicModel.fromJson(_musicsList);
    notifyListeners();
  }

  int _playedMusic = -1;
  int get playedMusic => _playedMusic;
  final AudioPlayer _audioPlayer = AudioPlayer();
  Future<void> playMusic(int index) async {
    try {
      if (_playedMusic == index) {
        // If already playing, stop it
        await _audioPlayer.stop();
        _playedMusic = -1;
      } else {
        // Stop any currently playing music before starting a new one
        await _audioPlayer.stop();

        _playedMusic = index;

        await _audioPlayer.setSource(AssetSource(_musicModel!.musicList![index].audioPath!));
        await _audioPlayer.play(AssetSource(_musicModel!.musicList![index].audioPath!),volume: 1000);
      }
    } catch (e) {
      print("Error playing audio: $e");
    }

    notifyListeners();
  }

  //
  // final AudioPlayer _audioPlayer = AudioPlayer();
  // bool isPlaying = false;
  //
  // Future<void> _playAudio() async {
  //   await _audioPlayer.play(AssetSource('audio/song1.mp3'));
  //   setState(() {
  //     isPlaying = true;
  //   });
  // }
  //
  // Future<void> _pauseAudio() async {
  //   await _audioPlayer.pause();
  //   setState(() {
  //     isPlaying = false;
  //   });
  // }
  //
  // Future<void> _stopAudio() async {
  //   await _audioPlayer.stop();
  //   setState(() {
  //     isPlaying = false;
  //   });
  // }

}