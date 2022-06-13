class Path {
  final String path;
  Path({required this.path});

  factory Path.fromJSON(Map<String, dynamic> json) {
    return Path(path: json['path'] as String);
  }
}
