class Wind {
  late num speed;
  late num deg;
  late num gust;

  Wind(this.speed, this.deg, this.gust);

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'] != null ? json['speed'].toDouble() : 0;
    deg = json['deg'] ?? 0;
    gust = json['gust'] != null ? json['gust'].toDouble() : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['speed'] = speed;
    data['deg'] = deg;
    data['gust'] = gust;

    return data;
  }
}