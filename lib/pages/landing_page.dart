import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../pages/profile_page.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';

class LandingPage extends ConsumerStatefulWidget {
  final UserModel userModel;

  const LandingPage({Key? key, required this.userModel}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}
class _LandingPageState extends ConsumerState<LandingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final person = ref.watch(futureUserProvider(widget.userModel.email));
    return person.when(
        data: (user) {
          return ProfilePage(
            userModel: UserModel(
              uid: user.uid,
              name: user.name,
              email: user.email,
              photoUrl: user.photoUrl,
            ),);
        },
        error: (e, trace) => const Center(child: Text('error'),),
        loading: () => const Center(child: CircularProgressIndicator(),)
    );
  }
}
