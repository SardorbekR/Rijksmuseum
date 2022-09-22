// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'art_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArtDetailsEvent {
  String get objectId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String objectId) getArtDetailsEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String objectId)? getArtDetailsEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String objectId)? getArtDetailsEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetArtDetails value) getArtDetailsEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetArtDetails value)? getArtDetailsEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetArtDetails value)? getArtDetailsEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArtDetailsEventCopyWith<ArtDetailsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtDetailsEventCopyWith<$Res> {
  factory $ArtDetailsEventCopyWith(
          ArtDetailsEvent value, $Res Function(ArtDetailsEvent) then) =
      _$ArtDetailsEventCopyWithImpl<$Res>;
  $Res call({String objectId});
}

/// @nodoc
class _$ArtDetailsEventCopyWithImpl<$Res>
    implements $ArtDetailsEventCopyWith<$Res> {
  _$ArtDetailsEventCopyWithImpl(this._value, this._then);

  final ArtDetailsEvent _value;
  // ignore: unused_field
  final $Res Function(ArtDetailsEvent) _then;

  @override
  $Res call({
    Object? objectId = freezed,
  }) {
    return _then(_value.copyWith(
      objectId: objectId == freezed
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$GetArtDetailsCopyWith<$Res>
    implements $ArtDetailsEventCopyWith<$Res> {
  factory _$$GetArtDetailsCopyWith(
          _$GetArtDetails value, $Res Function(_$GetArtDetails) then) =
      __$$GetArtDetailsCopyWithImpl<$Res>;
  @override
  $Res call({String objectId});
}

/// @nodoc
class __$$GetArtDetailsCopyWithImpl<$Res>
    extends _$ArtDetailsEventCopyWithImpl<$Res>
    implements _$$GetArtDetailsCopyWith<$Res> {
  __$$GetArtDetailsCopyWithImpl(
      _$GetArtDetails _value, $Res Function(_$GetArtDetails) _then)
      : super(_value, (v) => _then(v as _$GetArtDetails));

  @override
  _$GetArtDetails get _value => super._value as _$GetArtDetails;

  @override
  $Res call({
    Object? objectId = freezed,
  }) {
    return _then(_$GetArtDetails(
      objectId == freezed
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetArtDetails implements GetArtDetails {
  const _$GetArtDetails(this.objectId);

  @override
  final String objectId;

  @override
  String toString() {
    return 'ArtDetailsEvent.getArtDetailsEvent(objectId: $objectId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetArtDetails &&
            const DeepCollectionEquality().equals(other.objectId, objectId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(objectId));

  @JsonKey(ignore: true)
  @override
  _$$GetArtDetailsCopyWith<_$GetArtDetails> get copyWith =>
      __$$GetArtDetailsCopyWithImpl<_$GetArtDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String objectId) getArtDetailsEvent,
  }) {
    return getArtDetailsEvent(objectId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String objectId)? getArtDetailsEvent,
  }) {
    return getArtDetailsEvent?.call(objectId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String objectId)? getArtDetailsEvent,
    required TResult orElse(),
  }) {
    if (getArtDetailsEvent != null) {
      return getArtDetailsEvent(objectId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetArtDetails value) getArtDetailsEvent,
  }) {
    return getArtDetailsEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetArtDetails value)? getArtDetailsEvent,
  }) {
    return getArtDetailsEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetArtDetails value)? getArtDetailsEvent,
    required TResult orElse(),
  }) {
    if (getArtDetailsEvent != null) {
      return getArtDetailsEvent(this);
    }
    return orElse();
  }
}

abstract class GetArtDetails implements ArtDetailsEvent {
  const factory GetArtDetails(final String objectId) = _$GetArtDetails;

