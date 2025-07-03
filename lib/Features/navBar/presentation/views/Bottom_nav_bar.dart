import 'package:bookly_app/Features/categories/presentation/views/catageroies_view.dart';
import 'package:bookly_app/Features/favorites/presentation/views/favorites_view.dart';
import 'package:bookly_app/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app/Features/navBar/presentation/manager/cubit/nav_bar_cubit.dart';
import 'package:bookly_app/Features/profile/presentation/views/profile_view.dart';
import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({super.key});
  final List<Widget> views = [
    HomeView(),
    CatageroiesView(),
    FavoritesView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          NavBarCubit cubit = context.read<NavBarCubit>();
          return Scaffold(
            body: views[cubit.selectIndex],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12,
                ),
                child: GNav(
                  onTabChange: (index) {
                    cubit.changeCurrentIndex(index);
                  },
                  tabBorderRadius: 15,
                  duration: Duration(milliseconds: 400),
                  gap: 8,
                  color: Colors.grey,
                  activeColor: Colors.white,
                  iconSize: 24,
                  tabBackgroundColor: AppColors.kprimaryColor.withValues(
                    alpha: .8,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  tabs: [
                    GButton(icon: Icons.home, text: 'Home'),
                    GButton(icon: Icons.category, text: 'Category'),
                    GButton(icon: Icons.favorite, text: 'Favorites'),
                    GButton(icon: Icons.person, text: 'Profile'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
