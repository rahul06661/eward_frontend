import 'package:flutter/material.dart';
import 'package:eward_frontend/screens/userscreen/compregscreen.dart';
import 'package:eward_frontend/apicall/apirequest.dart';
import 'package:eward_frontend/screens/userscreen/compscreen.dart';

class compscreen extends StatelessWidget {
  const compscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<dynamic>>(
          future: Future.value(complaints()),
          builder:
              ((BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              return ListView.builder(
                  itemCount: data?.length ?? 0,
                  itemBuilder: ((BuildContext context, int index) {
                    final user = snapshot.data?[index];
                    String complaint_title = user['name'];
                    String complaint_desc = user['desc'];
                    String complaint_created = user['created_on'];
                    String complaint_updated = user['update_on'];
                    String complaint_imgpath = user['img_path'];
                    String complaint_status = user['status'];
                    String complaint_remark = user['remark'];
                    return Card(
                        elevation: 0,
                        child: SizedBox(
                          height: 100,
                          child: ListTile(
                            leading:
                                Image.asset("assets/images/notification.png"),
                            title: Text(complaint_title),
                            subtitle: Text(complaint_desc),
                            trailing: Text(complaint_updated),
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: ((context) {
                                return complaintscreen(
                                  complaintTitle: complaint_title,
                                  complaintDesc: complaint_desc,
                                  complaintCreated: complaint_created,
                                  complaintImgpath: complaint_imgpath,
                                  complaintStatus: complaint_status,
                                  complaintRemark: complaint_remark,
                                  complaintUpdated: complaint_updated,
                                );
                              })));
                            },
                          ),
                        ));
                  }));
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          }),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                return compregscreens();
              })));
            },
            child: const Text(
              "+",
              style: TextStyle(fontWeight: FontWeight.bold),
            )));
  }
}
//compileSdkVersion flutter.compileSdkVersion