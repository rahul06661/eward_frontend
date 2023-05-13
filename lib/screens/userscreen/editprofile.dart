import 'package:flutter/material.dart';
import 'package:eward_frontend/apicall/apirequest.dart';

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
  final t7 = TextEditingController();
  final t8 = TextEditingController();
  final t9 = TextEditingController();
  final t10 = TextEditingController();

  String? selectedoption;
  String? select_tax;
  var jobs = [
    'Goverment ',
    'Doctor',
    'Nurse',
    'Military',
    'Police',
    'Others',
    'Private'
  ];
  var blood_group = ['O+', 'O-', 'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-'];
  var qualification = [
    'School',
    'PreDegree',
    'Degree',
    'PostGraduate',
    'Doctor'
  ];

  String? selectedjob;
  String? selectedqualification;
  String? selectedbloodgroup;

  @override
  void initState() {
    convertToMap();
  }

  String convert(str) {
    String firtle = str[0].toUpperCase();
    String sub = str.substring(1);
    print(firtle + sub);
    return firtle + sub;
  }

  void convertToMap() async {
    dynamic dynamicObject = await getUserData();
    Map<String, dynamic> mapObject = {};
    if (dynamicObject is Map) {
      mapObject = Map<String, dynamic>.from(dynamicObject);
    }
    print(mapObject);
    t2.text = mapObject['firstname'];
    t3.text = mapObject['lastname'];
    t4.text = mapObject['voter_id'];
    t5.text = mapObject['age'].toString();
    t6.text = mapObject['phone'];
    t8.text = mapObject['housenumber'];
    setState(() {
      selectedoption = mapObject['gender'];
      String bldgrp = mapObject['blood_group'];
      selectedbloodgroup = bldgrp.replaceAll('ve', '');
      selectedqualification = convert(mapObject['qualification']);
      selectedjob = convert(mapObject['job']);
      select_tax = mapObject['tax_payer'];
    });

    //selectedbloodgroup = mapObject['blood_group'];
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Voter ID required';
                        }
                        return null;
                      },
                      controller: t4,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.how_to_vote),
                        border: OutlineInputBorder(),
                        labelText: 'Enter Voter_id',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Container(
                        width: double.infinity,
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.work),
                            contentPadding: EdgeInsets.all(4),
                            border: OutlineInputBorder(),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              isExpanded: true,
                              hint: const Text(
                                "Select job",
                              ),
                              value: selectedjob,
                              items: jobs.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: ((value) {
                                setState(() {
                                  selectedjob = value;
                                });
                              }),
                            ),
                          ),
                        )),
                  ),
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
                      controller: t5,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(),
                        labelText: 'Enter Age',
                      ),
                    ),
                  ),
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
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Container(
                        width: double.infinity,
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.cast_for_education),
                            contentPadding: EdgeInsets.all(4),
                            border: OutlineInputBorder(),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              isExpanded: true,
                              hint: const Text(
                                "Select qualification",
                              ),
                              value: selectedqualification,
                              items: qualification.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedqualification = newValue;
                                });
                              },
                            ),
                          ),
                        )),
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
                      controller: t6,
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
                          return 'House Number required';
                        }
                        return null;
                      },
                      controller: t8,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.home_filled),
                        border: OutlineInputBorder(),
                        labelText: 'Enter Housenumber',
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: RadioListTile(
                              title: const Text('Paying Tax'),
                              value: 'yes',
                              groupValue: select_tax,
                              onChanged: ((value) {
                                setState(() {
                                  select_tax = value;
                                });
                              }),
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              title: const Text('Not Paying Tax'),
                              value: 'no',
                              groupValue: select_tax,
                              onChanged: ((value) {
                                setState(() {
                                  select_tax = value;
                                });
                              }),
                            ),
                          ),
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: RadioListTile(
                              title: const Text(
                                'Male',
                              ),
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
                              title: const Text('Female'),
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
                              title: const Text('Others'),
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
                              var usermap = Map();
                              usermap['firstname'] = t2.text;
                              usermap['lastname'] = t3.text;
                              usermap['voter_id'] = t4.text;
                              usermap['age'] = t5.text;
                              usermap['phone'] = t6.text;
                              usermap['housenumber'] = t8.text;
                              usermap['blood_group'] = selectedbloodgroup;
                              usermap['qualification'] = selectedqualification;
                              usermap['tax_payer'] = select_tax;
                              usermap['job'] = selectedjob;
                              usermap['gender'] = selectedoption;

                               response = await userUpdate(usermap);
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
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, 2)
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
