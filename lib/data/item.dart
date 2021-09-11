class ItemModel {
  final int? albumId;
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnailUrl;

  ItemModel({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  ItemModel.fromJson(Map<String, dynamic> json)
      : albumId = json['albumId'],
        id = json['id'],
        title = json['title'],
        url = json['url'],
        thumbnailUrl = json['thumbnailUrl'];

  Map<String, dynamic> toJson() => {};
}
