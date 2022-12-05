import 'dart:convert';

AllData allDataFromJson(String str) => AllData.fromJson(json.decode(str));

String allDataToJson(AllData data) => json.encode(data.toJson());

class AllData {
  AllData({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });

  int? totalCount;
  bool? incompleteResults;
  List<Item>? items;

  factory AllData.fromJson(Map<String, dynamic> json) => AllData(
        totalCount: json["total_count"],
        incompleteResults: json["incomplete_results"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "incomplete_results": incompleteResults,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.owner,
    this.description,
    this.size,
    this.stargazersCount,
    this.watchersCount,
    this.openIssuesCount,
  });

  int? id;
  String? nodeId;
  String? name;
  String? fullName;
  Owner? owner;
  String? description;
  int? size;
  int? stargazersCount;
  int? watchersCount;
  int? openIssuesCount;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        nodeId: json["node_id"],
        name: json["name"],
        fullName: json["full_name"],
        owner: Owner.fromJson(json["owner"]),
        description: json["description"] == null ? null : json["description"],
        size: json["size"],
        stargazersCount: json["stargazers_count"],
        watchersCount: json["watchers_count"],
        openIssuesCount: json["open_issues_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "node_id": nodeId,
        "name": name,
        "full_name": fullName,
        "owner": owner?.toJson(),
        "description": description == null ? null : description,
        "size": size,
        "stargazers_count": stargazersCount,
        "watchers_count": watchersCount,
      };
}

class Owner {
  Owner({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
  });

  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
      };
}
