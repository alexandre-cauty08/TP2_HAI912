class Rain {
  late num d1h;
  late num d3h;

  Rain(this.d3h, this.d1h);

  Rain.fromJson(Map<String, dynamic> json) {
    d3h = json['3h'] != null ? json['3h'].toDouble() : 0;
    d1h = json['1h'] != null ? json['1h'].toDouble() : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['3h'] = d3h;
    data['1h'] = d1h;

    return data;
  }
}