import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/WeatherCubit.dart';
import 'views/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => WeatherCubit(),
        child: MaterialApp(
              title: 'First Flutter App Alex',
              theme: ThemeData(),
              home: const HomePage(),
            ),
    );
  }
}