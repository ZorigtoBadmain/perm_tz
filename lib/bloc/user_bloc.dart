import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perm_tz/bloc/user_event.dart';
import 'package:perm_tz/bloc/user_state.dart';
import 'package:perm_tz/models/user.dart';
import 'package:perm_tz/services/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState>{

  final UsersRepository userRepository;
  UserBloc({this.userRepository}) : assert (UsersRepository != null);
  @override

  UserState get initialState => UserEmtyState();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserLoadEvent) {
      yield UserLoadingState();
      try {

        final List<User> _loadedUserList = await userRepository.getAllUsers();
        yield UserLoadedState(loadedUser: _loadedUserList);
      } catch (_) {
        yield UserErrorState();
      }
    } else if (event is UserClearEvent) {
      yield UserEmtyState();
    }
  }

}