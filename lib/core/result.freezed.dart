// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ResultTearOff {
  const _$ResultTearOff();

// ignore: unused_element
  _Loading<T> loading<T>() {
    return _Loading<T>();
  }

// ignore: unused_element
  _Success<T> success<T>(T data, int totalPage, int currentPage) {
    return _Success<T>(
      data,
      totalPage,
      currentPage,
    );
  }

// ignore: unused_element
  _Failure<T> failure<T>(NetworkExceptions error) {
    return _Failure<T>(
      error,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Result = _$ResultTearOff();

/// @nodoc
mixin _$Result<T> {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result success(T data, int totalPage, int currentPage),
    @required Result failure(NetworkExceptions error),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result success(T data, int totalPage, int currentPage),
    Result failure(NetworkExceptions error),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(_Loading<T> value),
    @required Result success(_Success<T> value),
    @required Result failure(_Failure<T> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(_Loading<T> value),
    Result success(_Success<T> value),
    Result failure(_Failure<T> value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $ResultCopyWith<T, $Res> {
  factory $ResultCopyWith(Result<T> value, $Res Function(Result<T>) then) =
      _$ResultCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$ResultCopyWithImpl<T, $Res> implements $ResultCopyWith<T, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  final Result<T> _value;
  // ignore: unused_field
  final $Res Function(Result<T>) _then;
}

/// @nodoc
abstract class _$LoadingCopyWith<T, $Res> {
  factory _$LoadingCopyWith(
          _Loading<T> value, $Res Function(_Loading<T>) then) =
      __$LoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<T, $Res> extends _$ResultCopyWithImpl<T, $Res>
    implements _$LoadingCopyWith<T, $Res> {
  __$LoadingCopyWithImpl(_Loading<T> _value, $Res Function(_Loading<T>) _then)
      : super(_value, (v) => _then(v as _Loading<T>));

  @override
  _Loading<T> get _value => super._value as _Loading<T>;
}

/// @nodoc
class _$_Loading<T> implements _Loading<T> {
  const _$_Loading();

  @override
  String toString() {
    return 'Result<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result success(T data, int totalPage, int currentPage),
    @required Result failure(NetworkExceptions error),
  }) {
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result success(T data, int totalPage, int currentPage),
    Result failure(NetworkExceptions error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(_Loading<T> value),
    @required Result success(_Success<T> value),
    @required Result failure(_Failure<T> value),
  }) {
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(_Loading<T> value),
    Result success(_Success<T> value),
    Result failure(_Failure<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading<T> implements Result<T> {
  const factory _Loading() = _$_Loading<T>;
}

/// @nodoc
abstract class _$SuccessCopyWith<T, $Res> {
  factory _$SuccessCopyWith(
          _Success<T> value, $Res Function(_Success<T>) then) =
      __$SuccessCopyWithImpl<T, $Res>;
  $Res call({T data, int totalPage, int currentPage});
}

/// @nodoc
class __$SuccessCopyWithImpl<T, $Res> extends _$ResultCopyWithImpl<T, $Res>
    implements _$SuccessCopyWith<T, $Res> {
  __$SuccessCopyWithImpl(_Success<T> _value, $Res Function(_Success<T>) _then)
      : super(_value, (v) => _then(v as _Success<T>));

  @override
  _Success<T> get _value => super._value as _Success<T>;

  @override
  $Res call({
    Object data = freezed,
    Object totalPage = freezed,
    Object currentPage = freezed,
  }) {
    return _then(_Success<T>(
      data == freezed ? _value.data : data as T,
      totalPage == freezed ? _value.totalPage : totalPage as int,
      currentPage == freezed ? _value.currentPage : currentPage as int,
    ));
  }
}

/// @nodoc
class _$_Success<T> implements _Success<T> {
  const _$_Success(this.data, this.totalPage, this.currentPage)
      : assert(data != null),
        assert(totalPage != null),
        assert(currentPage != null);

  @override
  final T data;
  @override
  final int totalPage;
  @override
  final int currentPage;

  @override
  String toString() {
    return 'Result<$T>.success(data: $data, totalPage: $totalPage, currentPage: $currentPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Success<T> &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.totalPage, totalPage) ||
                const DeepCollectionEquality()
                    .equals(other.totalPage, totalPage)) &&
            (identical(other.currentPage, currentPage) ||
                const DeepCollectionEquality()
                    .equals(other.currentPage, currentPage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(totalPage) ^
      const DeepCollectionEquality().hash(currentPage);

  @override
  _$SuccessCopyWith<T, _Success<T>> get copyWith =>
      __$SuccessCopyWithImpl<T, _Success<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result success(T data, int totalPage, int currentPage),
    @required Result failure(NetworkExceptions error),
  }) {
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return success(data, totalPage, currentPage);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result success(T data, int totalPage, int currentPage),
    Result failure(NetworkExceptions error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(data, totalPage, currentPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(_Loading<T> value),
    @required Result success(_Success<T> value),
    @required Result failure(_Failure<T> value),
  }) {
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(_Loading<T> value),
    Result success(_Success<T> value),
    Result failure(_Failure<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success<T> implements Result<T> {
  const factory _Success(T data, int totalPage, int currentPage) =
      _$_Success<T>;

  T get data;
  int get totalPage;
  int get currentPage;
  _$SuccessCopyWith<T, _Success<T>> get copyWith;
}

/// @nodoc
abstract class _$FailureCopyWith<T, $Res> {
  factory _$FailureCopyWith(
          _Failure<T> value, $Res Function(_Failure<T>) then) =
      __$FailureCopyWithImpl<T, $Res>;
  $Res call({NetworkExceptions error});

  $NetworkExceptionsCopyWith<$Res> get error;
}

/// @nodoc
class __$FailureCopyWithImpl<T, $Res> extends _$ResultCopyWithImpl<T, $Res>
    implements _$FailureCopyWith<T, $Res> {
  __$FailureCopyWithImpl(_Failure<T> _value, $Res Function(_Failure<T>) _then)
      : super(_value, (v) => _then(v as _Failure<T>));

  @override
  _Failure<T> get _value => super._value as _Failure<T>;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(_Failure<T>(
      error == freezed ? _value.error : error as NetworkExceptions,
    ));
  }

  @override
  $NetworkExceptionsCopyWith<$Res> get error {
    if (_value.error == null) {
      return null;
    }
    return $NetworkExceptionsCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc
class _$_Failure<T> implements _Failure<T> {
  const _$_Failure(this.error) : assert(error != null);

  @override
  final NetworkExceptions error;

  @override
  String toString() {
    return 'Result<$T>.failure(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Failure<T> &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  _$FailureCopyWith<T, _Failure<T>> get copyWith =>
      __$FailureCopyWithImpl<T, _Failure<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result success(T data, int totalPage, int currentPage),
    @required Result failure(NetworkExceptions error),
  }) {
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return failure(error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result success(T data, int totalPage, int currentPage),
    Result failure(NetworkExceptions error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(_Loading<T> value),
    @required Result success(_Success<T> value),
    @required Result failure(_Failure<T> value),
  }) {
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(_Loading<T> value),
    Result success(_Success<T> value),
    Result failure(_Failure<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure<T> implements Result<T> {
  const factory _Failure(NetworkExceptions error) = _$_Failure<T>;

  NetworkExceptions get error;
  _$FailureCopyWith<T, _Failure<T>> get copyWith;
}
