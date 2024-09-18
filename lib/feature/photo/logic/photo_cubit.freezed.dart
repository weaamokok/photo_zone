// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhotoState {
  GenericState<List<HiveCategory>> get categories =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  int? get selectedCategory => throw _privateConstructorUsedError;
  GenericState<HivePhoto> get photo => throw _privateConstructorUsedError;

  /// Create a copy of PhotoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotoStateCopyWith<PhotoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoStateCopyWith<$Res> {
  factory $PhotoStateCopyWith(
          PhotoState value, $Res Function(PhotoState) then) =
      _$PhotoStateCopyWithImpl<$Res, PhotoState>;
  @useResult
  $Res call(
      {GenericState<List<HiveCategory>> categories,
      bool isLoading,
      int? selectedCategory,
      GenericState<HivePhoto> photo});

  $GenericStateCopyWith<List<HiveCategory>, $Res> get categories;
  $GenericStateCopyWith<HivePhoto, $Res> get photo;
}

/// @nodoc
class _$PhotoStateCopyWithImpl<$Res, $Val extends PhotoState>
    implements $PhotoStateCopyWith<$Res> {
  _$PhotoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? isLoading = null,
    Object? selectedCategory = freezed,
    Object? photo = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as GenericState<List<HiveCategory>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as int?,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as GenericState<HivePhoto>,
    ) as $Val);
  }

  /// Create a copy of PhotoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GenericStateCopyWith<List<HiveCategory>, $Res> get categories {
    return $GenericStateCopyWith<List<HiveCategory>, $Res>(_value.categories,
        (value) {
      return _then(_value.copyWith(categories: value) as $Val);
    });
  }

  /// Create a copy of PhotoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GenericStateCopyWith<HivePhoto, $Res> get photo {
    return $GenericStateCopyWith<HivePhoto, $Res>(_value.photo, (value) {
      return _then(_value.copyWith(photo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PhotoStateImplCopyWith<$Res>
    implements $PhotoStateCopyWith<$Res> {
  factory _$$PhotoStateImplCopyWith(
          _$PhotoStateImpl value, $Res Function(_$PhotoStateImpl) then) =
      __$$PhotoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GenericState<List<HiveCategory>> categories,
      bool isLoading,
      int? selectedCategory,
      GenericState<HivePhoto> photo});

  @override
  $GenericStateCopyWith<List<HiveCategory>, $Res> get categories;
  @override
  $GenericStateCopyWith<HivePhoto, $Res> get photo;
}

/// @nodoc
class __$$PhotoStateImplCopyWithImpl<$Res>
    extends _$PhotoStateCopyWithImpl<$Res, _$PhotoStateImpl>
    implements _$$PhotoStateImplCopyWith<$Res> {
  __$$PhotoStateImplCopyWithImpl(
      _$PhotoStateImpl _value, $Res Function(_$PhotoStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? isLoading = null,
    Object? selectedCategory = freezed,
    Object? photo = null,
  }) {
    return _then(_$PhotoStateImpl(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as GenericState<List<HiveCategory>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as int?,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as GenericState<HivePhoto>,
    ));
  }
}

/// @nodoc

class _$PhotoStateImpl implements _PhotoState {
  const _$PhotoStateImpl(
      {required this.categories,
      required this.isLoading,
      required this.selectedCategory,
      required this.photo});

  @override
  final GenericState<List<HiveCategory>> categories;
  @override
  final bool isLoading;
  @override
  final int? selectedCategory;
  @override
  final GenericState<HivePhoto> photo;

  @override
  String toString() {
    return 'PhotoState(categories: $categories, isLoading: $isLoading, selectedCategory: $selectedCategory, photo: $photo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoStateImpl &&
            (identical(other.categories, categories) ||
                other.categories == categories) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, categories, isLoading, selectedCategory, photo);

  /// Create a copy of PhotoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoStateImplCopyWith<_$PhotoStateImpl> get copyWith =>
      __$$PhotoStateImplCopyWithImpl<_$PhotoStateImpl>(this, _$identity);
}

abstract class _PhotoState implements PhotoState {
  const factory _PhotoState(
      {required final GenericState<List<HiveCategory>> categories,
      required final bool isLoading,
      required final int? selectedCategory,
      required final GenericState<HivePhoto> photo}) = _$PhotoStateImpl;

  @override
  GenericState<List<HiveCategory>> get categories;
  @override
  bool get isLoading;
  @override
  int? get selectedCategory;
  @override
  GenericState<HivePhoto> get photo;

  /// Create a copy of PhotoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotoStateImplCopyWith<_$PhotoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
