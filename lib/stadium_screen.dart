import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'screens/data/football.dart';
import 'shared/model/stadium.dart';

class StadiumMapScreen extends StatefulWidget {
  final String initialStadiumId;

  const StadiumMapScreen({
    super.key,
    this.initialStadiumId = 'santiago-bernabeu',
  });

  @override
  State<StadiumMapScreen> createState() => _StadiumMapScreenState();
}

class _StadiumMapScreenState extends State<StadiumMapScreen> {
  final List<Stadium> _stadiums = FootballData.stadiums;
  late Stadium _selectedStadium;

  @override
  void initState() {
    super.initState();
    _selectedStadium = _findStadium(widget.initialStadiumId);
  }

  @override
  void didUpdateWidget(covariant StadiumMapScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialStadiumId != widget.initialStadiumId) {
      _selectedStadium = _findStadium(widget.initialStadiumId);
    }
  }

  Stadium _findStadium(String id) => _stadiums.firstWhere(
        (stadium) => stadium.id == id,
        orElse: () => _stadiums.first,
      );

  void _selectStadium(Stadium stadium) {
    setState(() {
      _selectedStadium = stadium;
    });
  }

  Future<void> _openGoogleMaps(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Tidak dapat membuka peta: $url'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F17),
      appBar: AppBar(
        title: const Text(
          'Peta Stadion Elit (Google Maps)',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        backgroundColor: const Color(0xFF131B2E),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.open_in_new, color: Color(0xFFFBBF24)),
            tooltip: 'Buka di Google Maps',
            onPressed: () => _openGoogleMaps(_selectedStadium.googleMapsUrl),
          ),
        ],
      ),
      body: Column(
        children: [
          // Banner Tampilan Visual Peta Satelit Interaktif
          Expanded(
            flex: 6,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Foto Stadion Asli Resolusi Tinggi
                Image.network(
                  _selectedStadium.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFF1E293B),
                      child: const Center(
                        child: Icon(Icons.stadium,
                            size: 64, color: Color(0xFF64748B)),
                      ),
                    );
                  },
                ),
                // Gradien Overlay untuk keterbacaan teks
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                        Colors.black.withOpacity(0.9),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),

                // Pin Marker Koordinat Google Maps
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFBBF24),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: const Color(0xFF0B0F17),
                              size: 18,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              _selectedStadium.name,
                              style: TextStyle(
                                color: const Color(0xFF0B0F17),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Icon(
                        Icons.place,
                        size: 42,
                        color: const Color(0xFFFBBF24),
                      ),
                    ],
                  ),
                ),

                // Info Badge di Pojok Bawah Peta
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 16,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF131B2E).withOpacity(0.92),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFFFBBF24),
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                _selectedStadium.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${_selectedStadium.clubName} · ${_selectedStadium.city}, ${_selectedStadium.country}',
                          style: const TextStyle(
                              color: Color(0xFF94A3B8), fontSize: 13),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            _buildInfoChip(
                              Icons.people_outline,
                              '${_selectedStadium.capacity} Kursi',
                            ),
                            const SizedBox(width: 8),
                            _buildInfoChip(
                              Icons.history,
                              'Buka ${_selectedStadium.openedYear}',
                            ),
                            const SizedBox(width: 8),
                            _buildInfoChip(
                              Icons.gps_fixed,
                              '${_selectedStadium.latitude.toStringAsFixed(2)}, ${_selectedStadium.longitude.toStringAsFixed(2)}',
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () =>
                                _openGoogleMaps(_selectedStadium.googleMapsUrl),
                            icon: const Icon(Icons.navigation, size: 18),
                            label:
                                const Text('Buka Navigasi di Google Maps Asli'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF10B981),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Pilihan Daftar Stadion di Bagian Bawah
          Expanded(
            flex: 4,
            child: Container(
              color: const Color(0xFF0B0F17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
                    child: Text(
                      'Pilih Stadion Ikonik Eropa:',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFCBD5E1),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      itemCount: _stadiums.length,
                      itemBuilder: (context, index) {
                        final st = _stadiums[index];
                        final isSelected = st.id == _selectedStadium.id;
                        return GestureDetector(
                          onTap: () {
                            _selectStadium(st);
                          },
                          child: Container(
                            width: 200,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF131B2E),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFFFBBF24)
                                    : const Color(0xFF1E293B),
                                width: isSelected ? 2 : 1,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12)),
                                  child: Image.network(
                                    st.imageUrl,
                                    height: 80,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        st.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: isSelected
                                              ? const Color(0xFFFBBF24)
                                              : Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        st.clubName,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 11,
                                          color: Color(0xFF94A3B8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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

  Widget _buildInfoChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: const Color(0xFF94A3B8)),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(fontSize: 11, color: Color(0xFFE2E8F0)),
          ),
        ],
      ),
    );
  }
}
