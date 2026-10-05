import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/app_svg_icon.dart';

class HomeHeroCarousel extends StatefulWidget {
  const HomeHeroCarousel({super.key});

  @override
  State<HomeHeroCarousel> createState() => _HomeHeroCarouselState();
}

class _HomeHeroCarouselState extends State<HomeHeroCarousel>{
  late final PageController _pageController;

  int _currentPage = 0;

  final List<Map<String, String>> movies = [
    {
      'title': 'Dune: Part Two',
      'image': 'https://image.tmdb.org/t/p/w780/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg',
    },
    {
      'title': 'Oppenheimer',
      'image': 'https://image.tmdb.org/t/p/w780/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
    },
    {
      'title': 'Interstellar',
      'image': 'https://image.tmdb.org/t/p/w780/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
    },
    {
      'title': 'Interstellar2',
      'image': 'https://image.tmdb.org/t/p/w780/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
    },
    {
      'title': 'Interstellar3',
      'image': 'https://image.tmdb.org/t/p/w780/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
    },
    {
      'title': 'Interstellar4',
      'image': 'https://image.tmdb.org/t/p/w780/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
    },
    {
      'title': 'Interstellar5',
      'image': 'https://image.tmdb.org/t/p/w780/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
    },
    {
      'title': 'Interstellar6',
      'image': 'https://image.tmdb.org/t/p/w780/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
    },
    {
      'title': 'Interstellar7',
      'image': 'https://image.tmdb.org/t/p/w780/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
    },
    {
      'title': 'Interstellar8',
      'image': 'https://image.tmdb.org/t/p/w780/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
    },
    {
      'title': 'Interstellar9',
      'image': 'https://image.tmdb.org/t/p/w780/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
    },
    {
      'title': 'Interstellar10',
      'image': 'https://image.tmdb.org/t/p/w780/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.88);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildMovieCard(Map<String, String> movie) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              movie['image']!,
              fit: BoxFit.cover,
            ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.85),
                  ],
                ),
              ),
            ),

            Positioned(
              left: 16,
              bottom: 16,
              right: 16,
              child: Text(
                movie['title']!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlidingDots() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(movies.length, (index) {
      final int distance = (index - _currentPage).abs();
      final bool isActive = distance == 0;

      // 🎯 Dynamic sizing based on distance from current page
      double width = 0;
      double height = 0;
      double horizontalMargin = 0;
      Color color = Colors.transparent;

      if (isActive) {
        width = 20; // Active expanded pill
        height = 6;
        horizontalMargin = 4;
        color = Colors.white;
      } else if (distance == 1) {
        width = 6; // Immediate neighbors
        height = 6;
        horizontalMargin = 4;
        color = Colors.white70;
      } else if (distance == 2) {
        width = 4; // Edge dots (smaller to hint more movies)
        height = 4;
        horizontalMargin = 3;
        color = Colors.white38;
      } else {
        // 🎯 Dots further away collapse to 0 width (NO trimming or cut-offs!)
        width = 0;
        height = 0;
        horizontalMargin = 0;
        color = Colors.transparent;
      }

      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(3),
        ),
      );
    }),
  );
}



  Widget _buildIndicatorDot({required bool isActive}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 6,
      width: isActive ? 20 : 6,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white24,
        borderRadius: BorderRadius.circular(3),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 220,
          child: PageView.builder(
            controller: _pageController,
            itemCount: movies.length,
            padEnds: false,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return _buildMovieCard(movies[index]);
            }
          )
        ),
        const SizedBox(height: 12),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: List.generate(
        //     movies.length, (index) => _buildIndicatorDot(isActive: index == _currentPage),
        //   ),
        // ),
        _buildSlidingDots(),
      ]
    );
  }
}
