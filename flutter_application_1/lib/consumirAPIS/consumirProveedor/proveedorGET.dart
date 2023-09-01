import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/consumirAPIS/consumirProveedor/proveedorGETModel.dart';
import 'package:http/http.dart' as http;

class ProveedorApi extends StatefulWidget {
  const ProveedorApi({Key? key}) : super(key: key);

  @override
  State<ProveedorApi> createState() => _ProveedorApiState();
}

class _ProveedorApiState extends State<ProveedorApi> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  ProveedorModel? dataFromAPI;
  _getData() async {
    try {
      String url = "https://project-valisoft-2559218.onrender.com/api/proveedores";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFromAPI = ProveedorModel.fromJson(json.decode(res.body));
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
                      
                      Text(dataFromAPI!.proveedors[index].nombre.toString()),
                      Text(dataFromAPI!.proveedors[index].nit.toString()),
                      Text(dataFromAPI!.proveedors[index].email.toString()),
                      Text(dataFromAPI!.proveedors[index].telefono.toString()),                     
                      Text(dataFromAPI!.proveedors[index].estado.toString()),
                      Text(dataFromAPI!.proveedors[index].categoria.toString()),
                    ],
                  ),
                );
              },
              itemCount: dataFromAPI!.proveedors.length,
            ),
    
      );
    
  }
}