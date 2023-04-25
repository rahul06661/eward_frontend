import 'package:flutter/material.dart';
import 'package:eward_frontend/apicall/apirequest.dart';
import 'package:eward_frontend/screens/userscreen/profilescreen.dart';

class famMemberReg extends StatefulWidget {
  const famMemberReg({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<famMemberReg> {
  final _formKey = GlobalKey<FormState>();
  final t1 = TextEditingController();
  final t2 = TextEditingController();
  final t3 = TextEditingController();
  final t4 = TextEditingController();
  final t5 = TextEditingController();
  final t6 = TextEditingController();

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
  var relation = [
    'Father',
    'Mother',
    'Brother',
    'Sister',
    'Wife',
    'Daughter',
    'Son'
  ];
  String? selectedjob;
  String? selectedqualification;
  String? selectedbloodgroup;
  String? selectedrelation;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Register Family Member")),
        body: SingleChildScrollView(
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
                      controller: t5,
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
                    child: Container(
                      width: double.infinity,
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.man),
                          contentPadding: EdgeInsets.all(4),
                          border: OutlineInputBorder(),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
                            hint: const Text(
                              "Select Relation",
                            ),
                            value: selectedrelation,
                            items: relation.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedrelation = newValue;
                              });
                            },
                          ),
                        ),
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
                            var familymap = Map();
                            familymap['email'] = t1.text;
                            familymap['firstname'] = t2.text;
                            familymap['lastname'] = t3.text;
                            familymap['voter_id'] = t4.text;
                            familymap['tax_payer'] = select_tax;
                            familymap['gender'] = " ";
                            familymap['age'] = t5.text;
                            familymap['job'] = selectedjob;
                            familymap['qualification'] = selectedqualification;
                            familymap['relation'] = selectedrelation;
                            familymap['phone'] = t6.text;
                            familymap['blood_group'] = selectedbloodgroup;
                            String response =
                                await familyMemberRegistration(familymap);
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return const profile_screen();
                            }));

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
                          child: const Text('Register Family Member '),
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
