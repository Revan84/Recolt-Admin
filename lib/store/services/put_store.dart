import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api/customisation/textfield.dart';
import 'package:flutter_api/store/services/get_post.dart';
import 'package:flutter_api/store/model/store.dart';
import 'package:http/http.dart' as http;

class PutStore extends StatefulWidget {
  final Store? store;
  const PutStore({Key? key, this.store});

  @override
  _PutStoreState createState() => _PutStoreState();
}

class _PutStoreState extends State<PutStore> {
  void editStore(
    {String? id, String? media_id, String? activity_id, 
    String? siret, String? name, String? phone, String? description,
    String? uuid, String? created_at, String? updated_at, String? deleted_at}) async {
      await http.put(
        Uri.parse(
          "http://localhost:8092/api/stores/${widget.store!.uuid}",
        ),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
        },
        body: jsonEncode(<String, String?>{
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
        }));
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => const GetStore()),
            (Route<dynamic> route) => false);
    
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController idController = TextEditingController(text: widget.store!.id);
    TextEditingController media_idController = TextEditingController(text: widget.store!.media_id);
    TextEditingController activity_idController = TextEditingController(text: widget.store!.activity_id);
    TextEditingController siretController = TextEditingController(text: widget.store!.siret);
    TextEditingController nameController = TextEditingController(text: widget.store!.name);
    TextEditingController phoneController = TextEditingController(text: widget.store!.phone);
    TextEditingController descriptionController = TextEditingController(text: widget.store!.description);
    TextEditingController uuidController = TextEditingController(text: widget.store!.uuid);
    TextEditingController created_atController = TextEditingController(text: widget.store!.created_at);
    TextEditingController updated_atController = TextEditingController(text: widget.store!.updated_at);
    TextEditingController deleted_atController = TextEditingController(text: widget.store!.deleted_at);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[700],
        elevation: 0.0,
        title: const Text('Edit Store'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, bottom: 100, left: 18, right: 18),
          child: Container(
            height: 550,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.indigo[700],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 300,
                    decoration: const BoxDecoration(boxShadow: [
                      
                    ]),
                    child: Textfield(
                      controller: nameController,
                      onChanged: (val) {
                        nameController.text = val;
                      },
                      hintText: 'Name',
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    width: 300,
                    decoration: const BoxDecoration(boxShadow: []),
                    child: Textfield(
                      controller: phoneController,
                      onChanged: (val) {
                        phoneController.text = val;
                      },
                      hintText: 'Code',
                    )),
                Container(
                    width: 300,
                    decoration: const BoxDecoration(boxShadow: []),
                    child: Textfield(
                      hintText: 'Timezone',
                      controller: descriptionController,
                      onChanged: (val) {
                        descriptionController.text = val;
                      },
                      
                    )),
                SizedBox(
                  width: 100,
                  child: TextButton(
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: () {
                        editStore(
                            name: nameController.text,
                            phone: phoneController.text,
                            description: descriptionController.text,
                            uuid: uuidController.text);
                      },
                      child: const Text('Enregistrer')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
