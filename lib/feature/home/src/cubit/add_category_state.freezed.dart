// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddCategoryState _$AddCategoryStateFromJson(Map<String, dynamic> json) {
  return _AddCategoryState.fromJson(json);
}

/// @nodoc
mixin _$AddCategoryState {
  int get selectedColorIndex => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  List<CategoryModel>? get folders => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;

  /// Serializes this AddCategoryState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddCategoryStateCopyWith<AddCategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCategoryStateCopyWith<$Res> {
  factory $AddCategoryStateCopyWith(
          AddCategoryState value, $Res Function(AddCategoryState) then) =
      _$AddCategoryStateCopyWithImpl<$Res, AddCategoryState>;
  @useResult
  $Res call(
      {int selectedColorIndex,
      bool isSubmitting,
      List<CategoryModel>? folders,
      bool isSuccess,
      bool isFailure});
}

/// @nodoc
class _$AddCategoryStateCopyWithImpl<$Res, $Val extends AddCategoryState>
    implements $AddCategoryStateCopyWith<$Res> {
  _$AddCategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedColorIndex = null,
    Object? isSubmitting = null,
    Object? folders = freezed,
    Object? isSuccess = null,
    Object? isFailure = null,
  }) {
    return _then(_value.copyWith(
      selectedColorIndex: null == selectedColorIndex
          ? _value.selectedColorIndex
          : selectedColorIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      folders: freezed == folders
          ? _value.folders
          : folders // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>?,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailure: null == isFailure
          ? _value.isFailure
          : isFailure // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddCategoryStateImplCopyWith<$Res>
    implements $AddCategoryStateCopyWith<$Res> {
  factory _$$AddCategoryStateImplCopyWith(_$AddCategoryStateImpl value,
          $Res Function(_$AddCategoryStateImpl) then) =
      __$$AddCategoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int selectedColorIndex,
      bool isSubmitting,
      List<CategoryModel>? folders,
      bool isSuccess,
      bool isFailure});
}

/// @nodoc
class __$$AddCategoryStateImplCopyWithImpl<$Res>
    extends _$AddCategoryStateCopyWithImpl<$Res, _$AddCategoryStateImpl>
    implements _$$AddCategoryStateImplCopyWith<$Res> {
  __$$AddCategoryStateImplCopyWithImpl(_$AddCategoryStateImpl _value,
      $Res Function(_$AddCategoryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedColorIndex = null,
    Object? isSubmitting = null,
    Object? folders = freezed,
    Object? isSuccess = null,
    Object? isFailure = null,
  }) {
    return _then(_$AddCategoryStateImpl(
      selectedColorIndex: null == selectedColorIndex
          ? _value.selectedColorIndex
          : selectedColorIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      folders: freezed == folders
          ? _value._folders
          : folders // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>?,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailure: null == isFailure
          ? _value.isFailure
          : isFailure // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddCategoryStateImpl implements _AddCategoryState {
  const _$AddCategoryStateImpl(
      {required this.selectedColorIndex,
      required this.isSubmitting,
      required final List<CategoryModel>? folders,
      required this.isSuccess,
      required this.isFailure})
      : _folders = folders;

  factory _$AddCategoryStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddCategoryStateImplFromJson(json);

  @override
  final int selectedColorIndex;
  @override
  final bool isSubmitting;
  final List<CategoryModel>? _folders;
  @override
  List<CategoryModel>? get folders {
    final value = _folders;
    if (value == null) return null;
    if (_folders is EqualUnmodifiableListView) return _folders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool isSuccess;
  @override
  final bool isFailure;

  @override
  String toString() {
    return 'AddCategoryState(selectedColorIndex: $selectedColorIndex, isSubmitting: $isSubmitting, folders: $folders, isSuccess: $isSuccess, isFailure: $isFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCategoryStateImpl &&
            (identical(other.selectedColorIndex, selectedColorIndex) ||
                other.selectedColorIndex == selectedColorIndex) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            const DeepCollectionEquality().equals(other._folders, _folders) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, selectedColorIndex, isSubmitting,
      const DeepCollectionEquality().hash(_folders), isSuccess, isFailure);

  /// Create a copy of AddCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCategoryStateImplCopyWith<_$AddCategoryStateImpl> get copyWith =>
      __$$AddCategoryStateImplCopyWithImpl<_$AddCategoryStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddCategoryStateImplToJson(
      this,
    );
  }
}

abstract class _AddCategoryState implements AddCategoryState {
  const factory _AddCategoryState(
      {required final int selectedColorIndex,
      required final bool isSubmitting,
      required final List<CategoryModel>? folders,
      required final bool isSuccess,
      required final bool isFailure}) = _$AddCategoryStateImpl;

  factory _AddCategoryState.fromJson(Map<String, dynamic> json) =
      _$AddCategoryStateImpl.fromJson;

  @override
  int get selectedColorIndex;
  @override
  bool get isSubmitting;
  @override
  List<CategoryModel>? get folders;
  @override
  bool get isSuccess;
  @override
  bool get isFailure;

  /// Create a copy of AddCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddCategoryStateImplCopyWith<_$AddCategoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
