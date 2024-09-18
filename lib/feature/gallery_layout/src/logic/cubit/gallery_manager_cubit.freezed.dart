// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_manager_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GalleryManagerState {
  GenericState<List<Photo>> get photos => throw _privateConstructorUsedError;

  /// Create a copy of GalleryManagerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GalleryManagerStateCopyWith<GalleryManagerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryManagerStateCopyWith<$Res> {
  factory $GalleryManagerStateCopyWith(
          GalleryManagerState value, $Res Function(GalleryManagerState) then) =
      _$GalleryManagerStateCopyWithImpl<$Res, GalleryManagerState>;
  @useResult
  $Res call({GenericState<List<Photo>> photos});

  $GenericStateCopyWith<List<Photo>, $Res> get photos;
}

/// @nodoc
class _$GalleryManagerStateCopyWithImpl<$Res, $Val extends GalleryManagerState>
    implements $GalleryManagerStateCopyWith<$Res> {
  _$GalleryManagerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GalleryManagerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photos = null,
  }) {
    return _then(_value.copyWith(
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as GenericState<List<Photo>>,
    ) as $Val);
  }

  /// Create a copy of GalleryManagerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GenericStateCopyWith<List<Photo>, $Res> get photos {
    return $GenericStateCopyWith<List<Photo>, $Res>(_value.photos, (value) {
      return _then(_value.copyWith(photos: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GalleryManagerStateImplCopyWith<$Res>
    implements $GalleryManagerStateCopyWith<$Res> {
  factory _$$GalleryManagerStateImplCopyWith(_$GalleryManagerStateImpl value,
          $Res Function(_$GalleryManagerStateImpl) then) =
      __$$GalleryManagerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GenericState<List<Photo>> photos});

  @override
  $GenericStateCopyWith<List<Photo>, $Res> get photos;
}

/// @nodoc
class __$$GalleryManagerStateImplCopyWithImpl<$Res>
    extends _$GalleryManagerStateCopyWithImpl<$Res, _$GalleryManagerStateImpl>
    implements _$$GalleryManagerStateImplCopyWith<$Res> {
  __$$GalleryManagerStateImplCopyWithImpl(_$GalleryManagerStateImpl _value,
      $Res Function(_$GalleryManagerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GalleryManagerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photos = null,
  }) {
    return _then(_$GalleryManagerStateImpl(
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as GenericState<List<Photo>>,
    ));
  }
}

/// @nodoc

class _$GalleryManagerStateImpl implements _GalleryManagerState {
  _$GalleryManagerStateImpl({required this.photos});

  @override
  final GenericState<List<Photo>> photos;

  @override
  String toString() {
    return 'GalleryManagerState(photos: $photos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalleryManagerStateImpl &&
            (identical(other.photos, photos) || other.photos == photos));
  }

  @override
  int get hashCode => Object.hash(runtimeType, photos);

  /// Create a copy of GalleryManagerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GalleryManagerStateImplCopyWith<_$GalleryManagerStateImpl> get copyWith =>
      __$$GalleryManagerStateImplCopyWithImpl<_$GalleryManagerStateImpl>(
          this, _$identity);
}

abstract class _GalleryManagerState implements GalleryManagerState {
  factory _GalleryManagerState(
          {required final GenericState<List<Photo>> photos}) =
      _$GalleryManagerStateImpl;

  @override
  GenericState<List<Photo>> get photos;

  /// Create a copy of GalleryManagerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GalleryManagerStateImplCopyWith<_$GalleryManagerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
