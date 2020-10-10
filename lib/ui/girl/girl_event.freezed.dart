// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'girl_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GirlEventTearOff {
  const _$GirlEventTearOff();

// ignore: unused_element
  GirlLoadingEvent loadingGirl(int page) {
    return GirlLoadingEvent(
      page,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GirlEvent = _$GirlEventTearOff();

/// @nodoc
mixin _$GirlEvent {
  int get page;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loadingGirl(int page),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loadingGirl(int page),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loadingGirl(GirlLoadingEvent value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loadingGirl(GirlLoadingEvent value),
    @required Result orElse(),
  });

  $GirlEventCopyWith<GirlEvent> get copyWith;
}

/// @nodoc
abstract class $GirlEventCopyWith<$Res> {
  factory $GirlEventCopyWith(GirlEvent value, $Res Function(GirlEvent) then) =
      _$GirlEventCopyWithImpl<$Res>;
  $Res call({int page});
}

/// @nodoc
class _$GirlEventCopyWithImpl<$Res> implements $GirlEventCopyWith<$Res> {
  _$GirlEventCopyWithImpl(this._value, this._then);

  final GirlEvent _value;
  // ignore: unused_field
  final $Res Function(GirlEvent) _then;

  @override
  $Res call({
    Object page = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed ? _value.page : page as int,
    ));
  }
}

/// @nodoc
abstract class $GirlLoadingEventCopyWith<$Res>
    implements $GirlEventCopyWith<$Res> {
  factory $GirlLoadingEventCopyWith(
          GirlLoadingEvent value, $Res Function(GirlLoadingEvent) then) =
      _$GirlLoadingEventCopyWithImpl<$Res>;
  @override
  $Res call({int page});
}

/// @nodoc
class _$GirlLoadingEventCopyWithImpl<$Res> extends _$GirlEventCopyWithImpl<$Res>
    implements $GirlLoadingEventCopyWith<$Res> {
  _$GirlLoadingEventCopyWithImpl(
      GirlLoadingEvent _value, $Res Function(GirlLoadingEvent) _then)
      : super(_value, (v) => _then(v as GirlLoadingEvent));

  @override
  GirlLoadingEvent get _value => super._value as GirlLoadingEvent;

  @override
  $Res call({
    Object page = freezed,
  }) {
    return _then(GirlLoadingEvent(
      page == freezed ? _value.page : page as int,
    ));
  }
}

/// @nodoc
class _$GirlLoadingEvent
    with DiagnosticableTreeMixin
    implements GirlLoadingEvent {
  const _$GirlLoadingEvent(this.page) : assert(page != null);

  @override
  final int page;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GirlEvent.loadingGirl(page: $page)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GirlEvent.loadingGirl'))
      ..add(DiagnosticsProperty('page', page));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GirlLoadingEvent &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(page);

  @override
  $GirlLoadingEventCopyWith<GirlLoadingEvent> get copyWith =>
      _$GirlLoadingEventCopyWithImpl<GirlLoadingEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loadingGirl(int page),
  }) {
    assert(loadingGirl != null);
    return loadingGirl(page);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loadingGirl(int page),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingGirl != null) {
      return loadingGirl(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loadingGirl(GirlLoadingEvent value),
  }) {
    assert(loadingGirl != null);
    return loadingGirl(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loadingGirl(GirlLoadingEvent value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingGirl != null) {
      return loadingGirl(this);
    }
    return orElse();
  }
}

abstract class GirlLoadingEvent implements GirlEvent {
  const factory GirlLoadingEvent(int page) = _$GirlLoadingEvent;

  @override
  int get page;
  @override
  $GirlLoadingEventCopyWith<GirlLoadingEvent> get copyWith;
}
