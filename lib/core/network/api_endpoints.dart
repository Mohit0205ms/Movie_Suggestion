abstract final class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl = 'https://api.tvmaze.com';
  
  static const String shows = '$baseUrl/shows';
  static String showDetails(String id) => '$baseUrl/shows/$id';
  static String showCast(String id) => '$baseUrl/shows/$id/cast';
  static String searchShows(String query) => '$baseUrl/search/shows?q=$query';
}
