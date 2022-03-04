import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../services/profile_service.dart';

final profileServiceProvider = Provider<ProfileService>((ref){
  return ProfileService(ref.read(httpServiceProvider));
 });