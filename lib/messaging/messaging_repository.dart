import 'package:firebase_messaging/firebase_messaging.dart';

class MessagingRepository{

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  
  onConfigureMessaging() {
    
    _firebaseMessaging.configure(

      onMessage: (Map<String,dynamic> message) async{

      },
      onResume: (Map<String,dynamic> message)async{

      },
      onLaunch: (Map<String,dynamic> message) async{
        
      },

    );

  }

}
