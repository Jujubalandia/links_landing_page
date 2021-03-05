import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final _linksCollection = Provider.of<CollectionReference>(context);
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      body: Center(
        child: SizedBox(
          width: 400,
          child: Material(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Add a email to continue';
                        } else if (!isValidEmail(value)) {
                          return 'Valid email needed';
                        } else {
                          return null;
                        }
                      },
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Add a password to continue';
                        } else if (value.length < 6) {
                          return 'Password must be have more than 6';
                        } else {
                          return null;
                        }
                      },
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: FlatButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            final _email = _emailController.text;
                            final _password = _passwordController.text;

                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                  email: _email,
                                  password: _password,
                                )
                                .then((_) => Navigator.of(context)
                                    .pushNamed('/settings'))
                                .catchError(
                              (error) {
                                ShowErrorDialog(context, error);
                              },
                            );
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future ShowErrorDialog(BuildContext context, error) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Oh Snap!'),
          content: Text(error.message),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Dismiss'),
            ),
          ],
        );
      },
    );
  }
}

bool isValidEmail(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}
