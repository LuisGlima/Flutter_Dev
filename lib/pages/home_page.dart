import 'package:flutter/material.dart';
import 'package:simple_todo/utils/todo_list.dart'; 

class HomePage extends StatefulWidget { 
  HomePage({super.key}); 

  @override 
  State<HomePage> createState() => _HomePageState(); 
} 

class _HomePageState extends State<HomePage> { 
  // Controlador para o campo de texto onde novas tarefas são adicionadas
  final _controller = TextEditingController(); 

  // Lista de tarefas. Cada tarefa é uma lista com dois elementos:
  // O primeiro elemento é o nome da tarefa (String)
  // O segundo elemento indica se a tarefa está concluída (booleano)
  List toDoList = [ 
    ['Code With Otabek', true], 
    ['Learn Flutter', true], 
    ['Drink Coffee', false], 
    ['Explore Firebase', false], 
  ]; 

  // Função chamada quando o estado de uma caixa de seleção é alterado
  void checkBoxChanged(int index) { 
    setState(() { 
      // Inverte o estado de conclusão da tarefa na posição 'index' da lista
      toDoList[index][1] = !toDoList[index][1]; 
    }); 
  } 

  // Função chamada para salvar uma nova tarefa
  void saveNewTask() { 
    setState(() { 
      // Adiciona uma nova tarefa à lista com o texto do controlador e estado 'não concluído'
      toDoList.add([_controller.text, false]); 
      // Limpa o campo de texto após adicionar a tarefa
      _controller.clear(); 
    }); 
  } 

  // Função chamada para excluir uma tarefa
  void deleteTask(int index) { 
    setState(() { 
      // Remove a tarefa na posição 'index' da lista
      toDoList.removeAt(index); 
    }); 
  } 

  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      backgroundColor: Colors.deepPurple.shade300, 
      appBar: AppBar( 
        title: const Text( 
          'Simple Todo', 
        ), 
        backgroundColor: Colors.deepPurple, 
        foregroundColor: Colors.white, 
      ), 
      body: ListView.builder( 
        itemCount: toDoList.length, // Define o número de itens na lista
        itemBuilder: (BuildContext context, index) { // Constrói cada item da lista
          return TodoList( 
            taskName: toDoList[index][0], // Nome da tarefa
            taskCompleted: toDoList[index][1], // Estado de conclusão da tarefa
            onChanged: (value) => checkBoxChanged(index), // Função chamada ao alterar a caixa de seleção
            deleteFunction: (contex) => deleteTask(index), // Função chamada ao excluir a tarefa
          ); 
        }, 
      ), 
      floatingActionButton: Padding( 
        padding: const EdgeInsets.symmetric(horizontal: 20), 
        child: Row( 
          children: [ 
            Expanded( 
              child: Padding( 
                padding: const EdgeInsets.symmetric( 
                  horizontal: 20, 
                ), 
                child: TextField( 
                  controller: _controller, // Controlador para o campo de texto
                  decoration: InputDecoration( 
                    hintText: 'Add a new todo items', 
                    filled: true, 
                    fillColor: Colors.deepPurple.shade200, 
                    enabledBorder: OutlineInputBorder( 
                      borderSide: const BorderSide( 
                        color: Colors.deepPurple, 
                      ), 
                      borderRadius: BorderRadius.circular(15), 
                    ), 
                    focusedBorder: OutlineInputBorder( 
                      borderSide: const BorderSide( 
                        color: Colors.deepPurple, 
                      ), 
                      borderRadius: BorderRadius.circular(15), 
                    ), 
                  ), 
                ), 
              ), 
            ), 
            FloatingActionButton( 
              onPressed: saveNewTask, // Função chamada ao pressionar o botão
              child: const Icon(Icons.add), 
            ), 
          ], 
        ), 
      ), 
    ); 
  } 
}