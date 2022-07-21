class TimelinesData {
  final String endDateTime;
  final int totalCount;
  final int limit;
  final int dataCount;

  TimelinesData(
      {required this.endDateTime,
      required this.totalCount,
      required this.limit,
      required this.dataCount});

  factory TimelinesData.fromJSON(Map<String, dynamic> json) {
    return TimelinesData(
      endDateTime: json['endDateTime'] as String,
      totalCount: json['totalCount'] as int,
      limit: json['limit'] as int,
      dataCount: json['dataCount'] as int,
    );
  }
}
