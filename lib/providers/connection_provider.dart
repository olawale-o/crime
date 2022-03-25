import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_provider.dart';
import '../providers/auth_provider.dart';
import '../models/person_model.dart';
import '../data/datasource/remote_datasource.dart';

final friendsSuggestionProvider = FutureProvider<List<PersonModel>>((ref) async {
  var dataSource = RemoteDataSource();
  final currentUserToken = await ref.read(firebaseAuthServiceProvider).currentUserToken;
  final userId = ref.read(userProvider).uid;
  var users = await dataSource.getSuggestedFriends('user/$userId/suggestion', currentUserToken);
  return users;
});