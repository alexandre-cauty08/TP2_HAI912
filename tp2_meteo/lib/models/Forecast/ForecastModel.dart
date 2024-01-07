import 'dart:convert';
import 'Sys.dart';
import 'Weather.dart';
import 'City.dart';
import 'Clouds.dart';
import 'Coordo.dart';
import 'Wind.dart';

ForecastModel forecastModelFromJson(String str) => ForecastModel.fromJson(json.decode(str));

class ForecastModel {

  late List<Forecast> forecastList;
  late City city;

  ForecastModel(
      this.forecastList,
      this.city
      );
  ForecastModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      forecastList = [];
      json['list'].forEach((v) {
        forecastList.add(Forecast.fromJson(v));
      });
    }

    city = json['city'] != null ? City.fromJson(json['city']) : City(0,
        "",Coordo(0,0),"",0,0,0,0);

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['list'] = forecastList.map((v) => v.toJson()).toList();
    data['city'] = city.toJson();

    return data;
  }

}


class Forecast{

  late num dt;
  late Main main;
  late List<Weather> weather;
  late Clouds clouds;
  late Wind wind;
  late num visibility;
  late num pop;
  late Sys sys;
  late String dt_txt;

  Forecast(this.dt,
      this.main,
      this.weather,
      this.clouds,
      this.wind,
      this.visibility,
      this.pop,
      this.sys,
      this.dt_txt);


  Forecast.fromJson(Map<String, dynamic> json) {
    dt = json['dt'] ?? 0;
    main = json['main'] != null ? Main.fromJson(json['main']) : Main(0.0,0.0,0.0,0.0,0,0,0,0,0.0);
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather.add(Weather.fromJson(v));
      });
    }
    clouds = json['clouds'] != null  ? Clouds.fromJson(json['clouds']) : Clouds(0);
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : Wind(0,0,0);
    visibility = json['visibility'] ?? 0;
    pop = json['pop'] ?? 0;
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : Sys('');
    dt_txt = json['dt_txt'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['main'] = main;
    data['weather'] = weather.map((v) => v.toJson()).toList();
    data['clouds'] = clouds;
    data['wind'] = wind;
    data['visibility'] = visibility;
    data['pop'] = pop;
    data['sys'] = sys;
    data['dt_txt'] = dt_txt;

    return data;
  }
}

class Main {
  late num temp;
  late num feelsLike;
  late num tempMin;
  late num tempMax;
  late num pressure;
  late num seaLevel;
  late num grndLevel;
  late num humidity;
  late num tempKf;


  Main(this.temp, this.feelsLike, this.tempMin, this.tempMax, this.pressure,
      this.seaLevel,this.grndLevel,this.humidity,this.tempKf);

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'] != null ? json['temp'].toDouble() : 0;
    feelsLike = json['feels_like'] != null ? json['feels_like'].toDouble() : 0;
    tempMin = json['temp_min'] != null ? json['temp_min'].toDouble() : 0;
    tempMax = json['temp_max'] != null ? json['temp_max'].toDouble() : 0;
    pressure = json['pressure'] ?? 0;
    seaLevel = json['sea_level'] ?? 0;
    grndLevel = json['grnd_level'] ?? 0;
    humidity = json['humidity'] ?? 0;
    tempKf = json['temp_kf']  != null ? json['temp_kf'].toDouble() : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['sea_level'] = seaLevel;
    data['grnd_level'] = grndLevel;
    data['humidity'] = humidity;
    data['temp_kf'] = tempKf;

    return data;
  }
}






