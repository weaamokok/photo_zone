import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_manager_state.dart';
part 'gallery_manager_cubit.freezed.dart';

class GalleryManagerCubit extends Cubit<GalleryManagerState> {
  GalleryManagerCubit() : super(GalleryManagerState.initial());
}
