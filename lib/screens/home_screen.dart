import 'package:flutter/material.dart';
import 'package:flutter_timer/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/shared/styles/styles.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Timer App"),
      ),
      body: Stack(
        children: [
          Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100),
                child: Center(
                  child: BlocBuilder<TimerBloc, TimerState>(
                    builder: (context, state) {
                      final minutes = (state.duration / 60)
                          .floor()
                          .toString()
                          .padLeft(2, "0");
                      final seconds = (state.duration % 60)
                          .floor()
                          .toString()
                          .padLeft(2, "0");

                      return Text(
                        "$minutes:$seconds",
                        style: TextStyle(fontSize: 40),
                      );
                    },
                  ),
                ),
              ),
              BlocBuilder<TimerBloc, TimerState>(
                  buildWhen: (prevState, currState) =>
                      prevState.runtimeType != currState.runtimeType,
                  builder: (context, state) => Actions())
            ],
          )
        ],
      ),
    );
  }
}

class Actions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _mapToAction(timerBloc: BlocProvider.of<TimerBloc>(context)),
    );
  }

  List<Widget> _mapToAction({TimerBloc timerBloc}) {
    final TimerState currentState = timerBloc.state;

    if (currentState is Started) {
      return [
        FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed: () =>
                timerBloc.add(Start(duration: currentState.duration)))
      ];
    } else if (currentState is Running) {
      return [
        FloatingActionButton(
            child: Icon(Icons.pause_sharp),
            onPressed: () => timerBloc.add(Stop())),
        FloatingActionButton(
            child: Icon(Icons.replay), onPressed: () => timerBloc.add(Reset()))
      ];
    } else if (currentState is Paused) {
      return [
        FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed: () => timerBloc.add(Resume())),
        FloatingActionButton(
            child: Icon(Icons.replay), onPressed: () => timerBloc.add(Reset()))
      ];
    } else if (currentState is Finished) {
      return [
        FloatingActionButton(
            child: Icon(Icons.replay), onPressed: () => timerBloc.add(Reset())),
      ];
    }
  }
}
