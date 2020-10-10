import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'girl_event.freezed.dart';

@freezed
abstract class GirlEvent with _$GirlEvent {
  const factory GirlEvent.loadingGirl(int page) = GirlLoadingEvent;
}

// import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';
//
// @immutable
// abstract class GirlEvent extends Equatable {
//   const GirlEvent();
// }
//
// class GirlLoadingEvent extends GirlEvent {
//   final int page;
//
//   GirlLoadingEvent(this.page);
//
//   @override
//   List<Object> get props => [page];
// }
