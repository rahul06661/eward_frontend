import 'package:flutter/material.dart';
import 'package:eward_frontend/apicall/apirequest.dart';
import 'package:image_picker/image_picker.dart';
import 'package:eward_frontend/screens/userscreen/userhmscreen.dart';

class compregscreens extends StatelessWidget {
  compregscreens({super.key});
  final formkey = GlobalKey<FormState>();
  final t1 = TextEditingController();
  final t2 = TextEditingController();
  var pickedfile = null;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Register Complaint")),
          body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(7),
          padding: const EdgeInsets.fromLTRB(4, 30, 4, 0),
          decoration: BoxDecoration(
             
              borderRadius: BorderRadius.circular(10)),
          child: Column(children: [
            TextFormField(
              controller: t1,
              decoration:const  InputDecoration(
               
                hintText: 'Complaint Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: t2,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                
                contentPadding: EdgeInsets.symmetric(vertical: 55),
                hintText: 'Complaint  Descrption',
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 400,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(colors: [
                         Color.fromARGB(255, 0, 98, 255),
                         Color.fromARGB(255, 0, 98, 255),
                      ])),
                  child: ElevatedButton(
                    onPressed: (() async {
                      final picker = ImagePicker();
                      pickedfile =
                          await picker.pickImage(source: ImageSource.gallery);
                    }),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shadowColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: const Text("Upload from Gallery"),
                  ),
                ),
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 0, 98, 255),
                         Color.fromARGB(255, 0, 98, 255),
                      ]
                      )
                      ),
                  child: ElevatedButton(
                    onPressed: (() async {
                      final picker = ImagePicker();
                      pickedfile =
                          await picker.pickImage(source: ImageSource.camera);
                    }),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shadowColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: const Text("Upload from Image"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              width: 430,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 0, 98, 255),
                         Color.fromARGB(255, 0, 98, 255),
                  ])),
              child: ElevatedButton(
                onPressed: (() {
                  Future<String> resp = compreg(context);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return userhomescreen();
                  }));
                }),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
                child: const Text("Register Complaint"),
              ),
            )
          ]),
        ),
      )),
    );
  }

  Future<String> compreg(context) async {
    String title = t1.text;
    String desc = t2.text;
    print(title);
    print(desc);
    print(pickedfile);

    var comp_status = await complaints_reg(title, desc, pickedfile);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(comp_status),
    ));
    return comp_status;
  }
}
