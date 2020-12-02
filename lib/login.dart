import 'dart:convert';
import 'package:Bacancy_task10/listtile.dart';
import 'package:Bacancy_task10/viewitem.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLoginScreen extends StatefulWidget {
  @override
  _MyLoginScreenState createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
  SharedPreferences logindata;
  bool newuser;
  bool _obsecureText = true;
  List _data;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String _error = " ";
  int _flag = 0;
  void showError() {
    setState(() {
      _error = "Invalid User";
    });
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    if (newuser == false) {
      Navigator.pushReplacement(context,
          new MaterialPageRoute(builder: (context) => MyViewItem(_data)));
    }
  }

  Future<String> loadJasonData() async {
    var jsonText = await rootBundle.loadString('assets/user.json');
    setState(() {
      _data = json.decode(jsonText);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    this.loadJasonData();
    this.check_if_already_login();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Image(
                image: AssetImage("images/2.png"),
                width: MediaQuery.of(context).size.width * 0.35,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1,
                  left: MediaQuery.of(context).size.width * 0.07,
                  right: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Your email address',
                        ),
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      TextField(
                        obscureText: _obsecureText,
                        controller: passwordController,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: GestureDetector(
                              child: const Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Icon(Icons.visibility),
                              ),
                              onTap: () {
                                setState(() {
                                  _obsecureText = !_obsecureText;
                                });
                              },
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.008,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          _error,
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.23,
                      ),
                      ButtonTheme(
                        minWidth: MediaQuery.of(context).size.height * 0.8,
                        height: MediaQuery.of(context).size.height * 0.07,
                        buttonColor: Colors.blueAccent,
                        child: RaisedButton(
                          onPressed: () {
                            for (int i = 0; i < _data.length; i++) {
                              if (emailController.text.toString() ==
                                      _data[i]['email'] &&
                                  passwordController.text.toString() ==
                                      "Test@123") {
                                _flag = 1;
                                logindata.setBool('login', false);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyViewItem(_data),
                                    ));
                              }
                            }
                            if (_flag == 0) {
                              showError();
                            }
                          },
                          child: Text(
                            "SIGN IN",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
