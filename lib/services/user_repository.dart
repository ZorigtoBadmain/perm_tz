import 'package:perm_tz/models/user.dart';
import 'package:perm_tz/services/user_api_provader.dart';

class UsersRepository {
  UserProvider _userProvider = UserProvider();
  Future<List<User>> getAllUsers() => _userProvider.getUser();
}