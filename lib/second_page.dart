import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:http/http.dart' as http;

class second extends StatefulWidget {
  const second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  String first = "USD";
  String second = "INR";
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "Currency Converter",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      showCurrencyPicker(
                        context: context,
                        showFlag: true,
                        showSearchField: true,
                        showCurrencyName: true,
                        showCurrencyCode: true,
                        onSelect: (Currency currency) {
                          print('Select currency: ${currency.name}');
                          setState(() {
                            first = currency.code;
                          });
                        },
                        // favorite: ['INR'],
                      );
                    },
                    child: Container(
                      height: 30,
                      width: 100,
                      margin: EdgeInsets.only(left: 30),
                      // color: Colors.cyan,
                      alignment: Alignment.topRight,
                      decoration: BoxDecoration(
                          color: Color(0xFF58345E),
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "$first",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showCurrencyPicker(
                        context: context,
                        showFlag: true,
                        showSearchField: true,
                        showCurrencyName: true,
                        showCurrencyCode: true,
                        onSelect: (Currency currency) {
                          print('Select currency: ${currency.name}');
                          setState(() {
                            second = currency.code;
                          });
                        },
                        // favorite: ['INR'],
                      );
                    },
                    child: Container(
                      height: 30,
                      width: 100,
                      margin: EdgeInsets.only(left: 80),
                      // color: Colors.cyan,
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                          color: Color(0xFF58345E),
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text("$second",style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),


              IconButton(onPressed: () async {
                String amount=t1.text;
                var url = Uri.parse('https://trushagajera.000webhostapp.com/currency.php');
                var response = await http.post(url, body: {'to': '$first', 'from': '$second','amount':'$amount'});
                print('Response status: ${response.statusCode}');
                print('Response body: ${response.body}');
                Map m=jsonDecode(response.body);
                setState(() {
                  t2.text=m['result'].toString();
                  
                });
                print(m['result']);

              }, icon: Icon(Icons.cached_rounded,size: 40,color: Colors.white,),),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      margin: EdgeInsets.only(top: 20, left:20),
                      padding: EdgeInsets.only(right: 20),
                      child: TextField(
                        controller: t1,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.white30,
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      margin: EdgeInsets.only(top: 20, left: 20),
                      padding: EdgeInsets.only(right: 20),
                      child: TextField(
                        controller: t2,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 2, color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            filled: true,
                            fillColor: Colors.white30,
                            border: InputBorder.none),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCurrencyPicker(
            context: context,
            showFlag: true,
            showSearchField: true,
            showCurrencyName: true,
            showCurrencyCode: true,
            onSelect: (Currency currency) {
              print('Select currency: ${currency.name}');
            },
            favorite: ['INR'],
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}