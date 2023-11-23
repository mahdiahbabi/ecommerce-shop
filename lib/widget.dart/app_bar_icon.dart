



import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  final GestureTapCallback onTap;
  final BorderRadiusGeometry borderRadius;
  final IconData icon;
  const AppBarIcon({
    super.key,
    required this.onTap,
    required this.borderRadius,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(500),
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(borderRadius: borderRadius),
        child: Icon(icon),
      ),
    );
  }
}
