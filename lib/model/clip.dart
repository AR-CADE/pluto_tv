class Clip {
  final DateTime originalReleaseDate;

  Clip({required this.originalReleaseDate});

  factory Clip.fromJSON(Map<String, dynamic> json) {
    return Clip(
        originalReleaseDate:
            DateTime.parse(json['originalReleaseDate']).toUtc());
  }
}
