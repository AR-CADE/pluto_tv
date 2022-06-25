import 'package:uuid/uuid.dart';

class Profile {
  final String id = const Uuid().v4();
  final String advertisingId;
  final bool terminate;
  final String appVersion;
  final String clientModelNumber;
  final int clientDeviceType;
  final String country;
  final bool deviceDNT;
  final double deviceLat;
  final double deviceLon;
  final String deviceMake;
  final String deviceVersion = "flutter_current_version";
  final bool includeExtendedEvents;
  final String appName;
  final String sessionID;
  final bool serverSideAds;
  final String userId;
  late Map<String, String> queryParams;

  String? clientID;
  String? deviceId;
  String? deviceModel;
  String? deviceType;
  String? marketingRegion;
  String? sid;

  final String? architecture;
  final String? buildVersion;
  final String? clientTime;

  Profile(
      {this.sid,
      this.advertisingId = "",
      this.appName = "flutter",
      this.appVersion = "1",
      this.architecture,
      this.buildVersion,
      this.clientTime,
      this.clientModelNumber = "1.0.0",
      this.clientID,
      this.clientDeviceType = 0,
      this.country = "EARTH",
      this.deviceDNT = false,
      this.terminate = false,
      this.deviceLat = 0,
      this.deviceLon = 0,
      this.deviceMake = "flutter",
      this.deviceModel,
      this.deviceType,
      this.deviceId,
      this.includeExtendedEvents = false,
      this.marketingRegion,
      this.sessionID = "",
      this.serverSideAds = false,
      this.userId = ""}) {
    deviceModel = deviceModel ?? appName;
    deviceType = deviceType ?? appName;
    clientID = clientID ?? id;
    deviceId = deviceId ?? id;
    sid = sid ?? const Uuid().v4();

    marketingRegion = marketingRegion ?? country;

    queryParams = {
      'advertisingId': advertisingId,
      'appName': appName,
      'terminate': terminate.toString(),
      'appVersion': appVersion,
      'architecture': architecture ?? '',
      'buildVersion': buildVersion ?? '',
      'clientTime': clientTime ?? '',
      'deviceDNT': deviceDNT.toString(),
      'deviceId': deviceId ?? '',
      'deviceLat': deviceLat.toString(),
      'deviceLon': deviceLon.toString(),
      'deviceMake': deviceMake,
      'deviceModel': deviceModel ?? '',
      'deviceType': deviceType ?? '',
      'deviceVersion': deviceVersion,
      'includeExtendedEvents': includeExtendedEvents.toString(),
      'marketingRegion': marketingRegion ?? '',
      'country': country,
      'serverSideAds': serverSideAds.toString(),
      'sid': sid ?? '',
      'clientID': clientID ?? '',
      'clientModelNumber': clientModelNumber,
      'clientDeviceType': clientDeviceType.toString(),
      'sessionID': sessionID,
      'userId': userId
    };
  }

  Map<String, String> toMap() {
    return queryParams;
  }

  @override
  String toString() {
    return Uri(queryParameters: queryParams).query;
  }
}
