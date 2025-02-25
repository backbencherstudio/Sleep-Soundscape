
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreenProvider extends ChangeNotifier {
  bool _hasSeenOnboarding = false;
  bool _isLoading = true;
  bool get hasSeenOnboarding => _hasSeenOnboarding;
  bool get isLoading => _isLoading;

  OnboardingScreenProvider() {
    _loadOnboardingStatus();
  }
  Future<void> _loadOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
    _isLoading = false;
    notifyListeners();
  }
  Future<void> completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);
    _hasSeenOnboarding = true;
    notifyListeners();
  }
}
