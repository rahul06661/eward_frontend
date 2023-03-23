import 'package:flutter/material.dart';
import 'package:eward_frontend/apicall/apirequest.dart';
import 'package:image_picker/image_picker.dart';

class compregscreens extends StatelessWidget {
  compregscreens({super.key});
  final formkey = GlobalKey<FormState>();
  final t1 = TextEditingController();
  final t2 = TextEditingController();
  var pickedfile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Container(
              width: double.infinity,
              height: 1000,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.fromLTRB(5, 30, 5, 0),
              decoration: BoxDecoration(
                  color: Color.fromARGB(160, 231, 232, 238),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(children: [
                TextFormField(
                  controller: t1,
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black45)),
                      labelText: "Complaint title"),
                ),
                TextFormField(
                  controller: t2,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black45),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 50),
                      labelText: "Complaint desc"),
                ),
                const SizedBox(
                  height: 500,
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
                    child: const Text("Upload image"),
                  ),
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
                        Color.fromRGBO(143, 148, 251, 1),
                        Color.fromRGBO(143, 148, 251, 2)
                      ])),
                  child: ElevatedButton(
                    onPressed: (() {
                      Future<String> resp = compreg();
                      resp.then(
                        (value) {
                          print(value);
                        },
                      );
                    }),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shadowColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: const Text("Register Complaint"),
                  ),
                )
              ]),
            ),
          ),
        ));
  }

  Future<String> compreg() {
    String title = t1.text;
    String desc = t2.text;
    print(title);
    print(desc);

    var comp_status = complaints_reg(title, desc, pickedfile);
    return comp_status;
  }
}
