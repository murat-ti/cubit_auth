import '../models/auth_data/auth_data.dart';
import '../models/registration/registration_model.dart';

abstract class AuthRepository {
  //Registration
  Future<AuthData> signUp(RegistrationModel registrationModel);

  //Authorization
  Future<AuthData> signIn();

  //Logout
  Future signOut();
}
