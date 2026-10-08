class Club {
  final String id;
  final String name;
  final String shortName;
  final String league;
  final String country;
  final String city;
  final String logoUrl;
  final String bannerPhoto;
  final int uclTitles;
  final int leagueTitles;
  final String stadiumName;
  final String stadiumId;
  final int stadiumCapacity;
  final String manager;
  final String marketValue;
  final bool isMadridFavorite;
  final List<String> starPlayers;
  final String description;
  final String characteristics;
  final String playingStyle;

  const Club({
    required this.id,
    required this.name,
    required this.shortName,
    required this.league,
    required this.country,
    required this.city,
    required this.logoUrl,
    required this.bannerPhoto,
    required this.uclTitles,
    required this.leagueTitles,
    required this.stadiumName,
    required this.stadiumId,
    required this.stadiumCapacity,
    required this.manager,
    required this.marketValue,
    this.isMadridFavorite = false,
    required this.starPlayers,
    required this.description,
    required this.characteristics,
    required this.playingStyle,
  });
}
