import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreenProvider with ChangeNotifier {
  late Timer _timer;
  Map<String, int> _dailyUsageMap = {}; // Store usage data by date

  ProfileScreenProvider() {
    _loadDailyUsage();
    _startTracking();
  }

  Map<String, int> get dailyUsageMap => _dailyUsageMap;

  /// Load stored usage data
  Future<void> _loadDailyUsage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _dailyUsageMap = Map<String, int>.from(prefs.getStringList('daily_usage')?.asMap().map(
          (key, value) => MapEntry(value.split('|')[0], int.parse(value.split('|')[1])),
    ) ?? {});

    _cleanupOldData(); // Remove data older than 3 months
    notifyListeners();
  }

  /// Start tracking time per day
  void _startTracking() {
    _timer = Timer.periodic(const Duration(seconds: 60), (timer) async {
      String today = DateTime.now().toIso8601String().split("T")[0];

      _dailyUsageMap[today] = (_dailyUsageMap[today] ?? 0) + 1; // Increment usage in minutes
      notifyListeners();

      _saveUsageData();
    });
  }

  /// Remove data older than 3 months
  void _cleanupOldData() async {
    DateTime threeMonthsAgo = DateTime.now().subtract(const Duration(days: 90));
    _dailyUsageMap.removeWhere((date, _) => DateTime.parse(date).isBefore(threeMonthsAgo));
    _saveUsageData();
  }

  /// Save updated usage data
  Future<void> _saveUsageData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> usageList = _dailyUsageMap.entries.map((e) => "${e.key}|${e.value}").toList();
    await prefs.setStringList('daily_usage', usageList);
  }

  /// Get heatmap color level based on minutes
  int getUsageLevel(int minutes) {
    if (minutes < 60) return 1;
    if (minutes < 120) return 2;
    if (minutes < 180) return 3;
    return 4;
  }

  /// Stop tracking when disposing
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
