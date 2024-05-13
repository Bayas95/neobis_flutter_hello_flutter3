import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _userToDO;
  List todoList =[];

    @override
  void initState() {
      super.initState();
      todoList.addAll(['Bay milk','Bay meet', 'Купить картошку']);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: Text('Список дел'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index){
            return Dismissible(
                key: Key(todoList[index]), 
                child: Card(
                  child: ListTile(
                      title: Text(todoList[index]),
                  trailing: IconButton(
                      icon: Icon(
                        Icons.delete_forever,
                        color: Colors.green[200],
                      ),
                      onPressed: (){
                        setState(() {
                          todoList.removeAt(index);
                        });
                  },
                  ),),
                ),
              onDismissed: (direction){
                  setState(() {
                    todoList.removeAt(index);
                  });
              }
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          showDialog(context: context, builder: (BuildContext) {
            return AlertDialog(
            title: Text('Добавить'),
            content: TextField(
              onChanged: (String value) {
                _userToDO = value;
              },
            ),
              actions: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    todoList.add(_userToDO);
                  });
                  Navigator.of(context).pop();
                }, child: Text('Добавить'))
              ],
            );
          });
        },
        child: Icon(
          Icons.add_box,
          color: Colors.white,
        ),
      ),
    );
  }
}
