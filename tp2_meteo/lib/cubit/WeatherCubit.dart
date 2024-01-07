import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherCubit extends Cubit<String> {

  String _city = "Paris";

  WeatherCubit() : super("Paris");

  set city(String city) {
    _city = city;
  }
}
