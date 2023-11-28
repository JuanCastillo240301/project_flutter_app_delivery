import 'package:project_flutter_app_delivery/src/Base/ApiService/AppError.dart';
import 'package:project_flutter_app_delivery/src/Base/Constants/ErrorMessages.dart';
import 'package:project_flutter_app_delivery/src/features/data/Repositories/Auth/SignInRepository/SignInBodyParameters.dart';
import 'package:project_flutter_app_delivery/src/features/data/Repositories/Auth/SignInRepository/SignInRepository.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Auth/SignInEntity/SignInEntity.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Interfaces/Interfaces.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/Auth/GoogleSignInUseCase/GoogleSignInUseCase.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/Auth/SignInUseCase/SignInUseCaseBodyParameters.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ResultType/ResultType.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class SignInUseCase {
  Future<Result<SignInEntity, Failure>> execute(
      {required SignInUseCaseBodyParameters params});
}

class DefaultSignInUseCase extends SignInUseCase {
  // Dependencias
  SignInRepository _signInRepository;

  DefaultSignInUseCase({SignInRepository? signInRepository})
      : _signInRepository = signInRepository ?? DefaultSignInRepository();

  @override
  Future<Result<SignInEntity, Failure>> execute(
      {required SignInUseCaseBodyParameters params}) {
    return _signInRepository
        .signIn(
            params: SignInBodyParameters(
                email: params.email, password: params.password))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(
                message: AppFailureMessages.unExpectedErrorMessage));
          }
          var entity = SignInEntity.fromMap(result.value!.toMap());
          print(entity.localId.toString());
          print(entity.toJson());
          getUserData(entity.localId);
          GlobalUserData.idTok = entity.localId;

          return Result.success(entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}

Future<void> getUserData(String? userId) async {
  try {
    // URL de la base de datos de Firebase
    final String apiUrl =
        'https://project-flutter-app-delivery-default-rtdb.firebaseio.com/users/$userId.json';

    // Realizar una solicitud GET a la API REST de Firebase
    final response = await http.get(Uri.parse(apiUrl));

    // Verificar si la solicitud fue exitosa (código de estado 200)
    if (response.statusCode == 200) {
      // Convertir la respuesta JSON a un mapa
      Map<String, dynamic> userData = json.decode(response.body);

      // Verificar si el usuario existe
      if (userData != null) {
        // Acceder a los campos 'username' y 'photo' del mapa
        String username = userData['username'];
        String photoUrl = userData['photo'];
        GlobalUserData.name = username;
        GlobalUserData.photoURL = photoUrl;
        GlobalUserData.emailandpass = true;
        // Hacer algo con la información obtenida
        print('Username: $username');
        print('Photo URL: $photoUrl');
      } else {
        print('El usuario con el ID $userId no existe en la base de datos.');
      }
    } else {
      print(
          'Error al obtener los datos del usuario. Código de estado: ${response.statusCode}');
    }
  } catch (e) {
    print('Error al obtener los datos del usuario: $e');
  }
}
