import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconly/iconly.dart';
import 'package:motion/config/assets.dart';
import 'package:motion/config/theme.dart';
import 'package:motion/widgets/app_scaffold.dart';
import 'package:motion/widgets/home_marker.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            MapAsset.png,
            alignment: Alignment.centerRight,
            fit: BoxFit.fitHeight,
          ),
        ),
        Positioned.fill(
          child: Column(
            children: [
              const SizedBox(height: kToolbarHeight),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: FilledButton.tonal(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(64),
                          ),
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                        child: const Row(
                          children: [
                            Icon(IconlyLight.search, size: 18),
                            SizedBox(width: 8),
                            Text('Saint Petersburg'),
                          ],
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 1.seconds, begin: .5)
                          .scale(),
                    ),
                    const SizedBox(width: 8),
                    FloatingActionButton(
                      onPressed: () {},
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      heroTag: 'Settings_FAB_Hero_Tag',
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(64),
                      ),
                      backgroundColor: Colors.white,
                      child: const Icon(IconlyLight.filter),
                    ).animate().fadeIn(duration: 1.seconds, begin: .5).scale(),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FloatingActionButton(
                          onPressed: () {},
                          heroTag: 'Stack_FAB_Hero_Tag',
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(64),
                          ),
                          backgroundColor: Colors.white.withOpacity(0.4),
                          child: Icon(
                            IconlyLight.scan,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        )
                            .animate()
                            .fadeIn(duration: 1.seconds, begin: .5)
                            .scale(),
                        const SizedBox(height: 8),
                        FloatingActionButton(
                          onPressed: () {},
                          heroTag: 'Send_FAB_Hero_Tag',
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(64),
                          ),
                          backgroundColor: Colors.white.withOpacity(0.4),
                          child: Icon(
                            IconlyLight.send,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        )
                            .animate()
                            .fadeIn(duration: 1.seconds, begin: .5)
                            .scale(),
                      ],
                    ),
                    const Spacer(),
                    FilledButton.tonal(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(64),
                        ),
                        backgroundColor: Colors.white.withOpacity(0.4),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            IconlyLight.work,
                            size: 18,
                            color: Colors.white.withOpacity(0.8),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'List of variants',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(duration: 1.seconds, begin: .5).scale(),
                  ],
                ),
              ),
              const SizedBox(height: 120),
            ],
          ),
        ),
        const Align(
          alignment: Alignment(.5, .3),
          child: HomeMarker(
            label: 'Blk, 1',
          ),
        ),
        const Align(
          alignment: Alignment(-.3, 0),
          child: HomeMarker(
            label: 'Cello',
          ),
        ),
        const Align(
          alignment: Alignment(-.3, -.4),
          child: HomeMarker(
            label: 'Lvl, 4',
          ),
        ),
        const Align(
          alignment: Alignment(.7, 0),
          child: HomeMarker(
            label: 'Monie',
          ),
        ),
        const Align(
          alignment: Alignment(-.8, -.2),
          child: HomeMarker(
            label: 'Point',
          ),
        ),
      ],
    );
  }
}
