class Coordo {
  late num lon;
  late num lat;

  Coordo(this.lon, this.lat);

  Coordo.fromJson(Map<String, dynamic> json) {
    lon = json['lon'] != null ? json['lon'].toDouble() : 0;
    lat = json['lat'] != null ? json['lat'].toDouble() : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lon'] = lon;
    data['lat'] = lat;
    return data;
  }
}