import 'package:flutter/material.dart';
import 'package:eward_frontend/globals/globalvar.dart' as globals;

String ipaddress = globals.ipaddress;

class complaintscreen extends StatelessWidget {
  String? complaintTitle = ' ',
      complaintDesc = ' ',
      complaintCreated = ' ',
      complaintUpdated = ' ',
      complaintImgpath = ' ',
      complaintStatus = ' ',
      complaintRemark = ' ';

  complaintscreen({
    super.key,
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
                  child: Align(alignment: Alignment.topLeft,
                    child: Text(complaintDesc as String,
                        style: const TextStyle(

                            fontWeight: FontWeight.w300, fontSize: 13)),
                  ),
                ),
                Container(
                  color: const Color.fromARGB(96, 215, 20, 20),
                  child: Image.network('${ipaddress}${complaintImgpath}',errorBuilder: (context, error, stackTrace) {
                    return const  Text(" ");
                  },),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Align(
                    child: Text(complaintRemark as String,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 25, 22, 22),
                            fontWeight: FontWeight.w200,
                            fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
