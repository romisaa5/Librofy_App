import 'package:bookly_app/Features/auth/login/presentation/views/login_view.dart';
import 'package:bookly_app/Features/onboarding/presentation/views/first_onboarding_view.dart';
import 'package:bookly_app/Features/onboarding/presentation/views/second_onboarding_view.dart';
import 'package:bookly_app/Features/onboarding/presentation/views/third_onboarding_view.dart';
import 'package:bookly_app/Features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String splashView = '/splash';
  static const String onboardingView1 = '/onboarding1';
  static const String onboardingView2 = '/onboarding2';
  static const String onboardingView3 = '/onboarding3';
  static const String loginView = '/login';
  static const String registerView = '/register';
  static const String homeView = '/home';
  static const String bookDetailsView = '/bookDetails';
  static const String searchView = '/search';
  static final router = GoRouter(
    initialLocation: splashView,

    routes: [
      GoRoute(path: splashView, builder: (context, state) => SplashView()),
      GoRoute(
        path: onboardingView1,
        builder: (context, state) => FirstOnboardingView(),
      ),
      GoRoute(
        path: onboardingView2,
        builder: (context, state) => SecondOnboardingView(),
      ),
      GoRoute(
        path: onboardingView3,
        builder: (context, state) => ThirdOnboardingView(),
      ),
      GoRoute(path: loginView, builder: (context, state) => LoginView()),
    ],
  );
}
