import 'package:flutter/material.dart';
import '../shared/model/club.dart';

class ListViewClubsWidget extends StatelessWidget {
  final List<Club> clubs;
  final ValueChanged<Club> onSelectClub;
  final ValueChanged<String> onOpenStadiumMap;
  final Set<String> favoriteClubIds;
  final ValueChanged<Club> onToggleFavorite;

  const ListViewClubsWidget({
    super.key,
    required this.clubs,
    required this.onSelectClub,
    required this.onOpenStadiumMap,
    required this.favoriteClubIds,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    if (clubs.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(32),
        alignment: Alignment.center,
        child: const Text(
          'Tidak ada klub yang cocok.',
          style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: clubs.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final club = clubs[index];
        final isMadrid = club.id == 'real-madrid';
        final isFavorite = favoriteClubIds.contains(club.id);

        return GestureDetector(
          onTap: () => onSelectClub(club),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF131B2E),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: isMadrid
                    ? const Color(0xFFFBBF24)
                    : const Color(0xFF1E293B),
                width: isMadrid ? 1.5 : 1,
              ),
            ),
            child: Row(
              children: [
                // Nomor Urut Peringkat / Ranking
                Container(
                  width: 26,
                  height: 26,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isMadrid
                        ? const Color(0xFFFBBF24)
                        : const Color(0xFF0F172A),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: isMadrid
                          ? const Color(0xFF0B0F17)
                          : const Color(0xFF94A3B8),
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                // Foto Banner Klub
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    club.bannerPhoto,
                    width: 65,
                    height: 55,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 65,
                      height: 55,
                      color: const Color(0xFF1E293B),
                      child: const Icon(Icons.shield,
                          size: 24, color: Color(0xFF64748B)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Info Klub
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              club.name,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: isMadrid
                                    ? const Color(0xFFFBBF24)
                                    : Colors.white,
                              ),
                            ),
                          ),
                          if (isMadrid)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 1),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFBBF24),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'Favorit',
                                style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0B0F17),
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${club.league} · ${club.city}',
                        style: const TextStyle(
                            fontSize: 12, color: Color(0xFF94A3B8)),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.emoji_events,
                              size: 13, color: Color(0xFFFBBF24)),
                          const SizedBox(width: 4),
                          Text(
                            '${club.uclTitles} UCL / ${club.leagueTitles} Liga',
                            style: const TextStyle(
                                fontSize: 11, color: Color(0xFFCBD5E1)),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              '• ${club.stadiumName}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 11, color: Color(0xFF64748B)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  tooltip: 'Buka peta ${club.stadiumName}',
                  onPressed: () => onOpenStadiumMap(club.stadiumId),
                  icon: const Icon(Icons.map_outlined,
                      color: Color(0xFF10B981), size: 20),
                ),
                IconButton(
                  tooltip:
                      isFavorite ? 'Hapus dari favorit' : 'Tambah ke favorit',
                  onPressed: () => onToggleFavorite(club),
                  icon: Icon(
                    isFavorite ? Icons.star : Icons.star_border,
                    color: const Color(0xFFFBBF24),
                    size: 20,
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
