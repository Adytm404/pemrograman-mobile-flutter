import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:note_keep/helpers/database_helper.dart';

class MockDatabaseHelper extends Mock implements DatabaseHelper {}

void main() {
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
  });

  group('DatabaseHelper Tests', () {
    test('Create Todo Test', () async {
    });

    test('Get Todos Test', () async {
    });

    test('Update Todo Test', () async {
    });

    test('Delete Todo Test', () async {
    });

    test('Upload Image To Appwrite Test', () async {
    });
  });
}
