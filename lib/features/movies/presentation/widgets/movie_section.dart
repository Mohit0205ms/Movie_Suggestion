import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/movie_card.dart';
import '../../../../core/widgets/app_svg_icon.dart';
import '../../../../core/constants/app_assets.dart';

class MovieSection extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;

  const MovieSection({
    super.key,
    required this.title,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Section Header (Title + Arrow)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
              ),
              AppSvgIcon(assetPath: AppIcons.next, size: 24, color: Colors.white, onTap: onSeeAll),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Horizontal Movie List
        SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 10,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) => MovieCard(
              onTap: () {
                // 🎯 Navigates to /movie/1, /movie/2, etc.
                context.push('/movie/${index + 1}');
              },
            ),
          ),
        ),
      ],
    );
  }
}
