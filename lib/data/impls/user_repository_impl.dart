import '../../app/app_constants.dart';
import '../../domain/interfaces/user_repository.dart';
import '../../domain/models/user/user.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<User> fetch(String token) async {
    await Future.delayed(Duration(seconds: AppConstants.delayTime));
    // Fake data
    // Token check, receive data
    return User(id: 'Elon');
  }
}
