import 'package:flutter/material.dart';
import 'core/club_detail.dart';
import 'screens/data/football.dart';
import 'shared/model/club.dart';

class ClubsScreen extends StatefulWidget {
  const ClubsScreen({super.key});

  @override
  State<ClubsScreen> createState() => _ClubsScreenState();
}

class _ClubsScreenState extends State<ClubsScreen> {
  String _selectedLeague = 'Semua';
  final Set<String> _favoriteClubIds = {'real-madrid'};

  @override
  Widget build(BuildContext context) {
    final clubs = FootballData.clubs;
    final leagues = [
      'Semua',
      ...{for (final club in clubs) club.league}
    ];
    final shownClubs = _selectedLeague == 'Semua'
        ? clubs
        : clubs.where((club) => club.league == _selectedLeague).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF0B0F17),
      appBar: AppBar(
        title: const Text('Klub & Skuad'),
        backgroundColor: const Color(0xFF131B2E),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 56,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              scrollDirection: Axis.horizontal,
              itemCount: leagues.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final league = leagues[index];
                return FilterChip(
                  selected: _selectedLeague == league,
                  label: Text(league),
                  onSelected: (_) => setState(() => _selectedLeague = league),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              itemCount: shownClubs.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.78,
              ),
              itemBuilder: (context, index) =>
                  _buildClubCard(context, shownClubs[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClubCard(BuildContext context, Club club) {
    final isFavorite = _favoriteClubIds.contains(club.id);

    return InkWell(
      onTap: () => ClubDetailModalWidget.show(
        context,
        club,
        () => Navigator.pushNamed(context, '/stadiums'),
      ),
      borderRadius: BorderRadius.circular(14),
      child: Ink(
        decoration: BoxDecoration(
          color: const Color(0xFF131B2E),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFF1E293B)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(13),
                    ),
                    child: Image.network(
                      club.bannerPhoto,
                      fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                          const ColoredBox(
                        color: Color(0xFF1E293B),
                        child: Icon(Icons.stadium, color: Color(0xFF94A3B8)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: IconButton.filledTonal(
                      tooltip: isFavorite
                          ? 'Hapus dari favorit'
                          : 'Tambah ke favorit',
                      visualDensity: VisualDensity.compact,
                      onPressed: () => setState(() {
                        if (isFavorite) {
                          _favoriteClubIds.remove(club.id);
                        } else {
                          _favoriteClubIds.add(club.id);
                        }
                      }),
                      icon: Icon(
                        isFavorite ? Icons.star : Icons.star_border,
                        color: const Color(0xFFFBBF24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    club.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    club.league,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${club.uclTitles}x UCL · ${club.stadiumName}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFFFBBF24),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
