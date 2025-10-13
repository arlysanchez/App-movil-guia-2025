import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfirstlove/src/constants/app_colors.dart';
import 'package:myfirstlove/src/features/dashboard/presentation/screens/home/bloc/HomeBloc.dart';
import 'package:myfirstlove/src/features/dashboard/presentation/screens/home/bloc/HomeEvent.dart';
import 'package:myfirstlove/src/features/dashboard/presentation/screens/home/bloc/HomeState.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  late HomeBloc _bloc; 

  List<Widget> _pages = const [
    Text('Pantalla de inicio'),
    Text('Pantalla de productos'),
    Text('Pantalla de Mis ventas'),
    Text('Pantalla de Mis Ajustes'),
  ];

  final Map<int, String> _pageTitles = {
    0: 'Hola Jhan Arly!',
    1: 'Mis Productos',
    2: 'Mis Ventas',
    3: 'Configuración',
  };

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<HomeBloc>(context); // ✅ Safe
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              _pageTitles[state.pageIndex] ?? 'Dashboard',
              style: const TextStyle(color: AppColors.background),
            ),
            backgroundColor: AppColors.primary,
            iconTheme: const IconThemeData(color: Colors.white),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Chip(
                  avatar: const Icon(Icons.add_shopping_cart, color: AppColors.primary),
                  label: const Text('Cart'),
                ),
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: AppColors.primary),
                  child: Text('Menú Izquierdo', style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Inicio'),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    _bloc.add(const ChangeDrawerPage(pageIndex: 0));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.share),
                  title: const Text('Productos'),
                  selected: state.pageIndex == 1,
                  onTap: () {
                    _bloc.add(const ChangeDrawerPage(pageIndex: 1));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.sell),
                  title: const Text('Ventas'),
                  selected: state.pageIndex == 2,
                  onTap: () {
                    _bloc.add(const ChangeDrawerPage(pageIndex: 2));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Configuración'),
                  selected: state.pageIndex == 3,
                  onTap: () {
                    _bloc.add(const ChangeDrawerPage(pageIndex: 3));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Cerrar sesión'),
                  onTap: () {
                    _bloc.add(const Logout());
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                ),
              ],
            ),
          ),
          body: Center(
            child: _pages[state.pageIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.pageIndex,
            onTap: (index) {
              _bloc.add(ChangeDrawerPage(pageIndex: index));
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
              BottomNavigationBarItem(icon: Icon(Icons.share), label: 'Productos'),
              BottomNavigationBarItem(icon: Icon(Icons.sell), label: 'Ventas'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Config'),
            ],
          ),
        );
      },
    );
  }
}
