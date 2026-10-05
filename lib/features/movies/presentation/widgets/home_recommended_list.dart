import 'package:flutter/material.dart';
import '../../../../core/widgets/movie_card.dart';
import '../../../../core/widgets/app_svg_icon.dart';
import '../../../../core/constants/app_assets.dart';

class HomeRecommendedList extends StatefulWidget {
  const HomeRecommendedList({super.key});

  @override
  State<HomeRecommendedList> createState() => _HomeRecommendedListState();
}

class _HomeRecommendedListState extends State<HomeRecommendedList> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("My List", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500,)),
                AppSvgIcon(assetPath: AppIcons.next, size: 24, color: Colors.white, onTap: () {})
              ]
            )
          ),
          const SizedBox(height: 16),
          SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 10,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return MovieCard();
            }
          )
        )
      ]
    )
    );
  }
}
