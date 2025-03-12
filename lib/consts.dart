// Importa la librería de animaciones de Flutter, que permite crear animaciones fluidas en la aplicación.
import 'package:flutter/animation.dart';

// Importa la librería principal de Flutter, que proporciona todos los widgets y componentes visuales para crear la UI.
import 'package:flutter/material.dart';

// Importa la librería de Google Fonts, que permite usar fuentes personalizadas en la aplicación.
import 'package:google_fonts/google_fonts.dart';

// Definición de colores personalizados utilizando valores hexadecimales. Estos colores se utilizarán a lo largo de la aplicación.

// Color blanco con opacidad total (100%).
const white = Color(0xFFffffff);

// Color negro con opacidad total (100%).
const black = Color(0xFF000000);

// Color transparente, sin color (opacidad 0%).
const transparent = Color(0x00000000);

// Color naranja suave, definido por el código hexadecimal.
const orange = Color(0xFFfdc55e);

// Color gris claro, útil para fondos o bordes suaves.
const grey = Color(0xFFdadbdb);

// Color rojo brillante, se puede usar para resaltar elementos importantes.
const red = Color(0xFFf54748);

// Color amarillo fuerte, ideal para destacar elementos llamativos.
const yellow = Color(0xFFf6d134);

// Definición de una fuente personalizada usando Google Fonts.
// En este caso, se utiliza la fuente "Poppins", con color negro y un espaciado entre letras de 1.2 píxeles.
final poppins = GoogleFonts.poppins(
  color: black,        // El color del texto será negro (definido anteriormente).
  letterSpacing: 1.2,   // Se agrega un espaciado de 1.2 píxeles entre las letras del texto.
);

