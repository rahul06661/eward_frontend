import 'package:flutter/material.dart';
import 'package:eward_frontend/globals/globalvar.dart' as globals;
import 'package:eward_frontend/screens/userscreen/complaintview.dart';
import 'package:eward_frontend/apicall/apirequest.dart';
import 'package:eward_frontend/screens/userscreen/chat_screen.dart';

String ipaddress = globals.ipaddress;

class complaintscreen extends StatelessWidget {
  String? complaintId = '',
      complaintTitle = ' ',
      complaintDesc = ' ',
      complaintCreated = ' ',
      complaintUpdated = ' ',
      complaintImgpath = ' ',
      complaintStatus = ' ';
  TextEditingController t1 = TextEditingController();

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
  Widget build(BuildContext context) {
    bool colr;
    if (complaintStatus == "Active") {
      colr = true;
    } else {
      colr = false;
    }
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: colr
                ? const Color.fromARGB(191, 206, 149, 149)
                : Color.fromARGB(159, 115, 228, 115),
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(complaintTitle as String,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18)),
                    Text(complaintUpdated as String,
                        style: const TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 14))
                  ],
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
                  alignment: Alignment.topLeft,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(complaintDesc as String,
                        style: const TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 13)),
                  ),
                ),
                Container(
                  child: Image.network(
                    '${ipaddress}${complaintImgpath}',
                    errorBuilder: (context, error, stackTrace) {
                      return const Text("");
                    },
                  ),
                ),
                Container(
                  height: 350,
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  child: Container(
                    child:const MyWidget() ,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
                  child: TextFormField(
                    controller: t1,
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45)),
                        labelText: "Remark About complanit"),
                  ),
                ),
                Container(
                  height: 50,
                  width: 430,
                  
                  child: ElevatedButton(
                    onPressed: (() {
                      updatecomplaint(context);
                    }),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shadowColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Image.asset("assets/images/arrow.png")
                  ),
                  
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
                child: ElevatedButton(onPressed: (() {
                  
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

  void updatecomplaint(context) async {
    String remark = t1.text;
    if (remark == "") {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return MyWidget();
        },
      ));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return MyWidget();
        },
      ));
    }
    String response = await updateRemark(remark, complaintId) as String;

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(response),
    ));
  }
}
