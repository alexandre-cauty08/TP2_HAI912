import 'dart:convert';

WeatherModel weatherModelFromJson(String str) => WeatherModel.fromJson(json.decode(str));

class WeatherModel {

  late double lat;
  late double lon;
  late String cityName;
  late String countryName;
  late String weatherIcon;
  late String description;

  late double temp;

  late int humidity;
  late double wind;
  late int pressure;

  WeatherModel(
      this.lat,
      this.lon,
      this.cityName,
      this.countryName,
      this.weatherIcon,
      this.description,
      this.temp,
      this.humidity,
      this.wind,
      this.pressure);

  WeatherModel.fromJson(Map<String, dynamic> json) {

    lat = json['coord']['lat'];
    lon = json['coord']['lon'];

    cityName = json['name'];
    countryName = json['sys']['country'];
    weatherIcon = json['weather'][0]['main'];
    description = json['weather'][0]['description'];
    temp = json['main']['temp'];
    humidity =  json['main']['humidity'];
    wind =  json['wind']['speed'];
    pressure =  json['main']['pressure'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['coord']['lat'] = lat;
    data['coord']['lon'] = lon;
    data['name'] = cityName;
    data['sys']['country'] = countryName;
    data['weather']['main'] = weatherIcon;
    data['weather'][0]['descritpion'] = description;
    data['main']['temp'] = temp;
    data['main']['humidity'] = humidity;
    data['wind']['speed'] = wind;
    data['main']['pressure'] = pressure;

    return data;
  }

}