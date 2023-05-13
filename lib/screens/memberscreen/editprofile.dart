import 'package:flutter/material.dart';
import 'package:eward_frontend/apicall/apirequest.dart';
import 'package:eward_frontend/screens/adminscreens/adminhomepage.dart';
import 'package:eward_frontend/screens/adminscreens/adminnav.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _memberRegState();
}

class _memberRegState extends State<EditProfile> {
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
  void initState() {
    convertToMap();
  }

  void convertToMap() async {
    dynamic dynamicObject = await getMemberData();
    Map<String, dynamic> mapObject = {};
    if (dynamicObject is Map) {
      mapObject = Map<String, String>.from(dynamicObject);
    }
    t2.text = mapObject['firstname'];
    t3.text = mapObject['lastname'];
    setState(() {
      selectedoption = mapObject['gender'];
      String bldgrp = mapObject['blood_group'];
      selectedbloodgroup = bldgrp.replaceAll('ve', '');
    });

    //selectedbloodgroup = mapObject['blood_group'];
    t4.text = mapObject['age'];
    t5.text = mapObject['phone'];
  }

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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: RadioListTile(
                              title: const Text('Male',
                                  style: TextStyle(fontSize: 12)),
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
                                  style: TextStyle(fontSize: 12)),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Container(
                        width: double.infinity,
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.bloodtype),
                            contentPadding: EdgeInsets.all(4),
                            border: OutlineInputBorder(),
                          ),
                          child: DropdownButtonHideUnderline(
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
                          ),
                        ),
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Age Required';
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
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Container(
                        height: 50,
                        width: 430,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(255, 17, 28, 227),
                              Color.fromARGB(253, 14, 25, 234)
                            ])),
                        child: ElevatedButton(
                          onPressed: (() async {
                            String response;
                            if (_formKey.currentState!.validate()) {
                              var membermap = Map();
                              membermap['firstname'] = t2.text;
                              membermap['lastname'] = t3.text;
                              membermap['age'] = t4.text;
                              membermap['gender'] = selectedoption;
                              membermap['phone'] = t5.text;
                              membermap['blood_group'] = selectedbloodgroup;
                              response = await memberUpdate(membermap);
                              Navigator.of(context).pop();
                            } else {
                              response = "Invaild Data";
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
                          child: const Text('Update Profile '),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Container(
                        height: 50,
                        width: 430,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(255, 17, 28, 227),
                              Color.fromARGB(253, 14, 25, 234)
                            ])),
                        child: ElevatedButton(
                          onPressed: (() async {
                            Navigator.of(context).pop();
                          }),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            shadowColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          child: const Text('Cancel '),
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
}
