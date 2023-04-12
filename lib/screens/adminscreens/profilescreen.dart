
import 'package:flutter/material.dart';
import 'package:eward_frontend/screens/userscreen/clipper_profile.dart';
import 'package:eward_frontend/apicall/apirequest.dart';
import 'package:eward_frontend/screens/authentication/loginscreen.dart';
import 'package:eward_frontend/screens/adminscreens/datashow.dart';



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
          child:  Container(
            child:const  Text("",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.w900)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 320, 0, 0),
          child: Container(
              height: 250,
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
                    margin: const EdgeInsets.all(10),
                    height: 50,
                    width: 430,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(143, 148, 251, 2),
                    ),
                    child: ElevatedButton(
                      onPressed: (() {
                       
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    StaticDropDown()));
                      }),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: const Text(
                        "Search Profile",
                      ),
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
                        clear_cache();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    loginscreen()));
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

  

}
