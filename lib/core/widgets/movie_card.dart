import 'package:flutter/material.dart';
import '../constants/app_assets.dart';
import 'app_svg_icon.dart';

class MovieCard extends StatelessWidget {
  final VoidCallback? onTap; // 👈 1. Accept onTap callback

  const MovieCard({
    super.key,
    this.onTap,
  });

  Widget _getRating({required double rating}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        rating.toInt(),
        (index) => const AppSvgIcon(
          assetPath: AppIcons.star,
          size: 14,
          color: Colors.yellow,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 👈 2. Wrap with GestureDetector
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 100,
        height: 200,
        child: Column(
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w780/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg',
              fit: BoxFit.cover,
            ),
            const Text(
              "Under Paris",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
            _getRating(rating: 5),
          ],
        ),
      ),
    );
  }
}
