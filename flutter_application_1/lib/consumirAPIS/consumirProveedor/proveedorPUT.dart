import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//https://frontendhbs.onrender.com/
Future<Proveed> createProveedor(String nombreProveedor, String nit, String emailProv, String telefonoProv, String categoriaProv, String estadoProv ) async {
  final response = await http.put(
    Uri.parse('https://project-valisoft-2559218.onrender.com/api/proveedores'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "nombreProveedor": nombreProveedor,
        "nit": nit,
        "emailProv": emailProv,
        "telefonoProv": telefonoProv,
        "categoriaProv": categoriaProv,
        "estadoProv": estadoProv,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Proveed.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception(response.body);
  }
}

class Proveed {
  final  String id;
  final  String nombreProveedor;
  final  int nit;
  final  String emailProv;
  final  int telefonoProv;
  final  String categoriaProv;
  final  bool estadoProv;

  const Proveed({required this.id, required this.nombreProveedor, required this.nit, required this.emailProv, required this.telefonoProv, required this.categoriaProv, required this.estadoProv});

  factory Proveed.fromJson(Map<String, dynamic> json) {
    return Proveed(
      id: json["_id"],
        nombreProveedor: json["nombreProveedor"],
        nit: json["nit"],
        emailProv: json["emailProv"],
        telefonoProv: json["telefonoProv"],
        categoriaProv: json["categoriaProv"],
        estadoProv: json["estadoProv"],
    );
  }
}


class ProveedorPut extends StatefulWidget {
  const ProveedorPut({super.key});

  @override
  State<ProveedorPut> createState() {
    return _ProveedorPutState();
  }
}


class _ProveedorPutState extends State<ProveedorPut> {
  final TextEditingController _nombreProveedor = TextEditingController();
  final TextEditingController _nit = TextEditingController();
  final TextEditingController _emailProv = TextEditingController();
  final TextEditingController _telefonoProv = TextEditingController();
  final TextEditingController _categoriaProv = TextEditingController();
  final TextEditingController _estadoProv = TextEditingController();
  Future<Proveed>? _futureProveed;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modificar Proveedores',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Modificar'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: (_futureProveed == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _nombreProveedor,
          decoration: const InputDecoration(hintText: 'Digite Nombre'),
        ),
        TextField(
          controller: _nit,
          decoration: const InputDecoration(hintText: 'Digite Nit'),
        ),
         TextField(
          controller: _emailProv,
          decoration: const InputDecoration(hintText: 'Digite Email'),
        ),
        TextField(
          controller: _telefonoProv,
          decoration: const InputDecoration(hintText: 'Digite Teléfono'),
        ),
        TextField(
          controller: _categoriaProv,
          decoration: const InputDecoration(hintText: 'Digite Categoría'),
        ),
          TextField(
          controller: _estadoProv,
          decoration: const InputDecoration(hintText: 'Digite Estado'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureProveed = createProveedor(_nombreProveedor.text, _nit.text, _emailProv.text, _telefonoProv.text, _categoriaProv.text, _estadoProv.text);
            });
            const SizedBox(height: 40,);
          },
          child: const Text('Actualizar'),
        ),
      ],
    );
  }

  FutureBuilder<Proveed> buildFutureBuilder() {
    return FutureBuilder<Proveed>(
      future: _futureProveed,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.nombreProveedor);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}