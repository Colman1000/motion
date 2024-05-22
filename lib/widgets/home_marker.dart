import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconly/iconly.dart';
import 'package:motion/config/assets.dart';
import 'package:motion/config/theme.dart';

class HomeMarker extends StatefulWidget {
  const HomeMarker({super.key, required this.label});

  final String label;

  @override
  State<HomeMarker> createState() => _HomeMarkerState();
}

class _HomeMarkerState extends State<HomeMarker> {
  bool _showing = false;
  CrossFadeState _show = CrossFadeState.showFirst;

  static const _rad = BorderRadius.only(
    topLeft: Radius.circular(16),
    topRight: Radius.circular(16),
    bottomRight: Radius.circular(16),
  );

  @override
  void initState() {
    super.initState();

    Future.delayed(1.5.seconds, () {
      setState(() {
        _showing = true;
        Future.delayed(2.seconds, () {
          setState(() {
            _show = (_show == CrossFadeState.showFirst)
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst;
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final textWidget = Center(
      child: Text(
        widget.label,
        style: const TextStyle(color: Colors.white),
      ),
    );
    const secondWidget = Center(
      child: Icon(
        IconlyBold.home,
        size: 18,
        color: Colors.white,
      ),
    );
    return GestureDetector(
      onTap: () {
        setState(() {
          _show = (_show == CrossFadeState.showFirst)
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst;
        });
      },
      child: AnimatedContainer(
        duration: 250.ms,
        height: !_showing ? 0 : 40,
        width: !_showing
            ? 0
            : _show == CrossFadeState.showFirst
                ? 100
                : 40,
        decoration:
            const BoxDecoration(color: AppTheme.gold, borderRadius: _rad),
        child: AnimatedCrossFade(
            duration: 250.ms,
            firstChild: textWidget,
            secondChild: secondWidget,
            crossFadeState: _show,
            alignment: Alignment.centerRight,
            firstCurve: Curves.linearToEaseOut,
            secondCurve: Curves.linearToEaseOut,
            sizeCurve: Curves.linearToEaseOut,
            layoutBuilder: (Widget topChild, Key topChildKey,
                Widget bottomChild, Key bottomChildKey) {
              return Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Positioned(
                    key: bottomChildKey,
                    child: bottomChild,
                  ),
                  Positioned(
                    key: topChildKey,
                    child: topChild,
                  ).animate(),
                ],
              );
            }),
      ),
    );
  }
}
