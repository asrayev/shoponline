import 'package:flutter/material.dart';
import 'package:shoponline/ui/main/pages/home/home_page.dart';
import 'package:shoponline/utils/my_colors.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';
import '../../utils/my_utils.dart';
import '../../view_model/login_view_model.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

final TextEditingController _controllerEmail = TextEditingController();
final TextEditingController _controllerPassword = TextEditingController();
final TextEditingController _controllerPassword1 = TextEditingController();
class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: MyColors.C_0F1620,
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                
                SizedBox(
                  height: 100,
                ),
                Text("Register", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,fontSize: 30)),
                SizedBox(height: 190,),
                Padding(
                  padding: const EdgeInsets.only(right: 25,left: 25),
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
                          style: TextStyle(color: Colors.white,fontSize: 17,
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
                  padding: EdgeInsets.only(right: 25,left: 25),
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
                              return "Password is short";},

                          controller: _controllerPassword,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.white,fontSize: 17,
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
                SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.only(right: 25,left: 25),
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
                            // if (_controllerPassword == _controllerPassword1 )
                            //   return "Password are not equal";},
                            if (value!.length < 4)
                              return "Password is short";},

                          controller: _controllerPassword1,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.white,fontSize: 17,
                            height: 25.0 / 15,),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: "Enter your password again",
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
                  onTap: ((){
                    if (_formkey.currentState?.validate() == true) {
                      Provider.of<AuthViewModel>(context, listen: false)
                          .sigUpcreateUserWithEmailAndPassword(
                          password: _controllerPassword.text.trim(),
                          email: _controllerEmail.text.trim());
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                    } else {
                      return;
                    }
                  }),
                  child:  Padding(
                    padding: const EdgeInsets.only(right: 50,left: 50),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text("Register", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17),),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  signUp() {
    final isValid = _formkey.currentState!.validate();
    if (!isValid) return;
    String email = _controllerEmail.text.trim();
    String password = _controllerPassword .text.trim();
    String confirmPassword = _controllerPassword1.text.trim();

    if (confirmPassword == password) {
      Provider.of<AuthViewModel>(context,listen: false).sigUpcreateUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } else {
      MyUtils.getMyToast(message: "Passwords don't match!");
    }
  }
}

