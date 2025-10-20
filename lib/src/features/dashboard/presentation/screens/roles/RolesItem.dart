import 'package:flutter/material.dart';
import 'package:myfirstlove/src/domain/models/Role.dart';

class RolesItem extends StatelessWidget {
  final Role role;
  
  const RolesItem(this.role, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // La lógica de navegación no cambia, sigue siendo correcta.
        Navigator.pushNamedAndRemoveUntil(context, role.route, (route) => false);
      },
      child: Card(
        elevation: 4.0, // Añade una sombra sutil para darle profundidad.
        margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0), // Espaciado entre cards.
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Bordes redondeados.
        ),
        child: Container(
          padding: const EdgeInsets.all(24.0), // Espaciado interno.
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Nombre del Rol
              Text(
                role.name,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Icono para indicar que es clickeable
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}