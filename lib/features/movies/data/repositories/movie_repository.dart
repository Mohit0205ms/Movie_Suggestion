import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/movie_model.dart';

class MovieRepository {
  final ApiClient _apiClient;

  MovieRepository(this._apiClient);

  // 1. Fetch all popular shows/movies
  Future<List<MovieModel>> getMovies() async {
    final response = await _apiClient.get<List<dynamic>>(ApiEndpoints.shows);

    final List<dynamic> data = response.data ?? [];

    return data.map((json) => MovieModel.fromJson(json as Map<String, dynamic>)).toList();
  }

  // 2. Fetch specific movie details by ID
  Future<MovieModel> getMovieDetails(String id) async {
    final response = await _apiClient.get<Map<String, dynamic>>(
      ApiEndpoints.showDetails(id),
    );
    return MovieModel.fromJson(response.data!);
  }

  // 3. Search movies by query
  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await _apiClient.get<List<dynamic>>(
      ApiEndpoints.searchShows(query),
    );
    final List<dynamic> data = response.data ?? [];
    return data.map((item) => MovieModel.fromJson(item['show'] as Map<String,dynamic>)).toList();
  }
}
