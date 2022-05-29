
import 'package:flutter/material.dart';
import 'package:flutter_api/country/services/put_country.dart';
import 'package:flutter_api/country/services/get_post.dart';
import 'package:flutter_api/country/model/country.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_api/customisation/palette.dart'; 

class DeleteCountry extends StatefulWidget {
  final  Country? country;
  const DeleteCountry({ Key? key, this.country}) ;
  

  @override
  _DeleteCountryState createState() => _DeleteCountryState();
}
 
class _DeleteCountryState extends State<DeleteCountry> {
  @override
  Widget build(BuildContext context) {
    void deleteCountry() async{
      await http.delete(Uri.parse("http://localhost:8092/api/countries/${widget.country!.uuid}"));
       Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => const GetCountry()),
          (Route<dynamic> route) => false);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails'),
        elevation: 0.0,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 18,vertical:32),
          child: Column(
            children: [
              Container(
                height:50,
                width: MediaQuery.of(context).size.width,
                color: Colors.indigo,
                child: const Center(child: Text('Fiche',style: TextStyle(color: Color(0xffFFFFFF)),)),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Text(widget.country!.name),
                      const SizedBox(height: 10,),
                      Text(widget.country!.code),
                      const SizedBox(height: 10,),
                      Text(widget.country!.timezone),
                      
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
                         Navigator.push(context, MaterialPageRoute(builder: (_)=>PutCountry(country: widget.country,)));
                     
                    }, child:const Text('Edit'),
                  ),
                  TextButton(
                    onPressed:(){
                      deleteCountry();

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