import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pluto_tv/model/channel.dart';
import 'package:pluto_tv/model/profile.dart';
import 'dart:async';
import 'dart:convert';

import 'package:pluto_tv/model/timelines.dart';

class API {
  static Future<void> boot({
    Profile? profile,
  }) async {
    profile = profile ?? Profile(appName: "web");

    Map<String, String> queryParams = {
      'appName': profile.appName,
      'appVersion': profile.appVersion,
      'clientTime': DateTime.now().toUtc().toIso8601String(),
      'deviceMake': profile.deviceMake,
      'deviceModel': profile.deviceModel ?? '',
      'deviceType': profile.deviceType ?? '',
      'deviceVersion': profile.deviceVersion,
      'serverSideAds': profile.serverSideAds.toString(),
      'clientID': profile.clientID ?? '',
      'clientModelNumber': profile.clientModelNumber,
      'constraints': '',
      'channelSlug': ''
    };

    http.Response response = await http.get(
      Uri(
          scheme: 'https',
          host: 'boot.pluto.tv',
          path: 'v4/start',
          queryParameters: queryParams),
    );

    if (response.statusCode == 200) {
      debugPrint(response.body);
      return;
    } else {
      throw Exception("Failed to boot");
    }
  }

  static Future<List<Channel>> getChannelList({
    DateTime? start,
    DateTime? end,
  }) async {
    start = start ?? DateTime.now();
    end = DateTime.now().add(const Duration(minutes: 45));

    Map<String, String> queryParams = {
      'start': start.toUtc().toIso8601String(),
      'stop': end.toUtc().toIso8601String()
    };

    http.Response response = await http.get(
      Uri(
          scheme: 'https',
          host: 'api.pluto.tv',
          path: 'v2/channels',
          queryParameters: queryParams),
    );

    if (response.statusCode == 200) {
      return compute(parseChannels, response.bodyBytes);
    } else {
      throw Exception(
          "Failed to Load channel list {start: ${start.toUtc().toIso8601String()}, end: ${end.toUtc().toIso8601String()}}");
    }
  }

  static List<Channel> parseChannels(Uint8List bodyBytes) {
    Iterable iterable = json.decode(const Utf8Decoder().convert(bodyBytes));

    List<Channel> channels = []..length;

    for (final e in iterable) {
      channels.add(Channel.fromJSON(e));
    }

    return channels;
  }

  static Future<Timelines> getTimelines(List<String> channelIds,
      {DateTime? start, int duration = 240}) async {
    start = start ?? DateTime.now();

    Map<String, String> queryParams = {
      'start': start.toUtc().toIso8601String(),
      'channelIds': channelIds.join(','),
      'duration': duration.toString()
    };

    http.Response response = await http.get(Uri(
        scheme: 'https',
        host: 'service-channels.clusters.pluto.tv',
        path: 'v2/guide/timelines',
        queryParameters: queryParams));

    if (response.statusCode == 200) {
      return compute(parseTimelines, response.bodyBytes);
    } else {
      throw Exception(
          "Failed to Load timelines  {channel ids [${channelIds.join(',')}], start: ${start.toUtc().toIso8601String()}, duration: $duration }");
    }
  }

  static Timelines parseTimelines(Uint8List bodyBytes) {
    dynamic jsonBody = json.decode(const Utf8Decoder().convert(bodyBytes));
    return Timelines.fromJSON(jsonBody);
  }
}
