import 'package:flutter/material.dart';
import 'intro.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user.dart';

class Login extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<List<User>> loginUser() async {
    String url = 'http://192.168.1.103:8000/api/insert';
    var res = await http.post(Uri.encodeFull(url), headers: {
      "Accept": "application/json"
    }, body: {
      "email": emailController.text,
      "password": passwordController.text,
    });
    List<dynamic> userData = jsonDecode(res.body);
    List<User> users = userData.map((json) => User.fromJson(json)).toList();
    return users;
  }

  @override
  Widget _buildLogo() {
    return Column(
      children: <Widget>[
        SizedBox(height: 2.0),
        Padding(
          padding: EdgeInsets.all(50.0),
        ),
        Image.asset('assets/logo.png')
      ],
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Enter Email*'),
      controller: emailController,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }
      },
      // onSaved: (String value) {
      //   email = value;
      // }
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: 'Enter Password*'),
      controller: passwordController,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }
      },
      // onSaved: (String value) {
      //   email = value;
      // }
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            // margin: EdgeInsets.all(24),
            padding: EdgeInsets.all(50),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildLogo(),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                    ),
                    _buildEmail(),
                    _buildPassword(),
                    SizedBox(height: 50),
                    RaisedButton(
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      color: Colors.deepOrange,
                      onPressed: ()
                          // async {
                          //   if (_formKey.currentState.validate()) {
                          //     var email = emailController.text;
                          //     var password = passwordController.text;
                          //     setState(() {
                          //       message = 'Please Wait...';
                          //     });
                          //     var rsp = await loginUser(email, password);
                          //     print(rsp);
                          //   }
                          //   _formKey.currentState.save();
                          //  },

                          {
                        loginUser();
                        // Navigator.of(context).push(new MaterialPageRoute(
                        //     builder: (BuildContext context) =>
                        //         new AgentIntro()));
                      },
                    )
                  ],
                ))));
  }
}
