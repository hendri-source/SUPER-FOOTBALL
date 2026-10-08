import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'core/gridview.dart';
import 'shared/model/club.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Club> clubs;
  final Set<String> favoriteClubIds;
  final ValueChanged<Club> onSelectClub;
  final ValueChanged<Club> onToggleFavorite;
  final ValueChanged<String> onOpenStadiumMap;

  const FavoritesScreen({
    super.key,
    required this.clubs,
    required this.favoriteClubIds,
    required this.onSelectClub,
    required this.onToggleFavorite,
    required this.onOpenStadiumMap,
  });

  static const _prices = <String, int>{
    'real-madrid': 1750000,
    'barcelona': 1690000,
    'manchester-city': 1590000,
    'liverpool': 1590000,
    'arsenal': 1590000,
    'bayern-munich': 1590000,
    'inter-milan': 1490000,
    'psg': 1690000,
    'atletico-madrid': 1490000,
    'tottenham': 1490000,
    'manchester-united': 1590000,
    'chelsea': 1590000,
    'juventus': 1490000,
    'borussia-dortmund': 1490000,
  };

  static const _officialStores = <String, String>{
    'real-madrid': 'https://shop.realmadrid.com/',
    'barcelona': 'https://store.fcbarcelona.com/',
    'manchester-city': 'https://shop.mancity.com/',
    'liverpool': 'https://store.liverpoolfc.com/',
    'arsenal': 'https://arsenaldirect.arsenal.com/',
    'bayern-munich': 'https://fcbayern.com/shop/en',
    'inter-milan': 'https://store.inter.it/',
    'psg': 'https://store.psg.fr/',
    'atletico-madrid': 'https://shop.atleticodemadrid.com/',
    'tottenham': 'https://shop.tottenhamhotspur.com/',
    'manchester-united': 'https://store.manutd.com/',
    'chelsea': 'https://shop.chelseafc.com/',
    'juventus': 'https://store.juventus.com/',
    'borussia-dortmund': 'https://shop.bvb.de/',
  };

  static const _ticketPrices = <String, int>{
    'real-madrid': 750000,
    'barcelona': 650000,
    'manchester-city': 700000,
    'liverpool': 620000,
    'arsenal': 680000,
    'bayern-munich': 750000,
    'inter-milan': 550000,
    'psg': 600000,
    'atletico-madrid': 500000,
    'tottenham': 580000,
    'manchester-united': 640000,
    'chelsea': 650000,
    'juventus': 520000,
    'borussia-dortmund': 480000,
  };

  static const _officialTicketLinks = <String, String>{
    'real-madrid': 'https://www.realmadrid.com/en/tickets',
    'barcelona': 'https://www.fcbarcelona.com/en/tickets',
    'manchester-city': 'https://www.mancity.com/tickets',
    'liverpool': 'https://www.liverpoolfc.com/tickets',
    'arsenal': 'https://www.arsenal.com/tickets',
    'bayern-munich': 'https://fcbayern.com/en/tickets',
    'inter-milan': 'https://www.inter.it/en/tickets',
    'psg': 'https://www.psg.fr/en/tickets',
    'atletico-madrid': 'https://www.atleticodemadrid.com/en/tickets',
    'tottenham': 'https://www.tottenhamhotspur.com/tickets/',
    'manchester-united': 'https://www.manutd.com/tickets',
    'chelsea': 'https://www.chelseafc.com/en/tickets',
    'juventus': 'https://www.juventus.com/en/tickets',
    'borussia-dortmund': 'https://www.bvb.de/eng/Tickets',
  };

  Future<void> _showPurchaseGuide(BuildContext context, Club club) async {
    var selectedSize = 'M';
    final price = _prices[club.id] ?? 1490000;
    final storeUrl = _officialStores[club.id];

    await showDialog<void>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          backgroundColor: const Color(0xFF131B2E),
          title: Text('Jersey ${club.shortName}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Estimasi harga: ${_formatPrice(price)}',
                style: const TextStyle(
                    color: Color(0xFFFBBF24), fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: selectedSize,
                decoration: const InputDecoration(labelText: 'Pilih ukuran'),
                items: const ['S', 'M', 'L', 'XL', 'XXL']
                    .map((size) => DropdownMenuItem(
                          value: size,
                          child: Text(size),
                        ))
                    .toList(),
                onChanged: (size) {
                  if (size != null) setDialogState(() => selectedSize = size);
                },
              ),
              const SizedBox(height: 12),
              const Text(
                'Cara beli: pilih ukuran, lanjut ke toko resmi klub, lalu cek harga akhir, pembayaran, dan pengiriman di sana.',
                style: TextStyle(
                    color: Color(0xFFCBD5E1), fontSize: 12, height: 1.4),
              ),
              const SizedBox(height: 8),
              const Text(
                'Harga di aplikasi hanya estimasi dan dapat berubah.',
                style: TextStyle(color: Color(0xFF94A3B8), fontSize: 11),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Tutup'),
            ),
            FilledButton.icon(
              onPressed: storeUrl == null
                  ? null
                  : () async {
                      Navigator.pop(dialogContext);
                      final uri = Uri.parse(storeUrl);
                      if (!await launchUrl(
                            uri,
                            mode: LaunchMode.externalApplication,
                          ) &&
                          context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Toko resmi tidak dapat dibuka.')),
                        );
                      }
                    },
              icon: const Icon(Icons.open_in_new, size: 16),
              label: const Text('Toko resmi'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openExternalLink(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        ) &&
        context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tautan resmi tidak dapat dibuka.')),
      );
    }
  }

  String _formatPrice(int price) {
    final digits = price.toString();
    final groups = <String>[];
    for (var end = digits.length; end > 0; end -= 3) {
      final start = end - 3 < 0 ? 0 : end - 3;
      groups.insert(0, digits.substring(start, end));
    }
    return 'Rp${groups.join('.')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F17),
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.star, color: Color(0xFFFBBF24)),
            SizedBox(width: 8),
            Text('Klub Favorit'),
          ],
        ),
        backgroundColor: const Color(0xFF131B2E),
      ),
      body: clubs.isEmpty
          ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star_border, size: 48, color: Color(0xFF64748B)),
                  SizedBox(height: 10),
                  Text(
                    'Belum ada klub favorit',
                    style: TextStyle(color: Color(0xFFCBD5E1), fontSize: 14),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Klub Tersimpan',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  GridViewClubsWidget(
                    clubs: clubs,
                    favoriteClubIds: favoriteClubIds,
                    onSelectClub: onSelectClub,
                    onToggleFavorite: onToggleFavorite,
                    onOpenStadiumMap: onOpenStadiumMap,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Jersey Klub Favorit',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  ...clubs.map((club) => _buildJerseyOffer(context, club)),
                  const SizedBox(height: 24),
                  const Text(
                    'Tiket Masuk Stadion',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  ...clubs.map((club) => _buildTicketOffer(context, club)),
                ],
              ),
            ),
    );
  }

  Widget _buildTicketOffer(BuildContext context, Club club) {
    final ticketPrice = _ticketPrices[club.id] ?? 500000;
    final officialTicketUrl = _officialTicketLinks[club.id];

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF131B2E),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.horizontal(left: Radius.circular(9)),
            child: Image.network(
              club.bannerPhoto,
              width: 104,
              height: 112,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const SizedBox(
                width: 104,
                height: 112,
                child: ColoredBox(
                  color: Color(0xFF1E293B),
                  child:
                      Icon(Icons.stadium, color: Color(0xFFFBBF24), size: 34),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    club.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    club.stadiumName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        const TextStyle(color: Color(0xFF94A3B8), fontSize: 11),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Mulai ${_formatPrice(ticketPrice)}',
                    style: const TextStyle(
                        color: Color(0xFFFBBF24),
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  const SizedBox(height: 6),
                  if (officialTicketUrl != null)
                    OutlinedButton.icon(
                      onPressed: () =>
                          _openExternalLink(context, officialTicketUrl),
                      icon: const Icon(Icons.open_in_new, size: 15),
                      label: const Text('Link resmi'),
                      style: OutlinedButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                        foregroundColor: const Color(0xFF60A5FA),
                        side: const BorderSide(color: Color(0xFF60A5FA)),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJerseyOffer(BuildContext context, Club club) {
    final price = _prices[club.id] ?? 1490000;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF131B2E),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.horizontal(left: Radius.circular(9)),
            child: Image.network(
              club.bannerPhoto,
              width: 92,
              height: 112,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const SizedBox(
                width: 92,
                height: 112,
                child: ColoredBox(
                  color: Color(0xFF1E293B),
                  child:
                      Icon(Icons.checkroom, color: Color(0xFFFBBF24), size: 34),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(club.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text('Jersey kandang · musim 2026/27',
                      style: TextStyle(color: Color(0xFF94A3B8), fontSize: 11)),
                  const SizedBox(height: 6),
                  Text(
                    _formatPrice(price),
                    style: const TextStyle(
                        color: Color(0xFFFBBF24),
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  const SizedBox(height: 6),
                  OutlinedButton.icon(
                    onPressed: () => _showPurchaseGuide(context, club),
                    icon: const Icon(Icons.shopping_bag_outlined, size: 15),
                    label: const Text('Cara beli'),
                    style: OutlinedButton.styleFrom(
                      visualDensity: VisualDensity.compact,
                      foregroundColor: const Color(0xFF10B981),
                      side: const BorderSide(color: Color(0xFF10B981)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
