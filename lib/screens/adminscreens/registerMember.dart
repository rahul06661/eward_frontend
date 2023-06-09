import 'package:flutter/material.dart';
import 'package:eward_frontend/apicall/apirequest.dart';
import 'package:eward_frontend/screens/adminscreens/adminhomepage.dart';
import 'package:eward_frontend/screens/adminscreens/adminnav.dart';

class memberReg extends StatefulWidget {
  memberReg({super.key});

  @override
  State<memberReg> createState() => _memberRegState();
}

class _memberRegState extends State<memberReg> {
  final _formKey = GlobalKey<FormState>();
  final t1 = TextEditingController();
  final t2 = TextEditingController();
  final t3 = TextEditingController();
  final t4 = TextEditingController();
  final t5 = TextEditingController();
  final t6 = TextEditingController();

  String? selectedoption;

  var blood_group = ['O+', 'O-', 'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-'];
  String? selectedbloodgroup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Material(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a vaild email';
                        }
                        if (!isValidEmail(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                      controller: t1,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                        labelText: 'Enter Email',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Firstname required';
                        }
                        return null;
                      },
                      controller: t2,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.abc),
                        border: OutlineInputBorder(),
                        labelText: 'Enter Firstname',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lastname required';
                        }
                        return null;
                      },
                      controller: t3,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.abc),
                        border: OutlineInputBorder(),
                        labelText: 'Enter Lastname',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Age Required';
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Only numbers allowed';
                        }
                        return null;
                      },
                      controller: t4,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(),
                        labelText: 'Enter Age',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone Number required';
                        }
                        if (!isValidPhoneNumber(value)) {
                          return 'Enter vaild phone number';
                        }
                        return null;
                      },
                      controller: t5,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(),
                        labelText: 'Enter Phone Number',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ward number required';
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Only numbers allowed';
                        }

                        return null;
                      },
                      controller: t6,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.numbers_outlined),
                        border: OutlineInputBorder(),
                        labelText: 'Enter Ward',
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Container(
                        width: double.infinity,
                        child: DropdownButton(
                          value: selectedbloodgroup,
                          onChanged: ((value) {
                            setState(() {
                              selectedbloodgroup = value;
                            });
                          }),
                          isExpanded: true,
                          hint: const Text("Blood group"),
                          items: blood_group.map((String items) {
                            return DropdownMenuItem(
                                value: items, child: Text(items));
                          }).toList(),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: RadioListTile(
                              title: const Text('Male',
                                  style: TextStyle(fontSize: 13)),
                              value: 'male',
                              groupValue: selectedoption,
                              onChanged: ((value) {
                                setState(() {
                                  selectedoption = value;
                                });
                              }),
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              title: const Text('Female',
                                  style: TextStyle(fontSize: 13)),
                              value: 'female',
                              groupValue: selectedoption,
                              onChanged: ((value) {
                                setState(() {
                                  selectedoption = value;
                                });
                              }),
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              title: const Text('Others',
                                  style: TextStyle(fontSize: 13)),
                              value: 'others',
                              groupValue: selectedoption,
                              onChanged: ((value) {
                                setState(() {
                                  selectedoption = value;
                                });
                              }),
                            ),
                          ),
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Container(
                        height: 50,
                        width: 430,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, 2)
                            ])),
                        child: ElevatedButton(
                          onPressed: (() async {
                            String response;
                            if (_formKey.currentState!.validate()) {
                              var membermap = Map();
                              membermap['email'] = t1.text;
                              membermap['firstname'] = t2.text;
                              membermap['lastname'] = t3.text;
                              membermap['age'] = t4.text;
                              membermap['gender'] = selectedoption;
                              membermap['ward'] = t6.text;
                              membermap['phone'] = t5.text;
                              membermap['blood_group'] = selectedbloodgroup;
                              response = await memberRegistration(membermap);
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: ((contex) {
                                return adminhomenav();
                              })));
                            } else {
                              response = "Invalid Data";
                            }

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text(response),
                            ));
                          }),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            shadowColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          child: const Text('Register Member '),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    return RegExp(
            r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$')
        .hasMatch(email);
  }

  bool isValidPhoneNumber(String phoneNumber) {
    String digits = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
    print(digits.length== 10);
    return digits.length == 10;
  }
}
