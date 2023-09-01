import 'package:flutter/material.dart';
import 'package:flutter_application_1/consumirAPIS/consumirAlerta/alertaGET.dart';
import 'package:flutter_application_1/consumirAPIS/consumirAlerta/alertaPOST.dart';
import 'package:flutter_application_1/consumirAPIS/consumirAlerta/alertaPUT.dart';

// import 'package:flutter_application_1/salud/rutinasEjercicioSalud.dart';


class MenuAlertas extends StatefulWidget {
  const MenuAlertas({super.key});

  @override
  State<MenuAlertas> createState() => _MenuAlertasState();
}

class _MenuAlertasState extends State<MenuAlertas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:const Text("ALERTAS" , style: TextStyle(color: Color.fromARGB(255, 240, 244, 245) , fontSize: 25), ),
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
                  builder: (context) => const AlertaApi() ));
              },
            ),
            const SizedBox(height: 20,),
            ListTile(
              title: const Text('Insertar'),
              leading: const Icon(Icons.arrow_right, color: Color.fromARGB(255, 213, 228, 9)),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(
                  builder: (context) => const AlertaPost() ));
            },
            ),
            const SizedBox(height: 20,),
            ListTile(
              title: const Text('Modificar'),
              leading: const Icon(Icons.arrow_right, color: Color.fromARGB(255, 213, 228, 9)),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(
                  builder: (context) => const AlertaPut() ));
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
    