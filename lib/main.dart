import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de pessoas',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Contador de pessoas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _msg = "";
  final int _maxcap = 5;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter >= _maxcap) {
        _msg = "Restaurante lotado!";
        _counter = _maxcap;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      if (_counter < _maxcap) _msg = "";
      if (_counter < 0) _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "imagens/restaurante.jpg",
              height: 200,
            ),
            const Text('Quantidade de pessoas no restaurante:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                )),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              _msg,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Text('Incrementar'),
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: const Text('Decrementar'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
