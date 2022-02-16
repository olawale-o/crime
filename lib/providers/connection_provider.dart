import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/person_model.dart';
import '../data/datasource/remote_datasource.dart';

final friendsSuggestionProvider = FutureProvider<List<PersonModel>>((ref) async {
  var dataSource = RemoteDataSource();
  var users = await dataSource.getSuggestedFriends('user/all');
  return users;
});