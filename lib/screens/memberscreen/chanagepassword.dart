import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eward_frontend/apicall/apirequest.dart';

class Changepassword extends StatelessWidget {
  Changepassword({super.key});
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Change Password")),
      body: Form(
        key: _formKey,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Required';
                }
                return null;
              },
              obscureText: true,
              controller: t1,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(),
                labelText: 'Enter Password',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Required';
                }
                return null;
              },
              obscureText: true,
              controller: t2,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(),
                labelText: 'ReEnter Password',
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Container(
                height: 50,
                width: 430,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(255, 0, 98, 255),
                      Color.fromARGB(255, 0, 98, 255),
                    ])),
                child: ElevatedButton(
                  onPressed: (() async {
                    String password1, password2, response;
                    password1 = t1.text;
                    password2 = t2.text;

                    if (_formKey.currentState!.validate()) {
                      if (password1 == password2) {
                         response = await passwordchange(password1);
                        Navigator.of(context).pop();
                      } else {
                        response = "Password  Mismatch";
                      }
                    } else {
                      response = "Invaild data";
                    }

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text(response)));
                  }),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: const Text('Change Password'),
                ),
              ))
        ]),
      ),
    );
  }
}
