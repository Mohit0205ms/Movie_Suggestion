import 'package:flutter/material.dart';
import '../../../../core/widgets/movie_card.dart';

class HomeMyList extends StatefulWidget {
  const HomeMyList({super.key});

  @override
  State<HomeMyList> createState() => _HomeMyListState();
}

class _HomeMyListState extends State<HomeMyList> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const MovieCard(),
    );
  }
}
