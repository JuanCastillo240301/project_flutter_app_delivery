
import 'package:project_flutter_app_delivery/src/services/GoogleSignIn/Entities/GoogleUserEntity.dart';

abstract class GoogleSignInService {
   Future<GoogleSignInUserEntity> signInWithGoogle();
   Future<bool> isUserInDatabase({ required String uid });
}