class CoinsInfoModel {
  String? id;
  String? name;
  String? symbol;
  int? rank;
  bool? isNew;
  bool? isActive;
  String? type;
  String? logo;
  List<Tags>? tags;
  List<Team>? team;
  String? description;
  String? message;
  bool? openSource;
  String? startedAt;
  String? developmentStatus;
  bool? hardwareWallet;
  String? proofType;
  String? orgStructure;
  String? hashAlgorithm;
  Links? links;
  List<LinksExtended>? linksExtended;
  Whitepaper? whitepaper;
  String? firstDataAt;
  String? lastDataAt;

  CoinsInfoModel(
      {this.id,
        this.name,
        this.symbol,
        this.rank,
        this.isNew,
        this.isActive,
        this.type,
        this.logo,
        this.tags,
        this.team,
        this.description,
        this.message,
        this.openSource,
        this.startedAt,
        this.developmentStatus,
        this.hardwareWallet,
        this.proofType,
        this.orgStructure,
        this.hashAlgorithm,
        this.links,
        this.linksExtended,
        this.whitepaper,
        this.firstDataAt,
        this.lastDataAt});

  CoinsInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    rank = json['rank'];
    isNew = json['is_new'];
    isActive = json['is_active'];
    type = json['type'];
    logo = json['logo'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    if (json['team'] != null) {
      team = <Team>[];
      json['team'].forEach((v) {
        team!.add(Team.fromJson(v));
      });
    }
    description = json['description'];
    message = json['message'];
    openSource = json['open_source'];
    startedAt = json['started_at'];
    developmentStatus = json['development_status'];
    hardwareWallet = json['hardware_wallet'];
    proofType = json['proof_type'];
    orgStructure = json['org_structure'];
    hashAlgorithm = json['hash_algorithm'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    if (json['links_extended'] != null) {
      linksExtended = <LinksExtended>[];
      json['links_extended'].forEach((v) {
        linksExtended!.add(LinksExtended.fromJson(v));
      });
    }
    whitepaper = json['whitepaper'] != null
        ? Whitepaper.fromJson(json['whitepaper'])
        : null;
    firstDataAt = json['first_data_at'];
    lastDataAt = json['last_data_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['rank'] = rank;
    data['is_new'] = isNew;
    data['is_active'] = isActive;
    data['type'] = type;
    data['logo'] = logo;
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    if (team != null) {
      data['team'] = team!.map((v) => v.toJson()).toList();
    }
    data['description'] = description;
    data['message'] = message;
    data['open_source'] = openSource;
    data['started_at'] = startedAt;
    data['development_status'] = developmentStatus;
    data['hardware_wallet'] = hardwareWallet;
    data['proof_type'] = proofType;
    data['org_structure'] = orgStructure;
    data['hash_algorithm'] = hashAlgorithm;
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (linksExtended != null) {
      data['links_extended'] =
          linksExtended!.map((v) => v.toJson()).toList();
    }
    if (whitepaper != null) {
      data['whitepaper'] = whitepaper!.toJson();
    }
    data['first_data_at'] = firstDataAt;
    data['last_data_at'] = lastDataAt;
    return data;
  }
}

class Tags {
  String? id;
  String? name;
  int? coinCounter;
  int? icoCounter;

  Tags({this.id, this.name, this.coinCounter, this.icoCounter});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coinCounter = json['coin_counter'];
    icoCounter = json['ico_counter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['coin_counter'] = coinCounter;
    data['ico_counter'] = icoCounter;
    return data;
  }
}

class Team {
  String? id;
  String? name;
  String? position;

  Team({this.id, this.name, this.position});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['position'] = position;
    return data;
  }
}

class Links {
  List<String>? explorer;
  List<String>? facebook;
  List<String>? reddit;
  List<String>? sourceCode;
  List<String>? website;
  List<String>? youtube;

  Links(
      {this.explorer,
        this.facebook,
        this.reddit,
        this.sourceCode,
        this.website,
        this.youtube});

  Links.fromJson(Map<String, dynamic> json) {
    explorer = json['explorer'].cast<String>();
    facebook = json['facebook'].cast<String>();
    reddit = json['reddit'].cast<String>();
    sourceCode = json['source_code'].cast<String>();
    website = json['website'].cast<String>();
    youtube = json['youtube'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['explorer'] = explorer;
    data['facebook'] = facebook;
    data['reddit'] = reddit;
    data['source_code'] = sourceCode;
    data['website'] = website;
    data['youtube'] = youtube;
    return data;
  }
}

class LinksExtended {
  String? url;
  String? type;
  Stats? stats;

  LinksExtended({this.url, this.type, this.stats});

  LinksExtended.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    type = json['type'];
    stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['type'] = type;
    if (stats != null) {
      data['stats'] = stats!.toJson();
    }
    return data;
  }
}

class Stats {
  int? subscribers;
  int? contributors;
  int? stars;
  int? followers;

  Stats({this.subscribers, this.contributors, this.stars, this.followers});

  Stats.fromJson(Map<String, dynamic> json) {
    subscribers = json['subscribers'];
    contributors = json['contributors'];
    stars = json['stars'];
    followers = json['followers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subscribers'] = subscribers;
    data['contributors'] = contributors;
    data['stars'] = stars;
    data['followers'] = followers;
    return data;
  }
}

class Whitepaper {
  String? link;
  String? thumbnail;

  Whitepaper({this.link, this.thumbnail});

  Whitepaper.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['link'] = link;
    data['thumbnail'] = thumbnail;
    return data;
  }
}
