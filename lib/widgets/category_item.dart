import 'package:burguer_app_ui_2b_aguilar/consts.dart';
import 'package:burguer_app_ui_2b_aguilar/models/categories_model.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  // Constructor que recibe una categoría y un booleano que indica si está seleccionada.
  const CategoryItem({
    super.key,
    required this.category, // La categoría que se va a mostrar
    required this.selected, // Booleano que indica si la categoría está seleccionada
  });

  // Propiedades que definen el objeto CategoryItem
  final Category category;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      // Duración de la animación cuando cambia la apariencia de la categoría (en este caso 200ms)
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.only(left: 16, right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
        // El color cambia dependiendo de si la categoría está seleccionada o no
        color: selected ? red.withValues(alpha: 0.3) : grey.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(30), // Bordes redondeados
        boxShadow: [
          // Si la categoría está seleccionada, se aplica una sombra con color rojo
          selected
              ? const BoxShadow(
                  color: red, // Sombra roja
                  spreadRadius: 2, // Radio de expansión de la sombra
                  blurRadius: 5, // Radio de difuminado de la sombra
                  offset: Offset(2, 3), // Desplazamiento de la sombra
                )
              : const BoxShadow(color: transparent), // Si no está seleccionada, no hay sombra
        ],
      ),
      child: Row(
        children: [
          // Contenedor que contiene la imagen de la categoría
          Container(
            padding: const EdgeInsets.all(8), // Espaciado interno
            decoration: const BoxDecoration(
              color: white, // Fondo blanco para el contenedor de la imagen
              shape: BoxShape.circle, // Forma circular para la imagen
            ),
            child: Image.asset(
              // Cargar la imagen de la categoría desde los assets
              'assets/category/${category.image}',
              width: 18, // Ancho de la imagen
              height: 18, // Alto de la imagen
            ),
          ),
          const SizedBox(width: 16), // Espaciado entre la imagen y el texto
          // Texto que muestra el nombre de la categoría
          Text(
            category.name, // Nombre de la categoría
            style: poppins.copyWith(
              // Estilo de texto: si está seleccionada, el texto es blanco, si no, negro
              color: selected ? white : black,
              fontSize: 16, // Tamaño de la fuente
              fontWeight: FontWeight.bold, // Peso de la fuente (negrita)
            ),
          ),
        ],
      ),
    );
  }
}


