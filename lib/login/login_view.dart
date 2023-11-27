import 'package:UTS_Kelompok5/calories.dart';
import 'package:UTS_Kelompok5/common/colo_extension.dart';
import 'package:UTS_Kelompok5/common_widget/round_orangebutton.dart';
import 'package:UTS_Kelompok5/common_widget/round_textfield.dart';
import 'package:UTS_Kelompok5/login/profileprep.dart';
import 'package:UTS_Kelompok5/login/signup_view.dart';
import 'package:UTS_Kelompok5/note/users.dart';
import 'package:UTS_Kelompok5/note/SQLite.dart';
import 'package:UTS_Kelompok5/note/notes.dart';

import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final first = TextEditingController();
  final password = TextEditingController();
  final last = TextEditingController();
  final email = TextEditingController();
  final confirmPassword = TextEditingController();
  bool isLoginTrue = false;
  bool isCheck = false;
  bool isVisible = false;

  final db = DatabaseHelper();

  login() async {
    var response = await db
        .login(Users(usrMail: email.text, usrPassword: password.text));
    if (response == true) {
      //If login is correct, then goto notes
      if (!mounted) return;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Calories()));
    } else {
      //If not, true the bool value to show error message
      setState(() {
        isLoginTrue = true;
      });
    }
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: media.height * 0.9,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 38),
            child: Form(
              key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hey there,",
                  style: TextStyle(color: TColor.white, fontSize: 16),
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                      color: Colors.orange[800],
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),

                Container(margin:const EdgeInsets.all(8),
                  padding:
                  const EdgeInsets.symmetric(horizontal:10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),

                  child: TextFormField(
                  controller: email,
                  validator: (value){
                    if(value!.isEmpty){
                      return "email is required";
                    }
                    return null;
                  },
                  decoration:const InputDecoration(
                    hintText: "Email",
                    icon: const Icon(Icons.mail),
                    iconColor: Colors.grey,
                    hintStyle: TextStyle(fontSize: 13.0, color: Colors.grey),
                  ),
                    style: TextStyle(color: Colors.grey),
                ),
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  padding:
                  const EdgeInsets.symmetric(horizontal:10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                child: TextFormField(
                  controller: password,
                    validator: (value){
                      if(value!.isEmpty){
                        return "password is required";
                      }
                      return null;
                    },
                    obscureText: !isVisible,
                  decoration:const InputDecoration(
                    hintText: "Password",
                    icon: const Icon(Icons.lock),
                    iconColor: Colors.grey,
                    hintStyle: TextStyle(fontSize: 13.0, color: Colors.grey),
                  ),
                  style: TextStyle(color: Colors.grey),
                  /*children: [
                    IconButton(
                      onPressed: () {
                    setState(() {
                      //toggle button
                      isVisible = !isVisible;
                    });
                      }, icon: Icon(isVisible
                    ? Icons.visibility
                    : Icons.visibility_off),
                    ),
                  ],*/
                ),
                ),
                SizedBox(
                  height: 20, // <-- SEE HERE
                ),
                SizedBox(
                  height: media.width * 0.1,
                ),
                RoundButton(
                    title: "Login",
                    onPressed: () {
                      if (formKey.currentState!.validate()){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const Calories()));
                        /*login();*/
                      }


                    }),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.,
                  children: [
                    Expanded(
                        child: Container(
                          height: 1,
                          color: TColor.white.withOpacity(0.9),
                        )),
                    Text(
                      "  Or  ",
                      style: TextStyle(color: TColor.white, fontSize: 12),
                    ),
                    Expanded(
                        child: Container(
                          height: 1,
                          color: TColor.white.withOpacity(0.9),
                        )),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: TColor.white,
                          border: Border.all(
                            width: 1,
                            color: TColor.gray.withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/img/google.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: media.width * 0.04,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: TColor.white,
                          border: Border.all(
                            width: 1,
                            color: TColor.gray.withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/img/facebook.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const SignUpView()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Don’t have an account yet? ",
                        style: TextStyle(
                          color: TColor.white,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Register",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                      // We will disable this message in default, when user and pass is incorrect we will trigger this message to user
                    ],
                  ),
                ),
                isLoginTrue
                    ? const Text(
                  "Username or password is incorrect",
                  style: TextStyle(color: Colors.red),
                )
                    : const SizedBox(),
              ],
            ),
    ),
          ),
        ),
      ),
    );
  }
}
