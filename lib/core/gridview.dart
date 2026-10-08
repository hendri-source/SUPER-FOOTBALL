import 'package:flutter/material.dart';
import '../shared/model/club.dart';

class GridViewClubsWidget extends StatelessWidget {
  final List<Club> clubs;
  final ValueChanged<Club> onSelectClub;
  final ValueChanged<String> onOpenStadiumMap;
  final Set<String> favoriteClubIds;
  final ValueChanged<Club> onToggleFavorite;

  const GridViewClubsWidget({
    super.key,
    required this.clubs,
    required this.onSelectClub,
    required this.onOpenStadiumMap,
    required this.favoriteClubIds,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final crossAxisCount = screenWidth >= 1400
        ? 5
        : screenWidth >= 1000
            ? 4
            : screenWidth >= 650
                ? 3
                : 2;

    if (clubs.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(32),
        alignment: Alignment.center,
        child: Column(
          children: const [
            Icon(Icons.search_off, size: 48, color: Color(0xFF64748B)),
            SizedBox(height: 12),
            Text(
              'Tidak ada klub yang cocok dengan pencarian.',
              style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.05,
      ),
      itemCount: clubs.length,
      itemBuilder: (context, index) {
        final club = clubs[index];
        final isFavorite = favoriteClubIds.contains(club.id);

        return GestureDetector(
          onTap: () => onSelectClub(club),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF131B2E),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFF1E293B), width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Banner Gambar Sedang
                SizedBox(
                  height: 60,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(13)),
                        child: Image.network(
                          club.bannerPhoto,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          tooltip: isFavorite
                              ? 'Hapus dari favorit'
                              : 'Tambah ke favorit',
                          visualDensity: VisualDensity.compact,
                          onPressed: () => onToggleFavorite(club),
                          icon: Icon(
                            isFavorite ? Icons.star : Icons.star_border,
                            color: const Color(0xFFFBBF24),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: IconButton(
                          tooltip: 'Buka peta ${club.stadiumName}',
                          visualDensity: VisualDensity.compact,
                          onPressed: () => onOpenStadiumMap(club.stadiumId),
                          icon: const Icon(
                            Icons.map_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Informasi Klub Sedang
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        club.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${club.league} · ${club.country}',
                        style: const TextStyle(
                            fontSize: 10, color: Color(0xFF94A3B8)),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.emoji_events_outlined,
                              size: 12, color: Color(0xFFFBBF24)),
                          const SizedBox(width: 3),
                          Text(
                            '${club.uclTitles}x UCL',
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFBBF24),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              '• ${club.stadiumName}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 9, color: Color(0xFF64748B)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      // Bintang Utama dalam Chip Rapi
                      Wrap(
                        spacing: 3,
                        children: club.starPlayers.take(2).map((player) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 1),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0F172A),
                              borderRadius: BorderRadius.circular(4),
                              border:
                                  Border.all(color: const Color(0xFF334155)),
                            ),
                            child: Text(
                              player,
                              style: const TextStyle(
                                  fontSize: 9, color: Color(0xFFCBD5E1)),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
