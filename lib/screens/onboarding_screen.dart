import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/onboarding_model.dart';
import '../models/progress_model.dart';
import '../widgets/dot_widget.dart';
import '../widgets/onboard_page_widget.dart';
import '../notifiers/progress_notifier.dart';
import '../providers/onboarding_provider.dart';
import '../providers/progressProvider.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final List<OnboardingModel> items = ref.read(onboardingProvider);
      ProgressModel progress = ref.watch(progressProvider);
      PageController controller = ref.watch(pageControllerProvider);
      return Stack(
        children: [
          PageView.builder(
            controller: controller,
            scrollDirection: Axis.vertical,
            onPageChanged: ref.read(progressProvider.notifier).onPageUpdate,
            itemCount: items.length,
            itemBuilder: (context, index) => OnBoardPageWidget(model: items[index]),
          ),
          Positioned(
            right: 20,
            top: (MediaQuery.of(context).size.height / 2) - 40,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    items.length,
                    (index) => DotWidget(progress: progress, index: index))),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () => ref.read(progressProvider.notifier).moveForward(),
              child: const Text('Next'),
              elevation: 0.0,
            ),
          )
        ],
      );
    });
  }
}
