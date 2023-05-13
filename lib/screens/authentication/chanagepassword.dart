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
      appBar: AppBar(title: Text("Reset Password")),
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
              
              controller: t1,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
                labelText: 'Enter email',
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
                    String response = await resetpassword(t1.text) as String;

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text(response)));
                  }),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: const Text('Send Email'),
                ),
              ))
        ]),
      ),
    );
  }
}
