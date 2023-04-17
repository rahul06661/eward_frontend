import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:eward_frontend/apicall/apirequest.dart';

class profileShows extends StatelessWidget {
  String? selectedData, selectedItems;
  profileShows({super.key,
   this.selectedData, 
   this.selectedItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profiles")),
      body: FutureBuilder<List<dynamic>>(
        future: Future.value(profile(selectedData, selectedItems)),
        builder:
            ((BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.length == 0) {
              return Center(child: Text("No Data"));
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
                      elevation: 0,
                      child: SizedBox(
                        height: 100,
                        child: ListTile(
                          leading:
                              Image.asset("assets/images/notification.png"),
                          title: Text(firstname),
                          trailing: Text(phone),
                          subtitle: Text(email),
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
      
    );
  }
}
