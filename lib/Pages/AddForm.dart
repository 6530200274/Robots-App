import 'package:flutter/material.dart';
import 'package:robots/service/crud_service.dart';

class Addform extends StatefulWidget {
  const Addform({super.key});

  @override
  State<Addform> createState() => _AddformState();
}

class _AddformState extends State<Addform> {
  //databaseApp db = databaseApp();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final yearController = TextEditingController();

  void handleSubmit(){
    String titlerobot = titleController.text;
    String usage = descriptionController.text;
    String year = yearController.text;

    addData(titlerobot, usage, year);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 167, 38, 147),
        title: Center(
          child: Text(
            'New post',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  /*Text(
                    'New Post',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),*/
                  SizedBox(height: 20),
                  SizedBox(
                    width: 350, // ปรับขนาดให้สั้นลง
                    child: TextFormField(
                      controller: titleController,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: 'Robot name',
                        icon: Icon(Icons.smart_toy),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        hintText: 'Usage',
                        icon: Icon(Icons.electric_meter),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      controller: yearController,
                      decoration: InputDecoration(
                        hintText: 'Year of development',
                        icon: Icon(Icons.history),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.amber, // สีปุ่ม Question
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      ),
                    onPressed: () {
                      handleSubmit();
                      //insert(data);
                      Navigator.pop(context);
                    },
                    child: Text('Post',style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /*void insert(Map input) async {
    postModel data = postModel(
      title: input['title'],
      description: input['description'],
    );
    await db.insertData(data);
  }*/
}
