import 'Coordo.dart';

class City {
  late num id;
  late String name;
  late Coordo coord;
  late String country;
  late num population;
  late num timezone;
  late num sunrise;
  late num sunset;

  City(this.id,
      this.name,
      this.coord,
      this.country,
      this.population,
      this.timezone,
      this.sunrise,
      this.sunset);

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    coord = json['coord'] != null ? Coordo.fromJson(json['coord']) : Coordo(0, 0);
    country = json['country'] ?? "";
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['coord'] = coord;
    data['country'] = coord;
    data['population'] = coord;
    data['timezone'] = coord;
    data['sunrise'] = coord;
    data['sunset'] = coord;

    return data;
  }
}