import 'package:flutter/material.dart';
import 'package:flutter_application_1/consumirAPIS/consumirProveedor/proveedorGET.dart';
import 'package:flutter_application_1/consumirAPIS/consumirProveedor/proveedorPOST.dart';
import 'package:flutter_application_1/consumirAPIS/consumirProveedor/proveedorPUT.dart';

// import 'package:flutter_application_1/salud/rutinasEjercicioSalud.dart';


class MenuProveedores extends StatefulWidget {
  const MenuProveedores({super.key});

  @override
  State<MenuProveedores> createState() => _MenuProveedoresState();
}

class _MenuProveedoresState extends State<MenuProveedores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:const Text("PROVEEDORES" , style: TextStyle(color: Color.fromARGB(255, 240, 244, 245) , fontSize: 25), ),
        ),
        body: ListView(
        children: [
           Card(
            child: ListTile(
              title: Center(
                child: Column(
                  children: [
                    const Text('Selecciona una opción',style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 7, 226, 73)),),
                    
                    const SizedBox(height: 30,),
                    
                    Card(
                      child: Image.network('https://th.bing.com/th/id/R.9edcabe9c1ce209dd518ca010ab08797?rik=6MNnauvSfpylrg&pid=ImgRaw&r=0' , width: 150,),
                        ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 40,),
          ListTile(
            title: const Text('Listar'),
            leading: const Icon(Icons.arrow_right, color: Color.fromARGB(255, 213, 228, 9)),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(
                  builder: (context) => const ProveedorApi() ));
              },
            ),
            const SizedBox(height: 20,),
            ListTile(
              title: const Text('Insertar'),
              leading: const Icon(Icons.arrow_right, color: Color.fromARGB(255, 213, 228, 9)),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(
                  builder: (context) => const ProveedorPost() ));
            },
            ),
            const SizedBox(height: 20,),
            ListTile(
              title: const Text('Modificar'),
              leading: const Icon(Icons.arrow_right, color: Color.fromARGB(255, 213, 228, 9)),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(
                  builder: (context) => const ProveedorPut() ));
            },
          ),
          const Card(
                      child: Icon(Icons.api_sharp, size: 100,),
                    ),
        ],
      ),
    );
  }
}
    