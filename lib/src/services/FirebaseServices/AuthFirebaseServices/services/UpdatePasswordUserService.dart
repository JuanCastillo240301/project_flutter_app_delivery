
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/AuthFirebaseServices/Interfaces/AuthFirebaseInterfaces.dart';
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/AuthFirebaseServices/BodyParameters/UpdatePasswordUserServiceBodyParameters.dart';

class DefaultUpdatePasswordUserService extends UpdatePasswordUserService {

  final String _requesType = "PASSWORD_RESET";

  @override
  Future<Map<String, dynamic>> updatePassword({ required String email }) {
    final _params = UpdatePasswordBodyParameters(requestType: _requesType, email: email);
    return apiService.getDataFromPostRequest(bodyParameters: _params.toMap(), url: endpoint);
  }
}