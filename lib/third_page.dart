import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class third extends StatefulWidget {
  const third({Key? key}) : super(key: key);

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  TextEditingController t1 = TextEditingController();
  String str = "Not connected...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EMAIL CHECHER"),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: double.infinity,
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                controller: t1,
              ),
              ElevatedButton(
                  onPressed: () async {
                    print("Button pressed::");
                    String email = t1.text;
                    var url = Uri.parse(
                        "https://trushagajera.000webhostapp.com/email.php");
                    var response =
                        await http.post(url, body: {'email': '$email'});
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    Map m = jsonDecode(response.body);
                    if (m['success'] == false) {
                      str = "No data Enterd";
                    } else {
                      str =
                          "domain:${m['domain']} \n email address:${m['email']} \n is valid :${m['format_valid']} \n found email:${m['nx_found']} \n user name:${m['user']}";
                    }
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Container(
                            width: double.infinity,
                            margin: EdgeInsets.all(10),
                            child: Text("${str}"),
                          ),
                        );
                      },
                    );
                    Future.delayed(Duration(seconds: 10)).then((value) {
                      Navigator.pop(context);
                    });
                  },
                  child: Text("CHECK"))
            ],
          ),
        ),
      ),
    );
  }
}
