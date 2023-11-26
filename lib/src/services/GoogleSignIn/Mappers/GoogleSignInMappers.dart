
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_flutter_app_delivery/src/services/GoogleSignIn/Entities/GoogleUserEntity.dart';

class GoogleSignInMapper {
  static GoogleSignInUserEntity mapUserCredential(UserCredential credential, String? idToken) {
     return GoogleSignInUserEntity(credential.user, idToken);
  }
}