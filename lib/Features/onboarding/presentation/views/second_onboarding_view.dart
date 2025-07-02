import 'package:bookly_app/Features/onboarding/presentation/widgets/custom_onboard_body.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecondOnboardingView extends StatelessWidget {
  const SecondOnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomOnboardBody(
        currentIndex: 1,
        onTap: () {
          GoRouter.of(context).go(AppRouter.onboardingView3);
        },
        image: 'assets/images/onboard2.png',
        title: 'Your Bookish Soulmate Awaits',
        desc:
            ' Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience.',
        buttonName: 'Continue',
      ),
    );
  }
}
