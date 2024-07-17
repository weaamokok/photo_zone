import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_state.freezed.dart';

@freezed
class GenericState<T> with _$GenericState<T> {
  const factory GenericState.initial() = _Initial<T>;

  const factory GenericState.loading() = _Loading<T>;

  const factory GenericState.loaded(T data) = _Loaded<T>;

  const factory GenericState.failedProcess([String? message]) =
      _FailedProcess<T>;

  const factory GenericState.emptyPage() = _EmptyPage<T>;
}

extension GenericStateX<T> on GenericState<T> {
  bool get isLoading => this is _Loading<T>;

  bool get isLoaded => this is _Loaded<T>;

  bool get isFailedProcess => this is _FailedProcess<T>;
}
