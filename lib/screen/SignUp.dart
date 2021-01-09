import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_error/screen/Loginscreen.dart';
import 'package:test_error/screen/MyService.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUp createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passwordString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF1241db),
                  Color(0xFF1270db),
                  Color(0xFF129bdb),
                  Color(0xFF12c7db),
                ],
              ),
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 100.0,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    buildBoxUserID(),
                    SizedBox(
                      height: 20,
                    ),
                    buildBoxPassword(),
                    SizedBox(
                      height: 20,
                    ),
                    buildBoxEmail(),
                    SizedBox(
                      height: 20,
                    ),
                    buildSignUpButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBoxUserID() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Username",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              hintText: "ภาษาอังกฤษเท่านั้น",
              hintStyle: TextStyle(color: Colors.white24)),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Please Fill Your Username in the Blank';
            } else {
              return null;
            }
          },
          onSaved: (String value) {
            nameString = value.trim();
          },
        ),
      ],
    );
  }

  Widget buildBoxPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Password",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          obscureText: true,
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              hintText: "อย่างน้อย 8 ตัวอักษร",
              hintStyle: TextStyle(color: Colors.white24)),
          validator: (String value) {
            if (value.length < 8) {
              return 'Password More 8 Charactor';
            } else {
              return null;
            }
          },
          onSaved: (String value) {
            passwordString = value.trim();
          },
        )
      ],
    );
  }

  Widget buildBoxEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Email",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              hintText: "เช่น tester@gmail.com",
              hintStyle: TextStyle(color: Colors.white24)),
          validator: (String value) {
            if (!((value.contains('@')) && (value.contains('.')))) {
              return 'Please Type Email in Exp. tester@gmail.com';
            } else {
              return null;
            }
          },
          onSaved: (String value) {
            emailString = value.trim();
          },
        )
      ],
    );
  }

  Widget buildForgotPasswordButton() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => [],
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget buildRegisterButton() {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: () => [],
        child: Text(
          "Don't have an Account ? Sign Up",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget buildSignInButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () => {},
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        child: Text(
          "LOGIN",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildSignUpButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          print('You Click Sign Up');
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            print(
                'name = $nameString, password = $passwordString ,email =  $emailString');
            registerThread();
          }
        },
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        child: Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Future<void> registerThread() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await Firebase.initializeApp();
    await auth
        .createUserWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      print('Register Success for Email = $emailString');
      setupDisplayName();
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      print('title = $title , message = $message');
      myAlert(title, message);
    });
  }

  Future<void> setupDisplayName() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    var user = firebaseAuth.currentUser;
    if (user != null) {
      user.updateProfile(displayName: nameString);

      MaterialPageRoute materialPageRoute =
      MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }
  }



  void myAlert(String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: ListTile(
              leading: Icon(
                Icons.add_alert,
                color: Colors.red,size: 48,
              ),
              title: Text(
                title,
                style: TextStyle(color: Colors.red),
              ),
            ),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Widget buildSignInButtonFacebook() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () => {},
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.blue,
        child: Text(
          "Login with Facebook",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildSignInButtonGoogle() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () => {},
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.deepOrange,
        child: Text(
          "Login with Google",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
