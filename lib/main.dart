import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'home_screen.dart';
import 'stadium_screen.dart';
import 'profile_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SuperFootballApp());
}

class SuperFootballApp extends StatelessWidget {
  const SuperFootballApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super Football',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0F17),
        primaryColor: const Color(0xFFFBBF24), // Aksen Emas Madridista
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFBBF24),
          secondary: Color(0xFF10B981),
          surface: Color(0xFF131B2E),
        ),
        fontFamily: 'Roboto',
      ),
      // ALUR UTAMA: Pertama main.dart abis itu LOGIN baru masuk ke HOME
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/stadiums': (context) => const StadiumMapScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
