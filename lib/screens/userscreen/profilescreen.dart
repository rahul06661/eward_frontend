import 'package:flutter/material.dart';
import 'package:eward_frontend/screens/userscreen/clipper_profile.dart';
import 'package:eward_frontend/apicall/apirequest.dart';
import 'package:eward_frontend/screens/authentication/loginscreen.dart';
import 'package:eward_frontend/screens/userscreen/familyview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eward_frontend/screens/userscreen/complaintStatu.dart';
import 'package:eward_frontend/screens/userscreen/profilepage.dart';



class profile_screen extends StatefulWidget {
  profile_screen({super.key});

  @override
  State<profile_screen> createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
  String user1 = '';

  String email1 = '';

  Future<dynamic> get_data() async {
    final sharedpref = await SharedPreferences.getInstance();
    String user = sharedpref.getString('utype') as String;
    String email = sharedpref.getString('email') as String;
    setState(() {
      user1 = user;
      email1 = email;
    });
    return [user, email];
  }

  @override
  void initState() {
    get_data();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const clipper_prof(),
        Padding(
          padding: const EdgeInsets.fromLTRB(158, 108, 0, 0),
          child: Container(
              height: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 210, 206, 206),
              ),
              child: Image.asset("assets/images/icons8-user-58.png")),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(220, 200, 20, 0),
            child: Container(
              child: Column(
                children: [
                  Text("Loggined as : ",
                      style: TextStyle(
                          color: const Color.fromRGBO(143, 148, 251, 2),
                          fontSize: 22,
                          fontWeight: FontWeight.w700)),
                  Text('  $email1',
                      style: TextStyle(
                          color: const Color.fromRGBO(143, 148, 251, 2),
                          fontSize: 14,
                          fontWeight: FontWeight.w500))
                ],
              ),
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 320, 0, 0),
          child: Container(
              height: 300,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 50,
                    width: 430,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(143, 148, 251, 2),
                    ),
                    child: ElevatedButton(
                      onPressed: (() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return   profile_page();
                        }));
                      }),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: const Text("Profile"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 50,
                    width: 430,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(143, 148, 251, 2),
                    ),
                    child: ElevatedButton(
                      onPressed: (() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const familyview();
                        }));
                      }),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: const Text("Family Members"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 50,
                    width: 430,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(143, 148, 251, 2),
                    ),
                    child: ElevatedButton(
                      onPressed: (() async {
                        dynamic data = await getcompstaus();

                        Map<String, String> myMap =
                            Map<String, String>.from(data);
                        print(myMap);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return complaintStatus(
                            open: myMap['opencomp'],
                            pending: myMap['pendingcomp'],
                            close: myMap['closedcomp'],
                          );
                        }));
                      }),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: const Text("Complaints Status"),
                    ),
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
                        signout(context);
                      }),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: const Text(
                        "Logout",
                      ),
                    ),
                  ),
                ],
              )),
        )
      ],
    );
  }

  void signout(context) async {
    Future<String> msg = Logout();
    String result = await msg;
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: ((context) {
      return loginscreen();
    })));

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(result),
    ));
  }
}
