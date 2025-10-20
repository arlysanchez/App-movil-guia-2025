import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfirstlove/src/domain/models/Role.dart';
import 'package:myfirstlove/src/features/dashboard/presentation/screens/roles/RolesItem.dart';
import 'package:myfirstlove/src/features/dashboard/presentation/screens/roles/bloc/RolesBloc.dart';
import 'package:myfirstlove/src/features/dashboard/presentation/screens/roles/bloc/RolesEvent.dart';
import 'package:myfirstlove/src/features/dashboard/presentation/screens/roles/bloc/RolesState.dart';
import 'package:myfirstlove/src/routing/app_router.dart';

class RolesPage extends StatefulWidget {
  const RolesPage({super.key});

  @override
  State<RolesPage> createState() => _RolesPageState();
}

class _RolesPageState extends State<RolesPage> {
 @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RolesBloc>().add(const GetRolesList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<RolesBloc, RolesState>(builder: (context, state) {
      // Verifica si los roles están cargados
      if (state.roles != null) {
        if (state.roles!.length == 1) {
          // Si el usuario tiene solo un rol
          final role = state.roles!.first;
          if (role?.id == 'CLIENT') {
            // Si el único rol es 'CLIENTE', redirigir al HomePage
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context, AppRoutes.homeClient);
            });
            return Container(); // Evita mostrar cualquier UI mientras se redirige
          }
        }
      }
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: ListView(
          shrinkWrap: true,
          children: state.roles != null
              ? (state.roles?.map((Role? role) {
                  return role != null ? RolesItem(role) : Container();
                }).toList()) as List<Widget>
              : [],
        ),
      );
    }));
  }
}