import 'package:flutter/material.dart';
import 'package:eward_frontend/apicall/apirequest.dart';
import 'package:eward_frontend/screens/authentication/loginscreen.dart';

class userRegistration extends StatefulWidget {
  const userRegistration({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<userRegistration> {
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
  var jobs = ['Goverment ', 'Doctor', 'Nurse', 'Military', 'Police', 'Others'];
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Registeration")),
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
                          return 'Enter vaild email';
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
                          return 'Ward number required';
                        }
                        return null;
                      },
                      controller: t7,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.numbers_outlined),
                        border: OutlineInputBorder(),
                        labelText: 'Enter Ward',
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password required';
                        }
                        return null;
                      },
                      obscureText: true,
                      controller: t9,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(),
                        labelText: 'Enter Password',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      obscureText: true,
                      controller: t10,
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
                            var usermap = Map();
                            usermap['email'] = t1.text;
                            usermap['firstname'] = t2.text;
                            usermap['lastname'] = t3.text;
                            usermap['voter_id'] = t4.text;
                            usermap['job'] = selectedjob;
                            usermap['tax_payer'] = select_tax;
                            usermap['age'] = t5.text;
                            usermap['gender'] = selectedoption;
                            usermap['phone'] = t6.text;
                            usermap['blood_group'] = selectedbloodgroup;
                            usermap['ward'] = t7.text;
                            usermap['housenumber'] = t8.text;
                            usermap['password'] = t9.text;
                            usermap['qualification'] = selectedqualification;
                            String password1, password2, response = " ";
                            password1 = t9.text;
                            password2 = t10.text;

                            if (_formKey.currentState!.validate()) {
                              if (password1 == password2) {
                                response = await userRegistrations(usermap);
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return loginscreen();
                                }));
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
                            shadowColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          child: const Text('Register'),
                        ),
                      )),
                  Row(
                    children: [
                      const Text('Does not have account?'),
                      TextButton(
                        child: const Text(
                          'Sign in',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: ((context) {
                            return loginscreen();
                          })));
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
