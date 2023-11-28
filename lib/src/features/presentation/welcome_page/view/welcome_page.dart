import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/Base/Views/BaseView.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/StateProviders/LoadingStateProvider.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/header_text.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/rounded_button.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/welcome_page/viewModel/WelcomePageViewModel.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ResultType/ResultType.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/Auth/GoogleSignInUseCase/GoogleSignInUseCase.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WelcomePage extends StatefulWidget with BaseView {
  WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with BaseView {
// Almacena la información del usuario
  final WelcomePageViewModel viewModel;
  _WelcomePageState({WelcomePageViewModel? welcomePageViewModel})
      : viewModel = welcomePageViewModel ?? DefaultWelcomePageViewModel();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GitHubSignIn _gitHubSignIn = GitHubSignIn(
    clientId: '2969c2ed80f6da9a20bf',
    clientSecret: '8db41435904c842909179294403e3363eae74ea4',
    redirectUrl:
        'https://project-flutter-app-delivery.firebaseapp.com/__/auth/handler',
  );
  @override
  Widget build(BuildContext context) {
    viewModel.initState(
        loadingStateProvider: Provider.of<LoadingStateProvider>(context));

    return viewModel.loadingState.isLoading
        ? loadingView
        : Scaffold(
            body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    // Utilizar CachedNetworkImageProvider para obtener un ImageProvider desde la URL
                    image: CachedNetworkImageProvider(
                      'https://firebasestorage.googleapis.com/v0/b/project-flutter-app-delivery.appspot.com/o/imagen_2023-11-27_073911833.png?alt=media&token=e31052c9-9b39-4d63-99a0-b76fe632f860',
                    ),
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                  child: Container(
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: createText(
                        texto: 'DELIVERED FAST FOOD\nTO YOUR\nDOOR',
                        color: Colors.white,
                        fontSize: 40.0),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 30.0),
                    child: const Text(
                        'Set exact location to find the right restaurants near you.',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 17.0)),
                  ),
                  createElevatedButton(
                      labelButton: 'Log in',
                      color: orange,
                      shape: const StadiumBorder(),
                      func: () {
                        Navigator.pushNamed(context, 'login');
                      }),
                  createElevatedButton(
                      labelButton: 'Connect with Google',
                      color: Colors.blue,
                      isWithIcon: true,
                      shape: const StadiumBorder(),
                      icon: const AssetImage('assets/google1.png'),
                      func: () => googleSignInTapped(context)),
                  createElevatedButton(
                      labelButton: 'Connect with Github',
                      color: Colors.blueGrey,
                      isWithIcon: true,
                      shape: const StadiumBorder(),
                      icon: const AssetImage('assets/github1.png'),
                      func: () => githubSignInTapped(context)),
                ],
              )
            ],
          ));
  }

// Método para manejar la autenticación con GitHub
  void githubSignInTapped(BuildContext context) async {
    try {
      final GitHubSignInResult result = await _gitHubSignIn.signIn(context);

      final AuthCredential githubAuthCredential =
          GithubAuthProvider.credential(result.token!);

      final UserCredential userCredential =
          await _auth.signInWithCredential(githubAuthCredential);

      // Verifica si el inicio de sesión fue exitoso
      if (userCredential.user != null) {
        // Accede a la información del usuario
        final User user = userCredential.user!;

        // Imprime el nombre y la URL de la foto del perfil en la consola
        String displayName = user.displayName ??
            user.providerData.first.displayName ??
            'Usuario Desconocido';
        print('Nombre del usuario: $displayName');
        GlobalUserData.name = displayName;
        print('URL de la foto del perfil: ${user.photoURL}');
        GlobalUserData.photoURL = user.photoURL;

        // Redirige a la pantalla principal después del inicio de sesión exitoso
        Navigator.pushNamed(context, 'tabs');
      } else {
        // Maneja el caso de inicio de sesión no exitoso según tus necesidades
      }
    } catch (e) {
      print('Error al iniciar sesión con GitHub: $e');
      // Maneja el error según tus necesidades
    }
  }
}

extension UserActions on _WelcomePageState {
  googleSignInTapped(BuildContext context) {
    viewModel.signInWithGoogle().then((result) {
      switch (result.status) {
        case ResultStatus.success:
          coordinator.showTabsPage(context: context);
          break;
        case ResultStatus.error:
          errorStateProvider.setFailure(context: context, value: result.error!);
          break;
      }
    });
  }
}
