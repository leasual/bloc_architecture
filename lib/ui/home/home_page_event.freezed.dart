// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'home_page_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$HomePageEventTearOff {
  const _$HomePageEventTearOff();

// ignore: unused_element
  HomePageLoadingGoodsEvent loadingGoods(int page) {
    return HomePageLoadingGoodsEvent(
      page,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $HomePageEvent = _$HomePageEventTearOff();

/// @nodoc
mixin _$HomePageEvent {
  int get page;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loadingGoods(int page),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loadingGoods(int page),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loadingGoods(HomePageLoadingGoodsEvent value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loadingGoods(HomePageLoadingGoodsEvent value),
    @required Result orElse(),
  });

  $HomePageEventCopyWith<HomePageEvent> get copyWith;
}

/// @nodoc
abstract class $HomePageEventCopyWith<$Res> {
  factory $HomePageEventCopyWith(
          HomePageEvent value, $Res Function(HomePageEvent) then) =
      _$HomePageEventCopyWithImpl<$Res>;
  $Res call({int page});
}

/// @nodoc
class _$HomePageEventCopyWithImpl<$Res>
    implements $HomePageEventCopyWith<$Res> {
  _$HomePageEventCopyWithImpl(this._value, this._then);

  final HomePageEvent _value;
  // ignore: unused_field
  final $Res Function(HomePageEvent) _then;

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
abstract class $HomePageLoadingGoodsEventCopyWith<$Res>
    implements $HomePageEventCopyWith<$Res> {
  factory $HomePageLoadingGoodsEventCopyWith(HomePageLoadingGoodsEvent value,
          $Res Function(HomePageLoadingGoodsEvent) then) =
      _$HomePageLoadingGoodsEventCopyWithImpl<$Res>;
  @override
  $Res call({int page});
}

/// @nodoc
class _$HomePageLoadingGoodsEventCopyWithImpl<$Res>
    extends _$HomePageEventCopyWithImpl<$Res>
    implements $HomePageLoadingGoodsEventCopyWith<$Res> {
  _$HomePageLoadingGoodsEventCopyWithImpl(HomePageLoadingGoodsEvent _value,
      $Res Function(HomePageLoadingGoodsEvent) _then)
      : super(_value, (v) => _then(v as HomePageLoadingGoodsEvent));

  @override
  HomePageLoadingGoodsEvent get _value =>
      super._value as HomePageLoadingGoodsEvent;

  @override
  $Res call({
    Object page = freezed,
  }) {
    return _then(HomePageLoadingGoodsEvent(
      page == freezed ? _value.page : page as int,
    ));
  }
}

/// @nodoc
class _$HomePageLoadingGoodsEvent
    with DiagnosticableTreeMixin
    implements HomePageLoadingGoodsEvent {
  const _$HomePageLoadingGoodsEvent(this.page) : assert(page != null);

  @override
  final int page;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomePageEvent.loadingGoods(page: $page)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomePageEvent.loadingGoods'))
      ..add(DiagnosticsProperty('page', page));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HomePageLoadingGoodsEvent &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(page);

  @override
  $HomePageLoadingGoodsEventCopyWith<HomePageLoadingGoodsEvent> get copyWith =>
      _$HomePageLoadingGoodsEventCopyWithImpl<HomePageLoadingGoodsEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loadingGoods(int page),
  }) {
    assert(loadingGoods != null);
    return loadingGoods(page);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loadingGoods(int page),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingGoods != null) {
      return loadingGoods(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loadingGoods(HomePageLoadingGoodsEvent value),
  }) {
    assert(loadingGoods != null);
    return loadingGoods(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loadingGoods(HomePageLoadingGoodsEvent value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingGoods != null) {
      return loadingGoods(this);
    }
    return orElse();
  }
}

abstract class HomePageLoadingGoodsEvent implements HomePageEvent {
  const factory HomePageLoadingGoodsEvent(int page) =
      _$HomePageLoadingGoodsEvent;

  @override
  int get page;
  @override
  $HomePageLoadingGoodsEventCopyWith<HomePageLoadingGoodsEvent> get copyWith;
}
