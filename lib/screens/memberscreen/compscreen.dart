import 'package:flutter/material.dart';
import 'package:eward_frontend/globals/globalvar.dart' as globals;
import 'package:eward_frontend/apicall/apirequest.dart';
import 'package:eward_frontend/screens/memberscreen/complaintview.dart';

String ipaddress = globals.ipaddress;

class complaintscreen extends StatelessWidget {
  TextEditingController t1 = TextEditingController();
  String? complaintId,
      complaintTitle = " ",
      complaintDesc,
      complaintCreated,
      complaintUpdated,
      complaintImgpath,
      complaintStatus,
      complaintRemark;

  complaintscreen({
    super.key,
    this.complaintId,
    this.complaintTitle,
    this.complaintDesc,
    this.complaintCreated,
    this.complaintUpdated,
    this.complaintImgpath,
    this.complaintStatus,
    this.complaintRemark,
  });
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
                  color: const Color.fromARGB(96, 215, 20, 20),
                  child: Image.network(
                    '${ipaddress}${complaintImgpath}',
                    errorBuilder: (context, error, stackTrace) {
                      return const Text("helo ");
                    },
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(colors: [
                        Color.fromRGBO(143, 148, 251, 1),
                        Color.fromRGBO(143, 148, 251, 2)
                      ])),
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
                    child: const Text("Update Remark"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updatecomplaint(context) async {
    String remark = t1.text;
    if (remark == " ") {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return compscreen();
        },
      ));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return compscreen();
        },
      ));
    }
    print("____________________________________________________");
    print(complaintId.runtimeType);
    String response = await updateRemark(remark, complaintId) as String;

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(response),
    ));
  }
}
