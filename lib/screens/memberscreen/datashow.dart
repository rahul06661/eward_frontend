import 'package:flutter/material.dart';
import 'package:eward_frontend/screens/memberscreen/profileshow.dart';

class StaticDropDown extends StatefulWidget {
  @override
  _StaticDropDownState createState() => _StaticDropDownState();
}

class _StaticDropDownState extends State<StaticDropDown> {
  List<String> data = ['Job', 'Blood_Group', 'Qualification', 'Age'];
  List<String> Job = [
    'Goverment ',
    'Doctor',
    'Nurse',
    'Military',
    'Police',
    'Others'
  ];
  List<String> Blood_Group = ['O+', 'O-', 'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-'];
  List<String> Qualification = [
    'School',
    'PreDegree',
    'Degree',
    'PostGraduate',
    'Doctor'
  ];

  List<String> items = [];
  String? selectedData;
  String? selectedItems;
  final t2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Attributes'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          // Country Dropdown
          DropdownButton(
            
            hint: const Text('Select parameter'),
            value: selectedData,
            isExpanded: true,
            items: data.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (values) {
              if (values == 'Job') {
                items = Job;
              } else if (values == 'Blood_Group') {
                items = Blood_Group;
              } else if (values == 'Qualification') {
                items = Qualification;
              } else {
                items = [];
              }
              setState(() {
                selectedData = values;
                selectedItems = null;
              });
            },
          ),
          // Country Dropdown Ends here
          const SizedBox(height: 60.0),
          // Province Dropdown
          selectedData == 'Age'
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: t2,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: '15-30',
                    ),
                  ),
                )
              : DropdownButton<String>(
                  hint: Text('Select'),
                  value: selectedItems,
                  isExpanded: true,
                  items: items.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (values) {
                    setState(() {
                      selectedItems = values;
                    });
                  },
                ),

          Container(
            margin: const EdgeInsets.all(10),
            height: 50,
            width: 430,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(143, 148, 251, 2),
            ),
            child: ElevatedButton(
              onPressed: (() {
                if (t2.text != '') {
                  selectedItems = t2.text;
                  t2.clear();
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => profileShows(
                            selectedData: selectedData,
                            selectedItems: selectedItems)));
              }),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
              child: const Text(
                "Search",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
