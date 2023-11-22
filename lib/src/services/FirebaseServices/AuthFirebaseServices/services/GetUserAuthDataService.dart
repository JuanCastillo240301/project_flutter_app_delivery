


import 'package:project_flutter_app_delivery/src/services/FirebaseServices/AuthFirebaseServices/Interfaces/AuthFirebaseInterfaces.dart';

class DefaultGetUserAuthDataService extends GetUserAuthDataService {

  @override
  Future<Map<String, dynamic>> getUserAuthData({required Map<String, dynamic> bodyparameters}) {
    return apiService.getDataFromPostRequest(bodyParameters: bodyparameters, url: endpoint);
  }
}