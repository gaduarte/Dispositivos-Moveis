import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage()
    );
    
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textEditingControllerGasolina = TextEditingController();
  TextEditingController _textEditingControllerAlcool = TextEditingController();

  var resultado = 0.0;
  String mensagem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Gasolina x Alcool'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Gasolina vs Alcool'),

            SizedBox(height: 20,),
            Card(
              elevation: 10,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("../assets/images/gasolina.jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(90),
                ),
              ),
            ),
            SizedBox(height: 20), // Espaçamento entre o Container e o TextField
            TextField(
              controller: _textEditingControllerGasolina,
              decoration: InputDecoration(
                hintText: 'Valor da Gasolina',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _textEditingControllerAlcool,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Valor do Álcool',
              ),
            ),
            SizedBox(height: 20), 
            ElevatedButton(
              onPressed: () {
                double valorGasolina = double.tryParse(_textEditingControllerGasolina.text) ?? 0.0;
                double valorAlcool = double.tryParse(_textEditingControllerAlcool.text) ?? 0.0;
                setState(() {
                  resultado = (valorAlcool / valorGasolina) * 100;

                  if(resultado >= 70){
                    mensagem = 'Abastecer com alcool';
                  }else{
                    mensagem = 'Abastecer com Gasolina';
                  }
                });
              },
              child: Text('Calcular'),
            ),
            SizedBox(height: 20), // Espaçamento entre o botão e o resultado
            Text(
              'Resultado: $resultado, $mensagem',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

