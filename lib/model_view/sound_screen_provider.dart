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

      debugPrint(" category is selected =====${category}");
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

  int _playedMusic = -1;
  // int get playedMusic => _playedMusic;
  // final AudioPlayer _audioPlayer = AudioPlayer();
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

        //String demoAudioPath = "http://192.168.40.25:3000/uploads/sounds/1740473347754-fire-02.mp3";
        String baseUrl = "http://192.168.40.25:3000";
        String fullPath = "$baseUrl${_soundList[index].audioPath}";
 debugPrint("full path :${fullPath}");
        await _audioPlayer.setSource(UrlSource(fullPath,));
        await _audioPlayer.play(UrlSource(fullPath),volume: 1000);
      }
    } catch (e) {
      print("Error playing audio: $e");
    }

    notifyListeners();
  }


}
