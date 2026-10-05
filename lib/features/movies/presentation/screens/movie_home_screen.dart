import 'package:flutter/material.dart';
import 'package:flutter_movie_suggestion/features/movies/presentation/widgets/home_header.dart';
import 'package:flutter_movie_suggestion/features/movies/presentation/widgets/home_hero_carousel.dart';
import 'package:flutter_movie_suggestion/features/movies/presentation/widgets/home_search_bar.dart';
import 'package:flutter_movie_suggestion/features/movies/presentation/widgets/home_my_list.dart';
import 'package:flutter_movie_suggestion/features/movies/presentation/widgets/home_recommended_list.dart';

class MovieHomeScreen extends StatelessWidget {
  const MovieHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        backgroundColor: const Color(0xFF1F1F29),
        appBar: const HomeHeader(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              const HomeSearchBar(),
              const SizedBox(height: 24),
              const HomeHeroCarousel(),
              const HomeMyList(),
              const HomeRecommendedList(),
            ],
          ),
        )
      ),
    );
  }
}
