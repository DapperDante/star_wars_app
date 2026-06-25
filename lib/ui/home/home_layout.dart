import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_wars/services/theme.service.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key, required this.navigationShell, required this.themeService});
  final StatefulNavigationShell navigationShell;
  final ThemeService themeService;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(themeService.getMessage(context)),
      ),
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.dataset), label: 'Databank'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          // Add more items for other branches if needed
        ],
      ),
    );
  }
}
