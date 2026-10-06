import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_movie_suggestion/features/movies/presentation/widgets/home_header.dart';
import 'package:flutter_movie_suggestion/features/movies/presentation/widgets/home_hero_carousel.dart';
import 'package:flutter_movie_suggestion/features/movies/presentation/widgets/home_search_bar.dart';
import 'package:flutter_movie_suggestion/features/movies/presentation/widgets/movie_section.dart';

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
              MovieSection(title: "My List", onSeeAll: () {
                context.push('/movie/view-more/My List');
              }),
              MovieSection(title: "Recommended", onSeeAll: () {
                context.push('/movie/view-more/Recommended');
              }),
              MovieSection(title: "Top Rated", onSeeAll: () {
                context.push('/movie/view-more/Top Rated');
              }),
            ],
          ),
        )
      ),
    );
  }
}
