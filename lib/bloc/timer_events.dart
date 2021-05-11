import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class TimerEvent extends Equatable {
  const TimerEvent();
  @override
  List<Object> get props => [];
}

class TimerStared extends TimerEvent {
  final int duration;
  const TimerStared({@required this.duration});

  @override
  String toString() {
    return "TimerStarted {duration: $duration}";
  }
}

class TimerStopped extends TimerEvent {}

class TimerResumed extends TimerEvent {}

class TimerReset extends TimerEvent {}

class TimerTricked extends TimerEvent {
  final int duration;
  const TimerTricked({@required this.duration});

  @override
  List<Object> get props =>[duration];

   @override
  String toString() {
    return "TimerTricked {duration: $duration}";
  }
}
