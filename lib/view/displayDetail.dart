import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rnsolution/model/brewery.dart';

class DisplayDetail extends StatefulWidget {
  final BreweryItems breweryitems;
  DisplayDetail({Key? key, required this.breweryitems}) : super(key: key);

  @override
  _DisplayDetailState createState() => _DisplayDetailState();
}

class _DisplayDetailState extends State<DisplayDetail> {
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
      children: [
      SizedBox(height: 60,),
      Text("Breweries Details",style: TextStyle(fontSize: 30),),

      Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 20,right: 20,top:10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.blue,
            width: 2,
          )),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               SizedBox(height: 10,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   Text("ID ", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                   Text("Name ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                   Text("City ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                   Text("Country ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                 ],
               ),
               SizedBox(height:20),
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('${widget.breweryitems.id}'),
                    GestureDetector(
                        onTap: () {
                        },
                        child: Text(widget.breweryitems.name ?? "")),
                    Text(widget.breweryitems.city ?? ""),
                    Text(widget.breweryitems.country ?? ""),
                    //Text(widget.breweryitems[index].countyProvince ?? ""),
                  ],
                ),
             ],
           )
        //  }

        //  ),
    )

      ],
    );
   // return
  }
}
