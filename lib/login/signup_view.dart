import 'package:UTS_Kelompok5/common/colo_extension.dart';
import 'package:UTS_Kelompok5/common_widget/round_orangebutton.dart';
import 'package:UTS_Kelompok5/common_widget/round_textfield.dart';
import 'package:UTS_Kelompok5/login/profileprep.dart';
import 'package:UTS_Kelompok5/login/login_view.dart';
import 'package:flutter/material.dart';

import 'package:UTS_Kelompok5/note/users.dart';
import 'package:UTS_Kelompok5/note/SQLite.dart';
import 'package:UTS_Kelompok5/note/notes.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final first = TextEditingController();
  final password = TextEditingController();
  final last = TextEditingController();
  final email = TextEditingController();
  final confirmPassword = TextEditingController();
  bool isCheck = false;
  bool isVisible = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                    'assets/img/run.png',
                    width: 190,
                    height: 200,
                    fit:BoxFit.fill

                ),
                Text(
                  "Hey there,",
                  style: TextStyle(color: TColor.white, fontSize: 16),
                ),
                Text(
                  "Create an Account",
                  style: TextStyle(
                      color: Colors.orange[800],
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.05,
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
                  controller: first,
                    validator: (value){
                      if(value!.isEmpty){
                        return "First Name is required";
                      }
                      return null;
                    },
                    decoration:const InputDecoration(
                      hintText: "First Name",
                      icon: const Icon(Icons.person_2),
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
                  margin:const EdgeInsets.all(8),
                  padding:
                  const EdgeInsets.symmetric(horizontal:10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                child: TextFormField(
                  controller: last,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Last name is required";
                      }
                      return null;
                    },
                    decoration:const InputDecoration(
                      hintText: "Last Name",
                      icon: const Icon(Icons.person),
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
                  margin:const EdgeInsets.all(8),
                  padding:
                  const EdgeInsets.symmetric(horizontal:10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                child: TextFormField(
                  controller:email,
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
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 13.0, color: Colors.grey),
                    ),
                  style: TextStyle(color: Colors.grey),
                ),
          ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Container(
                  margin:const EdgeInsets.all(8),
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
                  height: media.width * 0.04,
                ),

                Container(
                  margin:const EdgeInsets.all(8),
                  padding:
                  const EdgeInsets.symmetric(horizontal:10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                child: TextFormField(
                  controller: confirmPassword,
                  validator: (value){
                    if(value!.isEmpty){
                      return "password is required";
                    }else if (password.text != confirmPassword.text) {
                      return "Password don't match";
                  }
                    return null;
                  },
                  obscureText: !isVisible,
                  decoration:const InputDecoration(
                      hintText: "Confirm Password",
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

                Row(
                  // crossAxisAlignment: CrossAxisAlignment.,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isCheck = !isCheck;
                        });
                      },
                      icon: Icon(
                        isCheck
                            ? Icons.check_box_outlined
                            : Icons.check_box_outline_blank_outlined,
                        color: TColor.gray,
                        size: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child:  Text(
                        "By continuing you accept our Privacy Policy and\nTerm of Use",
                        style: TextStyle(color: Colors.grey[400], fontSize: 12),
                      ),

                    )
                  ],
                ),
                SizedBox(
                  height: media.width * 0.1,
                ),
                RoundButton(title: "Sign Up", onPressed: () {
                  if (formKey.currentState!.validate()){
                    final db = DatabaseHelper();
                    db
                        .signup(Users(
                        usrMail: email.text,
                        usrPassword: password.text))
                        .whenComplete((){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const LoginView()));
                        });
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
                          color: TColor.gray.withOpacity(0.5),
                        )),
                    Text(
                      "  Or  ",
                      style: TextStyle(color: TColor.black, fontSize: 12),
                    ),
                    Expanded(
                        child: Container(
                          height: 1,
                          color: TColor.gray.withOpacity(0.5),
                        )),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                            color: TColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
              ],
            ),
            ),
          ),
        ),
      ),
    );
  }
}
