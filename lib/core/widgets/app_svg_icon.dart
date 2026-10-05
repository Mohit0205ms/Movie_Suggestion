import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvgIcon extends StatelessWidget {
  final String assetPath;
  final double size;
  final Color? color;
  final VoidCallback? onTap;

  const AppSvgIcon({
    super.key,
    required this.assetPath,
    this.size = 24,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final iconWidget = SvgPicture.asset(
      assetPath,
      width: size,
      height: size,
      colorFilter: color != null 
          ? ColorFilter.mode(color!, BlendMode.srcIn) 
          : null,
    );

    if (onTap != null) {
      return IconButton(
        onPressed: onTap,
        icon: iconWidget,
        padding: const EdgeInsets.all(8),
        splashRadius: size + 8,
        constraints: const BoxConstraints(),
      );
    }
    return iconWidget;
  }
}
