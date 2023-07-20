import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class LocalizationView extends StatefulWidget {
  const LocalizationView({Key? key}) : super(key: key);

  @override
  State<LocalizationView> createState() => _LocalizationViewState();
}

class _LocalizationViewState extends State<LocalizationView> {
  late Map<String, dynamic> localization;
  String _initialLang = 'English';
  bool isComplete = false;
  @override
  void initState() {
    // TODO: implement initState
    loadJsonFile(_initialLang);
    super.initState();
  }

  Future<void> loadJsonFile(initialLang) async {
    String jsonString = await rootBundle.loadString('assets/$initialLang.json');
    Map<String, dynamic> data = jsonDecode(jsonString);
    setState(() {
      localization = data;
      _initialLang = initialLang;
    });
    print(data);

    setState(() {
      isComplete = true;
    });
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: !isComplete?Center(child: CircularProgressIndicator(),): Column(
        children: [
          SizedBox(height: 50,),
          DropdownButton<String>(
            icon: Icon(Icons.add),
            value: _initialLang,
            items: ['English', 'Arabic'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value)async{
              loadJsonFile(value);
              print('Selected language: $value');
            },
          ),
          ListTile(
            title: Text("${localization['nameText']} : ${localization['name']}",textDirection: _initialLang=="Arabic"? TextDirection.rtl:TextDirection.ltr,),
            subtitle: Text("${localization['phoneText']} : ${localization['phone']}",textDirection: _initialLang=="Arabic"? TextDirection.rtl:TextDirection.ltr,),
          ),

        ],
      ),
    );

  }
}
