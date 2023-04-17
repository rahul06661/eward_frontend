import 'package:flutter/material.dart';
import 'package:eward_frontend/screens/userscreen/clipper_profile.dart';
import 'package:eward_frontend/apicall/apirequest.dart';
import 'package:eward_frontend/screens/authentication/loginscreen.dart';
import 'package:eward_frontend/screens/userscreen/family_memb.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eward_frontend/screens/userscreen/complaintStatu.dart';

class profile_screen extends StatelessWidget {
  const profile_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const clipper_prof(),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 110, 0, 0),
          child: Container(
            height: 80,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/notification.png"),
                ),
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 210, 206, 206)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(175, 125, 0, 0),
          child: Container(
            child: Text("",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.w900)),
          ),
        ),
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
                      onPressed: (() {}),
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
                          return const famMemberReg();
                        }));
                      }),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: const Text("Add Family Members"),
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
                      onPressed: (() async{
                        
                       dynamic data =
                            await getcompstaus() ;
                            
                            Map<String, String> myMap = Map<String, String>.from(data);
                            print(myMap);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return complaintStatus(open: myMap['opencomp'],pending:myMap['pendingcomp'],close:myMap['closedcomp'],);
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

  Future<String> getchar() async {
    final sharepref = await SharedPreferences.getInstance();
    String name = sharepref.getString('email').toString();
    print(name);

    return name[0];
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
