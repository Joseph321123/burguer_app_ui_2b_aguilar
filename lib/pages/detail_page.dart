// Importaciones necesarias para el funcionamiento de la página
import 'package:burguer_app_ui_2b_aguilar/consts.dart';
import 'package:burguer_app_ui_2b_aguilar/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

// DetailPage es un StatefulWidget que se muestra cuando el usuario selecciona un producto específico.
class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.product});
  
  // El producto que se pasa como parámetro para mostrar sus detalles en la página.
  final ProductModel product;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

// El estado de DetailPage donde se maneja la cantidad del producto.
class _DetailPageState extends State<DetailPage> {
  int quantity = 1; // Variable que maneja la cantidad de productos seleccionados.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent, // Hace que el fondo sea transparente
        elevation: 0, // Elimina la sombra de la AppBar
        centerTitle: true, // Centra el título en la barra
        leadingWidth: 80, // Define el ancho de la parte izquierda de la AppBar
        leading: Row(
          children: [
            const SizedBox(width: 35), // Espacio vacío a la izquierda
            GestureDetector(
              onTap: () {
                Navigator.pop(context);  // Vuelve a la página anterior
              },
              child: Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: white, // Fondo blanco
                  borderRadius: BorderRadius.circular(10) // Bordes redondeados
                ),
                child: const Icon(
                  Icons.arrow_back_ios_rounded, // Ícono de flecha hacia atrás
                  color: black, // Color de la flecha
                  size: 18,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.more_horiz_rounded, // Ícono para más opciones
                  color: black, // Color del ícono
                  size: 18,
                ),
              ),
              const SizedBox(width: 35), // Espacio vacío a la derecha
            ],
          ),
        ],
      ),
      extendBodyBehindAppBar: true,  // Permite que el cuerpo esté detrás de la AppBar
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,  // Alineación en la parte inferior de la pantalla
        children: [
          // Fondo con un patrón de comida y color naranja
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: orange.withValues(alpha: 150),  // Color de fondo con opacidad
            child: Image.asset(
              'assets/food pattern.png',
              repeat: ImageRepeat.repeatY, // Repite la imagen en el eje Y
              color: orange, // Aplica un filtro de color naranja
            ),
          ),
          // Contenedor blanco que cubre 3/4 de la pantalla, creando una forma redondeada en la parte superior
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: white, // Fondo blanco
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)) // Bordes redondeados en la parte superior
            ),
          ),
          // Aquí empieza el contenido de la página de detalle del producto
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(left: 35, right: 35, bottom: 35),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,  // Desplazamiento vertical
              reverse: true,  // Invierte el desplazamiento
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,  // Alinea el contenido hacia el fondo
                children: [
                  const SizedBox(height: 70),  // Espacio superior
                  Hero(
                    tag: widget.product.name,  // Héroe de animación para la transición entre pantallas
                    child: Image.asset(
                      'assets/${widget.product.imageDetail}',  // Imagen del producto
                      width: 220,
                      height: 310,
                    ),
                  ),
                  const SizedBox(height: 30),  // Espacio entre la imagen y el siguiente contenido
                  // Contenedor para seleccionar la cantidad del producto
                  Container(
                    height: 50,
                    width: 110,
                    decoration: BoxDecoration(
                        color: red, // Fondo rojo
                        borderRadius: BorderRadius.circular(30) // Bordes redondeados
                    ),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (quantity > 1) {
                                  quantity--;  // Disminuye la cantidad
                                }
                              });
                            },
                            child: const Icon(Icons.remove, color: white),  // Ícono de "menos"
                          ),
                          const SizedBox(width: 15),
                          Text(
                            quantity.toString(),  // Muestra la cantidad actual
                            style: poppins.copyWith(color: white, fontSize: 18),
                          ),
                          const SizedBox(width: 15),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                quantity++;  // Aumenta la cantidad
                              });
                            },
                            child: const Icon(Icons.add, color: white),  // Ícono de "más"
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),  // Espacio entre los botones y la siguiente sección
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Distribuye los elementos entre los extremos
                    children: [
                      // Información del producto (nombre y especialidad)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name,  // Nombre del producto
                            style: poppins.copyWith(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                widget.product.special.name,  // Nombre de la especialidad del producto
                                style: poppins.copyWith(
                                    letterSpacing: 1.1,
                                    fontSize: 14,
                                    color: black.withValues(alpha: 0.7)),  // Aquí se actualizó
                              ),
                              const SizedBox(width: 10),
                              Image.asset(
                                'assets/icon/${widget.product.special.image}',  // Imagen de la especialidad
                                width: 14,
                              )
                            ],
                          ),
                        ],
                      ),
                      // Precio del producto con formato de moneda
                      RichText(
                        text: TextSpan(
                          style: poppins.copyWith(fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: '\$',  // Símbolo de dólar
                                style: poppins.copyWith(color: red, fontSize: 14)),
                            TextSpan(
                                text: '${widget.product.price}',  // Precio del producto
                                style: poppins.copyWith(
                                    fontSize: 30, color: black)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),  // Espacio entre la sección de precio y los detalles nutricionales
                  // Información nutricional (calorías, valoraciones, tiempo de preparación)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icon/star.png', width: 22),
                          const SizedBox(width: 10),
                          Text(
                            widget.product.rate.toString(),  // Valoración del producto
                            style: poppins.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/icon/fire.png', width: 22),
                          const SizedBox(width: 10),
                          Text(
                            '150 Kcal',  // Información de calorías
                            style: poppins.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/icon/time.png', width: 22),
                          const SizedBox(width: 10),
                          Text(
                            '5-10 Min',  // Tiempo de preparación
                            style: poppins.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: black),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),  // Espacio entre los detalles nutricionales y la descripción
                  // Descripción del producto con capacidad de leer más
                  ReadMoreText(
                    widget.product.description,  // Descripción completa del producto
                    style: poppins.copyWith(
                        fontSize: 14, color: black, height: 1.5),
                    trimMode: TrimMode.Length,  // Recorta la descripción
                    trimLength: 100,  // Longitud máxima antes de recortar
                    trimLines: 3,  // Líneas máximas antes de recortar
                    trimCollapsedText: 'Read More',  // Texto que se muestra cuando se corta
                    trimExpandedText: 'Read Less',  // Texto que se muestra cuando se expande
                    colorClickableText: red,  // Color del texto clickeable
                    moreStyle: poppins.copyWith(
                        fontWeight: FontWeight.bold, color: red),
                  ),
                  const SizedBox(height: 40),  // Espacio antes del botón
                  // Botón para añadir al carrito
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),  // Bordes redondeados
                    ),
                    height: 66,
                    onPressed: () {},  // Acción al presionar el botón
                    color: red,  // Fondo rojo
                    child: Center(
                      child: Text(
                        'Add to Cart',  // Texto del botón
                        style: poppins.copyWith(
                            color: white, fontSize: 18, letterSpacing: 1.3),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


