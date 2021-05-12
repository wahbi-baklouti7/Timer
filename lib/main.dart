import 'package:flutter/material.dart';
import 'package:flutter_timer/bloc/bloc.dart';
import 'package:flutter_timer/modules/home_screen.dart';
import 'package:flutter_timer/ticker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(TimerApp());

class TimerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        primaryColor: Color.fromRGBO(109,234,255,1),
        accentColor: Color.fromRGBO(72,74,126,1),
        brightness: Brightness.dark

      ),
      home: BlocProvider(
        create: (context) => TimerBloc(ticker: Ticker()),
        child:HomeScreen(),
      ),
    );
  }
}
