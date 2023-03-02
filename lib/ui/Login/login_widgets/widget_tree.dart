import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shoponline/data/login_register/auth.dart';
import 'package:shoponline/ui/Login/login_page.dart';
import 'package:shoponline/ui/Login/sign_up_page.dart';
import 'package:shoponline/ui/main/pages/home/home_page.dart';
import 'package:shoponline/ui/Login/login_and_register_page.dart';
import 'package:provider/provider.dart';


import '../../../data/models/user_model.dart';
import '../../../view_model/login_view_model.dart';
import '../../../view_model/profil_view_model.dart';
import '../../main/mainPage.dart';
class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Provider.of<AuthViewModel>(context,listen: false).checkAuthState(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            Provider.of<ProfileViewModel>(context, listen: false).addUser(
              UserModel(
                  docId: "",
                  age: 0,
                  userId: FirebaseAuth.instance.currentUser!.uid,
                  fullName: "",
                  email: FirebaseAuth.instance.currentUser!.email.toString(),
                  createdAt: DateTime.now().toString(),
                  imageUrl: "",
                  fcmToken: "" ?? ""),
            );
            return MainPage();
          }else if (2==3){
            return SignUpPage();
          }else{
            return LoginPage1();
          }

        });
  }

}
