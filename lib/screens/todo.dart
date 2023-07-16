class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Morning Excercise', isDone: false),
      ToDo(id: '02', todoText: 'Shopping', isDone: true),
      ToDo(
        id: '03',
        todoText: 'Check Emails',
      ),
      ToDo(
        id: '04',
        todoText: 'Daily calls',
      ),
      ToDo(
        id: '05',
        todoText: 'Completing assigned tasks',
      ),
      ToDo(
        id: '06',
        todoText: 'Dinner with mother',
      ),
    ];
  }
}
