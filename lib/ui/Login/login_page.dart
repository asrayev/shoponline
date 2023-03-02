import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoponline/ui/Login/sign_up_page.dart';
import 'package:shoponline/ui/main/pages/home/home_page.dart';
import 'package:shoponline/utils/my_colors.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';
import '../../data/models/user_model.dart';
import '../../view_model/login_view_model.dart';
import '../../view_model/profil_view_model.dart';

class LoginPage1 extends StatefulWidget {
  const LoginPage1({Key? key}) : super(key: key);

  @override
  State<LoginPage1> createState() => _LoginPage1State();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

final TextEditingController _controllerEmail = TextEditingController();
final TextEditingController _controllerPassword = TextEditingController();

class _LoginPage1State extends State<LoginPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        color: MyColors.C_0F1620,
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25, left: 25),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.grey,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          blurRadius: 3,
                          offset: Offset(2, 3), // Shadow position
                        ),
                      ],
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: TextFormField(
                          cursorHeight: 25,
                          cursorColor: Colors.white,
                          validator: (value) {
                            if (!EmailValidator.validate(value.toString())) {
                              return 'Please enter a valid email';
                            }
                          },
                          controller: _controllerEmail,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.white, fontSize: 17,
                            height: 25.0 / 15,),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: "Enter your email",
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.white.withOpacity(0)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.white.withOpacity(0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.only(right: 25, left: 25),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.grey,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          blurRadius: 3,
                          offset: Offset(2, 3), // Shadow position
                        ),
                      ],
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: TextFormField(
                          cursorHeight: 25,
                          cursorColor: Colors.white,
                          validator: (value) {
                            if (value!.length < 4)
                              return "Password is short";
                          },

                          controller: _controllerPassword,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.white, fontSize: 17,
                            height: 25.0 / 15,),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: "Enter your password",
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.white.withOpacity(0)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.white.withOpacity(0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                InkWell(
                  onTap: (() {
                    // formKey.currentState?.validate() == true ?{ Navigator.push(context, MaterialPageRoute(builder: (context)=> testscreen(number: 0))),
// saved(),
                    if (_formkey.currentState?.validate() == true) {
                      Provider.of<AuthViewModel>(context, listen: false)
                          .signInWithEmailAndPassword(
                          password: _controllerPassword.text.trim(),
                          email: _controllerEmail.text.trim());

                      // Provider.of<ProfileViewModel>(context,listen: false).addUser(
                      //   UserModel(
                      //     age: 0,
                      //     userId: FirebaseAuth.instance.currentUser!.uid,
                      //     fullName: "",
                      //     email: _controllerEmail.text.trim(),
                      //     createdAt: DateTime.now().toString(),
                      //     imageUrl: "",
                      // //   ),
                      // );
                    } else {
                      return;
                    }
                  }),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50,left: 50),
                    child: Container(
                      height: 45,
                     decoration: BoxDecoration(
                       color: Colors.blue,
                       borderRadius: BorderRadius.circular(10)
                     ),
                      child: Center(
                        child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17),),
                      ),
                    ),
                  ),

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member ?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),),
                    TextButton(onPressed: ((){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                    }), child: Text("SignUp now", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
