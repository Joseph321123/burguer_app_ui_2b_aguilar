import 'package:burguer_app_ui_2b_aguilar/consts.dart';
import 'package:burguer_app_ui_2b_aguilar/pages/home_page.dart';
import 'package:flutter/material.dart';

// La clase OnBoardPage representa la página de introducción de la aplicación (Onboarding).
class OnBoardPage extends StatefulWidget {
  // Constructor de la clase OnBoardPage, no recibe parámetros.
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

// El estado de la página OnBoardPage, donde se maneja la lógica de la UI.
class _OnBoardPageState extends State<OnBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // El cuerpo de la página usa un Stack para superponer varios widgets.
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          // Fondo de la página con un color y una imagen repetida.
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: orange.withAlpha(150), // Fondo naranja con transparencia.
            child: Image.asset(
              'assets/food pattern.png',
              repeat: ImageRepeat.repeatY, // Imagen de fondo repetida en el eje Y.
              color: orange, // Aplicando el color naranja sobre la imagen.
            ),
          ),
          // Posicionando una imagen en la parte superior de la pantalla.
          Positioned(
            top: 25,
            child: Image.asset(
              'assets/dashboard/chef_holding_vegetables.png',
              width: 260, // La imagen tiene un ancho fijo.
            ),
          ),
          // Posicionando otra imagen en la parte superior derecha.
          Positioned(
            top: 100,
            right: 50,
            child: Image.asset(
              'assets/dashboard/bassil.png',
              width: 80, // Ancho fijo de la imagen.
            ),
          ),
          // Otra imagen ubicada cerca de la parte inferior, a la derecha.
          Positioned(
            top: 300,
            right: 30,
            child: Image.asset(
              'assets/dashboard/chili.png',
              width: 80, // Ancho fijo de la imagen.
            ),
          ),
          // Imagen de setas posicionada cerca de la parte izquierda.
          Positioned(
            top: 200,
            left: -30,
            child: Image.asset(
              'assets/dashboard/mushrooms.png',
              width: 100, // Ancho fijo de la imagen.
            ),
          ),
          // Parte inferior de la pantalla que contiene un contenedor con texto y botones.
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: ClipPath(
              // Usamos un ClipPath para dar un diseño personalizado al contenedor inferior.
              clipper: CustomClip(),
              child: Container(
                color: white, // Fondo blanco para el contenedor inferior.
                padding: const EdgeInsets.only(
                    top: 70, bottom: 65, right: 50, left: 50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Título con texto destacado.
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: poppins.copyWith(
                                fontSize: 32, fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                  text: 'The Fastest In Delivery ',
                                  style: poppins.copyWith(color: black)),
                              TextSpan(
                                  text: 'Food',
                                  style: poppins.copyWith(color: red)),
                            ])),
                    const SizedBox(height: 25),
                    // Descripción debajo del título, centrada.
                    Text(
                      'Our job is to filling yout tummy with delicious food and fast delivery',
                      textAlign: TextAlign.center,
                      style: poppins.copyWith(fontSize: 14, color: black),
                    ),
                    const SizedBox(height: 25),
                    // Indicador de progreso con puntos (simula una barra de progreso).
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...List.generate(
                            3,
                            (index) => Container(
                                  width: index == 0 ? 30 : 10, // El primer punto es más grande.
                                  height: 10,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      color: index == 0 ? orange : grey,
                                      borderRadius: BorderRadius.circular(10)),
                                ))
                      ],
                    ),
                    const SizedBox(height: 30),
                    // Botón para empezar la navegación hacia la página de inicio.
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      color: red, // Color del botón (rojo).
                      height: 66,
                      minWidth: 250,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        'Get Started', // Texto del botón.
                        style: poppins.copyWith(fontSize: 18, color: white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Definimos un custom clipper que crea un contorno personalizado para el contenedor inferior.
class CustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 30); // Empieza el path desde el punto (0, 30).
    path.lineTo(0, size.height); // Traza una línea hasta el final del contenedor.
    path.lineTo(size.width, size.height); // Traza una línea hasta el final del contenedor a la derecha.
    path.lineTo(size.width, 30); // Traza una línea hasta el punto (size.width, 30).
    // Crea una curva cuadrática hacia la mitad de la pantalla.
    path.quadraticBezierTo(size.width / 2, -30, 0, 30); 
    path.close(); // Cierra el path.
    return path;
  }

  // No necesitamos reclipar este path, por lo que devuelve false.
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
