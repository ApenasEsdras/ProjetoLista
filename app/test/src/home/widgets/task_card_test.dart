import 'package:flutter_test/flutter_test.dart';
import 'package:listinha/src/home/widgets/task_card.dart';
import 'package:listinha/src/shared/services/realm/models/task_model.dart';
import 'package:realm/realm.dart';

void main() {
  final board = TaskBoard(
    Uuid.v4(),
    'Nova lista de tarefas 1',
  );

  testWidgets('deu bom', (tester) async {
    final tasks = [
      Task(Uuid.v1(), '', complete: true),
      Task(Uuid.v1(), '', complete: true),
      Task(Uuid.v1(), ''),
      Task(Uuid.v1(), ''),
    ];
    final progress = TaskCard(
      board: board,
    ).getProgress(tasks);
    expect(progress, 0.5);
  });
}
