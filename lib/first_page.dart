// import 'package:country_picker/country_picker.dart';
import 'package:currency_con/second_page.dart';
import 'package:flutter/material.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  void initState() {
    super.initState();
    go();
  }

  go() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return second();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency converter"),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("my_image/card.jpg"),
                      fit: BoxFit.fill)),
              child: Text("Currency Converter")),
          ListTile(
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.home)),
            title: Text("Home"),
          ),
          ListTile(
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
            title: Text("Favorites"),
          ),
          ListTile(
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.show_chart)),
            title: Text("Chart"),
          ),
          ListTile(
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
            title: Text("Settings"),
          ),
          ListTile(
            leading:
                IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
            title: Text("About"),
          )
        ],
      )),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("my_image/currency.jpg"))),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Text("currency Converter",
                    style: TextStyle(color: Colors.pink, fontSize: 30))),
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Text("Instantly convert currency by using",
                    style: TextStyle(color: Colors.white, fontSize: 20))),
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Text("live Exchange Rates",
                    style: TextStyle(color: Colors.white, fontSize: 20)))
          ],
        ),
      ),
    );
  }
}
