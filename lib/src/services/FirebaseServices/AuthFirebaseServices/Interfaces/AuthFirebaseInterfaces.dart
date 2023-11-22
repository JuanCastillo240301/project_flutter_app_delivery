
import 'package:project_flutter_app_delivery/src/Base/ApiService/ApiService.dart';

abstract class BaseFirebaseService {
  ApiService apiService = DefaultApiService();
  static String baseUrl = "https://identitytoolkit.googleapis.com/v1/";
  static String signUpEndpoint = "accounts:signUp?key=";
  static String signInEndpoint = "accounts:signInWithPassword?key=";
  static String updatePasswordEndpoint = "accounts:sendOobCode?key=";
  static String getUserDataEndpoint = "accounts:lookup?key=";
  static String adminToken = "AIzaSyBO2RQ4LAC1yCt_OA5aNTdSSJ54Cd_Bi6E";
}

abstract class SignUpService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl + BaseFirebaseService.signUpEndpoint + BaseFirebaseService.adminToken;
  Future<Map<String,dynamic>> signUp({ required Map<String,dynamic> bodyParameters});
}

abstract class SignInService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl + BaseFirebaseService.signInEndpoint + BaseFirebaseService.adminToken;
  Future<Map<String,dynamic>> signIn({ required Map<String,dynamic> bodyParameters});
}

abstract class UpdatePasswordUserService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl + BaseFirebaseService.updatePasswordEndpoint + BaseFirebaseService.adminToken;
  Future<Map<String, dynamic>> updatePassword({required String email});
}

abstract class GetUserAuthDataService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl + BaseFirebaseService.getUserDataEndpoint + BaseFirebaseService.adminToken;
  Future<Map<String,dynamic>> getUserAuthData({ required Map<String,dynamic> bodyparameters });
}