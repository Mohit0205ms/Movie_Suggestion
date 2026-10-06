import 'package:flutter/material.dart';
import '../widgets/detail_backdrop_header.dart';
import '../widgets/detail_content_section.dart';

class MovieDetailScreen extends StatelessWidget {
  final String movieId;

  const MovieDetailScreen({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F29),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🎯 Top Backdrop Header Component
            DetailBackdropHeader(
              imageUrl: 'https://image.tmdb.org/t/p/w780/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg',
              duration: '1h 44min',
              onBackTap: () => Navigator.of(context).pop(),
              onShareTap: () => debugPrint('Share movie $movieId'),
              onPlayTap: () => debugPrint('Play trailer for movie $movieId'),
            ),

            DetailContentSection(
              title: 'Under Paris',
              onImdbTap: () => debugPrint('Open IMDb for movie $movieId'),
            ),
          ],
        ),
      ),
    );
  }
}
