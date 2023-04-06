import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:eward_frontend/apicall/apirequest.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<dynamic>>(
          future: Future.value(get_chat('1')),
          builder:
              ((BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              return ListView.builder(
                  itemCount: data?.length ?? 0,
                  itemBuilder: ((BuildContext context, int index) {
                    final user = snapshot.data?[index];
                    String messgae = user['comment'];
                    String users = user['user'];
                    String time=user['update_on'];

                    return Card(
                        elevation: 0,
                        child: SizedBox(
                          height: 50,
                          child: Column(children: [
                            Text(users+':     '+messgae),
                            Text(time)
                          ],)
                        ));
                  }));
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Center(child: const CircularProgressIndicator());
            }
          }),
        ),
      ),
    );
  }
}
