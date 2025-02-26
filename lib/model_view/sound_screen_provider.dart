import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sleep_soundscape/api_services/api_end_point.dart';
import '../model/sound_model.dart';

class SoundScreenProvider with ChangeNotifier {
  SoundScreenProvider() {
    fetchSound(categories.first); // Fetch initial category
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

      final url = AppUrls.sound(category);
      print('Fetching URL: $url');

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

  // Play/Pause Music (Toggles Playback)
  Future<void> playMusic(int index) async {
    if (_soundList.isEmpty) return;

    final String audioUrl = _soundList[index].audioPath ?? "";

    if (audioUrl.isEmpty) {
      print("🔴 Error: Audio URL is empty!");
      return;
    }

    if (playedMusic == index && isPlaying) {
      await pauseMusic();
      return;
    }

    if (isPlaying) {
      await stopMusic();
    }

    playedMusic = index;
    try {
      await _audioPlayer.play(UrlSource(audioUrl));
      isPlaying = true;
      print("▶️ Playing Music: $audioUrl");
    } catch (e) {
      print("🔴 Error Playing Music: $e");
    }

    notifyListeners();
  }

  // Pause Music
  Future<void> pauseMusic() async {
    try {
      await _audioPlayer.pause();
      isPlaying = false;
      print("⏸️ Paused Music");
    } catch (e) {
      print("🔴 Error Pausing Music: $e");
    }
    notifyListeners();
  }

  // Stop Music (Stops & Resets State)
  Future<void> stopMusic() async {
    try {
      await _audioPlayer.stop();
      isPlaying = false;
      playedMusic = -1;
      print("⏹️ Stopped Music");
    } catch (e) {
      print("🔴 Error Stopping Music: $e");
    }
    notifyListeners();
  }
}
