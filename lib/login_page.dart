import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  var _formkey = GlobalKey<FormState>();
  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "Log In",
                style: TextStyle(fontSize: 25),
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Username is empty";
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Enter ur username",
                          label: Text("Username"),
                          prefixIcon: Icon(Icons.person)),
                      controller: _usernameController,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Password is empty";
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Enter ur password",
                          label: Text("Password"),
                          prefixIcon: Icon(Icons.key)),
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            minimumSize: Size.fromHeight(50),
                          ),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              var snackBar = SnackBar(
                                content: Row(
                                  children: [
                                    Icon(
                                      Icons.key,
                                      color: Colors.white,
                                    ),
                                    Text("Hi, ${_usernameController.text}"),
                                  ],
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          child: Text("Log In")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            minimumSize: Size.fromHeight(50),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
                          },
                          child: Text("Sign Up")),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  var _formkey = GlobalKey<FormState>();
  var _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Scaffold(
        body: Column(
          children: [
            Row(
              
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back_ios_new)),
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Username is empty";
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter ur username",
                      label: Text("Username"),
                      prefixIcon: Icon(Icons.person),
                    ),
                    controller: _usernameController,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Password is empty";
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter ur password",
                      label: Text("Password"),
                      prefixIcon: Icon(Icons.key),
                    ),
                    obscureText: true,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Re-Enter password is empty";
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Re-Enter ur password",
                      label: Text("Re-Enter Password"),
                      prefixIcon: Icon(Icons.key),
                    ),
                    obscureText: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        minimumSize: Size.fromHeight(50),
                      ),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            var snackBar = SnackBar(
                              content: Row(
                                children: [
                                  Icon(
                                    Icons.key,
                                    color: Colors.white,
                                  ),
                                  Text("Loged In, ${_usernameController.text}"),
                                ],
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: Text("Sign Up")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          minimumSize: Size.fromHeight(50),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Login")),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
