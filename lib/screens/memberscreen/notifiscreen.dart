import 'package:flutter/material.dart';

import 'package:eward_frontend/globals/globalvar.dart' as globals;

String ipaddress = globals.ipaddress;

class notificationscreen extends StatelessWidget {
  String? notification_title = ' ',
      notification_desc = ' ',
      notification_created = ' ',
      notification_updated = ' ',
      notification_imgpath = ' ';
  notificationscreen(
      {super.key,
      this.notification_title,
      this.notification_desc,
      this.notification_created,
      this.notification_updated,
      this.notification_imgpath});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Color.fromARGB(223, 205, 208, 227),
            padding: EdgeInsets.fromLTRB(15, 15, 15, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(notification_title as String,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18)),
                    Text(notification_updated as String,
                        style: const TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 14))
                  ],
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
                  child: Align(
                    child: Text(notification_desc as String,
                        style: const TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 13)),
                    alignment: Alignment.topLeft,
                  ),
                ),
                Container(
                  color: Color.fromARGB(96, 215, 20, 20),
                  child: Image.network('${ipaddress}${notification_imgpath}',
                      errorBuilder: (context, error, stackTrace) {
                    return const Text("");
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
