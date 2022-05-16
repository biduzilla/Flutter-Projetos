import 'package:tarefa/models/todo.dart';

class Tarefas {
  Tarefas({
    required this.todos,
    required this.nomeTarefa,
    required this.dateTime,
  });
  List<Todo> todos;
  String nomeTarefa;
  DateTime dateTime;
}
