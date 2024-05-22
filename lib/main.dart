import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconly/iconly.dart';
import 'package:motion/config/theme.dart';
import 'package:motion/screens/home.dart';
import 'package:motion/screens/map_screen.dart';
import 'package:motion/widgets/app_scaffold.dart';
import 'package:motion/widgets/custom_bottom_bar.dart';

void main() {
  Animate.restartOnHotReload = false;
  Animate.defaultCurve = Curves.easeOutCubic;
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  CustomBottomBarItem selected = const CustomBottomBarItem(IconlyBold.home);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: AppScaffold(
        destinations: const [
          CustomBottomBarItem(IconlyBold.search),
          CustomBottomBarItem(IconlyBold.chat),
          CustomBottomBarItem(IconlyBold.home),
          CustomBottomBarItem(IconlyBold.heart),
          CustomBottomBarItem(IconlyBold.profile),
        ],
        selected: selected,
        onChanged: (s) => setState(() => selected = s),
        child: PageTransitionSwitcher(
          reverse: [IconlyBold.search].contains(selected.icon),
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            );
          },
          child: selected.icon == IconlyBold.search
              ? const MapScreen()
              : const Home(),
        ),
      ),
    );
  }
}
