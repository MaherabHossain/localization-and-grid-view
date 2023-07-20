import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myvideos/widget/MyContainer.dart';

import '../../controller/CountryController.dart';
class CountryName extends StatefulWidget {
  const CountryName({Key? key}) : super(key: key);

  @override
  State<CountryName> createState() => _CountryNameState();
}

class _CountryNameState extends State<CountryName> {
  final CountryController countryController = Get.put(CountryController());

  List countries = [];
  bool isSet( int index) {
    if (index >= 0 && index < countries.length) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  List<Widget> _handleGridView(){
    List<Widget> widgets = [];
    double value = countries.length/9;
    int result = value.ceil();
    for(int i=0; i<result;++i){
      widgets.add(_GridView(i*9));
    }
    print(result);
   return widgets;
  }
  Widget _GridView(int start){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          children: [
            isSet(start)? MyContainer(text: countries[start], height: 100, width: width/3.9):SizedBox(),
            SizedBox(width: 20,),
            isSet(start+1)? MyContainer(text: countries[start+1], height: 100, width: width/3.9)
            :SizedBox(),
            SizedBox(width: 20,),
            isSet(start+2)? MyContainer(text: countries[start+2], height: 100, width: width/3.9):SizedBox(),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
             isSet(start+3) ?MyContainer(text: countries[start+3], height: 200, width: width/1.8):SizedBox(),
            SizedBox(width: 20,),
            Column(
              children: [
                 isSet(start+4)? MyContainer(text: countries[start+4], height: 100, width: width/3.9)
                :SizedBox(),
                SizedBox(height: 10,),
                isSet(start+5)?MyContainer(text: countries[start+5], height: 100, width: width/3.9)
                :SizedBox(),
              ],
            )
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            isSet(start+6)? MyContainer(text: countries[start+6], height: 100, width: width/3.9):SizedBox(),
            SizedBox(width: 20,),
            isSet(start+7)? MyContainer(text: countries[start+7], height: 100, width: width/3.9):SizedBox(),
            SizedBox(width: 20,),
            isSet(start+8)? MyContainer(text: countries[start+8], height: 100, width: width/3.9):SizedBox(),
          ],
        ),
        SizedBox(height: 20,),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
   double width = MediaQuery.of(context).size.width;
   double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 40,horizontal: 20),
            child: SingleChildScrollView(
              child:Obx(() {
                // Access the observed value here
                countries = countryController.countries.value;
                return Column(
                  children:
                  _handleGridView()
                  ,
                ); // Display the value
              }),

            ),
      ),
    );
  }
}
