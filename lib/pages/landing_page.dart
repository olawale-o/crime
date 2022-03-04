import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/loading_provider.dart';
import '../pages/profile_page.dart';
import '../pages/authentication_page.dart';
import '../providers/user_provider.dart';
import '../models/user_model.dart';

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
    ref.read(userProvider.notifier).getMyProfile(widget.userModel.email!);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(loadingProvider);
    final user = ref.watch(userProvider);
    return Scaffold(
        body: isLoading.loading ? const Center(child: CircularProgressIndicator(),)
        :  user.name == null ? const AuthenticationPage() : ProfilePage(
          userModel: UserModel(
            uid: user.uid,
            name: user.name,
            email: user.email,
            photoUrl: user.photoUrl,
        ),));
  }
}
