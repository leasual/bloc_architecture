import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class GirlEvent extends Equatable {
  const GirlEvent();
}

class GirlLoadingEvent extends GirlEvent {
  final int page;

  GirlLoadingEvent(this.page);

  @override
  List<Object> get props => [page];
}

