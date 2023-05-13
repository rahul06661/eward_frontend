import 'package:flutter/material.dart';
import 'package:eward_frontend/screens/memberscreen/chanagepassword.dart';
import 'package:eward_frontend/screens/memberscreen/editprofile.dart';
class profile_page extends StatelessWidget {
  profile_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Edit Profile")),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 320, 0, 0),
              child: Container(
                  height: 450,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 50,
                        width: 430,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(253, 15, 26, 240),
                        ),
                        child: ElevatedButton(
                          onPressed: (() {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return EditProfile();
                            }));
                          }),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            shadowColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          child: const Text("Edit Profile"),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 50,
                        width: 430,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(253, 15, 26, 240),
                        ),
                        child: ElevatedButton(
                          onPressed: (() {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return  Changepassword();
                            }));
                          }),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            shadowColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          child: const Text("Change Password"),
                        ),
                      ),
                      
                      
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
