// Definición de una clase llamada 'Category'. 
// Esta clase representa una categoría de alimentos o productos con una imagen y un nombre.

class Category {
  // Se definen dos variables de tipo String: 'image' y 'name', que almacenarán la información de cada categoría.
  String image, name;

  // El constructor de la clase 'Category' es obligatorio para inicializar los atributos 'image' y 'name'.
  // 'required' indica que estos atributos deben ser proporcionados cuando se cree una nueva instancia de la clase.
  Category({required this.image, required this.name});
}

// Se crea una lista llamada 'categories', que contiene objetos de la clase 'Category'.
// Cada elemento de la lista representa una categoría con su respectiva imagen y nombre.

List<Category> categories = [
  // Se crea un objeto 'Category' para la categoría 'Burger' con su imagen correspondiente.
  Category(image: 'burger.png', name: 'Burger'),

  // Se crea un objeto 'Category' para la categoría 'Pizza' con su imagen correspondiente.
  Category(image: 'pizza.png', name: 'Pizza'),

  // Se crea un objeto 'Category' para la categoría 'Cup Cake' con su imagen correspondiente.
  Category(image: 'cup cake.png', name: 'Cup Cake'),
];
