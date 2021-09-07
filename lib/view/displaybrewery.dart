import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rnsolution/model/brewery.dart';
import 'package:rnsolution/view/displayDetail.dart';

class DisplayBrewery extends StatefulWidget {
  final List<BreweryItems> breweryitems;
  DisplayBrewery({Key? key, required this.breweryitems}) : super(key: key);

  @override
  _DisplayBreweryState createState() => _DisplayBreweryState();
}

class _DisplayBreweryState extends State<DisplayBrewery> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: displayLoadedItems(),
      ),
    );
  }

  Widget displayLoadedItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 60),
            child: Text(
              " Brewery Items",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )),
        Expanded(
          child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 40, left: 40, right: 40),
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: widget.breweryitems.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DisplayDetail(
                                        breweryitems: widget.breweryitems[index])));
                          },
                          child: Container(
                              height: 50,
                              width: 300,
                              // margin: EdgeInsets.only(left: 5,top:5,right: 5,bottom: 5),
                              margin: EdgeInsets.only(left: 10, bottom: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 3,
                                  )),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    padding: EdgeInsets.only(left: 5, top: 3),
                                    margin: EdgeInsets.only(left: 5, top: 3),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.blue,
                                          width: 3,
                                        )),
                                    child: Text(
                                      getFirst(
                                              widget.breweryitems[index].name ??
                                                  "N.A") ??
                                          "",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        // decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    widget.breweryitems[index].name ?? "",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      //  decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  //   Padding(
                                  //  padding: const EdgeInsets.only(left:50),
                                  new Spacer(),
                                  Icon(Icons.arrow_forward)
                                ],
                                // ),
                              ))),
                      // Text(widget.breweryitems[index].city ?? ""),
                    ],
                  );
                }),
          ),
        )
      ],
    );
    //return
  }

  String getFirst(String name) {
    return name.substring(0, 1);
  }

  Widget getDetailsDisplay() {
    return Row(
      children: [
        Text(" Brewery Name "),
        SizedBox(width: 10),
        Text(" Brewery Id "),
        Column(
          children: [
            displayLoadedItems(),
          ],
        )
      ],
    );
  }
}
