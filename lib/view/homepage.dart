import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/ItemModel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ItemModel> items = [
    ItemModel('Maria', false),
    ItemModel('Ana', true),
    ItemModel('Carlos', true),
    ItemModel('Andre', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista/check'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: items.length * 2 - 1, // Considerando as linhas divisórias
          itemBuilder: (context, index) {
            if (index.isOdd) {
              //linha divisória
              return Divider();
            }
            final itemIndex = index ~/ 2;
            return CheckboxListTile(
              title: Text(items[itemIndex].name),
              value: items[itemIndex].check,
              onChanged: (bool? newValue) {
                setState(() {
                  items[itemIndex].check = newValue ?? false;
                });
              },
            );
          },
        ),
      ),
    );
  }
}
