import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/progress_model.dart';

final pageControllerProvider = Provider<PageController>((ref) => PageController());

class ProgressNotifier extends StateNotifier<ProgressModel> {
  ProgressNotifier(this.ref) : super(const ProgressModel(isLastStep: false, selectedIndex: 0));

  final Ref ref;
  void onPageUpdate(int index) {
    if (state.selectedIndex == index) {
      state = state.copyWith(isLastStep: !state.isLastStep);
    } else {
      state = state.copyWith(selectedIndex: index);
    }
  }

  void moveForward() {
    final pageController = ref.read(pageControllerProvider);
    if (!state.isLastStep) {
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }
}