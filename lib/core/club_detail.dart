import 'package:flutter/material.dart';
import '../screens/data/football.dart';
import '../shared/model/club.dart';
import '../shared/model/player.dart';
import 'player_star.dart';

class ClubDetailModalWidget extends StatelessWidget {
  final Club club;
  final VoidCallback onOpenStadium;

  const ClubDetailModalWidget({
    super.key,
    required this.club,
    required this.onOpenStadium,
  });

  static void show(
      BuildContext context, Club club, VoidCallback onOpenStadium) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF131B2E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return ClubDetailModalWidget(
          club: club,
          onOpenStadium: onOpenStadium,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMadrid = club.id == 'real-madrid';
    final playersByName = {
      for (final player in FootballData.playersForClub(club.name))
        player.name: player,
    };

    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      expand: false,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 44,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Banner Foto Stadion/Tim Asli
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    Image.network(
                      club.bannerPhoto,
                      height: 190,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 190,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.8)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      left: 14,
                      right: 14,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: isMadrid
                                  ? const Color(0xFFFBBF24)
                                  : Colors.black87,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              isMadrid ? '👑 Klub Kebanggaan' : club.league,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: isMadrid
                                    ? const Color(0xFF0B0F17)
                                    : Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Nilai: ${club.marketValue}',
                              style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFFFBBF24),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Baris Judul & Logo
              Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F172A),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: isMadrid
                            ? const Color(0xFFFBBF24)
                            : const Color(0xFF334155),
                        width: isMadrid ? 2 : 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '⚽',
                        style: const TextStyle(fontSize: 26),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          club.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '${club.city}, ${club.country} · Pelatih: ${club.manager}',
                          style: const TextStyle(
                              color: Color(0xFF94A3B8), fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Deskripsi Klub
              Text(
                club.description,
                style: const TextStyle(
                    color: Color(0xFFCBD5E1), fontSize: 13, height: 1.5),
              ),
              const SizedBox(height: 14),
              _buildClubInfo(
                'Karakteristik',
                club.characteristics,
                Icons.shield_outlined,
              ),
              const SizedBox(height: 10),
              _buildClubInfo(
                'Gaya Main',
                club.playingStyle,
                Icons.sports_soccer,
              ),
              const SizedBox(height: 18),

              // Lemari Trofi
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F172A),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFF1E293B)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTrophyStat('Trofi UCL', '${club.uclTitles}',
                        Icons.emoji_events, const Color(0xFFFBBF24)),
                    Container(
                        width: 1, height: 36, color: const Color(0xFF1E293B)),
                    _buildTrophyStat('Gelar Liga', '${club.leagueTitles}',
                        Icons.shield, const Color(0xFF38BDF8)),
                    Container(
                        width: 1, height: 36, color: const Color(0xFF1E293B)),
                    _buildTrophyStat(
                        'Kapasitas',
                        '${club.stadiumCapacity ~/ 1000}k',
                        Icons.stadium,
                        const Color(0xFF10B981)),
                  ],
                ),
              ),
              const SizedBox(height: 18),

              // Bintang Skuad
              const Text(
                'Skuad utama 2026/27 · pilih pemain untuk statistik',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: club.starPlayers.map((name) {
                  final player = playersByName[name];

                  if (player == null) {
                    return Chip(
                      backgroundColor: const Color(0xFF0F172A),
                      side: const BorderSide(color: Color(0xFF334155)),
                      label: Text(name),
                    );
                  }

                  return _buildPlayerCard(
                    player,
                    onPressed: () =>
                        PlayerStatsModalWidget.show(context, player),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),

              // Tombol Buka Peta Stadion
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    onOpenStadium();
                  },
                  icon: const Icon(Icons.location_on, size: 18),
                  label: Text('Kunjungi ${club.stadiumName} di Peta'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF10B981),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPlayerCard(
    Player player, {
    required VoidCallback onPressed,
  }) {
    Widget photoFallback() {
      return const ColoredBox(
        color: Color(0xFF1E293B),
        child: Center(
          child: Icon(Icons.person, size: 36, color: Color(0xFF94A3B8)),
        ),
      );
    }

    Widget photo;
    if (player.photoUrl.isEmpty) {
      photo = photoFallback();
    } else if (player.photoUrl.startsWith('http')) {
      photo = Image.network(
        player.photoUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => photoFallback(),
      );
    } else {
      photo = Image.asset(
        player.photoUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => photoFallback(),
      );
    }

    return SizedBox(
      width: 132,
      child: Material(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 92, child: photo),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 7,
                ),
                child: Text(
                  player.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFFE2E8F0),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrophyStat(
      String label, String value, IconData icon, Color color) {
    return Column(
      children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
        ),
      ],
    );
  }

  Widget _buildClubInfo(String title, String content, IconData icon) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 19, color: const Color(0xFFFBBF24)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: const TextStyle(
                    color: Color(0xFFCBD5E1),
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
