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
        super(null);

  TimerState get initialState => TimerInitial(_duration);

  @override
  Stream<TimerState> mapEventToState(event) async* {
    if (event is TimerStared) {
      TimerStared start = event;
      _tickerSubscription?.cancel();
      _tickerSubscription =
          _ticker.tick(ticks: start.duration).listen((duration) {
        add(TimerTricked(duration: duration));
      });
    } else if (event is TimerStopped) {
      if (state is Running) {
        _tickerSubscription.pause();
        yield Paused(state.duration);
      }
    } else if (event is TimerResumed) {
      if (state is Paused) {
        _tickerSubscription?.resume();
        yield Running(state.duration);
      }
    } else if (event is TimerReset) {
      _tickerSubscription?.cancel();
      yield TimerInitial(_duration);
    } else if (event is TimerTricked) {
      TimerTricked ticker = event;
      yield ticker.duration > 0 ? Running(ticker.duration) : Finished(0);
    }
  }

  @override
  Future<void> close() {
    _tickerSubscription.cancel();
    return super.close();
  }
}
