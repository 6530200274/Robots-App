import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:robots/Pages/EditForm.dart';
import 'package:robots/service/crud_service.dart';

class Robotslist extends StatefulWidget {
  const Robotslist({super.key});

  @override
  State<Robotslist> createState() => _robotslistState();
}

void handleDelete(String id){
  deleteData(id);
}

class _robotslistState extends State<Robotslist> {
  
  CollectionReference postCollection = 
  FirebaseFirestore.instance.collection('Robots');
 
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: postCollection.snapshots(), 
        builder: (cpntext,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context,Index) {
                var robotindex = snapshot.data!.docs[Index];

                return ListTile(
                  leading: Icon(Icons.smart_toy),
                  title: Text(robotindex["Title"]),
                  subtitle: Text(robotindex["Year"]),
                  trailing: Container(
                          width: 70,
                          child: Row(
                            children: [
                              Expanded(
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context, 
                                      MaterialPageRoute(
                                        builder: (context) => Editform(titlerobot: robotindex["Title"], usage: robotindex["Usage"], year: robotindex["Year"], doc_id: robotindex.id,), 
                                        settings: RouteSettings(
                                          /*arguments: topic*/)));
                                          //แก้เป็นคำตอบใหม่
                                          /*.then((value) {
                                            setState(() {
                                            });
                                          });*/
                                  }, icon: Icon(Icons.edit))),
                              Expanded(
                                child: IconButton(
                                  onPressed: () {
                                    deleteData(robotindex.id);
                                  },
                                  icon: Icon(Icons.delete, color: Colors.red)),
                              ),
                            ],
                          ),
                        ),
                );
              }
            );
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
        }
      )
    );
  }
}