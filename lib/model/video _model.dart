class VideoModel {
  Links? links;
  int? total;
  int? page;
  int? pageSize;
  List<Results>? results;

  VideoModel({this.links, this.total, this.page, this.pageSize, this.results});

  VideoModel.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    total = json['total'];
    page = json['page'];
    pageSize = json['page_size'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    data['total'] = this.total;
    data['page'] = this.page;
    data['page_size'] = this.pageSize;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Links {
  Null? next;
  Null? previous;

  Links({this.next, this.previous});

  Links.fromJson(Map<String, dynamic> json) {
    next = json['next'];
    previous = json['previous'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['next'] = this.next;
    data['previous'] = this.previous;
    return data;
  }
}

class Results {
  String? thumbnail;
  int? id;
  String? title;
  String? dateAndTime;
  String? slug;
  String? createdAt;
  String? manifest;
  int? liveStatus;
  String? liveManifest;
  bool? isLive;
  String? channelImage;
  String? channelName;
  String? channelUsername;
  bool? isVerified;
  String? channelSlug;
  String? channelSubscriber;
  int? channelId;
  String? type;
  String? viewers;
  String? duration;

  Results(
      {this.thumbnail,
      this.id,
      this.title,
      this.dateAndTime,
      this.slug,
      this.createdAt,
      this.manifest,
      this.liveStatus,
      this.liveManifest,
      this.isLive,
      this.channelImage,
      this.channelName,
      this.channelUsername,
      this.isVerified,
      this.channelSlug,
      this.channelSubscriber,
      this.channelId,
      this.type,
      this.viewers,
      this.duration});

  Results.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'];
    id = json['id'];
    title = json['title'];
    dateAndTime = json['date_and_time'];
    slug = json['slug'];
    createdAt = json['created_at'];
    manifest = json['manifest'];
    liveStatus = json['live_status'];
    liveManifest = json['live_manifest'];
    isLive = json['is_live'];
    channelImage = json['channel_image'];
    channelName = json['channel_name'];
    channelUsername = json['channel_username'];
    isVerified = json['is_verified'];
    channelSlug = json['channel_slug'];
    channelSubscriber = json['channel_subscriber'];
    channelId = json['channel_id'];
    type = json['type'];
    viewers = json['viewers'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumbnail'] = this.thumbnail;
    data['id'] = this.id;
    data['title'] = this.title;
    data['date_and_time'] = this.dateAndTime;
    data['slug'] = this.slug;
    data['created_at'] = this.createdAt;
    data['manifest'] = this.manifest;
    data['live_status'] = this.liveStatus;
    data['live_manifest'] = this.liveManifest;
    data['is_live'] = this.isLive;
    data['channel_image'] = this.channelImage;
    data['channel_name'] = this.channelName;
    data['channel_username'] = this.channelUsername;
    data['is_verified'] = this.isVerified;
    data['channel_slug'] = this.channelSlug;
    data['channel_subscriber'] = this.channelSubscriber;
    data['channel_id'] = this.channelId;
    data['type'] = this.type;
    data['viewers'] = this.viewers;
    data['duration'] = this.duration;
    return data;
  }
}
