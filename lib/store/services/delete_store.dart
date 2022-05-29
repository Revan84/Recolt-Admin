
import 'package:flutter/material.dart';

import 'package:flutter_api/store/model/store.dart';
import 'package:flutter_api/store/services/get_post.dart';
import 'package:flutter_api/store/services/put_store.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_api/customisation/palette.dart'; 

class DeleteStore extends StatefulWidget {
  final  Store? store;
  const DeleteStore({ Key? key, this.store});
  

  @override
  _DeleteStoreState createState() => _DeleteStoreState();
}
 
class _DeleteStoreState extends State<DeleteStore> {
  @override
  Widget build(BuildContext context) {
    void deleteStore() async{
      await http.delete(Uri.parse("http://localhost:8092/api/stores/${widget.store!.uuid}"));
       Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => const GetStore()),
          (Route<dynamic> route) => false);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails'),
        elevation: 0.0,
        backgroundColor: Palette.kToDark,
      ),
      body: Center(
        child: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 18,vertical:32),
          child: Column(
            children: [
              Container(
                height:50,
                width: MediaQuery.of(context).size.width,
                color: Palette.kToDark,
                child: const Center(child: Text('Fiche',style: TextStyle(color: Color(0xffFFFFFF)),)),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Text(widget.store!.name),
                      const SizedBox(height: 10,),
                      Text(widget.store!.phone),
                      const SizedBox(height: 10,),
                      Text(widget.store!.description),
                      
                    ],
                  ),
                ),
                // height: 455 ,
                width:  MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                   color: Color(0xffFFFFFF),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0,1),

                    ),
                  ]
                ),
                
              ),
              Row(
                children:[
                  TextButton(
                    onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (_)=>PutStore(store: widget.store,)));
                     
                    }, child:const Text('Edit'),
                  ),
                  TextButton(
                    onPressed:(){
                      deleteStore();

                    }, child:const Text('Delete'),
                  ),
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}