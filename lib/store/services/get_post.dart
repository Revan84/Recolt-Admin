import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_api/home.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_api/store/model/store.dart';
import 'package:flutter_api/store/services/delete_store.dart';

import '../../customisation/textfield.dart';

class GetStore extends StatefulWidget {
  final int? uuid;
  const GetStore({ Key? key,this.uuid});

  @override
  _GetStoreState createState() => _GetStoreState();
}
    TextEditingController idController = TextEditingController(text: store.id);
    TextEditingController media_idController = TextEditingController(text: store.media_id);
    TextEditingController activity_idController = TextEditingController(text: store.activity_id);
    TextEditingController siretController = TextEditingController(text: store.siret);
    TextEditingController nameController = TextEditingController(text: store.name);
    TextEditingController phoneController = TextEditingController(text: store.phone);
    TextEditingController descriptionController = TextEditingController(text: store.description);
    TextEditingController uuidController = TextEditingController(text: store.uuid);
    TextEditingController created_atController = TextEditingController(text: store.created_at);
    TextEditingController updated_atController = TextEditingController(text: store.updated_at);
    TextEditingController deleted_atController = TextEditingController(text: store.deleted_at);


  Store store = Store('', '', '', '','','','','','','','');
class _GetStoreState extends State<GetStore> {
  List<Store> store = [];
  Future<List<Store>> getAll() async {
    var response = await http.get(Uri.parse("http://localhost:8092/api/stores"));
  
    if(response.statusCode==200){
      store.clear();
    }
    var decodedData = jsonDecode(response.body);

    for (var u in decodedData) {
      store.add(Store(u['id'], u['media_id'], u['activity_id'], u['siret'],
       u['name'], u['phone'], u['description'], u['uuid'], u['created_at'], u['updated_at'],
        u['deleted_at']));
    }
    return store;
  }
  void save(
    {String? id, String? media_id, String? activity_id, 
    String? siret, String? name, String? phone, String? description,
    String? uuid, String? created_at, String? updated_at, String? deleted_at, url}) async {
    // var jsonResponse = null;
    const String url = 'http://localhost:8092/api/countries';
    await http.post(Uri.parse(url)
    ,headers:<String, String> {
      'Content-Type': 'application/json; charset=UTF-8',
    },body: jsonEncode(<String,String?> {  
          'id': id,
          'media_id': media_id,
          'activity_id': activity_id,
          'siret': siret,
          'name': name,
          'phone': phone,
          'description': description,
          'uuid': uuid,
          'created_at': created_at,
          'updated_at': updated_at,
          'deleted_at': deleted_at,
      }),
    );
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => const GetStore()), (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    getAll();
    
    return Scaffold(
      
        appBar: AppBar(
          title: const Text('Affichage Store'),
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
            builder: (context, AsyncSnapshot<List<Store>> snapshot) {
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
                      title: Text(snapshot.data![index].id),
                      subtitle: Text(snapshot.data![index].media_id),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>DeleteStore(store: snapshot.data![index],)));
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
                   controller:idController ,
                   onChanged: (val){
                     idController.text = val;
                   },
                   hintText: 'Id',
                 )
                 ),
                 
                 Container(
                     width: 300,
                     height: 50,
                 decoration: const BoxDecoration(boxShadow: [
                        ]),
                 child: Textfield(
                   controller: media_idController,
                   onChanged: (val) {
                     media_idController.text = val;
                   },
                   hintText: 'media_id',
                 )
                 ),
                   Container(
                     width: 300,
                     height: 50,
                 decoration: const BoxDecoration(boxShadow: [
                        ]),
                 child: Textfield(
                   hintText: 'activity_id',
                   onChanged: (val){
                     activity_idController.text = val;
                   },
                   controller: activity_idController,
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
                            id: idController.text,
                            media_id: media_idController.text,
                            activity_id: activity_idController.text,
                            siret: siretController.text);
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
