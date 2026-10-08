class Player {
  final String id;
  final String name;
  final int number;
  final String position; // FW, MF, DF, GK
  final String nationality;
  final int age;
  final int rating;
  final String marketValue;
  final int goals;
  final int assists;
  final int appearances;
  final int passAccuracy;
  final String preferredFoot;
  final String photoUrl;
  final String clubName;
  final String bio;

  const Player({
    required this.id,
    required this.name,
    required this.number,
    required this.position,
    required this.nationality,
    required this.age,
    required this.rating,
    required this.marketValue,
    required this.goals,
    required this.assists,
    this.appearances = 32,
    this.passAccuracy = 86,
    this.preferredFoot = 'Kanan',
    required this.photoUrl,
    required this.clubName,
    required this.bio,
  });

  Player copyWith({String? photoUrl}) {
    return Player(
      id: id,
      name: name,
      number: number,
      position: position,
      nationality: nationality,
      age: age,
      rating: rating,
      marketValue: marketValue,
      goals: goals,
      assists: assists,
      appearances: appearances,
      passAccuracy: passAccuracy,
      preferredFoot: preferredFoot,
      photoUrl: photoUrl ?? this.photoUrl,
      clubName: clubName,
      bio: bio,
    );
  }
}
