import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class TimerEvent extends Equatable {
  const TimerEvent();
  @override
  List<Object> get props => [];
}

class Start extends TimerEvent {
  final int duration;
  const Start({@required this.duration});

  @override
  String toString() {
    return "TimerStarted {duration: $duration}";
  }
}

class Stop extends TimerEvent {}

class Resume extends TimerEvent {}

class Reset extends TimerEvent {}

class Trick extends TimerEvent {
  final int duration;
  const Trick({@required this.duration});

  @override
  List<Object> get props =>[duration];

   @override
  String toString() {
    return "TimerTricked {duration: $duration}";
  }
}
