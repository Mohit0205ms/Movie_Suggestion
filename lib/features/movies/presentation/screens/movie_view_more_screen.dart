import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/app_svg_icon.dart';
import '../../../../core/widgets/movie_card.dart';

class MovieViewMoreScreen extends StatefulWidget {
  final String title;

  const MovieViewMoreScreen({super.key, required this.title});

  @override
  State<MovieViewMoreScreen> createState() => _MovieViewMoreScreenState();
}

class _MovieViewMoreScreenState extends State<MovieViewMoreScreen> {
  late final ScrollController _scrollController;

  int _itemCount = 18;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent - 200) {
      if (! _isLoadingMore) {
         _loadMoreMovies();
      }
    }
  }

  Future<void> _loadMoreMovies() async {
    setState(() => _isLoadingMore = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() {
        _itemCount += 12;
        _isLoadingMore = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F29),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F29),
        elevation: 0,
        centerTitle: true,
        leading: Center(
          child: AppSvgIcon(
            assetPath: AppIcons.back,
            size: 24,
            color: Colors.white,
            onTap: () => context.pop(),
          ),
        ),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                itemCount: _itemCount,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 50,
                  childAspectRatio: 2 / 3,
                ),
                itemBuilder: (context, index) {
                  return MovieCard(
                    onTap: () => context.push('/movie/${index + 1}'),
                  );
                }
              )
            ),

            if (_isLoadingMore) 
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Color(0xFFE50914),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
