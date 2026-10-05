import 'package:flutter/material.dart';
import '../constants/app_assets.dart';
import 'app_svg_icon.dart';

class MovieCard extends StatefulWidget {
  const MovieCard({super.key});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {

  Widget _getRating({required double rating}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(rating.toInt(), (index) => AppSvgIcon(assetPath: AppIcons.star, size: 14, color: Colors.yellow))
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 200,
      child: Column (
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w780/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg', 
            fit: BoxFit.cover
          ),
          Text("Under Paris ", style: TextStyle(fontSize: 12, color: Colors.white)),
          _getRating(rating: 5)
        ]
      ),
    );
  }
}
