import '../models/user/user.dart';

abstract class UserRepository {
  Future<User> fetch(String token);
}
