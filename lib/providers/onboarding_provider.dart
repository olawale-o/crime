import 'package:crime/models/onboarding_model.dart';
import 'package:crime/notifiers/onboarding_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardingProvider = StateNotifierProvider<OnboardingNotifier, List<OnboardingModel>>((_) => OnboardingNotifier());