abstract class ApiConsumer {
  Future<dynamic> get({
    required String q,
    required String from,
    required String apiKey,
    required String sortBy,
  });
}
