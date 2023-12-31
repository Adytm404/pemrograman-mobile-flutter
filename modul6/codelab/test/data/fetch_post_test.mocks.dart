import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modul6/app/data/api/fetch_post.dart';
import 'package:modul6/app/data/model/posts.dart';

import 'api_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  const _apiKey = 'd49a60d30c2441f099384095ad79ad4f';
  const _baseUrl = 'https://newsapi.org/v2/';
  const String _category = 'technology';
  const String _country = 'us';

  late PostService postService;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    postService = PostService();
  });

  group('PostService', () {
    test('fetchPosts returns a Posts object if response is successful',
        () async {
      when(mockClient.get(Uri.parse(
              '$_baseUrl/top-headlines?country=$_country&category=$_category&apiKey=$_apiKey')))
          .thenAnswer((_) async => http.Response(
              '{"userId": 1, "id": 1, "title": "Test Post", "body": "Test Body"}',
              200));

      final posts = await postService.fetchPosts();

      expect(posts, isA<Posts>());
    });
  });
}
