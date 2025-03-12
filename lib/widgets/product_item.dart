import 'package:burguer_app_ui_2b_aguilar/consts.dart';
import 'package:burguer_app_ui_2b_aguilar/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;

  // Constructor que recibe un ProductModel como parámetro.
  const ProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        // Contenedor principal donde se muestra el producto
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width / 2, // Ocupa la mitad del ancho de la pantalla
          decoration: BoxDecoration(
            color: white, // Color de fondo blanco
            borderRadius: BorderRadius.circular(30), // Bordes redondeados
            boxShadow: [
              BoxShadow(
                color: grey.withValues(alpha: 0.5), // Sombra de color gris con opacidad
                spreadRadius: 5, // Difusión de la sombra
                blurRadius: 5, // Difuminado de la sombra
                offset: const Offset(2, 5), // Dirección de la sombra
              ),
            ],
          ),
        ),
        // Contenedor interior donde se muestra la imagen y los detalles del producto
        Container(
          width: MediaQuery.of(context).size.width / 2,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Hero widget para animar la transición de la imagen del producto
              Hero(
                tag: product.name, // El tag se utiliza para hacer una animación de transición
                child: Image.asset(
                  'assets/${product.imageCard}', // Ruta de la imagen del producto
                  width: 120,
                  height: 110,
                  fit: BoxFit.fill, // Ajuste de la imagen
                ),
              ),
              const SizedBox(height: 20), // Espaciado entre elementos
              // Nombre del producto
              Text(
                product.name,
                maxLines: 1, // Asegura que el texto no se desborde en más de una línea
                style: poppins.copyWith(
                  color: black, // Color del texto
                  fontSize: 18, // Tamaño de la fuente
                  fontWeight: FontWeight.bold, // Peso de la fuente (negrita)
                ),
              ),
              const SizedBox(height: 12), // Espaciado
              // Información especial del producto, como su tipo o características
              Row(
                mainAxisSize: MainAxisSize.min, // Ajusta el tamaño al contenido
                children: [
                  Text(
                    product.special.name, // Nombre de la característica especial
                    style: poppins.copyWith(
                      letterSpacing: 1.1, // Espaciado entre letras
                      fontSize: 14, // Tamaño de la fuente
                      color: black.withValues(alpha: 0.7), // Color con opacidad
                    ),
                  ),
                  const SizedBox(width: 10), // Espaciado entre los elementos
                  Image.asset(
                    'assets/icon/${product.special.image}', // Icono de la característica especial
                    width: 14, // Ancho del icono
                  ),
                ],
              ),
              const SizedBox(height: 20), // Espaciado
              // Precio del producto
              RichText(
                text: TextSpan(
                  style: poppins.copyWith(fontWeight: FontWeight.bold), // Estilo general del texto
                  children: [
                    TextSpan(
                      text: '\$', // Símbolo del dólar
                      style: poppins.copyWith(color: red, fontSize: 14), // Estilo del símbolo del dólar
                    ),
                    TextSpan(
                      text: '${product.price}', // Precio del producto
                      style: poppins.copyWith(fontSize: 22, color: black), // Estilo del precio
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Contenedor pequeño en la esquina superior derecha que contiene un icono de "fuego"
        Positioned(
          top: 10,
          right: 5,
          child: Container(
            width: 22,
            height: 22,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: grey, // Color de fondo gris
              shape: BoxShape.circle, // Forma circular
            ),
            child: Image.asset('assets/icon/fire.png'), // Imagen del icono "fuego"
          ),
        ),
      ],
    );
  }
}
