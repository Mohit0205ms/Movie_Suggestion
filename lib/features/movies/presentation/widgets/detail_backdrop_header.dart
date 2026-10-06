import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/app_svg_icon.dart';

class DetailBackdropHeader extends StatelessWidget {
  final String imageUrl;
  final String duration;
  final VoidCallback? onBackTap;
  final VoidCallback? onShareTap;
  final VoidCallback? onPlayTap;

  const DetailBackdropHeader({
    super.key,
    required this.imageUrl,
    this.duration = '1h 44min',
    this.onBackTap,
    this.onShareTap,
    this.onPlayTap,
  });

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Stack(
      children: [
        // 1. Movie Poster Banner Image
        Image.network(
          imageUrl,
          height: 420,
          width: double.infinity,
          fit: BoxFit.cover,
        ),

        // 2. Top & Bottom Gradient Overlays
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.6), // Top dark shadow for icons
                  Colors.transparent,
                  const Color(0xFF1F1F29).withOpacity(0.95), // Bottom fade into background
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),
        ),

        // 3. Top Navigation Bar (Back & Share icons)
        Positioned(
          top: topPadding + 8,
          left: 16,
          right: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Back Button
              AppSvgIcon(
                assetPath: AppIcons.back,
                size: 26,
                color: Colors.white,
                onTap: onBackTap ?? () => Navigator.of(context).pop(),
              ),

              // Share Button
              AppSvgIcon(
                assetPath: AppIcons.share,
                size: 24,
                color: Colors.white,
                onTap: onShareTap,
              ),
            ],
          ),
        ),

        // 4. Center Red Play Button
        Positioned.fill(
          child: Center(
            child: GestureDetector(
              onTap: onPlayTap,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFE50914), // Netflix Red
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFE50914).withOpacity(0.5),
                      blurRadius: 18,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Center(
                  child: AppSvgIcon(
                    assetPath: AppIcons.play,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),

        // 5. Duration (e.g. "1h 44min") in Bottom Right
        Positioned(
          bottom: 16,
          right: 16,
          child: Text(
            duration,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: Colors.black,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
