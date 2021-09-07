import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rnsolution/viewmodel/brewery_viewmodel.dart';
import 'package:stacked/stacked.dart';

import 'displaybrewery.dart';

class Brewery extends StatefulWidget {
  const Brewery({Key? key}) : super(key: key);

  @override
  _BreweryState createState() => _BreweryState();
}

class _BreweryState extends State<Brewery> {
  BreweryViewModel breweryViewModelProcess = BreweryViewModel();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BreweryViewModel>.reactive(
      viewModelBuilder: () => BreweryViewModel(),
      onModelReady: (model) => model.isApiInProgress,
      builder: (context, breweryData, child) => Scaffold(
          body: ModalProgressHUD(
        inAsyncCall: breweryData.isApiInProgress,
        child: getBreweryDisplay(breweryData),
      )),
    );
  }

  Widget getBreweryDisplay(BreweryViewModel breweryData) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top:200,left:30,right:30),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
             Text("Email",
              style:
                   TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Colors.black,
                    fontFamily: "Rubik",
                  )
          ),
          SizedBox(height: 10,),
          TextFormField(
            textAlign: TextAlign.start,
            controller: breweryData.emailController,

            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  value.contains('@') == false) {
                return 'Email not valid';
              }
              return null;
            },
            decoration: InputDecoration(
              // alignLabelWithHint: Alignment.centerLeft,
              //     hintText: 'john@email.com',
              hintStyle:
              TextStyle(color: Color(0xff333333)),
              labelStyle: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    //height: 10.4,
                    fontFamily: 'Rubik',
                    color: Color(0xff333333),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black,
                    width: 0.5),
                borderRadius:
                BorderRadius.circular(12.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black,
                    width: 0.5),
                borderRadius:
                BorderRadius.circular(12.0),
              ),
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(
              onPressed: () {
               if(fieldValidator(breweryData.emailController.text)){
                  debugPrint(" Started fetch data");
                  breweryData.refreshIndicator();
                  breweryViewModelProcess.performBreweryFetch(
                      response: (bool success) {
                        if (success) {
                          debugPrint(" Successfully fetched data");
                          debugPrint(" Brewery Items length is "+ '${breweryViewModelProcess.breweryitems.length}');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DisplayBrewery(breweryitems:breweryViewModelProcess.breweryitems)));
                          breweryData.refreshIndicator();
                        } else {
                          breweryData.refreshIndicator();
                        }
                      });
                }
                else{
                    Fluttertoast.showToast(
                      msg: "Please enter valid email to continue",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 5,
                    );
                }
              },
              child: Text("Get Breweries")),
        ],
      )
     // child:
    );
  }

  bool fieldValidator(String emailId){
    debugPrint(" Email Id is "+ '${emailId}');
    if(emailId.isEmpty){
      return false;
    }
    else if(emailId!=null&&emailId.length>2&& !emailId.contains("@")){
      return false;
    }else{
      return true;
    }

    // return false;
  }
}
