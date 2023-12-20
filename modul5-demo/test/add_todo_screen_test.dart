import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:note_keep/helpers/database_helper.dart';
import 'package:note_keep/providers/todo_provider.dart';
import 'package:note_keep/screens/add_todo_screen.dart';
import 'package:provider/provider.dart';

class MockTodoProvider extends Mock implements TodoProvider {}

class MockDatabaseHelper extends Mock implements DatabaseHelper {}

void main() {
  late MockTodoProvider mockTodoProvider;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockTodoProvider = MockTodoProvider();
    mockDatabaseHelper = MockDatabaseHelper();
  });

  group('AddTodoScreen Widget Tests', () {
    testWidgets('Renders AddTodoScreen', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<TodoProvider>(
            create: (context) => mockTodoProvider,
            child: AddTodoScreen(),
          ),
        ),
      );

      expect(find.text('Add Activities'), findsOneWidget);
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
      expect(find.text('Add Todo'), findsOneWidget);
      expect(find.text('Select Image'), findsOneWidget);
    });

    testWidgets('Add Todo Button Pressed', (WidgetTester tester) async {
    });
  });
}
