import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/ItemModel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  late TabController _tabController;

 TextEditingController _textEditingControllerNome = TextEditingController();
  TextEditingController _textEditingControllerSenha = TextEditingController();

  List<ItemModel> items = [
    ItemModel('Maria'),
    ItemModel('Ana'),
    ItemModel('Carlos'),
    ItemModel('Andre'),
  ];

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(Icons.cloud_outlined),
            ),
            Tab(
              icon: Icon(Icons.beach_access_sharp),
            ),
              Tab(
              icon: Icon(Icons.brightness_5_sharp),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Column(
              children: [
                Container( 
                  width: 150,
                  height: 130,
                  decoration: BoxDecoration( 
                     image: DecorationImage(
                        image: AssetImage("../assets/images/gasolina.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                  ),
                ),
                TextField(
                  controller: _textEditingControllerNome,
                  decoration: InputDecoration(
                  hintText: 'Nome',
                ),
                ),
                TextField(
                  controller: _textEditingControllerSenha,
                  decoration: InputDecoration(
                    hintText: 'Senha',
                  ),
                ),
                ElevatedButton(onPressed: (){

                }, child: Text('Enviar'))
              ],
            ),
          ),
          Center(
            child: ListView.builder(
              itemCount: items.length * 2 - 1, // Considerando as linhas divisórias
              itemBuilder: (context, index) {
                if (index.isOdd) {
                  //linha divisória
                  return Divider();
                }
                final itemIndex = index ~/ 2;
                return ListTile(
                  title: Text(items[itemIndex].name),
                );
              },
            ),
          ),
          Center(
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 130,
                    decoration: BoxDecoration( 
                        image: DecorationImage(
                          image: AssetImage("../assets/images/gasolina.jpg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                      ),
                
                ),
                Text('Its sunny here'),
              ],
            ),
          )
        ],
      )
      
    );
  }
}
