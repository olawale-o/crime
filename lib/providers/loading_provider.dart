import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingState {
  final bool loading;

  LoadingState(this.loading);
}

class LoadingController extends StateNotifier<LoadingState> {
  LoadingController() : super(LoadingState(false));

  void onLoading() {
    state = LoadingState(!state.loading);
  }
}

final loadingProvider = StateNotifierProvider<LoadingController, LoadingState>((_) => LoadingController());