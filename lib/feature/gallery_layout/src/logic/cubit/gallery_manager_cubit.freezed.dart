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
  GenericState<List<HivePhoto>> get photos =>
      throw _privateConstructorUsedError;
  List<HivePhoto> get selectedPhotoList => throw _privateConstructorUsedError;
  bool get photoDeleted => throw _privateConstructorUsedError;
  bool get isSelecting => throw _privateConstructorUsedError;
  GenericState<HiveCategory> get viewedPhotoCategory =>
      throw _privateConstructorUsedError;

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
  $Res call(
      {GenericState<List<HivePhoto>> photos,
      List<HivePhoto> selectedPhotoList,
      bool photoDeleted,
      bool isSelecting,
      GenericState<HiveCategory> viewedPhotoCategory});

  $GenericStateCopyWith<List<HivePhoto>, $Res> get photos;
  $GenericStateCopyWith<HiveCategory, $Res> get viewedPhotoCategory;
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
    Object? selectedPhotoList = null,
    Object? photoDeleted = null,
    Object? isSelecting = null,
    Object? viewedPhotoCategory = null,
  }) {
    return _then(_value.copyWith(
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as GenericState<List<HivePhoto>>,
      selectedPhotoList: null == selectedPhotoList
          ? _value.selectedPhotoList
          : selectedPhotoList // ignore: cast_nullable_to_non_nullable
              as List<HivePhoto>,
      photoDeleted: null == photoDeleted
          ? _value.photoDeleted
          : photoDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelecting: null == isSelecting
          ? _value.isSelecting
          : isSelecting // ignore: cast_nullable_to_non_nullable
              as bool,
      viewedPhotoCategory: null == viewedPhotoCategory
          ? _value.viewedPhotoCategory
          : viewedPhotoCategory // ignore: cast_nullable_to_non_nullable
              as GenericState<HiveCategory>,
    ) as $Val);
  }

  /// Create a copy of GalleryManagerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GenericStateCopyWith<List<HivePhoto>, $Res> get photos {
    return $GenericStateCopyWith<List<HivePhoto>, $Res>(_value.photos, (value) {
      return _then(_value.copyWith(photos: value) as $Val);
    });
  }

  /// Create a copy of GalleryManagerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GenericStateCopyWith<HiveCategory, $Res> get viewedPhotoCategory {
    return $GenericStateCopyWith<HiveCategory, $Res>(_value.viewedPhotoCategory,
        (value) {
      return _then(_value.copyWith(viewedPhotoCategory: value) as $Val);
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
  $Res call(
      {GenericState<List<HivePhoto>> photos,
      List<HivePhoto> selectedPhotoList,
      bool photoDeleted,
      bool isSelecting,
      GenericState<HiveCategory> viewedPhotoCategory});

  @override
  $GenericStateCopyWith<List<HivePhoto>, $Res> get photos;
  @override
  $GenericStateCopyWith<HiveCategory, $Res> get viewedPhotoCategory;
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
    Object? selectedPhotoList = null,
    Object? photoDeleted = null,
    Object? isSelecting = null,
    Object? viewedPhotoCategory = null,
  }) {
    return _then(_$GalleryManagerStateImpl(
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as GenericState<List<HivePhoto>>,
      selectedPhotoList: null == selectedPhotoList
          ? _value._selectedPhotoList
          : selectedPhotoList // ignore: cast_nullable_to_non_nullable
              as List<HivePhoto>,
      photoDeleted: null == photoDeleted
          ? _value.photoDeleted
          : photoDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelecting: null == isSelecting
          ? _value.isSelecting
          : isSelecting // ignore: cast_nullable_to_non_nullable
              as bool,
      viewedPhotoCategory: null == viewedPhotoCategory
          ? _value.viewedPhotoCategory
          : viewedPhotoCategory // ignore: cast_nullable_to_non_nullable
              as GenericState<HiveCategory>,
    ));
  }
}

/// @nodoc

class _$GalleryManagerStateImpl implements _GalleryManagerState {
  _$GalleryManagerStateImpl(
      {required this.photos,
      required final List<HivePhoto> selectedPhotoList,
      required this.photoDeleted,
      required this.isSelecting,
      required this.viewedPhotoCategory})
      : _selectedPhotoList = selectedPhotoList;

  @override
  final GenericState<List<HivePhoto>> photos;
  final List<HivePhoto> _selectedPhotoList;
  @override
  List<HivePhoto> get selectedPhotoList {
    if (_selectedPhotoList is EqualUnmodifiableListView)
      return _selectedPhotoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedPhotoList);
  }

  @override
  final bool photoDeleted;
  @override
  final bool isSelecting;
  @override
  final GenericState<HiveCategory> viewedPhotoCategory;

  @override
  String toString() {
    return 'GalleryManagerState(photos: $photos, selectedPhotoList: $selectedPhotoList, photoDeleted: $photoDeleted, isSelecting: $isSelecting, viewedPhotoCategory: $viewedPhotoCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalleryManagerStateImpl &&
            (identical(other.photos, photos) || other.photos == photos) &&
            const DeepCollectionEquality()
                .equals(other._selectedPhotoList, _selectedPhotoList) &&
            (identical(other.photoDeleted, photoDeleted) ||
                other.photoDeleted == photoDeleted) &&
            (identical(other.isSelecting, isSelecting) ||
                other.isSelecting == isSelecting) &&
            (identical(other.viewedPhotoCategory, viewedPhotoCategory) ||
                other.viewedPhotoCategory == viewedPhotoCategory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      photos,
      const DeepCollectionEquality().hash(_selectedPhotoList),
      photoDeleted,
      isSelecting,
      viewedPhotoCategory);

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
          {required final GenericState<List<HivePhoto>> photos,
          required final List<HivePhoto> selectedPhotoList,
          required final bool photoDeleted,
          required final bool isSelecting,
          required final GenericState<HiveCategory> viewedPhotoCategory}) =
      _$GalleryManagerStateImpl;

  @override
  GenericState<List<HivePhoto>> get photos;
  @override
  List<HivePhoto> get selectedPhotoList;
  @override
  bool get photoDeleted;
  @override
  bool get isSelecting;
  @override
  GenericState<HiveCategory> get viewedPhotoCategory;

  /// Create a copy of GalleryManagerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GalleryManagerStateImplCopyWith<_$GalleryManagerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
