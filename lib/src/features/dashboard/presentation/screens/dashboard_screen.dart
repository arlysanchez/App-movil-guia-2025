import 'package:flutter/material.dart';
import 'package:myfirstlove/src/constants/app_colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DashboardScreenState();

}

class _DashboardScreenState extends State<DashboardScreen>{
  int _selectedIndex = 0;
 
 static final List<Widget> _widgetOptions = <Widget>[
  //DashboardHome(),
   Text('Pantalla de inicio'),
  Text('Pantalla de productos'),
  Text('Pantalla de Mis ventas'),
  Text('Pantalla de Mis Ajustes'),
 ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: const Text('Hola Jhan Arly!',
    style: TextStyle(color: AppColors.background)),
    backgroundColor: AppColors.primary,
    iconTheme: const IconThemeData(color: Colors.white),
    actions: [
     Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Chip( 
        avatar: const Icon(Icons.add_shopping_cart,color:AppColors.primary),
        label: const Text('Cart'),
      ),

     )

    ],

    ),
    drawer: Drawer(
    child: ListView(
      children: [
       DrawerHeader(child: Text('Menu Izquierdo')),
       ListTile(title: Text('Mi perfil')),
       ListTile(title: Text('Configuración'))
      ],
    ),

    ),
    body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index){
        setState(() {
          _selectedIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
      BottomNavigationBarItem(icon: Icon(Icons.share), label: 'Productos'),
      BottomNavigationBarItem(icon: Icon(Icons.sell), label: 'Ventas'),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Config'),

      ],
      
      
      ),

    );
  }

}