import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> addData(String name, String usage, String year) async {
  await FirebaseFirestore.instance.collection('Robots').add({
    "Title" :name,
    "Usage" :usage,
    "Year" :year,
    }
  );
}

void updateData(String id, String name, String usage, String year) async{
  try{
    await FirebaseFirestore.instance.collection('Robots').doc(id).update({
      "Title" :name,
      "Usage" :usage,
      "Year" :year,
    });
  }on Exception catch (e){
    print(e);
  }
}

void deleteData(String id) async{
  try{
    await FirebaseFirestore.instance.collection('Robots').doc(id).delete();
  }on Expanded catch (e){
    print(e);
  }
}