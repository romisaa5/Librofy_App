import 'package:bookly_app/Features/onboarding/presentation/widgets/custom_onboard_body.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FirstOnboardingView extends StatelessWidget {
  const FirstOnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomOnboardBody(
        currentIndex: 0,
        onTap: () {
          GoRouter.of(context).go(AppRouter.onboardingView2);
        },
        image: 'assets/images/onboard1.png',
        title: 'Now reading books \n will be easier',
        desc:
            ' Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.',
        buttonName: 'Continue',
      ),
    );
  }
}
