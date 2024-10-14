import 'package:bloc/bloc.dart';
import 'package:photo_zone/domain_model/generic_state.dart';
import 'package:photo_zone/domain_model/user_model.dart';
import 'package:photo_zone/feature/profile_layout/logic/cubit/profile_state.dart';
import 'package:photo_zone/local_storage/src/photo_local_database_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.localStorage})
      : super(const ProfileState(user: GenericState.initial()));
  final LocalStorage localStorage;

  void registertUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final user = UserHive(
        image: '',
        email: '',
        createdAt: DateTime.now(),
        name: '',
        userName: '');
    final response = await localStorage.addUser(userHive: user);
    response.fold(
      (l) {
        return;
      },
      (r) {
        prefs.setInt('userId', r);
      },
    );
  }

  void fetchUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');
    if (userId == null) {
      emit(state.copyWith(user: const GenericState.emptyPage()));

      return;
    }
    emit(state.copyWith(user: const GenericState.loading()));

    final response = await localStorage.fetchUserInfo(userId: userId);
    response.fold(
      (l) => emit(state.copyWith(user: const GenericState.failedProcess())),
      (r) {
        if (r == null) {
          emit(state.copyWith(user: const GenericState.emptyPage()));
          return;
        }
        emit(state.copyWith(user: GenericState.loaded(r)));
      },
    );
  }
}
