import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../notifiers/progress_notifier.dart';
import '../models/progress_model.dart';

final progressProvider = StateNotifierProvider<ProgressNotifier, ProgressModel>((ref) => ProgressNotifier(ref));