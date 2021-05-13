import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/bloc/timer_events.dart';
import 'package:flutter_timer/bloc/timer_states.dart';
import 'package:flutter_timer/ticker.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final _duration = 120;
  final Ticker _ticker;
  StreamSubscription<int> _tickerSubscription;
  TimerBloc({@required Ticker ticker})
      : _ticker = ticker,
        super(Started(120));


  @override
  Stream<TimerState> mapEventToState(event) async* {
    if (event is Start) {
      Start start = event;
      _tickerSubscription?.cancel();
      _tickerSubscription =
          _ticker.tick(ticks: start.duration).listen((duration) {
        add(Trick(duration: duration));
      });
    } else if (event is Stop) {
      if (state is Running) {
        _tickerSubscription.pause();
        yield Paused(state.duration);
      }
    } else if (event is Resume) {
      if (state is Paused) {
        _tickerSubscription?.resume();
        yield Running(state.duration);
      }
    } else if (event is Reset) {
      _tickerSubscription?.cancel();
      yield Started(_duration);
    } else if (event is Trick) {
      Trick ticker = event;
      yield ticker.duration > 0 ? Running(ticker.duration) : Finished(0);
    }
  }

  @override
  Future<void> close() {
    _tickerSubscription.cancel();
    return super.close();
  }
}
