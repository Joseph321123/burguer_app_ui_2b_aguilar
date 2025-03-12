import 'package:burguer_app_ui_2b_aguilar/pages/onboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Este widget es la raíz de tu aplicación.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Este es el tema de tu aplicación.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const OnBoardPage(), // Página de introducción
      // Si deseas cambiar la página inicial, puedes descomentar esta línea.
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // Este llamado a setState le dice al framework de Flutter que algo ha cambiado
      // en este estado, lo que hace que se ejecute nuevamente el método build.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Este método se vuelve a ejecutar cada vez que se llama a setState,
    // como sucede en el método _incrementCounter.
    return Scaffold(
      appBar: AppBar(
        // Aquí tomamos el valor del objeto MyHomePage que fue creado por
        // el método App.build y lo usamos para establecer el título de la appBar.
        title: Text(widget.title),
      ),
      body: Center(
        // Center es un widget de diseño. Toma un solo hijo y lo posiciona
        // en el centro del padre.
        child: Column(
          // Column es también un widget de diseño. Toma una lista de hijos y
          // los organiza verticalmente. Por defecto, se ajusta horizontalmente
          // a sus hijos, y trata de ser tan alto como su padre.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // Esta coma final facilita la correcta autoformateo en métodos build.
    );
  }
}

