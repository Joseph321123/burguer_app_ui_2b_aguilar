  // Definición de la clase 'ProductModel', que representa un producto en el menú de la aplicación (por ejemplo, una hamburguesa).
  class ProductModel {
    // Atributos de la clase 'ProductModel'. Cada producto tiene una imagen para la tarjeta, una imagen de detalle, nombre, descripción, precio, calificación y un objeto 'Special'.
    String imageCard, imageDetail, name, description;
    double price, rate;  // El precio y la calificación (rating) del producto son de tipo 'double'.
    Special special;  // El producto tiene un atributo 'special' de tipo 'Special', que representa una oferta o característica especial.
    String category;  // Nueva propiedad para la categoría

    // Constructor de la clase 'ProductModel'. Todos los parámetros son obligatorios, por lo tanto se usa 'required' para asegurarse de que se pasen al crear un producto.
    ProductModel({
      required this.imageCard,  // La imagen que se muestra en la tarjeta del producto.
      required this.imageDetail,  // La imagen que se muestra en la vista de detalle del producto.
      required this.name,  // El nombre del producto.
      required this.price,  // El precio del producto.
      required this.rate,  // La calificación del producto (por ejemplo, de 1 a 5 estrellas).
      required this.description,  // Una descripción detallada del producto.
      required this.special,  // Un objeto 'Special' que contiene detalles sobre una oferta o característica especial.
      required this.category,  // Agregar esta propiedad al constructor
    });
  }

  // Definición de la clase 'Special', que representa una oferta o una característica especial de un producto.
  class Special {
    final String name, image;  // Cada especial tiene un nombre y una imagen asociada.

    // Constructor de la clase 'Special'. Los parámetros son obligatorios, así que se usan 'required'.
    Special({required this.name, required this.image});
  }

// Lista de productos disponibles en el menú. Cada elemento de la lista es un objeto 'ProductModel'.
List<ProductModel> products = [
  // Primer producto: una hamburguesa llamada 'Beef Burger'.
  ProductModel(
    imageCard: 'burger/beef burger.png',  // Imagen para mostrar en la tarjeta del producto.
    imageDetail: 'burger/beef burger_.png',  // Imagen para mostrar en la vista de detalle del producto.
    name: 'Beef Burger',  // Nombre del producto.
    price: 6.59,  // Precio del producto.
    rate: 4.8,  // Calificación del producto (por ejemplo, 4.8 estrellas).
    special: Special(name: 'Cheesy Mozarella', image: 'cheese.png'),  // Un objeto 'Special' que indica una oferta especial (en este caso, 'Cheesy Mozarella').
    description: desc,  // Descripción del producto, que se refiere a la variable 'desc' definida más abajo.
    category: 'Burger',  // Asignamos la categoría 'Burger'
  ),
  // Segundo producto: una hamburguesa llamada 'Double Burger'.
  ProductModel(
    imageCard: 'burger/double burger.png',  // Imagen para mostrar en la tarjeta del producto.
    imageDetail: 'burger/double burger_.png',  // Imagen para mostrar en la vista de detalle del producto.
    name: 'Double Burger',  // Nombre del producto.
    price: 7.49,  // Precio del producto.
    rate: 4.8,  // Calificación del producto (por ejemplo, 4.8 estrellas).
    special: Special(name: 'Double Beef', image: 'beef.png'),  // Un objeto 'Special' que indica una oferta especial (en este caso, 'Double Beef').
    description: desc,  // Descripción del producto, que se refiere a la variable 'desc'.
    category: 'Burger',  // Asignamos la categoría 'Burger'
  ),

  // Productos de Pizza
  ProductModel(
    imageCard: 'pizza/margherita_pizza.png',
    imageDetail: 'pizza/margherita_pizza.png',
    name: 'Margherita Pizza',
    price: 8.99,
    rate: 4.5,
    special: Special(name: 'Fresh Basil', image: 'cheese.png'),
    description: "Classic pizza with tomato sauce, mozzarella cheese, and fresh basil leaves.",
    category: 'Pizza',  // Asignamos la categoría 'Pizza'
  ),
  ProductModel(
    imageCard: 'pizza/hawaiian_pizza.png',
    imageDetail: 'pizza/hawaiian_pizza.png',
    name: 'Pepperoni Pizza',
    price: 9.49,
    rate: 4.7,
    special: Special(name: 'Extra Cheese', image: 'beef.png'),
    description: "A delicious pizza topped with spicy pepperoni and extra cheese.",
    category: 'Pizza',  // Asignamos la categoría 'Pizza'
  ),

  // Productos de Cup Cake
  ProductModel(
    imageCard: 'cupcake/cupcake_rosa_negro.png',
    imageDetail: 'cupcake/cupcake_rosa_negro.png',
    name: 'Chocolate Cupcake',
    price: 3.99,
    rate: 4.9,
    special: Special(name: 'Rich Chocolate', image: 'cheese.png'),
    description: "A soft and moist chocolate cupcake topped with creamy chocolate frosting.",
    category: 'Cup Cake',  // Asignamos la categoría 'Cup Cake'
  ),
  ProductModel(
    imageCard: 'cupcake/cupcake_rosa.png',
    imageDetail: 'cupcake/cupcake_rosa.png',
    name: 'Vanilla Cupcake',
    price: 3.49,
    rate: 4.6,
    special: Special(name: 'Vanilla Cream', image: 'beef.png'),
    description: "A fluffy vanilla cupcake topped with a sweet vanilla cream frosting.",
    category: 'Cup Cake',  // Asignamos la categoría 'Cup Cake'
  ),
];

// Descripción general de las hamburguesas. Esta variable contiene una descripción larga que será utilizada por los productos para dar más contexto al usuario.
var desc =
    "This burger are often served with cheese, lettuce, tomato, onion,"
    "pickles, bacon, or chilis; condiments such as ketchup, mustard, "
    "mayonnaise, relish, or a 'special sauce', often a variation of "
    "Thousand Island dressing; and are frequently placed on sesame seed"
    "buns.";