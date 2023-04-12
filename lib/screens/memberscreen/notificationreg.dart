import 'package:eward_frontend/apicall/apirequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:eward_frontend/screens/memberscreen/memberhmscreen.dart';

class notificationRegs extends StatelessWidget {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  var pickedfile;

  notificationRegs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: AppBar(title: Text("Post Notification")),
          body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.fromLTRB(5, 30, 5, 0),
          decoration: BoxDecoration(
              color: Color.fromARGB(2, 231, 232, 238),
              borderRadius: BorderRadius.circular(10)),
          child: Column(children: [
            TextFormField(
              controller: t1,
              decoration: const  InputDecoration(
               
                hintText: 'Notification Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
           
            TextFormField(
              controller: t2,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration:  const InputDecoration(
                
                contentPadding: EdgeInsets.symmetric(vertical: 55),
                hintText: 'Notification  Descrption',
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 250,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(colors: [
                     Color.fromARGB(255, 0, 98, 255),
                         Color.fromARGB(255, 0, 98, 255),
                  ])),
              child: ElevatedButton(
                onPressed: (() async {
                  final picker = ImagePicker();
                  pickedfile =
                      await picker.pickImage(source: ImageSource.camera);
                }),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
                child: const Text("Upload Image from Camera"),
              ),
            ),

            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
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
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
                child: const Text("Upload Image from Gallery"),
              ),
            ),]
          ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              width: 430,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 0, 98, 255),
                         Color.fromARGB(255, 0, 98, 255),
                  ])),
              child: ElevatedButton(
                onPressed: (() {
                  notificationreg(context);
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return const membhomescreen();
                  }));
                }),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
                child: const Text("Post Notification"),
              ),
            )
          ]),
        ),
      )),
    );
  }

  void notificationreg(context) async {
    String title = t1.text;
    String desc = t2.text;

    String resp = await postnotification(title, desc, pickedfile);
    return;
  }
}
