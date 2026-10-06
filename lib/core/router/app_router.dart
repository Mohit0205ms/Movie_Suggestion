import 'package:go_router/go_router.dart';
import '../../features/movies/presentation/screens/movie_home_screen.dart';
import '../../features/movies/presentation/screens/movie_detail_screen.dart';
import '../../features/movies/presentation/screens/movie_view_more_screen.dart';

abstract final class AppRoutes {
  static const home = '/';
  static const movieDetail = '/movie/:id';
  static const movieViewMore = '/movie/view-more/:title'; 
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const MovieHomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.movieDetail,
      builder: (context, state) {
        final movieId = state.pathParameters['id']!;
        return MovieDetailScreen(movieId: movieId);
      },
    ),
    GoRoute(
      path: AppRoutes.movieViewMore,
      builder: (context, state) {
        final title = state.pathParameters['title']!;
        return MovieViewMoreScreen(title: title);
      },
    ),
  ],
);
