
import 'package:project_flutter_app_delivery/src/services/FirebaseServices/AuthFirebaseServices/Interfaces/AuthFirebaseInterfaces.dart';

class DefaultSignInService extends SignInService {

  @override
  Future<Map<String, dynamic>> signIn({required Map<String, dynamic> bodyParameters}) {
    return apiService.getDataFromPostRequest(bodyParameters: bodyParameters, 
                                             url: endpoint);
  }
}