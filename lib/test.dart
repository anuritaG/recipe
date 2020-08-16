import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:recipe/auth.dart';

import 'notifier.dart';

class Test extends StatefulWidget {
  final String itemName;
  const Test(this.itemName);
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  Future callback;

  //Provider.of<Item>(context, listen: false).getItem();
  var showAll = false;
  var qty;
  var tester;
  void initState() {
    super.initState();
    print("a");
    qty = 0;
     tester="as";
    var food = widget.itemName;
    callback = Provider.of<Info>(context, listen: false).getInfo(food);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    print("ht" + height.toString());
    print("wt" + width.toString());
    return Scaffold(
        body: FutureBuilder(
            future: callback,
            // ignore: missing_return
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError)
                throw snapshot.hasError;
              else if (!snapshot.hasData) {
                return Container();
              } else {
                var info = snapshot.data;
                print("image");
                print(info);
                print(info["hits"][0]["recipe"]["image"]);
                var ingr =
                    info["hits"][0]["recipe"]["ingredientLines"].toString();
                print(info["hits"][0]["recipe"]["totalNutrients"]);
                print("nk");

                return Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                  Container(
                    margin:  EdgeInsets.only(top:height*0.095),
                    child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                            print("tap");
                            Navigator.pop(context);
                          });
                        }),
                  ),
                  Container(

                    width: width * 0.41,
                    height: width * 0.41,
                    padding: const EdgeInsets.all(0),
                    margin: EdgeInsets.fromLTRB(width*0.4, height * 0.01, 0, 0),
                    //border:color.red,
                    // alignment:Alignment.center,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,

                          //fit: BoxFit.fitHeight,
                          //colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8),BlendMode.dstATop),
                          image:
                              NetworkImage(info["hits"][0]["recipe"]["image"]),
                        )
                        // child: Image.network(info["hits"][0]["recipe"]["image"]),
                        ),
                  ),

                          Container(
                            margin: EdgeInsets.only(top:height*0.08),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Container(
                                  margin:EdgeInsets.only(left: width*0.05),
                                  child: Text(info["q"],
                                      textAlign: TextAlign.center,

                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: width*0.076)),
                                ),
                                SizedBox(height: height*0.04),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        height: width*0.076,
                                        width:width*0.255,
                                        margin:  EdgeInsets.fromLTRB(width*0.076, 0, width*0.1, width*0.05),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          //border:Border.all(color:Colors.black),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(18)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.room_service,
                                              color: Colors.cyan,
                                            ),
                                            Padding(
                                              padding:  EdgeInsets.only(left: width*0.05),
                                              child: Text(info["hits"][0]["recipe"]
                                              ["yield"]
                                                  .toString()),
                                            )
                                          ],
                                        )),
                                    Container(
                                        height: width*0.076,
                                        width: width*0.255,
                                        margin: EdgeInsets.fromLTRB(width*0.0760, 0, width*0.1, width*0.05),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          //border:Border.all(color:Colors.black),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(18)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              MdiIcons.fire,
                                              color: Colors.pinkAccent,
                                            ),
                                            Padding(
                                              padding:  EdgeInsets.only(left: width*0.025),
                                              child: Text(info["hits"][0]["recipe"]
                                              ["calories"]
                                                  .toStringAsFixed(2)),
                                            )
                                          ],
                                        ))
                                  ],
                                ),

                              ],
                            ),
                          ),
                          Container(
                            height: 100,
                            child:NavigationToolbar(
                              leading: Text("as"),
                              middleSpacing: 0,
                              middle: Text("cs"),
                            )
                          ),
                          /*Container(
                            child: Row(
                              children: <Widget>[
                                InkWell(
                                  child: FlatButton(
                                    padding: EdgeInsets.all(8.0),
                                    onPressed: () {
                                      setState(() {
                                        tester="adfs";
                                        print(tester);
                                      });

                                      /*...*/
                                    },
                                    child: Text(
                                      "Ingredients",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  child: FlatButton(
                                    padding: EdgeInsets.all(8.0),
                                    onPressed: () {
                                      setState(() {
                                        tester="asd";
                                        print(tester);
                                      });

                                      /*...*/
                                    },
                                    child: Text(
                                      "Nutrients",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),*/
                                                    Text(tester),
                ]));
              }
            }));
  }
}
