import 'package:flutter/material.dart';

class AppNavbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onLogout;

  const AppNavbarWidget({
    super.key,
    required this.onLogout,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF131B2E),
      elevation: 0,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFBBF24), Color(0xFFD97706)],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.sports_soccer, color: Color(0xFF0B0F17), size: 16),
          ),
          const SizedBox(width: 8),
          const Text(
            'SUPER FOOTBALL',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              letterSpacing: 1.1,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0xFFFBBF24).withOpacity(0.2),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: const Color(0xFFFBBF24).withOpacity(0.4)),
            ),
            child: const Text(
              'Madridista',
              style: TextStyle(color: Color(0xFFFBBF24), fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout_rounded, color: Color(0xFF94A3B8), size: 20),
          tooltip: 'Keluar ke Menu Masuk',
          onPressed: onLogout,
        ),
      ],
    );
  }
}
