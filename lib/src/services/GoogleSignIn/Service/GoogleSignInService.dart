import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_flutter_app_delivery/src/Base/ApiService/AppError.dart';
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/RealtimeDatabaseService/Interfaces/interfaces.dart';
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/RealtimeDatabaseService/Services/RealtimeDataBaseService.dart';
import 'package:project_flutter_app_delivery/src/services/GoogleSignIn/Entities/GoogleUserEntity.dart';
import 'package:project_flutter_app_delivery/src/services/GoogleSignIn/Interfaces/Interfaces.dart';
import 'package:project_flutter_app_delivery/src/services/GoogleSignIn/Mappers/GoogleSignInMappers.dart';




class DefaultGoogleSignInService extends GoogleSignInService {
  final RealtimeDatabaseService _realtimeDataBaseService;
  String _path = "users/";

  // Dependencies
  DefaultGoogleSignInService({ RealtimeDatabaseService? realtimeDataBaseService })
           : _realtimeDataBaseService = realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<GoogleSignInUserEntity> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    return GoogleSignInMapper.mapUserCredential(userCredential,
                                                googleAuth?.idToken);
  }

  @override
  Future<bool> isUserInDatabase({ required String uid }) async {
    final fullpath = _path + uid;
    try {
      final result = await _realtimeDataBaseService.getData(path: fullpath);
      return result.isNotEmpty;
    } on Failure catch (f) {
      return false;
    }
  }
}