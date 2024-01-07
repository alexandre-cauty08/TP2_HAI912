class Sys {
  late num type;
  late num id;
  late String country;
  late num sunrise;
  late num sunset;

  Sys(this.type, this.id, this.country, this.sunrise, this.sunset);

  Sys.fromJson(Map<String, dynamic> json) {
    type = json['type'] ?? 0;
    id = json['id'] ?? 0;
    country = json['country'] ?? "";
    sunrise = json['sunrise'] ?? 0;
    sunset = json['sunset'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['country'] = country;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;

    return data;
  }
}