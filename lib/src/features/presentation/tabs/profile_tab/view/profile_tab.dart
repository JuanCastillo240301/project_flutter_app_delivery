import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/Base/Views/LoadingView.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/domain/UserCases/Auth/GoogleSignInUseCase/GoogleSignInUseCase.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/StateProviders/LoadingStateProvider.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Alerts/alert_dialog.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Buttons/rounded_button.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Texts/header_text.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/tabs/profile_tab/model/ProfileTabViewModel.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/welcome_page/view/welcome_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  String? photoURL = GlobalUserData.photoURL;
  String? name = GlobalUserData.name;
  String? idTok = GlobalUserData.idTok;
  final ProfileTabViewModel _viewModel;
  bool _updating = false;

  _ProfileTabState({ProfileTabViewModel? profileTabViewModel})
      : _viewModel = profileTabViewModel ?? DefaultProfileTabViewModel();

  @override
  Widget build(BuildContext context) {
    getUserData(idTok, GlobalUserData.emailandpass);
    if (photoURL == '') {
      photoURL =
          'https://lh3.googleusercontent.com/a/ACg8ocIHoNI2WNV2deDNhANmBZMVcotxhmjeuqiNCXntTcGnFqE=s432-c-no';
    }
    if (name == '') {
      name = 'Juan Perez';
    }
    _viewModel.initState(
        loadingState: Provider.of<LoadingStateProvider>(context));
    print('Id a usar $idTok');
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          Column(
            children: [
              GestureDetector(
                  onTap: () {
                    if (GlobalUserData.emailandpass == true) {
                      _showImagePickerDialog(context);
                    }
                    setState(() {});
                  },
                  child: _header()),
              _contentProfile(context)
            ],
          ),
        ]))
      ],
    ));
  }

  Widget _header() {
    return Container(
      height: 250,
      color: bgGreyPage,
      padding: EdgeInsets.all(40),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(photoURL ??
                'https://lh3.googleusercontent.com/a/ACg8ocIHoNI2WNV2deDNhANmBZMVcotxhmjeuqiNCXntTcGnFqE=s432-c-no'),
            radius: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    createText(
                        texto: name ?? 'Juan Perez',
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                    IconButton(
                        icon: Icon(Icons.chevron_right, color: grey),
                        onPressed: () {})
                  ],
                ),
              ),
              Container(
                height: 25,
                margin: EdgeInsets.only(left: 20.0),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _contentProfile(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            leading: Image(
              image: AssetImage('assets/noti.png'),
              width: 29,
              height: 29,
            ),
            title:
                createText(texto: 'Notifications', fontWeight: FontWeight.w400),
            trailing: Icon(Icons.chevron_right, color: grey),
          ),
          ListTile(
            leading: Image(
              image: AssetImage('assets/payicon.png'),
              width: 29,
              height: 29,
            ),
            title: createText(
                texto: 'Payment methods', fontWeight: FontWeight.w400),
            trailing: Icon(Icons.chevron_right, color: grey),
          ),
          ListTile(
            leading: Image(
              image: AssetImage('assets/rewardicon.png'),
              width: 29,
              height: 29,
            ),
            title: createText(texto: 'History', fontWeight: FontWeight.w400),
            trailing: Icon(Icons.chevron_right, color: grey),
          ),
          ListTile(
            leading: Image(
              image: AssetImage('assets/promoicon.png'),
              width: 29,
              height: 29,
            ),
            title: createText(texto: 'Promo Code', fontWeight: FontWeight.w400),
            trailing: Icon(Icons.chevron_right, color: grey),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Image(
              image: AssetImage('assets/settingicon.png'),
              width: 29,
              height: 29,
            ),
            title: createText(texto: 'Settings', fontWeight: FontWeight.w400),
            trailing: Icon(Icons.chevron_right, color: grey),
          ),
          ListTile(
            leading: Image(
              image: AssetImage('assets/inviteicon.png'),
              width: 29,
              height: 29,
            ),
            title: createText(
                texto: 'Invite Friends', fontWeight: FontWeight.w400),
            trailing: Icon(Icons.chevron_right, color: grey),
          ),
          ListTile(
            leading: Image(
              image: AssetImage('assets/helpicon.png'),
              width: 29,
              height: 29,
            ),
            title:
                createText(texto: 'Help Center', fontWeight: FontWeight.w400),
            trailing: Icon(Icons.chevron_right, color: grey),
          ),
          ListTile(
            leading: Image(
              image: AssetImage('assets/abouticon.png'),
              width: 29,
              height: 29,
            ),
            title: createText(texto: 'About us', fontWeight: FontWeight.w400),
            trailing: Icon(Icons.chevron_right, color: grey),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/logout.png'),
              width: 29,
              height: 29,
            ),
            title: Text('Cerrar sesión',
                style: TextStyle(fontWeight: FontWeight.w400)),
            trailing: Icon(Icons.chevron_right, color: grey),
            onTap: () => _signOut(context),
          )
        ],
      ),
    );
  }

  Future _signOut(BuildContext context) async {
    await showAlertDialog(
        context,
        AssetImage('assets/logout.png'),
        'Cierre de sesión en curso',
        "¿Desear salir de la sesión actual?",
        createElevatedButton(
            context: context,
            color: orange,
            labelButton: 'Cerrar Sesión',
            func: () {
              GlobalUserData.photoURL = '';
              GlobalUserData.name = '';
              _viewModel.signOut().then((_) {
                GlobalUserData.emailandpass = false;
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => WelcomePage(),
                        transitionDuration: Duration(seconds: 0)));
              });
            }));
  }
}

