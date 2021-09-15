class TouristSpot {
  final String? id;
  final String? name;
  final Map? location;
  final String? phone_number;
  final String? email;
  final String? full_description;
  final String? short_description;
  final List<String>? images;
  final String? qrcode;
  final String? thumbnail_url;
  TouristSpot(
      {this.id,
      this.name,
      this.location,
      this.phone_number,
      this.email,
      this.full_description,
      this.short_description,
      this.qrcode,
      this.thumbnail_url,
      this.images});

  TouristSpot.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        location = (json['location'] as Map<String, dynamic>),
        phone_number = json['phone_number'],
        email = json['email'],
        full_description = json['full_description'],
        short_description = json['short_description'],
        qrcode = json['qrcode'],
        thumbnail_url = json['thumbnail_url'],
        images = (json['images'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList();

  Map<String, dynamic> toJson() => {};
}
