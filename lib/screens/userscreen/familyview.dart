import 'package:flutter/material.dart';
import 'package:eward_frontend/screens/userscreen/compregscreen.dart';
import 'package:eward_frontend/apicall/apirequest.dart';
import 'package:eward_frontend/screens/userscreen/family_memb.dart';

class familyview extends StatelessWidget {
  const familyview({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text("familyMembers")),
          body: FutureBuilder<List<dynamic>>(
            future: Future.value(getfamilymembers()),
            builder:
                ((BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data?.length == 0) {
                  return Center(child: Text("No Family Members Added"));
                }
                final data = snapshot.data;
                return ListView.builder(
                    itemCount: data?.length ?? 0,
                    itemBuilder: ((BuildContext context, int index) {
                      final user = snapshot.data?[index];
                      String firstname = user['firstname'];
                      String lastname = user['lastname'];
                      String phone = user['phone'];
                      String email = user['email'];

                      return Card(
                          color: Color.fromARGB(0, 27, 7, 250),
                          elevation: 0,
                          child: SizedBox(
                            height: 100,
                            child: ListTile(
                              leading: Image.asset(
                                  "assets/images/icons8-complaint-100.png"),
                              title: Text(firstname + ' ' + lastname),
                              subtitle:
                                  Text(phone, overflow: TextOverflow.ellipsis),
                              trailing: Text(email),
                              onTap: () {},
                            ),
                          ));
                    }));
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Center(child: const CircularProgressIndicator());
              }
            }),
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: ((context) {
                  return famMemberReg();
                })));
              },
              child: const Text(
                "+",
                style: TextStyle(fontWeight: FontWeight.bold),
              ))),
    );
  }
}
//compileSdkVersion flutter.compileSdkVersion