Future<void> updateProfilePhoto(String? userId, BuildContext context) async {
  try {
    // Obtener la imagen desde la galería
    final imagePicker = ImagePicker();
    final XFile? pickedFile =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);

      // Obtener la URL del almacenamiento en Firebase
      final storageUrl = await uploadImageToStorage(userId, imageFile);

      // Actualizar el campo 'photo' en la base de datos Realtime Database
      final databaseUrl =
          'https://project-flutter-app-delivery-default-rtdb.firebaseio.com/users/$userId.json';
      await http.patch(Uri.parse(databaseUrl),
          body: '{"photo": "$storageUrl"}');

      // Actualizar la interfaz de usuario con la nueva foto
      // (puedes implementar esta parte según tu estructura de widgets)
      // por ejemplo, setState() o un bloc pattern.

      print('Foto de perfil actualizada correctamente.');
      Navigator.popAndPushNamed(context, 'tabs');
    }
  } catch (e) {
    print('Error al actualizar la foto de perfil: $e');
  }
}

Future<String> uploadImageToStorage(String? userId, File imageFile) async {
  try {
    // Obtener la referencia al almacenamiento en Firebase
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('profile_images')
        .child('$userId.jpg');

    // Subir la imagen al almacenamiento en Firebase
    await storageRef.putFile(imageFile);

    // Obtener la URL de descarga de la imagen
    String imageUrl = await storageRef.getDownloadURL();

    return imageUrl;
  } catch (e) {
    print('Error al subir la imagen al almacenamiento: $e');
    throw e; // Puedes manejar o propagar el error según tu lógica de la aplicación.
  }
}

Future<void> getUserData(String? userId, bool? emailandpass) async {
  if (emailandpass == true) {
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
  } else {
    print('Auth alterno');
  }
}

Future<void> _showImagePickerDialog(BuildContext context) async {
  showAlertDialog(
      context,
      AssetImage('assets/plus_order.png'),
      'Cargar Imagen desde Galeria',
      "¿Desear cambiar su foto de perfil?",
      createElevatedButton(
          context: context,
          color: orange,
          labelButton: 'Seleccionar foto desde galeria',
          func: () async {
            await updateProfilePhoto(GlobalUserData.idTok, context);
          }));
}
