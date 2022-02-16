import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabNotifier extends StateNotifier<int> {
  TabNotifier() : super(0);
  void onChange() {
    state = state + 1;
  }
}

final tabProvider = StateNotifierProvider((ref){
  return TabNotifier();
});