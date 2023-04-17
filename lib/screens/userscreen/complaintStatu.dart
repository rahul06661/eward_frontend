import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class complaintStatus extends StatelessWidget {
   String? open,close,pending;
  complaintStatus({super.key, this.open='',this.close='',this.pending=''});

  
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(" ")),
          body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                color: Colors.red,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: SizedBox(
                  width: 180,
                  height: 250,
                  child: Column(
                    children:  [
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Raleway',
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                              'Open Complaints')),
                      Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                              style: TextStyle(
                                  fontSize: 110, fontWeight: FontWeight.bold),
                              open as String)),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.blue,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: SizedBox(
                  width: 180,
                  height: 250,
                  child: Column(
                    children:  [
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Raleway',
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                              'Pending Complaints')),
                      Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                              style: TextStyle(
                                  fontSize: 110, fontWeight: FontWeight.bold),
                              pending as String)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Card(
              color: Colors.green,
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: SizedBox(
                
                width: 180,
                height: 250,
                child: Column(
                  children:  [
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Raleway',
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                            'Closed Complaints')),
                    Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                            style: TextStyle(
                                fontSize: 110, fontWeight: FontWeight.bold),
                           close as String )),
                  ],
                ),
              ),
            ),
          ])
        ],
      )),
    );
  }
}
