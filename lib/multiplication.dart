import 'dart:io';

import 'package:flutter/material.dart';

class Multiplication extends StatefulWidget {
  const Multiplication({Key? key}) : super(key: key);

  @override
  State<Multiplication> createState() => _MultiplicationState();
}

class _MultiplicationState extends State<Multiplication> {

  int number = 1 ;
  List<int> digit  =[1,2,3,4,5,6,7,8,9,10];
  List<int> output = [];

  TextEditingController txtno = TextEditingController();
  GlobalKey globalKey = GlobalKey();

  bool click = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: SafeArea(
        child: Scaffold(backgroundColor: Colors.teal.shade100,
          appBar: AppBar(backgroundColor: Colors.teal,
              title:Text("Multiplication Table",style: TextStyle(fontSize: 20,color: Colors.white),)

          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(

                    validator: (value) {

                     if(int.parse(txtno.text) < 0)
                       {
                         print("Enter Positive Number");
                       }


                    },
                    keyboardType: TextInputType.number,
                    controller: txtno,
                    decoration: InputDecoration(
                      filled: true,fillColor: Colors.white,
                      enabled: true,
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.blue.shade900)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.blue.shade900)),
                      hintText: "Enter Positive Integer Number...."
                    ),
                  ),
                ),

                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.cyanAccent),
                    onPressed: () {
                  setState(() {
                    number = int.parse(txtno.text);
                  });

                }, child: Text("Submit",style: TextStyle(fontSize: 25),)),

                Expanded(child: ListView.builder(itemBuilder: (context, index) {
                  return Tabs(no: number,num:digit[index],multi:(number * digit[index]));
                },
                  itemCount: 10,
                )
                )


              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Tabs({int? no, int?num,int? multi})
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("$no",style: TextStyle(fontSize: 15),),
        Text("      *       $num",style: TextStyle(fontSize: 15),),
        Text("       =   ${multi}",style: TextStyle(fontSize: 15),)
      ],
    );
  }

}
