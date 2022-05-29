import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Interface Admin RECOLT\'"),
          automaticallyImplyLeading: true
      ),
      body: 
      ListView(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/GetCountry');
                }, child: Text('Country'),
              )
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/GetStore');
                }, child: Text('Store'),
              )
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/GetStore');
                }, child: Text('Test'),
              )
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/GetStore');
                }, child: Text('Test'),
              )
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/GetStore');
                }, child: Text('Test'),
              )
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/GetStore');
                }, child: Text('Test'),
              )
            ),
          ]
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/GetCountry');
                }, child: Text('Test'),
              )
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/GetStore');
                }, child: Text('Test'),
              )
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/GetStore');
                }, child: Text('Test'),
              )
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/GetStore');
                }, child: Text('Test'),
              )
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/GetStore');
                }, child: Text('Test'),
              )
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/GetStore');
                }, child: Text('Test'),
              )
            ),
          ]
        ),
      ]
      ),
    );
  }
}
