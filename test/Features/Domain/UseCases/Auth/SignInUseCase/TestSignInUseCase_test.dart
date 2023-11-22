
// import 'package:deliver_app_yt/src/Base/ApiService/AppError.dart';
// import 'package:deliver_app_yt/src/Base/Constants/ErrorMessages.dart';
// import 'package:deliver_app_yt/src/Features/Domain/Entities/Auth/SignInEntity/SignInEntity.dart';
// import 'package:deliver_app_yt/src/Features/Domain/UseCases/Auth/SignInUseCase/SignInUseCase.dart';
// import 'package:deliver_app_yt/src/Features/Domain/UseCases/Auth/SignInUseCase/SignInUseCaseBodyParameters.dart';
// import 'package:deliver_app_yt/src/Services/FirebaseServices/AuthFirebaseServices/Decodables/AuthErrorDecodable.dart';
// import 'package:deliver_app_yt/src/Utils/Helpers/ResultType/ResultType.dart';
// import 'package:flutter_test/flutter_test.dart';

// abstract class _Constants {
//   static String correctEmail = "cane2@gmail.com";
//   static String correctPass = "1234566363636";
//   static String wrongEmail = "cane45@gmail.com";
//   static String wrongPass = "123456";
// }

// void main() {
//   // GIVEN
//   final SignInUseCase sut = DefaultSignInUseCase();

//   group('Test success response to SignInUseCase', () {
//     test('Test success signIn feature with correct email and password', () async {
//       // GIVEN
//       final SignInUseCaseBodyParameters _params = SignInUseCaseBodyParameters(email:_Constants.correctEmail,
//                                                                               password: _Constants.correctPass);
//       // WHEN
//       var result = await sut.execute(params: _params);
//       switch (result.status) {
//         case ResultStatus.success:
//           expect(result.value, isA<SignInEntity>());
//           break;
//         case ResultStatus.error:
//           //THEN
//           expect(result.error, Failure);
//           break;
//       }
//     });

//     // TODO: Añadir más test ;)
//   });

//   group('Test failure response to SignInUseCase', () {
//       test('Test failure response to SignInUseCase', () async {
//         // GIVEN
//         final SignInUseCaseBodyParameters _params = SignInUseCaseBodyParameters(email:_Constants.wrongEmail,
//             password: _Constants.wrongPass);

//         try {
//           final _ = await sut.execute(params: _params);
//         } on Failure catch(f) {
//           AuthErrorDecodable _error = f as AuthErrorDecodable;
//           // THEN
//           expect(_error.error!.message, FBFailureMessages.emailNotFoundMessage);
//         }
//       });

//       test('Test failure response to SignInUseCase with wrong password', () async {
//         // GIVEN
//         final SignInUseCaseBodyParameters _params = SignInUseCaseBodyParameters(email:_Constants.correctEmail,
//                                                                                 password: _Constants.wrongPass);

//         try {
//           final _ = await sut.execute(params: _params);
//         } on Failure catch(f) {
//           AuthErrorDecodable _error = f as AuthErrorDecodable;
//           // THEN
//           expect(_error.error!.message, FBFailureMessages.invalidPasswordMessage);
//         }
//       });

//       // TODO: Añadir más test ;)
//   });

// }