import 'package:burguer_app_ui_2b_aguilar/consts.dart';
import 'package:burguer_app_ui_2b_aguilar/models/categories_model.dart';
import 'package:burguer_app_ui_2b_aguilar/models/product_model.dart';
import 'package:burguer_app_ui_2b_aguilar/pages/detail_page.dart';
import 'package:burguer_app_ui_2b_aguilar/widgets/category_item.dart';
import 'package:burguer_app_ui_2b_aguilar/widgets/product_item.dart';
import 'package:flutter/material.dart';

// HomePage es un StatefulWidget que se usa para mostrar la pantalla principal de la aplicación.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// El estado de HomePage. Aquí se maneja la lógica para cambiar la categoría seleccionada.
class _HomePageState extends State<HomePage> {
  int currentCategory = 0; // Esta variable mantiene el índice de la categoría seleccionada.

// Función para filtrar los productos según la categoría seleccionada
List<ProductModel> getFilteredProducts(int currentCategory) {
  // Obtenemos el nombre de la categoría seleccionada
  String selectedCategory = categories[currentCategory].name;

  // Filtramos los productos que corresponden a la categoría seleccionada
  return products.where((product) => product.category == selectedCategory).toList();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar que se usa como la barra de navegación superior
      appBar: AppBar(
        backgroundColor: transparent, // Color de fondo de la AppBar
        elevation: 0, // Elimina la sombra de la AppBar
        centerTitle: true, // Centra el título en el medio
        leadingWidth: 80, // Ancho de la parte izquierda de la AppBar
        leading: Row(
          children: [
            const SizedBox(width: 35), // Espacio a la izquierda
            // Contenedor con una imagen de un ícono (posiblemente un menú o un icono de "dash")
            Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  color: grey, borderRadius: BorderRadius.circular(10)),
              child: Image.asset('assets/icon/dash.png'),
            ),
          ],
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min, // Hace que el tamaño del Row sea ajustado al contenido
          children: [
            const Icon(
              Icons.location_on_outlined, // Ícono de ubicación
              color: red,
              size: 18,
            ),
            const SizedBox(width: 5), // Espaciado entre íconos
            Text(
              'California, US', // Texto de la ubicación
              style: poppins.copyWith(fontSize: 16, color: black),
            ),
            const SizedBox(width: 5),
            const Icon(
              Icons.keyboard_arrow_down_rounded, // Ícono para desplegar
              color: orange,
              size: 18,
            )
          ],
        ),
        actions: [
          Row(
            children: [
              // Contenedor con una imagen de perfil
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                    color: grey, borderRadius: BorderRadius.circular(10)),
                child: Image.asset('assets/profile.png'),
              ),
              const SizedBox(width: 35), // Espaciado a la derecha
            ],
          ),
        ],
      ),
      // Aquí comienza el cuerpo de la pantalla
      body: SingleChildScrollView( // Se envuelve en un SingleChildScrollView para evitar el desbordamiento
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alineación a la izquierda
          children: [
            const SizedBox(height: 30), // Espacio en la parte superior
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35), // Espaciado horizontal
              child: Container(
                height: 150,
                width: double.infinity, // Ancho completo
                decoration: BoxDecoration(
                    color: orange.withValues(alpha: 150), // Aquí se usa withValues
                    borderRadius: BorderRadius.circular(20)), // Contenedor con fondo de color anaranjado
                padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
                child: Row(
                  children: [
                    Expanded(  // Esto asegura que la columna ocupe todo el espacio disponible
                      child: Column(
                        children: [
                          RichText( // Texto con múltiples estilos
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                  style: poppins.copyWith(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                        text: 'The Fastest In Delivery ',
                                        style: poppins.copyWith(color: black)),
                                    TextSpan(
                                        text: 'Food',
                                        style: poppins.copyWith(color: red)),
                                  ])),
                          const SizedBox(height: 10), // Espacio entre elementos
                          // Contenedor con botón para "Order Now"
                          Container(
                              decoration: BoxDecoration(
                                color: red,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 12),
                              child: Text(
                                'Order Now',
                                style:
                                    poppins.copyWith(color: white, fontSize: 14),
                              ))
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/courier.png', // Imagen de un mensajero/courier
                      width: 140,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 35), // Espaciado entre secciones
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Text(
                'Categories', // Título de la sección de categorías
                style: poppins.copyWith(
                    color: black, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(  // Se envuelve en otro SingleChildScrollView para el desplazamiento horizontal
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Se genera la lista de categorías
                  ...List.generate(
                      categories.length,
                      (index) => Padding(
                            padding: index == 0
                                ? const EdgeInsets.only(left: 35, right: 20)
                                : index == categories.length - 1
                                    ? const EdgeInsets.only(right: 35)
                                    : const EdgeInsets.only(right: 20),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentCategory = index;  // Actualiza la categoría seleccionada
                                });
                              },
                              child: CategoryItem(
                                category: categories[index],  // Widget para mostrar la categoría
                                selected: currentCategory == index, // Indica si la categoría está seleccionada
                              ),
                            ),
                          ))
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espacio entre los elementos
                children: [
                  Text(
                    'Popular Now', // Título de la sección de productos populares
                    style: poppins.copyWith(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        'View All', // Texto "Ver todo" para los productos
                        style: poppins.copyWith(color: orange, fontSize: 14),
                      ),
                      const SizedBox(width: 5),
                      // Icono de flecha para indicar la acción
                      Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: orange,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: white,
                            size: 10,
                          ))
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(  // Desplazamiento horizontal para los productos
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 10),
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  // Se genera la lista de productos filtrados por la categoría seleccionada
                  ...List.generate(
                      getFilteredProducts(currentCategory).length,
                      (index) => Padding(
                            padding: index == 0
                                ? const EdgeInsets.only(left: 35, right: 20)
                                : const EdgeInsets.only(right: 35),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        transitionDuration:
                                            const Duration(seconds: 1),
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            DetailPage(
                                              product: getFilteredProducts(
                                                      currentCategory)[index],  // Detalles del producto filtrado
                                            )));  // Navega a la página de detalles
                              },
                              child: ProductItem(
                                product: getFilteredProducts(currentCategory)[index],  // Producto filtrado
                              ),
                            ),
                          ))
                ],
              ),
            ),
          ],
        ),
      ),
      // Aquí comienza el BottomNavigationBar
      bottomNavigationBar: Container(
        height: 100,
        color: white,
        child: Align(
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(
                Icons.home_filled, // Ícono de inicio
                color: red,
                size: 30,
              ),
              const Icon(
                Icons.favorite_outline_rounded, // Ícono de favoritos
                color: grey,
                size: 30,
              ),
              // Ícono de búsqueda en un contenedor circular
              Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: red,
                      boxShadow: [
                        BoxShadow(
                            color: red.withValues(alpha: 0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3))
                      ]), 
                  child: const Icon(Icons.search, color: white)),
              const Icon(
                Icons.notifications_outlined, // Ícono de notificaciones
                color: grey,
                size: 30,
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  const Icon(
                    Icons.shopping_cart_outlined, // Ícono de carrito de compras
                    color: grey,
                    size: 30,
                  ),
                  Positioned(
                    top: -4,
                    right: 0,
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            color: red, shape: BoxShape.circle),
                        child: Text(
                          '3', // Número de productos en el carrito
                          style: poppins.copyWith(color: white, fontSize: 12),
                        ))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



