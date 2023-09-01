import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//https://frontendhbs.onrender.com/
Future<Alert> createAlerta(String enteRegulatorio, String fechaAlerta, String mensajeAlerta  ) async {
  final response = await http.post(
    Uri.parse('https://project-valisoft-2559218.onrender.com/api/alertas'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "enteRegulatorio": enteRegulatorio,
        "fechaAlerta": fechaAlerta,
        "mensajeAlerta": mensajeAlerta,
        
    }),
  );

  if (response.statusCode == 201) {
    
    return Alert.fromJson(jsonDecode(response.body));
  } else {
    
    throw Exception(response.body);
  }
}

class Alert {
  final  String id;
  final  String enteRegulatorio;
  final  String fechaAlerta;
  final  String mensajeAlerta;
  

  const Alert({required this.id, required this.enteRegulatorio, required this.fechaAlerta, required this.mensajeAlerta});

  factory Alert.fromJson(Map<String, dynamic> json) {
    return Alert(
      id: json["_id"],
        enteRegulatorio: json["enteRegulatorio"],
        fechaAlerta: json["fechaAlerta"],
        mensajeAlerta: json["mensajeAlerta"],
        
    );
  }
}


class AlertaPost extends StatefulWidget {
  const AlertaPost({super.key});

  @override
  State<AlertaPost> createState() {
    return _AlertaPostState();
  }
}


class _AlertaPostState extends State<AlertaPost> {
  final TextEditingController _enteRegulatorio = TextEditingController();
  final TextEditingController _fechaAlerta = TextEditingController();
  final TextEditingController _mensajeAlerta = TextEditingController();
  
  Future<Alert>? _futureAlert;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crear Alertas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Crear'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: (_futureAlert == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _enteRegulatorio,
          decoration: const InputDecoration(hintText: 'Digite Ente Regulatorio'),
        ),
        TextField(
          controller: _fechaAlerta,
          decoration: const InputDecoration(hintText: 'Digite Fecha'),
        ),
         TextField(
          controller: _mensajeAlerta,
          decoration: const InputDecoration(hintText: 'Digite Mensaje'),
        ),
        
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlert = createAlerta(_enteRegulatorio.text, _fechaAlerta.text, _mensajeAlerta.text);
            });
            const SizedBox(height: 40,);

          },
          child: const Text('Registrar'),
        ),
      ],
    );
  }

  FutureBuilder<Alert> buildFutureBuilder() {
    return FutureBuilder<Alert>(
      future: _futureAlert,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.enteRegulatorio);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}