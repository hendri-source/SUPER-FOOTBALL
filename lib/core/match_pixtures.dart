import 'package:flutter/material.dart';

class MatchFixtureItem {
  final String id;
  final String homeTeam;
  final String awayTeam;
  final String competition;
  final String matchDate;
  final String stadium;
  final bool isDerby;

  const MatchFixtureItem({
    required this.id,
    required this.homeTeam,
    required this.awayTeam,
    required this.competition,
    required this.matchDate,
    required this.stadium,
    this.isDerby = false,
  });
}

class MatchFixturesWidget extends StatelessWidget {
  final List<MatchFixtureItem> fixtures;
  final VoidCallback onOpenSantiagoBernabeu;

  const MatchFixturesWidget({
    super.key,
    required this.fixtures,
    required this.onOpenSantiagoBernabeu,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Jadwal Big Match Mendatang',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: fixtures.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final f = fixtures[index];
            final isElClasico = f.homeTeam.contains('Real Madrid') && f.awayTeam.contains('Barcelona');

            return Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF131B2E),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: isElClasico ? const Color(0xFFFBBF24) : const Color(0xFF1E293B),
                  width: isElClasico ? 1.5 : 1,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0F172A),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: const Color(0xFF334155)),
                        ),
                        child: Text(
                          f.competition,
                          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF38BDF8)),
                        ),
                      ),
                      Text(
                        f.matchDate,
                        style: const TextStyle(fontSize: 11, color: Color(0xFFFBBF24), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Text(
                          f.homeTeam,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: f.homeTeam.contains('Real Madrid') ? const Color(0xFFFBBF24) : Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0F172A),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'VS',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF94A3B8)),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          f.awayTeam,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '📍 ${f.stadium}',
                    style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
