import 'package:flutter/material.dart';
import 'package:flutter_application_1/consumirAPIS/alertaMENU.dart';
import 'package:flutter_application_1/consumirAPIS/proveedorMENU.dart';


class MenuProyecto extends StatefulWidget {
  const MenuProyecto({super.key});

  @override
  State<MenuProyecto> createState() => _MenuProyectoState();
}

class _MenuProyectoState extends State<MenuProyecto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:const Text("VALICOR" , style: TextStyle(color: Color.fromARGB(255, 240, 244, 245) , fontSize: 25), ),
        ),
        body: ListView(
        children: [
           Card(
            child: ListTile(
              title: Center(
                child: Column(
                  children: [
                    const Text('BIENVENIDO',style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 7, 226, 73)),),
                    const Text('¿Qué deseas hacer?' , style: TextStyle(fontSize: 20, color: Color.fromARGB(178, 7, 226, 73)),),
                    
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
            title: const Text('Ir a Proveedores'),
            leading: const Icon(Icons.arrow_right, color: Color.fromARGB(255, 213, 228, 9)),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(
                  builder: (context) => const MenuProveedores() ));
              },
            ),
            const SizedBox(height: 20,),
            ListTile(
              title: const Text('Ir a Alertas'),
              leading: const Icon(Icons.arrow_right, color: Color.fromARGB(255, 213, 228, 9)),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(
                  builder: (context) => const MenuAlertas() ));
            },
            ),
            const SizedBox(height: 20,),
            
          const Card(
                      child: Icon(Icons.api_sharp, size: 100,),
                    ),
        ],
      ),
    );
  }
}
    