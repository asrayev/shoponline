import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoponline/utils/myMediaquery.dart';
import 'package:provider/provider.dart';
import '../../../data/models/user_model.dart';
import '../../../view_model/login_view_model.dart';
import '../../../view_model/profil_view_model.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> signOut() async {
      await Provider.of<AuthViewModel>(context, listen: false).signOut();
    }
    return Scaffold(
      body: Container(
        height: m_h(context),
        width: m_w(context),
        child: Column(
          children: [
            SizedBox(height: 500,),
            InkWell(
              onTap: ((){
                signOut();
              }),
              child: Container(height: 50,
              width: 250,
              color: Colors.yellow,
              child: Center(child: Text("Sign Out")),),
            ),
            SizedBox(height: 40,),

          ],
        ),
      ),
    );
  }
}
