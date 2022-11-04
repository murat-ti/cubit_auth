import '../../app/app_constants.dart';
import '../../localization/string_hardcoded.dart';
import '../../domain/interfaces/auth_repository.dart';
import '../../domain/models/auth_data/auth_data.dart';
import '../../domain/models/registration/registration_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<AuthData> signUp(RegistrationModel registrationModel) async {
    await Future.delayed(Duration(seconds: AppConstants.delayTime));
    if (registrationModel.name == "error") {
      throw 'Registration error'.hardcoded;
    }
    return AuthData(
      apiToken: "nhgngalksdjjidwesolkdjlojh***cxvxc*as",
    );
  }

  @override
  Future<AuthData> signIn() {
    throw UnimplementedError();
  }

  @override
  Future signOut() {
    return Future.delayed(Duration(seconds: AppConstants.delayTime));
  }
}
