// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'authfunctions.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final _formkey = GlobalKey<FormState>();
  bool _isLogin = false;
  String email = '';
  String password = '';
  String username = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        centerTitle: true,
        title: Text("Email/Password Authentication"),
      ),
      body: Column(
        children: [
          SizedBox(
              height: 250,
              width: 250,
              child: Image.asset('assets/images/appstore.png')),
          Form(
            key: _formkey,
            child: Container(
              margin: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  !_isLogin
                      ? TextFormField(
                          key: ValueKey('username'),
                          decoration:
                              InputDecoration(hintText: "Enter Username"),
                          validator: (value) {
                            if (value.toString().length < 3) {
                              return 'Username is so small';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            setState(() {
                              username = value!;
                            });
                          },
                        )
                      : Container(),
                  TextFormField(
                    key: ValueKey('email'),
                    decoration: InputDecoration(hintText: "Enter Email"),
                    validator: (value) {
                      if (!(value.toString().contains('@'))) {
                        return 'Invalid Email';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        email = value!;
                      });
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    key: ValueKey('password'),
                    decoration: InputDecoration(hintText: "Enter Password"),
                    validator: (value) {
                      if (value.toString().length < 6) {
                        return 'Password is very small';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        password = value!;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red[900])),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();
                              _isLogin
                                  ? signin(email, password)
                                  : signup(email, password, username);
                            }
                          },
                          child: _isLogin
                              ? Text(
                                  'Login',
                                  style: TextStyle(fontSize: 20),
                                )
                              : Text(
                                  'SignUp',
                                  style: TextStyle(fontSize: 20),
                                ))),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      child: _isLogin
                          ? Text(
                              "Don't have an account? Signup",
                              style: TextStyle(fontSize: 15),
                            )
                          : Text(
                              'Already Sign Up ? LOGIN',
                              style: TextStyle(fontSize: 15),
                            ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
