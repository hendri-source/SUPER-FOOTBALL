import 'package:flutter/material.dart';
import 'core/user_profil.dart';
import 'screens/data/football.dart';
import 'shared/model/club.dart';

class ProfileScreen extends StatefulWidget {
  final String username;
  final String favoriteClub;
  final VoidCallback? onBackToClubs;
  final int favoriteClubCount;

  const ProfileScreen({
    super.key,
    this.username = 'Penggemar Sepak Bola',
    this.favoriteClub = 'Netral (Semua Klub)',
    this.onBackToClubs,
    this.favoriteClubCount = 0,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const String _defaultCreatorBio =
      'Sepak bola bukan sekadar permainan, tetapi semangat dan kebersamaan yang menyatukan kita.';
  static const String _defaultProfilePhotoUrl =
      'https://png.pngtree.com/background/20230611/original/pngtree-profile-man-silhouette-picture-image_3122035.jpg';
  static const String _defaultCreatorPhotoUrl =
      'https://cdnstatic.tencentcs.com/edgeone/pages/assets/1791418456695-2WyV.png';

  String? _profilePhotoUrl = _defaultProfilePhotoUrl;
  String? _creatorPhotoUrl = _defaultCreatorPhotoUrl;
  String _creatorName = 'Hendri';
  String _creatorBio = _defaultCreatorBio;

  Club? get _favoriteClub {
    for (final club in FootballData.clubs) {
      if (club.name == widget.favoriteClub) return club;
    }
    return null;
  }

  Future<void> _editProfilePhoto() async {
    final controller = TextEditingController(text: _profilePhotoUrl ?? '');
    final formKey = GlobalKey<FormState>();
    final shouldSave = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: const Color(0xFF131B2E),
        title: const Text('Ubah Foto Profil'),
        content: Form(
          key: formKey,
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.url,
            autofocus: true,
            decoration: const InputDecoration(
              labelText: 'URL Foto Profil',
              hintText: 'https://contoh.com/foto.jpg',
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) return null;
              final uri = Uri.tryParse(value.trim());
              if (uri == null ||
                  !uri.hasAuthority ||
                  !{'http', 'https'}.contains(uri.scheme)) {
                return 'Masukkan URL gambar langsung yang diawali http:// atau https://.';
              }
              return null;
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.pop(dialogContext, true);
              }
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
    if (shouldSave == true && mounted) {
      setState(() {
        final url = controller.text.trim();
        _profilePhotoUrl = url.isEmpty ? _defaultProfilePhotoUrl : url;
      });
    }
    controller.dispose();
  }

  Future<void> _editCreatorProfile() async {
    final nameController = TextEditingController(text: _creatorName);
    final bioController = TextEditingController(text: _creatorBio);
    final photoController = TextEditingController(text: _creatorPhotoUrl ?? '');
    final formKey = GlobalKey<FormState>();

    final shouldSave = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: const Color(0xFF131B2E),
        title: const Text('Ubah Profil Pembuat'),
        content: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: 'Nama Pembuat',
                    hintText: 'Masukkan nama',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: bioController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Bio Pembuat',
                    hintText: 'Tuliskan bio singkat',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Bio tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: photoController,
                  keyboardType: TextInputType.url,
                  decoration: const InputDecoration(
                    labelText: 'URL Foto Pembuat',
                    hintText: 'https://contoh.com/foto.jpg',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) return null;
                    final uri = Uri.tryParse(value.trim());
                    if (uri == null ||
                        !uri.hasAuthority ||
                        !{'http', 'https'}.contains(uri.scheme)) {
                      return 'Masukkan URL gambar langsung yang diawali http:// atau https://.';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.pop(dialogContext, true);
              }
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );

    if (shouldSave == true && mounted) {
      setState(() {
        _creatorName = nameController.text.trim();
        _creatorBio = bioController.text.trim();
        final photoUrl = photoController.text.trim();
        _creatorPhotoUrl = photoUrl.isEmpty ? _defaultCreatorPhotoUrl : photoUrl;
      });
    }

    nameController.dispose();
    bioController.dispose();
    photoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F17),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 1. Komponen Kartu Profil Netral
            UserProfileCardWidget(
              username: widget.username,
              favoriteClub: _favoriteClub,
              profilePhotoUrl: _profilePhotoUrl,
              onChangeProfilePhoto: _editProfilePhoto,
              onBackToClubs: widget.onBackToClubs,
              onLogout: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
            const SizedBox(height: 16),
            _buildCreatorCard(),
            const SizedBox(height: 16),

            if (_favoriteClub != null) ...[
              _buildSection(
                title: 'Tentang ${_favoriteClub!.name}',
                icon: Icons.shield,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _favoriteClub!.description,
                      style: const TextStyle(
                          color: Color(0xFFCBD5E1), fontSize: 13, height: 1.5),
                    ),
                    const SizedBox(height: 12),
                    _buildStatRow(
                      'Kompetisi',
                      _favoriteClub!.league,
                      Icons.emoji_events,
                    ),
                    _buildStatRow(
                      'Pelatih',
                      _favoriteClub!.manager,
                      Icons.sports,
                    ),
                    _buildStatRow(
                      'Kandang',
                      _favoriteClub!.stadiumName,
                      Icons.stadium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              _buildSection(
                title: 'Catatan Klub',
                icon: Icons.military_tech,
                child: Row(
                  children: [
                    Expanded(
                      child: _buildAchievement(
                          '${_favoriteClub!.uclTitles}', 'Gelar UCL', Icons.emoji_events),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildAchievement(
                          '${_favoriteClub!.leagueTitles}', 'Gelar Liga', Icons.shield),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildAchievement(
                          '${_favoriteClub!.stadiumCapacity}', 'Kapasitas', Icons.people),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              _buildSection(
                title: 'Pemain Bintang',
                icon: Icons.star,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _favoriteClub!.starPlayers
                      .map((player) => Chip(
                            avatar: const Icon(Icons.sports_soccer,
                                size: 15, color: Color(0xFFFBBF24)),
                            label: Text(player),
                            backgroundColor: const Color(0xFF0F172A),
                            side: const BorderSide(color: Color(0xFF334155)),
                            labelStyle: const TextStyle(
                                color: Color(0xFFE2E8F0), fontSize: 12),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 14),
            ],

            _buildSection(
              title: 'Aktivitas Penggemar',
              icon: Icons.insights,
              child: Row(
                children: [
                  Expanded(
                    child: _buildAchievement(
                      '${widget.favoriteClubCount}',
                      'Klub Favorit',
                      Icons.star,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildAchievement(
                      '${_favoriteClub?.starPlayers.length ?? 0}',
                      'Pemain Bintang',
                      Icons.groups,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildAchievement(
                      _favoriteClub?.shortName ?? 'ALL',
                      'Dukungan',
                      Icons.favorite,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            _buildSection(
              title: 'Preferensi Sepak Bola',
              icon: Icons.tune,
              child: Column(
                children: [
                  _buildStatRow('Formasi', '4-3-3 / 4-2-3-1', Icons.view_quilt),
                  _buildStatRow(
                    'Karakteristik',
                    _favoriteClub?.characteristics ?? 'Sepak bola Eropa',
                    Icons.shield_outlined,
                  ),
                  _buildStatRow(
                    'Gaya Main',
                    _favoriteClub?.playingStyle ?? 'Beragam sesuai klub',
                    Icons.speed,
                  ),
                  _buildStatRow('Kompetisi', 'Liga Eropa & turnamen UEFA',
                      Icons.emoji_events),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0xFFFBBF24)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
            ),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF131B2E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: const Color(0xFFFBBF24)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(title,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }

  Widget _buildCreatorCard() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF131B2E), Color(0xFF1E293B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFFBBF24).withOpacity(0.45)),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 34,
                backgroundColor: const Color(0xFF0F172A),
                child: ClipOval(
                  child: SizedBox(
                    width: 68,
                    height: 68,
                    child: Image.network(
                      _creatorPhotoUrl ?? _defaultCreatorPhotoUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 36,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'PEMBUAT SUPER FOOTBALL',
                      style: TextStyle(
                        color: Color(0xFFFBBF24),
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _creatorName.isEmpty ? 'Hendri' : _creatorName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _creatorBio.isEmpty ? _defaultCreatorBio : _creatorBio,
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
        ),
      ],
    );
  }

  Widget _buildAchievement(String value, String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFFFBBF24), size: 17),
          const SizedBox(height: 5),
          Text(value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 3),
          Text(label,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 10)),
        ],
      ),
    );
  }
}
