import 'package:flutter/material.dart';
import 'package:robots/Pages/AddForm.dart';
import 'package:robots/Pages/RobotsList.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int screenIndex = 0;

  List page = [
    Robotslist(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 22, 15, 48),
        elevation: 0, // ปรับให้ไม่มีเงาด้านล่าง
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), // ทำให้ขอบล่างมน
          ),
        ),
        title: Text(
          'Robots',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true, // จัด title ให้อยู่กึ่งกลาง
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              page[screenIndex]
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            screenIndex = 0;
          });
          //------ ไปหน้า addForm ------
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Addform()))
              .then((_) {
            setState(() {
              screenIndex = 0;
            });
          });
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: Colors.amber,
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //------ bottomNavigationBar ------
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 167, 38, 147),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    //------ กำหนดค่า Index เมื่อมีการคลิก ------
                    screenIndex = 0;
                  });
                },
                icon: Icon(
                  Icons.home,
                  //------ ถ้า Index = 0 ให้ไอคอนสีเขียวเข้ม ถ้าไม่ใช้ไอคอนสีขาว ------
                  color: screenIndex == 0
                      ? Color.fromARGB(255, 22, 15, 48)
                      : Colors.white,
                  // color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    screenIndex = 1;
                  });
                },
                icon: Icon(
                  Icons.person,
                  color: screenIndex == 1
                      ? Color.fromARGB(255, 22, 15, 48)
                      : Colors.white,
                )),
          ],
        ),
      ),
    );
  }


}