import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart'; // Importa o pacote para adicionar ações de deslizar

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.taskName, // Nome da tarefa
    required this.taskCompleted, // Estado de conclusão da tarefa
    required this.onChanged, // Função chamada quando o estado da caixa de seleção muda
    required this.deleteFunction, // Função chamada para excluir a tarefa
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 0,
      ),
      child: Slidable( // Widget que permite ações de deslizar
        endActionPane: ActionPane( // Define as ações no lado direito
          motion: StretchMotion(), // Define a animação de deslizar
          children: [
            SlidableAction( // Ação de deslizar para excluir
              onPressed: deleteFunction, // Função chamada ao pressionar o botão de excluir
              icon: Icons.delete, // Ícone de excluir
              borderRadius: BorderRadius.circular(15), // Define o raio da borda do botão
            ),
          ],
        ),
        child: Container( // Container que contém a tarefa
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.deepPurple, // Cor de fundo do container
            borderRadius: BorderRadius.circular(15), // Define o raio da borda do container
          ),
          child: Row( // Widget que organiza os elementos em uma linha
            children: [
              Checkbox( // Caixa de seleção para marcar a tarefa como concluída
                value: taskCompleted, // Estado da caixa de seleção
                onChanged: onChanged, // Função chamada ao alterar o estado da caixa de seleção
                checkColor: Colors.black, // Cor do ícone de seleção
                activeColor: Colors.white, // Cor de fundo da caixa de seleção quando ativa
                side: const BorderSide(
                  color: Colors.white, // Cor da borda da caixa de seleção
                ),
              ),
              Text( // Texto da tarefa
                taskName,
                style: TextStyle(
                  color: Colors.white, // Cor do texto
                  fontSize: 18, // Tamanho da fonte
                  decoration: taskCompleted // Adiciona um riscado no texto se a tarefa estiver concluída
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.white, // Cor do riscado
                  decorationThickness: 2, // Espessura do riscado
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}