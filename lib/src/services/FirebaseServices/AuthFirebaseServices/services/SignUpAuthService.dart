
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/AuthFirebaseServices/Interfaces/AuthFirebaseInterfaces.dart';

class DefaultSignUpService extends SignUpService {

  @override
  Future<Map<String, dynamic>> signUp({required Map<String, dynamic> bodyParameters}) {
    return apiService.getDataFromPostRequest(bodyParameters: bodyParameters, url: endpoint);
  }
}