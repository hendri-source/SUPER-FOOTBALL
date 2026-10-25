import 'package:flutter/material.dart';
import 'screens/data/football.dart';
import 'shared/model/club.dart';
import 'core/app_navbar.dart';
import 'core/hero_banner.dart';
import 'core/gridview.dart';
import 'core/listview.dart';
import 'core/club_detail.dart';
import 'stadium_screen.dart';
import 'profile_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTabIndex = 0;
  String _selectedStadiumId = 'santiago-bernabeu';
  bool _isGridView = true; // Toggle GridView vs ListView
  final Set<String> _favoriteClubIds = {};
  String _selectedLeague = 'All';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  late List<Club> _allClubs;
  String _username = 'Hendri';
  String _favoriteClub = 'Netral (Semua Klub)';
  bool _routeArgumentsLoaded = false;

  @override
  void initState() {
    super.initState();
    _allClubs = FootballData.clubs;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_routeArgumentsLoaded) return;
    _routeArgumentsLoaded = true;
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      if (args['username'] != null && (args['username'] as String).isNotEmpty) {
        _username = args['username'];
      }
      if (args['favoriteClub'] != null) {
        _favoriteClub = args['favoriteClub'];
        for (final club in _allClubs) {
          if (club.name == _favoriteClub) {
            _favoriteClubIds.add(club.id);
            break;
          }
        }
      }
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Club> get _filteredClubs {
    return _allClubs.where((club) {
      final matchesLeague =
          _selectedLeague == 'All' || club.league == _selectedLeague;
      final q = _searchQuery.toLowerCase().trim();
      final matchesSearch = q.isEmpty ||
          club.name.toLowerCase().contains(q) ||
          club.city.toLowerCase().contains(q) ||
          club.manager.toLowerCase().contains(q) ||
          club.stadiumName.toLowerCase().contains(q);
      return matchesLeague && matchesSearch;
    }).toList();
  }

  List<Club> get _favoriteClubs => _allClubs
      .where((club) => _favoriteClubIds.contains(club.id))
      .toList(growable: false);

  String get _supporterLabel {
    for (final club in _allClubs) {
      if (club.name == _favoriteClub) return club.supporterLabel;
    }
    return 'Football Fan';
  }

  void _toggleFavorite(Club club) {
    setState(() {
      if (!_favoriteClubIds.add(club.id)) {
        _favoriteClubIds.remove(club.id);
      }
    });
  }

  void _openClubDetail(Club club) {
    ClubDetailModalWidget.show(context, club, () {
      _openStadiumMap(club.stadiumId);
    });
  }

  void _openStadiumMap(String stadiumId) {
    setState(() {
      _selectedStadiumId = stadiumId;
      _currentTabIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F17),
      appBar: AppNavbarWidget(
        supporterLabel: _supporterLabel,
        onLogout: () {
          Navigator.pushReplacementNamed(context, '/login');
        },
      ),
      body: IndexedStack(
        index: _currentTabIndex,
        children: [
          _buildClubsTab(),
          StadiumMapScreen(initialStadiumId: _selectedStadiumId),
          ProfileScreen(
            username: _username,
            favoriteClub: _favoriteClub,
            favoriteClubCount: _favoriteClubIds.length,
          ),
          FavoritesScreen(
            clubs: _favoriteClubs,
            favoriteClubIds: _favoriteClubIds,
            onSelectClub: _openClubDetail,
            onToggleFavorite: _toggleFavorite,
            onOpenStadiumMap: _openStadiumMap,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        onTap: (index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
        backgroundColor: const Color(0xFF131B2E),
        selectedItemColor: const Color(0xFFFBBF24),
        unselectedItemColor: const Color(0xFF64748B),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shield_outlined),
            activeIcon: Icon(Icons.shield),
            label: 'Klub Elit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stadium_outlined),
            activeIcon: Icon(Icons.stadium),
            label: 'Peta Stadion',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            activeIcon: Icon(Icons.star),
            label: 'Favorit',
          ),
        ],
      ),
    );
  }

  Widget _buildClubsTab() {
    final clubs = _filteredClubs;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Sapaan untuk pengguna
          HeroBannerWidget(
            username: _username,
          ),
          const SizedBox(height: 18),

          // Search Bar & View Mode Toggle (GridView vs ListView)
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  onChanged: (val) {
                    setState(() {
                      _searchQuery = val;
                    });
                  },
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                  decoration: InputDecoration(
                    hintText: 'Cari klub, kota, atau manajer...',
                    hintStyle:
                        const TextStyle(color: Color(0xFF64748B), fontSize: 13),
                    prefixIcon: const Icon(Icons.search,
                        color: Color(0xFF94A3B8), size: 18),
                    filled: true,
                    fillColor: const Color(0xFF131B2E),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF1E293B)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF1E293B)),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),

              // Tombol Pengubah Mode: GridView vs ListView
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF131B2E),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF1E293B)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.grid_view_rounded,
                        color: _isGridView
                            ? const Color(0xFFFBBF24)
                            : const Color(0xFF64748B),
                        size: 20,
                      ),
                      tooltip: 'Tampilan GridView',
                      onPressed: () {
                        setState(() {
                          _isGridView = true;
                        });
                      },
                    ),
                    Container(
                        width: 1, height: 24, color: const Color(0xFF1E293B)),
                    IconButton(
                      icon: Icon(
                        Icons.format_list_bulleted_rounded,
                        color: !_isGridView
                            ? const Color(0xFFFBBF24)
                            : const Color(0xFF64748B),
                        size: 20,
                      ),
                      tooltip: 'Tampilan ListView',
                      onPressed: () {
                        setState(() {
                          _isGridView = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Filter Liga (Chips)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildLeagueChip('Semua', 'All'),
                _buildLeagueChip('La Liga', 'La Liga'),
                _buildLeagueChip('Premier League', 'Premier League'),
                _buildLeagueChip('Serie A', 'Serie A'),
                _buildLeagueChip('Bundesliga', 'Bundesliga'),
                _buildLeagueChip('Ligue 1', 'Ligue 1'),
              ],
            ),
          ),
          const SizedBox(height: 18),

          // Header Jumlah Klub & Mode Aktif
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Klub Sepak Bola Elit (${clubs.length})',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                _isGridView ? 'GridView' : 'ListView',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFFBBF24),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // 2. Render Komponen GridView atau ListView
          _isGridView
              ? GridViewClubsWidget(
                  clubs: clubs,
                  onSelectClub: _openClubDetail,
                  favoriteClubIds: _favoriteClubIds,
                  onToggleFavorite: _toggleFavorite,
                  onOpenStadiumMap: _openStadiumMap,
                )
              : ListViewClubsWidget(
                  clubs: clubs,
                  onSelectClub: _openClubDetail,
                  favoriteClubIds: _favoriteClubIds,
                  onToggleFavorite: _toggleFavorite,
                  onOpenStadiumMap: _openStadiumMap,
                ),
        ],
      ),
    );
  }

  Widget _buildLeagueChip(String label, String value) {
    final isSelected = _selectedLeague == value;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        selectedColor: const Color(0xFFFBBF24),
        backgroundColor: const Color(0xFF131B2E),
        labelStyle: TextStyle(
          color: isSelected ? const Color(0xFF0B0F17) : const Color(0xFFCBD5E1),
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 12,
        ),
        onSelected: (selected) {
          if (selected) {
            setState(() {
              _selectedLeague = value;
            });
          }
        },
      ),
    );
  }
}
