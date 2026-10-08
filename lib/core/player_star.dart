import 'package:flutter/material.dart';
import '../shared/model/player.dart';

class PlayerStatsModalWidget extends StatelessWidget {
  final Player player;

  const PlayerStatsModalWidget({super.key, required this.player});

  static void show(BuildContext context, Player player) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF131B2E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => PlayerStatsModalWidget(player: player),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  height: 4,
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(2)),
                ),
              ),
              const SizedBox(height: 16),

              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth >= 600;
                  final portraitSize = isWide ? 230.0 : 132.0;
                  final ratingWidth = isWide ? 104.0 : 58.0;
                  final ratingHeight = isWide ? 150.0 : 60.0;

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildPlayerPortrait(portraitSize),
                      SizedBox(width: isWide ? 20 : 16),
                      Expanded(child: _buildPlayerDetails(isWide)),
                      SizedBox(width: isWide ? 20 : 12),
                      _buildRatingBadge(
                        width: ratingWidth,
                        height: ratingHeight,
                        isWide: isWide,
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 18),

              // Kotak Statistik Performa
              const Text('Statistik musim 2026/27',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.white)),
              const SizedBox(height: 3),
              const Text('Statistik lengkap pemain bintang di musim ini',
                  style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildStatBox('Gol Dicetak', '${player.goals}',
                      const Color(0xFFFBBF24)),
                  const SizedBox(width: 8),
                  _buildStatBox(
                      'Assist', '${player.assists}', const Color(0xFF38BDF8)),
                  const SizedBox(width: 8),
                  _buildStatBox('Laga Main', '${player.appearances}',
                      const Color(0xFF10B981)),
                  const SizedBox(width: 8),
                  _buildStatBox('Akurasi Umpan', '${player.passAccuracy}%',
                      const Color(0xFFA855F7)),
                ],
              ),
              const SizedBox(height: 16),

              // Bio Analisis
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F172A),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFF1E293B)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Karakteristik & Gaya Bermain:',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    const SizedBox(height: 4),
                    Text(player.bio,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFFCBD5E1),
                            height: 1.4)),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E293B),
                      foregroundColor: Colors.white),
                  child: const Text('Tutup Statistik'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPlayerPortrait(double size) {
    if (player.photoUrl.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          width: size,
          height: size,
          child: player.photoUrl.startsWith('http')
              ? Image.network(
                  player.photoUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      _buildPlayerPortraitFallback(size),
                )
              : Image.asset(
                  player.photoUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      _buildPlayerPortraitFallback(size),
                ),
        ),
      );
    }
    return _buildPlayerPortraitFallback(size);
  }

  Widget _buildPlayerDetails(bool isWide) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          player.name,
          style: TextStyle(
            fontSize: isWide ? 22 : 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '${player.position} · ${player.nationality} · ${player.age} Tahun',
          style: TextStyle(
            fontSize: isWide ? 14 : 11,
            color: const Color(0xFF94A3B8),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '${player.clubName} · ${player.marketValue}',
          style: TextStyle(
            fontSize: isWide ? 14 : 11,
            color: const Color(0xFF10B981),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildRatingBadge({
    required double width,
    required double height,
    required bool isWide,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFBBF24), Color(0xFFD97706)],
        ),
        borderRadius: BorderRadius.circular(isWide ? 24 : 18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'RTG',
            style: TextStyle(
              fontSize: isWide ? 16 : 8,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF0B0F17),
            ),
          ),
          SizedBox(height: isWide ? 4 : 1),
          Text(
            '${player.rating}',
            style: TextStyle(
              fontSize: isWide ? 38 : 18,
              fontWeight: FontWeight.w900,
              color: const Color(0xFF0B0F17),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerPortraitFallback(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFBBF24), Color(0xFFD97706)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '#${player.number}',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: Color(0xFF0B0F17),
              height: 1.0,
            ),
          ),
          const SizedBox(height: 2),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
            decoration: BoxDecoration(
              color: const Color(0xFF0B0F17),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              player.position,
              style: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFBBF24),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatBox(String label, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFF1E293B)),
        ),
        child: Column(
          children: [
            Text(value,
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, color: color)),
            const SizedBox(height: 2),
            Text(label,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10, color: Color(0xFF94A3B8))),
          ],
        ),
      ),
    );
  }
}
