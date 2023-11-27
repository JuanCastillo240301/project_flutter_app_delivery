import 'package:firebase_messaging/firebase_messaging.dart';
class FirebaseApi{
  final _message = FirebaseMessaging.instance;


  Future<void> initNoti()async{
    await _message.requestPermission();
    final fcmtoken = await _message.getToken();

    print(fcmtoken); 
  }
}