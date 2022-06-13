import 'package:pluto_tv/model/path.dart';
import 'package:pluto_tv/model/profile.dart';
import 'package:pluto_tv/model/slug.dart';
import 'package:pluto_tv/model/stitched.dart';
import 'package:pluto_tv/model/simple_object.dart';

final Profile defaultProfile = Profile();

class Channel implements SimpleObject, Slug {
  final String hash;
  final int number;
  final String summary;
  final String visibility;
  final String onDemandDescription;
  final String category;
  final bool plutoOfficeOnly;
  final bool? directOnly;
  final int chatRoomId;
  final bool onDemand;
  final int cohortMask;
  final Path featuredImage;
  final Path thumbnail;
  final Path tile;
  final Path logo;
  final Path colorLogoSVG;
  final Path colorLogoPNG;
  final Path solidLogoSVG;
  final Path solidLogoPNG;
  final bool featured;
  final int? featuredOrder;
  final bool favorite;
  final bool isStitched;
  final Stitched stitched;

  @override
  String name;

  @override
  String slug;

  @override
  String id;

  Channel(
      {required this.id,
      required this.name,
      required this.slug,
      required this.hash,
      required this.number,
      required this.summary,
      required this.visibility,
      required this.onDemandDescription,
      required this.category,
      required this.plutoOfficeOnly,
      this.directOnly,
      required this.chatRoomId,
      required this.onDemand,
      required this.cohortMask,
      required this.featuredImage,
      required this.thumbnail,
      required this.tile,
      required this.logo,
      required this.colorLogoSVG,
      required this.colorLogoPNG,
      required this.solidLogoSVG,
      required this.solidLogoPNG,
      required this.featured,
      this.featuredOrder,
      required this.favorite,
      required this.isStitched,
      required this.stitched});

  factory Channel.fromJSON(Map<String, dynamic> json) {
    return Channel(
      id: json['_id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      hash: json['hash'] as String,
      number: json['number'] as int,
      summary: json['summary'] as String,
      visibility: json['visibility'] as String,
      onDemandDescription: json['onDemandDescription'] as String,
      category: json['category'] as String,
      plutoOfficeOnly: json['plutoOfficeOnly'] as bool,
      directOnly:
          json['directOnly'] != null ? json['directOnly'] as bool : null,
      chatRoomId: json['chatRoomId'] as int,
      onDemand: json['onDemand'] as bool,
      cohortMask: json['cohortMask'] as int,
      featuredImage: Path.fromJSON(json['featuredImage']),
      thumbnail: Path.fromJSON(json['thumbnail']),
      tile: Path.fromJSON(json['tile']),
      logo: Path.fromJSON(json['logo']),
      colorLogoSVG: Path.fromJSON(json['colorLogoSVG']),
      colorLogoPNG: Path.fromJSON(json['colorLogoPNG']),
      solidLogoSVG: Path.fromJSON(json['solidLogoSVG']),
      solidLogoPNG: Path.fromJSON(json['solidLogoPNG']),
      featured: json['featured'] as bool,
      featuredOrder:
          json['featuredOrder'] != null ? json['featuredOrder'] as int : null,
      favorite: json['favorite'] as bool,
      isStitched: json['isStitched'] as bool,
      stitched: Stitched.fromJSON(json['stitched']),
    );
  }

  String url({Profile? profile}) {
    profile = profile ?? defaultProfile;
    return "https://service-stitcher.clusters.pluto.tv/stitch/hls/channel/$id/master.m3u8?${profile.toString()}";
  }
}
