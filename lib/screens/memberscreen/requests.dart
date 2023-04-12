import 'package:flutter/material.dart';
import 'package:eward_frontend/apicall/apirequest.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: FutureBuilder<List<dynamic>>(
      future: Future.value(notapproved()),
      builder: ((BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data?.isEmpty == null) {
            return Text("No Requets Pending");
          }
          final data = snapshot.data;
          return ListView.builder(
            itemCount: data?.length ?? 0,
            itemBuilder: ((BuildContext context, int index) {
              final user = snapshot.data?[index];

              String email = user['email'];
              String first_name = user['firstname'];
              String last_name = user['lastname'];
              String phone = user['phone'];
              String housenumber = user['housenumber'];
              String job = user['job'];
              return Card(
                  elevation: 0,
                  child: SizedBox(
                      height: 200,
                      child: Container(
                        padding: EdgeInsets.all(7),
                        child: Column(children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Email ",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                email,
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Name ",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                first_name + ' ' + last_name,
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Phone Number",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                phone,
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "HouseNumber",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                housenumber,
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Job ",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                job,
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  style: ButtonStyle(),
                                  onPressed: (() {
                                    setState(() {
                                      approval(email);
                                      Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(
                                        builder: (context) {
                                          return super.widget;
                                        },
                                      ));
                                    });
                                  }),
                                  child: Text("Accept")),
                              ElevatedButton(
                                  onPressed: (() {}), child: Text("Reject"))
                            ],
                          ),
                        ]),
                      )));
            }),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Center(child: const CircularProgressIndicator());
        }
      }),
    )));
  }
}

/*
ListTile(
                      leading: Image.asset("assets/images/notification.png"),
                      title: Text(email),
                      trailing: Text(first_name),
                      subtitle: Text(voter_id),
                      onTap: () {},
                    ),*/