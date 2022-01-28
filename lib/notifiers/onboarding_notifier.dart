
import 'package:crime/models/onboarding_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingNotifier extends StateNotifier<List<OnboardingModel>> {
  OnboardingNotifier() : super(onboarding);

}