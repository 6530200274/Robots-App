import 'package:flutter/material.dart';
import 'package:robots/service/crud_service.dart';

class Editform extends StatefulWidget {
  final String doc_id;
  final String titlerobot;
  final String usage;
  final String year;

  Editform({
    required this.titlerobot,
    required this.usage,
    required this.year,
    required this.doc_id
  });

  @override
  State<Editform> createState() => _EditformState();
}

class _EditformState extends State<Editform> {
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: widget.titlerobot);
    final descriptionController = TextEditingController(text: widget.usage);
    final yearController = TextEditingController(text: widget.year);

    void handleSubmit() {
      String titlerobot = titleController.text;
      String usage = descriptionController.text;
      String year = yearController.text;

      updateData(widget.doc_id,titlerobot, usage, year);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 167, 38, 147),
        title: Center(
          child: Text(
            'Update post',
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
                      backgroundColor: Colors.amber, // สีปุ่ม Question
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
                    child: Text('Edit',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
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
