import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = "";
  bool isLogin = true;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try{
      await Auth().signInWithEmailAndPassword(email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text
      );

    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text("FireBase Auth");
  }

  Widget _entryField(String title, TextEditingController controller){
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        labelText: title
      ),
    );
  }

  Widget _errorMessage(){
    return Text(errorMessage == ""? "" : "humm ? $errorMessage");
  }

  Widget _submitButton(){
    return ElevatedButton(onPressed: isLogin? signInWithEmailAndPassword : createUserWithEmailAndPassword

        , child: Text(isLogin? "Login" : "Register" ));
  }

  Widget _loginOrRegisterButton(){
    return TextButton(onPressed:(){
      setState(() {
        isLogin = !isLogin;
      });
    }, child: Text(isLogin ? "Sign Up " : "Sign In"));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _entryField("email", _controllerEmail),
              SizedBox(height: 10,),
              _entryField("password", _controllerPassword),
              _errorMessage(),
              _submitButton(),
              SizedBox(height: 100,),
              _loginOrRegisterButton()

            ],
          ),
        ),

      ),
    );
  }
}
