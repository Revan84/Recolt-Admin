import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_api/home.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_api/country/model/country.dart';
import 'package:flutter_api/country/services/delete_country.dart';

import '../../customisation/textfield.dart';

class GetCountry extends StatefulWidget {
  final int? uuid;
  const GetCountry({ Key? key,this.uuid});

  @override
  _GetCountryState createState() => _GetCountryState();
}
  TextEditingController nameController = TextEditingController(text: country.name);
  TextEditingController codeController = TextEditingController(text: country.code);
  TextEditingController timezoneController = TextEditingController(text: country.timezone);
  TextEditingController uuidController = TextEditingController(text: country.uuid);

  Country country = Country('', '', '', '');
class _GetCountryState extends State<GetCountry> {
  List<Country> country = [];
  Future<List<Country>> getAll() async {
    var response = await http.get(Uri.parse("http://localhost:8092/api/countries"));
  
    if(response.statusCode==200){
      country.clear();
    }
    var decodedData = jsonDecode(response.body);

    for (var u in decodedData) {
      country.add(Country(u['name'], u['code'], u['timezone'], u['uuid']));
    }
    return country;
  }
  void save(
    {String? name, String? code, String? timezone, String? uuid, url}) async {
    // var jsonResponse = null;
    const String url = 'http://localhost:8092/api/countries';
    await http.post(Uri.parse(url)
    ,headers:<String, String> {
      'Content-Type': 'application/json; charset=UTF-8',
    },body: jsonEncode(<String,String?> {  
      'name': name,
      'code': code,
      'timezone': timezone,
      }),
    );
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => const GetCountry()), (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    getAll();
    
    return Scaffold(
      
        appBar: AppBar(
          title: const Text('Affichage Country'),
          automaticallyImplyLeading: true,
          elevation: 0.0,
          backgroundColor: Colors.indigo[700],
          leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed:() => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen())),
          ), 
        ),

        body: 
        Column(children: [
          Expanded(child:  
        FutureBuilder(
            future: getAll(),
            builder: (context, AsyncSnapshot<List<Country>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, index) => 
                  InkWell(
                    child: ListTile(
                      title: Text(snapshot.data![index].name),
                      subtitle: Text(snapshot.data![index].code),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>DeleteCountry(country: snapshot.data![index],)));
                      },
                    ),
                    
                  ),
                  
                );
              }
            ),
          ),
            Container(
              color:Colors.indigo,
              width: 400,
              height: 220,
              child:
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
               Container(
                 width: 300,
                 height: 50,
                 decoration: const BoxDecoration(boxShadow: [
                        ]),
                 child: Textfield(
                   controller:nameController ,
                   onChanged: (val){
                     nameController.text = val;
                   },
                   hintText: 'Name',
                 )
                 ),
                 
                 Container(
                     width: 300,
                     height: 50,
                 decoration: const BoxDecoration(boxShadow: [
                        ]),
                 child: Textfield(
                   controller: codeController,
                   onChanged: (val) {
                     codeController.text = val;
                   },
                   hintText: 'Code',
                 )
                 ),
                   Container(
                     width: 300,
                     height: 50,
                 decoration: const BoxDecoration(boxShadow: [
                        ]),
                 child: Textfield(
                   hintText: 'Timezone',
                   onChanged: (val){
                     timezoneController.text = val;
                   },
                   controller: timezoneController,
                 )
                 ),
            SizedBox(
                  width: 100,
                  height: 50,
                  child: TextButton(
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: () {
                        save(
                            name: nameController.text,
                            code: codeController.text,
                            timezone: timezoneController.text,
                            uuid: uuidController.text);
                      },
                      child: const Text('Enregistrer',
                      style: TextStyle(color: Colors.indigo),)),
                )
              ]
            ),
            )
        ]
        ),
        
    );
         
            
  }
}
