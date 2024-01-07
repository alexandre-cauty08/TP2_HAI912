class Coord {
  late double lon;
  late double lat;

  Coord(this.lon, this.lat);

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['coord']['lon'] != null ? json['coord']['lon'].toDouble() : 0;
    lat = json['coord']['lat'] != null ? json['coord']['lat'].toDouble() : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coord']['lon'] = lon;
    data['coord']['lat'] = lat;

    return data;
  }
}