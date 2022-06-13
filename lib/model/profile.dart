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
  }

  @override
  String toString() {
    return "advertisingId=$advertisingId&appName=$appName&terminate=$terminate&appVersion=$appVersion${architecture != null ? "&architecture=$architecture" : ""}${buildVersion != null ? "&buildVersion=$buildVersion" : ""}${clientTime != null ? "&clientTime=$clientTime" : ""}&deviceDNT=$deviceDNT&deviceId=$deviceId&deviceLat=$deviceLat&deviceLon=$deviceLon&deviceMake=$deviceMake&deviceModel=$deviceModel&deviceType=$deviceType&deviceVersion=$deviceVersion&includeExtendedEvents=$includeExtendedEvents&marketingRegion=$marketingRegion&country=$country&serverSideAds=$serverSideAds&sid=$sid&clientID=$clientID&clientModelNumber=$clientModelNumber&clientDeviceType=$clientDeviceType&sessionID=$sessionID&userId=$userId";
  }
}
