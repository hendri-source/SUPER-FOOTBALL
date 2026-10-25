import 'package:flutter/material.dart';
import '../components/app.assets.dart';
import '../shared/model/club.dart';

class UserProfileCardWidget extends StatelessWidget {
  final String username;
  final Club? favoriteClub;
  final String? profilePhotoUrl;
  final VoidCallback onLogout;
  final VoidCallback onChangeProfilePhoto;
  final VoidCallback? onBackToClubs;

  const UserProfileCardWidget({
    super.key,
    required this.username,
    required this.favoriteClub,
    required this.profilePhotoUrl,
    required this.onLogout,
    required this.onChangeProfilePhoto,
    this.onBackToClubs,
  });

  Widget _buildProfileImage(String? photoSource) {
    final source = photoSource?.trim();

    if (source == null || source.isEmpty) {
      return Image.asset(
        AppAssets.creatorProfile,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const Icon(
          Icons.person,
          size: 48,
          color: Colors.white,
        ),
      );
    }

    if (source.startsWith('assets/')) {
      return Image.asset(
        source,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const Icon(
          Icons.person,
          size: 48,
          color: Colors.white,
        ),
      );
    }

    return Image.network(
      source,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => const Icon(
        Icons.person,
        size: 48,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final supporterText = favoriteClub == null
        ? 'PENGGEMAR SEPAK BOLA'
        : 'SUPORTER ${favoriteClub!.shortName}';

    final clubDescription = favoriteClub?.description ??
        'Klub tersukses dalam sejarah sepak bola dunia dengan rekor 15 trofi Liga Champions UEFA.';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
      decoration: BoxDecoration(
        color: const Color(0xFF0F1C2F),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE7C35B),
          width: 1.2,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          CircleAvatar(
            radius: 48,
            backgroundColor: const Color(0xFF2E3D52),
            child: ClipOval(
              child: SizedBox(
                width: 92,
                height: 92,
                child: _buildProfileImage(profilePhotoUrl),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            username.isNotEmpty ? username : 'Hendri',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: const Color(0xFFE7C35B),
                width: 1.2,
              ),
            ),
            child: Text(
              supporterText,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE7C35B),
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              clubDescription,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFFCBD5E1),
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 18),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: const Color(0xFFE7C35B),
                width: 1.2,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE7C35B).withOpacity(0.18),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.shield,
                    color: Color(0xFFE7C35B),
                    size: 18,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE7C35B).withOpacity(0.14),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: const Color(0xFFE7C35B).withOpacity(0.3),
                          ),
                        ),
                        child: Text(
                          favoriteClub == null ? 'KLUB' : favoriteClub!.league.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 9,
                            color: Color(0xFFE7C35B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          favoriteClub?.name ?? 'Belum memilih klub',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (favoriteClub != null) ...[
            const SizedBox(height: 10),
            Text(
              '${favoriteClub!.city} · ${favoriteClub!.stadiumName}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
            ),
          ],
          const SizedBox(height: 18),
          if (onBackToClubs != null) ...[
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: onBackToClubs,
                icon: const Icon(Icons.arrow_back, size: 16, color: Color(0xFFF87171)),
                label: const Text(
                  'Kembali ke Klub',
                  style: TextStyle(color: Color(0xFFF87171)),
                ),
              ),
            ),
          ],
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 220,
              child: OutlinedButton.icon(
                onPressed: onLogout,
                icon: const Icon(Icons.logout, size: 16, color: Color(0xFFF87171)),
                label: const Text(
                  'Keluar / Ganti Akun',
                  style: TextStyle(
                    color: Color(0xFFF87171),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFF87171), width: 1.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
