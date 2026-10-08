class Stadium {
  final String id;
  final String name;
  final String clubName;
  final String city;
  final String country;
  final int capacity;
  final int openedYear;
  final double latitude;
  final double longitude;
  final String imageUrl;
  final String description;
  final String googleMapsUrl;

  const Stadium({
    required this.id,
    required this.name,
    required this.clubName,
    required this.city,
    required this.country,
    required this.capacity,
    required this.openedYear,
    required this.latitude,
    required this.longitude,
    required this.imageUrl,
    required this.description,
    required this.googleMapsUrl,
  });
}
