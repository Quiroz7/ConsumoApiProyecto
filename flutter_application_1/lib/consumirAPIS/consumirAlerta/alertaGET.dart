import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/consumirAPIS/consumirAlerta/alertaGETModel.dart';
import 'package:http/http.dart' as http;

class AlertaApi extends StatefulWidget {
  const AlertaApi({Key? key}) : super(key: key);

  @override
  State<AlertaApi> createState() => _AlertaApiState();
}

class _AlertaApiState extends State<AlertaApi> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  AlertaModel? dataFromAPI;
  _getData() async {
    try {
      String url = "https://project-valisoft-2559218.onrender.com/api/alertas";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFromAPI = AlertaModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("REST API Example"),
      ),
      body: _isLoading
        ? const Center(
            child: CircularProgressIndicator(),  
            )
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      Text(dataFromAPI!.alerts[index].enteRegulatorio.toString()),
                      Text(dataFromAPI!.alerts[index].fechaAlerta.toString()),                     
                      Text(dataFromAPI!.alerts[index].mensajeAlerta.toString()),
                      
                    ],
                  ),
                );
              },
              itemCount: dataFromAPI!.alerts.length,
            ),
            
    
      );
    
  }
}