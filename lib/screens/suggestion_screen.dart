import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/suggestion/suggestion_user_card.dart';
import '../providers/connection_provider.dart';

class SuggestionScreen extends StatelessWidget {
  const SuggestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, _) {
          final users = ref.watch(friendsSuggestionProvider);
        return users.when(
          data: (data) => ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return SuggestionUserCard(person: data[index]);
            },
          ),
          error: (_, stack) => const Center(child: Text('error'),),
              loading: () => const Center(child: CircularProgressIndicator(),),
          );
        }
      ),
    );
  }
}
