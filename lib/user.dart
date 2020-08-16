import 'package:flutter/material.dart';
import 'firstscreen.dart';
import 'settings.dart';

class UserProfile extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Your Profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Color color = Colors.green[500];

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.portrait, 'Profile Picture'),
        ],
      ),
    );

    Widget listButtonSection = Container(
      padding: EdgeInsets.all(8.0),
      child: FlatButton(
        onPressed: () {
          //do something
        },
        color: Colors.grey,
        child: Row(children: <Widget>[
          Text("Access Your Existing Lists",
            style: TextStyle(fontSize: 18),),
        ],
        ),
      ),
    );

    Widget foodButtonSearchSection = Container(
      padding: EdgeInsets.all(8.0),
      child: FlatButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MainMenu()));
          //runApp(MainMenu());
        },
        color: Colors.grey,
        child: Row(children: <Widget>[
          Text("Return to Food Search",
            style: TextStyle(fontSize: 18),),
        ],
        ),
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          leading: IconButton(
            icon: Icon(
              Icons.settings,
              color:Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
              //  runApp(Settings());
            },
          ),
          title: Text(''),
        ),
        body: ListView(
          children: [
            titleSection,
            buttonSection,
            foodButtonSearchSection,
            listButtonSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 50.0, color: color),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}