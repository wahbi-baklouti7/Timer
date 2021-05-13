import 'package:flutter/material.dart';
import 'package:flutter_timer/bloc/bloc.dart';
import 'package:flutter_timer/bloc/blocObserver.dart';
import 'package:flutter_timer/screens/home_screen.dart';
import 'package:flutter_timer/ticker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(TimerApp());
  Bloc.observer = MyBlocObserver();
}

class TimerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color.fromRGBO(109, 234, 255, 1),
          accentColor: Color.fromRGBO(72, 74, 126, 1),
          brightness: Brightness.dark),
      home: BlocProvider(
        create: (context) => TimerBloc(ticker: Ticker()),
        child: HomeScreen(),
      ),
    );
  }
}
