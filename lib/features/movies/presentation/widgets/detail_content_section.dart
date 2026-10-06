import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/app_svg_icon.dart';

class DetailContentSection extends StatefulWidget {
  final String title;
  final String synopsis;
  final String rating;
  final String ageRating;
  final String genre;
  final VoidCallback? onImdbTap;

  const DetailContentSection({
    super.key,
    this.title = 'Under Paris',
    this.synopsis =
        'To save Paris from a bloodbath, a grieving scientist is forced to face her tragic past when a giant shark appears in the Seine.',
    this.rating = '5.0',
    this.ageRating = '+18',
    this.genre = 'Action',
    this.onImdbTap,
  });

  @override
  State<DetailContentSection> createState() => _DetailContentSectionState();
}

class _DetailContentSectionState extends State<DetailContentSection> {
  bool _isFavorite = true;
  bool _isExpanded = false;

  // Mock cast list with images
  final List<Map<String, String>> _cast = [
    {
      'name': 'Bérénice Bejo',
      'image': 'https://image.tmdb.org/t/p/w185/eP49x52V7V3Rkm1wKxPj85V4eD1.jpg',
    },
    {
      'name': 'Nassim Lyes',
      'image': 'https://image.tmdb.org/t/p/w185/pY5xY7n8uV5w9xJ7Pq1zR6s1kE9.jpg',
    },
    {
      'name': 'Léa Léviant',
      'image': 'https://image.tmdb.org/t/p/w185/kF8w4f6D6w8r2x3n8m3h5p9L4k2.jpg',
    },
    {
      'name': 'Anne Marivin',
      'image': 'https://image.tmdb.org/t/p/w185/qY6r5t7y8u9i0o1p2a3s4d5f6g7.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Badges Row (+18, Action, 5.0 Star) & Heart Icon
          Row(
            children: [
              _buildBadge(widget.ageRating),
              const SizedBox(width: 8),
              _buildBadge(widget.genre),
              const SizedBox(width: 8),
              _buildRatingBadge(widget.rating),
              const Spacer(),
              // Heart / Favorite Toggle
              GestureDetector(
                onTap: () {
                  setState(() => _isFavorite = !_isFavorite);
                },
                child: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: _isFavorite ? const Color(0xFFE50914) : Colors.white60,
                  size: 26,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // 2. Movie Title
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          // 3. Synopsis with "Show More"
          RichText(
            text: TextSpan(
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.4,
              ),
              children: [
                TextSpan(
                  text: _isExpanded
                      ? widget.synopsis
                      : (widget.synopsis.length > 110
                          ? '${widget.synopsis.substring(0, 110)}... '
                          : widget.synopsis),
                ),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      setState(() => _isExpanded = !_isExpanded);
                    },
                    child: Text(
                      _isExpanded ? ' Show Less' : ' Show More',
                      style: const TextStyle(
                        color: Color(0xFFE50914), // Red link
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 4. Actors Section
          const Text(
            'Actors',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          // Actors Horizontal List
          SizedBox(
            height: 110,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _cast.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final actor = _cast[index];
                return SizedBox(
                  width: 76,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          actor['image']!,
                          width: 76,
                          height: 76,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            width: 76,
                            height: 76,
                            color: const Color(0xFF2B2B38),
                            child: const Icon(Icons.person, color: Colors.white38),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        actor['name']!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          // 5. Open IMDb Button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: widget.onImdbTap ?? () => debugPrint('IMDb opened'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF5C518), // Official IMDb Gold
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Open IMDb',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // Helper for age & genre pill badges
  Widget _buildBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF2B2B38),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Helper for rating badge with gold star
  Widget _buildRatingBadge(String rating) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF2B2B38),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AppSvgIcon(
            assetPath: AppIcons.star,
            size: 13,
            color: Color(0xFFFFB800),
          ),
          const SizedBox(width: 4),
          Text(
            rating,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
