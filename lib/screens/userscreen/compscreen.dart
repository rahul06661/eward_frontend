import 'package:flutter/material.dart';
import 'package:eward_frontend/globals/globalvar.dart' as globals;
import 'package:eward_frontend/apicall/apirequest.dart';
import 'package:eward_frontend/screens/userscreen/chat_screen.dart';
import 'package:eward_frontend/screens/memberscreen/status.dart';
import 'package:eward_frontend/screens/userscreen/userhmscreen.dart';

String ipaddress = globals.ipaddress;

class complaintscreen extends StatefulWidget {
  String? complaintId = '',
      complaintTitle = ' ',
      complaintDesc = ' ',
      complaintCreated = ' ',
      complaintUpdated = ' ',
      complaintImgpath = ' ',
      complaintStatus = ' ';

  complaintscreen({
    super.key,
    this.complaintId,
    this.complaintTitle,
    this.complaintDesc,
    this.complaintCreated,
    this.complaintUpdated,
    this.complaintImgpath,
    this.complaintStatus,
  });

  @override
  State<complaintscreen> createState() => _complaintscreenState();
}

class _complaintscreenState extends State<complaintscreen> {
  TextEditingController t1 = TextEditingController();
  String status = '1';
  @override
  void initState() {
    getState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.complaintTitle as String,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 18)),
                      Text(widget.complaintUpdated as String,
                          style: const TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 14))
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
                    alignment: Alignment.topLeft,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(widget.complaintDesc as String,
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 13)),
                    ),
                  ),
                ]),
                Container(
                  child: Image.network(
                    '${ipaddress}${widget.complaintImgpath}',
                    errorBuilder: (context, error, stackTrace) {
                      return const Text("");
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: statusbar(states: int.parse(status)),
                ),
                Container(
                  height: 350,
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  
                  child: Container(
                    child: MyWidget(id: widget.complaintId),
                  ),
                ),
                int.parse(status) != 3
                    ? Container(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
                        child: TextFormField(
                          controller: t1,
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black45)),
                              labelText: "Remark About complanit"),
                        ),
                      )
                    : Text("Complaint Closed"),
                int.parse(status) != 3
                    ? Container(
                        height: 50,
                        width: 100,
                        child: ElevatedButton(
                            onPressed: (() {
                              
                              updatecomplaint(context);
                              t1.clear();
                            }),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: const Text("Update Remark"),),
                      )
                    : const Text(" "),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
                  child: int.parse(status) == 3
                      ? null
                      : ElevatedButton(
                          onPressed: (() {
                            closeComplaint(widget.complaintId);
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) {
                                return userhomescreen();
                              },
                            ));
                          }),
                          child: Text("Close Complaint")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getState() async {
    status = await getStatus(widget.complaintId);
    setState(() {
      status = status;
    });
  }

  void updatecomplaint(context) async {
    String remark = t1.text;
    if (remark == "") {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return this.build(context);
        },
      ));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return this.build(context);
        },
      ));
    }
    String response = await updateRemark(remark, widget.complaintId) as String;

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(response),
    ));
  }
}
