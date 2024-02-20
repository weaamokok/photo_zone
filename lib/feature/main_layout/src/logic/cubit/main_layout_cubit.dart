import 'package:bloc/bloc.dart';

part 'main_layout_state.dart';

class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit() : super(const MainLayoutState(index: 0));
  void changeIndex(int index) {
    emit(MainLayoutState(index: index));
  }
}
