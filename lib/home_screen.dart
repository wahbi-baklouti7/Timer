import 'package:flutter/material.dart';
import 'package:flutter_timer/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Timer App"),
      ),
      body: Stack(
        children: [
          WaveWidget(
            config: CustomConfig(
              gradients: [
                [
                  Color.fromRGBO(72, 74, 126, 1),
                  Color.fromRGBO(125, 170, 206, 1),
                  Color.fromRGBO(184, 189, 245, 0.7),
                ],
                [
                  Color.fromRGBO(72, 74, 126, 1),
                  Color.fromRGBO(125, 170, 206, 1),
                  Color.fromRGBO(172, 182, 219, 0.7),
                ],
                [
                  Color.fromRGBO(72, 74, 126, 1),
                  Color.fromRGBO(125, 170, 206, 1),
                  Color.fromRGBO(190, 238, 219, 0.7),
                ]
              ],
              durations: [19000, 10000, 6500],
              heightPercentages: [0.03, 0.02, 0.01],
              gradientBegin: Alignment.bottomCenter,
              gradientEnd: Alignment.topCenter,
            ),
            size: Size(double.infinity, double.infinity),
            backgroundColor: Colors.amber[50],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100),
                child: Center(
                  child: BlocBuilder<TimerBloc, TimerState>(
                    builder: (context, state) {
                      
                      
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
