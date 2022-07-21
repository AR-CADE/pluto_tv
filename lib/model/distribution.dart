class Distribution {
  final bool avod;

  Distribution({required this.avod});

  factory Distribution.fromJSON(Map<String, dynamic> json) {
    return Distribution(avod: json['AVOD'] as bool);
  }
}
