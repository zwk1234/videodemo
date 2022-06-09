///解放生产力：在线json转dart https://www.devio.org/io/tools/json-to-dart/
class HomeMo {
  List<BannerMo>? bannerList;
  List<CategoryMo>? categoryList;
  List<VideoMo>? videoList;

  HomeMo({this.bannerList, this.categoryList, this.videoList});

  HomeMo.fromJson(Map<String, dynamic> json) {
    if (json['bannerList'] != null) {
      bannerList = List<BannerMo>.empty(growable: true);
      json['bannerList'].forEach((v) {
        bannerList?.add(BannerMo.fromJson(v));
      });
    }
    if (json['categoryList'] != null) {
      categoryList = List<CategoryMo>.empty(growable: true);
      json['categoryList'].forEach((v) {
        categoryList?.add(CategoryMo.fromJson(v));
      });
    }
    if (json['videoList'] != null) {
      videoList = List<VideoMo>.empty(growable: true);
      json['videoList'].forEach((v) {
        videoList?.add(VideoMo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bannerList != null) {
      data['bannerList'] = bannerList?.map((v) => v.toJson()).toList();
    }
    if (categoryList != null) {
      data['categoryList'] = categoryList?.map((v) => v.toJson()).toList();
    }
    if (videoList != null) {
      data['videoList'] = videoList?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannerMo {
  String? id;
  int? sticky;
  String? type;
  String? title;
  String? subtitle;
  String? url;
  String? cover;
  String? createTime;

  BannerMo(
      {this.id,
      this.sticky,
      this.type,
      this.title,
      this.subtitle,
      this.url,
      this.cover,
      this.createTime});

  BannerMo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sticky = json['sticky'];
    type = json['type'];
    title = json['title'];
    subtitle = json['subtitle'];
    url = json['url'];
    cover = json['cover'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sticky'] = sticky;
    data['type'] = type;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['url'] = url;
    data['cover'] = cover;
    data['createTime'] = createTime;
    return data;
  }
}

class CategoryMo {
  String? name;
  int? count;

  CategoryMo({this.name, this.count});

  CategoryMo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['count'] = count;
    return data;
  }
}

class VideoMo {
  String? id;
  String? vid;
  String? title;
  String? tname;
  String? url;
  String? cover;
  int? pubdate;
  String? desc;
  int? view;
  int? duration;
  Owner? owner;
  int? reply;
  int? favorite;
  int? like;
  int? coin;
  int? share;
  String? createTime;
  int? size;

  VideoMo(
      {this.id,
      this.vid,
      this.title,
      this.tname,
      this.url,
      this.cover,
      this.pubdate,
      this.desc,
      this.view,
      this.duration,
      this.owner,
      this.reply,
      this.favorite,
      this.like,
      this.coin,
      this.share,
      this.createTime,
      this.size});

  VideoMo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vid = json['vid'];
    title = json['title'];
    tname = json['tname'];
    url = json['url'];
    cover = json['cover'];
    pubdate = json['pubdate'];
    desc = json['desc'];
    view = json['view'];
    duration = json['duration'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    reply = json['reply'];
    favorite = json['favorite'];
    like = json['like'];
    coin = json['coin'];
    share = json['share'];
    createTime = json['createTime'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vid'] = vid;
    data['title'] = title;
    data['tname'] = tname;
    data['url'] = url;
    data['cover'] = cover;
    data['pubdate'] = pubdate;
    data['desc'] = desc;
    data['view'] = view;
    data['duration'] = duration;
    if (owner != null) {
      data['owner'] = owner?.toJson();
    }
    data['reply'] = reply;
    data['favorite'] = favorite;
    data['like'] = this.like;
    data['coin'] = this.coin;
    data['share'] = this.share;
    data['createTime'] = this.createTime;
    data['size'] = this.size;
    return data;
  }
}

class Owner {
  String? name;
  String? face;
  int? fans;

  Owner({this.name, this.face, this.fans});

  Owner.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    face = json['face'];
    fans = json['fans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['face'] = face;
    data['fans'] = fans;
    return data;
  }
}
