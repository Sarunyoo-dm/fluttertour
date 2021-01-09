import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:test_error/screen/HomePage.dart';
import 'package:test_error/screen/MyBottomNavigationBar.dart';
import 'package:test_error/screen/SignUp.dart';
import 'package:test_error/screen/MyService.dart';
import 'package:test_error/auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
 /* bool _isLogin = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();*/
  final formKey = GlobalKey<FormState>();
  String emailString, passwordString;
  User user;
 // User _user;

  void initState() {
    super.initState();
    signOutGoogle();
  }

  void click() {
    signInWithGoogle().then((user) => {
          this.user = user,
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyBottomNavigationBar()))
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Login'),
        backgroundColor: Color(0xFF1241db),
      ),
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
                      'Sign In',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    buildBoxEmail(),
                    SizedBox(
                      height: 20,
                    ),
                    buildBoxPassword(),
                    SizedBox(
                      height: 10,
                    ),
                    buildForgotPasswordButton(),
                    SizedBox(
                      height: 5,
                    ),
                    buildSignInButton(),
                    buildSignInButtonFacebook(),
                    buildSignInButtonGoogle(),
                    buildRegisterButton()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

 /* Future _handleLogin() async {
    FacebookLoginResult _result = await _facebookLogin.logIn(['email']);
    switch (_result.status) {
      case FacebookLoginStatus.cancelledByUser:
      print("cancelledByUser");
      break;
      case FacebookLoginStatus.error:
        print("error");
        break;
      case FacebookLoginStatus.loggedIn:
      await _loginWithFacebook(_result);
      break;
    }
  }*/

 /* Future _loginWithFacebook(FacebookLoginResult _result) async {
    FacebookAccessToken _accessToken = _result.accessToken;
    AuthCredential _credential = FacebookAuthProvider.credential(_accessToken.token);
    var a = await _auth.signInWithCredential(_credential);
    setState(() {
      _isLogin = true;
      _user = a.user;
    });
  }*/

  /*  Future _signOut() async {
    await _auth.signOut().then((value) {
      setState(() {
        _facebookLogin.logOut();
        _isLogin = false;
      });
    });
    }*/

  Future<void> checkAuthen() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      print('Authen Success');
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => MyBottomNavigationBar());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      myAlert(title, message);
    });
  }

  Widget showTitle(String title) {
    return ListTile(
      leading: Icon(
        Icons.add_alert,
        size: 48.0,
        color: Colors.red,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.red,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget okButton() {
    return FlatButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text('OK'),
    );
  }

  void myAlert(String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: showTitle(title),
            content: Text(message),
            actions: <Widget>[okButton()],
          );
        });
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
        TextField(
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: "Enter your username.",
              hintStyle: TextStyle(color: Colors.white24)),
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
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            hintText: "Enter your Email.",
            hintStyle: TextStyle(color: Colors.white24),
          ),
          onSaved: (String value) {
            emailString = value.trim();
          },
        )
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
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.verified_user,
              color: Colors.white,
            ),
            hintText: "Enter your password.",
            hintStyle: TextStyle(color: Colors.white24),
          ),
          onSaved: (String value) {
            passwordString = value.trim();
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
        onPressed: () {
          print('You Click Sign Up');
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) => SignUp());
          Navigator.of(context).push(materialPageRoute);
        },
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
        onPressed: () {
          formKey.currentState.save();
          print('email = $emailString, password = $passwordString');
          checkAuthen();
        },
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

  Widget buildSignInButtonFacebook() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
      width: double.infinity,
      child: RaisedButton(
        onPressed: ()  {},
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

  Widget googleLoginButton() {
    return OutlineButton(
        onPressed: this.click,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        splashColor: Colors.deepOrange,
        borderSide: BorderSide(color: Colors.grey),
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('Login with Google',
                        style: TextStyle(color: Colors.black87,
                          fontSize: 15.0,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold,)))
              ],
            )));
  }

  Widget buildSignInButtonGoogle() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          click();
        },
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
