import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/person_model.dart';
import '../data/datasource/remote_datasource.dart';

final friendsSuggestionProvider = FutureProvider<List<PersonModel>>((ref) async {
  var users = await RemoteDataSource.getSuggestedFriends('user/all');
  return users;
});