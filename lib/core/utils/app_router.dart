import 'package:bookly_app/Features/auth/login/presentation/views/login_view.dart';
import 'package:bookly_app/Features/home/data/models/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/details_view.dart';
import 'package:bookly_app/Features/navBar/presentation/views/bottom_nav_bar.dart';
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
  static const String navBar = '/navBar';
  static const String bookDetailsView = '/bookDetails';
  static const String searchView = '/search';
  static final router = GoRouter(
    initialLocation: navBar,

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
      GoRoute(path: navBar, builder: (context, state) => CustomBottomNavBar()),
      GoRoute(
        path: bookDetailsView,
        builder: (context, state) {
          final book = state.extra as BookModel;
          return DetailsView(book: book);
        },
      ),
    ],
  );
}
