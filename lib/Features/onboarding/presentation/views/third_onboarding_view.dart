import 'package:bookly_app/Features/onboarding/presentation/widgets/custom_onboard_body.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ThirdOnboardingView extends StatelessWidget {
  const ThirdOnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomOnboardBody(
        currentIndex: 2,
        onTap: () {
          GoRouter.of(context).go(AppRouter.loginView);
        },
        image: 'assets/images/onboard3.png',
        title: 'Start Your Adventure',
        desc:
            ' Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let\'s go!',
        buttonName: 'Get Started',
      ),
    );
  }
}
