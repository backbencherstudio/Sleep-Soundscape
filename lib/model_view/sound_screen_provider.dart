import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sleep_soundscape/api_services/api_end_point.dart';
import '../model/sound_model.dart';

class SoundScreenProvider with ChangeNotifier {
  SoundScreenProvider() {
    fetchSound(categories.first); // Fetch first category initially
  }

  List<SoundModel> _soundList = [];
  List<SoundModel> get soundList => _soundList;

  List<String> categories = ["Oceans", "Nature", "Rain", "Map", "Fire"];
  int playedMusic = -1;
  bool isPlaying = false;
  bool isLoading = false;

  final AudioPlayer _audioPlayer = AudioPlayer();

  // Fetch Sounds for the Selected Category
  Future<void> fetchSound(String category) async {
    try {
      isLoading = true;
      notifyListeners();

      final url = '${AppUrls.sound}?category=$category';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        _soundList = SoundModel.listFromJson(jsonData);
      } else {
        print('Failed to load sounds. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching sounds: $error');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Play Music
  Future<void> playMusic(int index) async {
    if (_soundList.isEmpty) return;

    if (playedMusic == index && isPlaying) {
      await pauseMusic();
      return;
    }

    playedMusic = index;
    final String audioUrl = _soundList[index].audioPath ?? "";

    if (audioUrl.isNotEmpty) {
      await _audioPlayer.play(UrlSource(audioUrl));
      isPlaying = true;
    }

    notifyListeners();
  }

  // Pause Music
  Future<void> pauseMusic() async {
    await _audioPlayer.pause();
    isPlaying = false;
    notifyListeners();
  }

  // Stop Music
  Future<void> stopMusic() async {
    await _audioPlayer.stop();
    isPlaying = false;
    playedMusic = -1;
    notifyListeners();
  }
}