  @override
  String get objectId;
  @override
  @JsonKey(ignore: true)
  _$$GetArtDetailsCopyWith<_$GetArtDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ArtDetailsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ArtObjectDetailsModel artObjectDetails) loaded,
    required TResult Function(String errorMsg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ArtObjectDetailsModel artObjectDetails)? loaded,
    TResult Function(String errorMsg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ArtObjectDetailsModel artObjectDetails)? loaded,
    TResult Function(String errorMsg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingState value) loading,
    required TResult Function(LoadedState value) loaded,
    required TResult Function(ErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(LoadedState value)? loaded,
    TResult Function(ErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(LoadedState value)? loaded,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtDetailsStateCopyWith<$Res> {
  factory $ArtDetailsStateCopyWith(
          ArtDetailsState value, $Res Function(ArtDetailsState) then) =
      _$ArtDetailsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ArtDetailsStateCopyWithImpl<$Res>
    implements $ArtDetailsStateCopyWith<$Res> {
  _$ArtDetailsStateCopyWithImpl(this._value, this._then);

  final ArtDetailsState _value;
  // ignore: unused_field
  final $Res Function(ArtDetailsState) _then;
}

/// @nodoc
abstract class _$$LoadingStateCopyWith<$Res> {
  factory _$$LoadingStateCopyWith(
          _$LoadingState value, $Res Function(_$LoadingState) then) =
      __$$LoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStateCopyWithImpl<$Res>
    extends _$ArtDetailsStateCopyWithImpl<$Res>
    implements _$$LoadingStateCopyWith<$Res> {
  __$$LoadingStateCopyWithImpl(
      _$LoadingState _value, $Res Function(_$LoadingState) _then)
      : super(_value, (v) => _then(v as _$LoadingState));

  @override
  _$LoadingState get _value => super._value as _$LoadingState;
}

/// @nodoc

class _$LoadingState implements LoadingState {
  const _$LoadingState();

  @override
  String toString() {
    return 'ArtDetailsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ArtObjectDetailsModel artObjectDetails) loaded,
    required TResult Function(String errorMsg) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ArtObjectDetailsModel artObjectDetails)? loaded,
    TResult Function(String errorMsg)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ArtObjectDetailsModel artObjectDetails)? loaded,
    TResult Function(String errorMsg)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingState value) loading,
    required TResult Function(LoadedState value) loaded,
    required TResult Function(ErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(LoadedState value)? loaded,
    TResult Function(ErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(LoadedState value)? loaded,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingState implements ArtDetailsState {
  const factory LoadingState() = _$LoadingState;
}

/// @nodoc
abstract class _$$LoadedStateCopyWith<$Res> {
  factory _$$LoadedStateCopyWith(
          _$LoadedState value, $Res Function(_$LoadedState) then) =
      __$$LoadedStateCopyWithImpl<$Res>;
  $Res call({ArtObjectDetailsModel artObjectDetails});
}

/// @nodoc
class __$$LoadedStateCopyWithImpl<$Res>
    extends _$ArtDetailsStateCopyWithImpl<$Res>
    implements _$$LoadedStateCopyWith<$Res> {
  __$$LoadedStateCopyWithImpl(
      _$LoadedState _value, $Res Function(_$LoadedState) _then)
      : super(_value, (v) => _then(v as _$LoadedState));

  @override
  _$LoadedState get _value => super._value as _$LoadedState;

  @override
  $Res call({
    Object? artObjectDetails = freezed,
  }) {
    return _then(_$LoadedState(
      artObjectDetails == freezed
          ? _value.artObjectDetails
          : artObjectDetails // ignore: cast_nullable_to_non_nullable
              as ArtObjectDetailsModel,
    ));
  }
}

/// @nodoc

class _$LoadedState implements LoadedState {
  const _$LoadedState(this.artObjectDetails);

  @override
  final ArtObjectDetailsModel artObjectDetails;

  @override
  String toString() {
    return 'ArtDetailsState.loaded(artObjectDetails: $artObjectDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedState &&
            const DeepCollectionEquality()
                .equals(other.artObjectDetails, artObjectDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(artObjectDetails));

  @JsonKey(ignore: true)
  @override
  _$$LoadedStateCopyWith<_$LoadedState> get copyWith =>
      __$$LoadedStateCopyWithImpl<_$LoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ArtObjectDetailsModel artObjectDetails) loaded,
    required TResult Function(String errorMsg) error,
  }) {
    return loaded(artObjectDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ArtObjectDetailsModel artObjectDetails)? loaded,
    TResult Function(String errorMsg)? error,
  }) {
    return loaded?.call(artObjectDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ArtObjectDetailsModel artObjectDetails)? loaded,
    TResult Function(String errorMsg)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(artObjectDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingState value) loading,
    required TResult Function(LoadedState value) loaded,
    required TResult Function(ErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(LoadedState value)? loaded,
    TResult Function(ErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(LoadedState value)? loaded,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedState implements ArtDetailsState {
  const factory LoadedState(final ArtObjectDetailsModel artObjectDetails) =
      _$LoadedState;

  ArtObjectDetailsModel get artObjectDetails;
  @JsonKey(ignore: true)
  _$$LoadedStateCopyWith<_$LoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorStateCopyWith<$Res> {
  factory _$$ErrorStateCopyWith(
          _$ErrorState value, $Res Function(_$ErrorState) then) =
      __$$ErrorStateCopyWithImpl<$Res>;
  $Res call({String errorMsg});
}

/// @nodoc
class __$$ErrorStateCopyWithImpl<$Res>
    extends _$ArtDetailsStateCopyWithImpl<$Res>
    implements _$$ErrorStateCopyWith<$Res> {
  __$$ErrorStateCopyWithImpl(
      _$ErrorState _value, $Res Function(_$ErrorState) _then)
      : super(_value, (v) => _then(v as _$ErrorState));

  @override
  _$ErrorState get _value => super._value as _$ErrorState;

  @override
  $Res call({
    Object? errorMsg = freezed,
  }) {
    return _then(_$ErrorState(
      errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorState implements ErrorState {
  const _$ErrorState(this.errorMsg);

  @override
  final String errorMsg;

  @override
  String toString() {
    return 'ArtDetailsState.error(errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorState &&
            const DeepCollectionEquality().equals(other.errorMsg, errorMsg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(errorMsg));

  @JsonKey(ignore: true)
  @override
  _$$ErrorStateCopyWith<_$ErrorState> get copyWith =>
      __$$ErrorStateCopyWithImpl<_$ErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ArtObjectDetailsModel artObjectDetails) loaded,
    required TResult Function(String errorMsg) error,
  }) {
    return error(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ArtObjectDetailsModel artObjectDetails)? loaded,
    TResult Function(String errorMsg)? error,
  }) {
    return error?.call(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ArtObjectDetailsModel artObjectDetails)? loaded,
    TResult Function(String errorMsg)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingState value) loading,
    required TResult Function(LoadedState value) loaded,
    required TResult Function(ErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(LoadedState value)? loaded,
    TResult Function(ErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(LoadedState value)? loaded,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorState implements ArtDetailsState {
  const factory ErrorState(final String errorMsg) = _$ErrorState;

  String get errorMsg;
  @JsonKey(ignore: true)
  _$$ErrorStateCopyWith<_$ErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
