class MovieModel {
  final String id;
  final String title;
  final String imageUrl;
  final double rating;
  final List<String> genres;
  final String summary;
  final int? runtime;

  const MovieModel({ ... })

  // 🎯 Converts raw JSON Map to a strongly-typed MovieModel
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    final ratingMap = json['rating'] as Map<String, dynamic>?;
    final double parsedRating = (ratingMap?['average'] as num?)?.toDouble() ?? 0.0;
    
    final imageMap = json['image'] as Map<String, dynamic>?;
    final String parsedImage = imageMap?['original'] ?? imageMap?['medium'] ??
        'https://via.placeholder.com/300x450?text=No+Poster';
    
    final List<dynamic>? genresList = json['genres'] as List<dynamic>?;
    final List<String> parsedGenres =
        genresList?.map((g) => g.toString()).toList() ?? [];
    
    final String rawSummary = json['summary'] as String? ?? 'No description available.';
    final String cleanSummary = rawSummary.replaceAll(RegExp(r'<[^>]*>'), '');

    return MovieModel(
      id: json['id']?.toString() ?? '',
      title: json['name'] as String? ?? 'Untitled',
      imageUrl: parsedImage,
      rating: parsedRating,
      genres: parsedGenres,
      summary: cleanSummary.trim(),
      runtime: json['runtime'] as int?,
    );
  }

  String get formattedDuration {
    if (runtime == null || runtime == 0) return 'N/A';
    final hours = runtime! ~/ 60;
    final minutes = runtime! % 60;
    if (hours > 0) {
      return '${hours}h ${minutes}min';
    }
    return '${minutes}min';
  }
}