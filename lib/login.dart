import 'package:flutter/material.dart';
import 'package:my_first_app/home.dart';
import 'package:my_first_app/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _userNameController = TextEditingController(); 

  final _passwordController = TextEditingController();

  

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Image(
                  image: AssetImage(
                    'images/a.png',
                  ),
                  width: 200,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical:10),
                child: TextFormField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'user name '),
                  validator: (value) {
                    

                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Password '),
                obscureText: true,
                validator: (value) {
                  

                  if (value == null || value.isEmpty) {
                    return 'value is empty';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
            
                
                  ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          CheckLogin(context);
                        } else {
                          print('data is empty');
                        }

                        Text("username password doesn't match");

                        // CheckLogin(context);
                      },
                      icon: Icon(Icons.login),
                      label: Text('Login')),
                             
            ],
          ),
        ),
      ),
    ));
  }

  // ignore: non_constant_identifier_names
  void CheckLogin(BuildContext ctx) async {
    final _username = _userNameController.text;
    final _password = _passwordController.text;
    if (_username == 'adil' && _password == '1234') {
      

      // go to home

      final _sharedPrefs = await SharedPreferences.getInstance();

      await _sharedPrefs.setBool(SAVE_KEY_NAME, true);

      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => HomeScreen()));
    } else {
      final _errorMessage = "username password doesn't match";

      //snack bar

      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          backgroundColor: const Color.fromARGB(255, 12, 12, 12),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(12),
          content: Text(_errorMessage),
        ),
      );
    }
  }
}
