import 'package:test_app/models/user.dart';
import 'package:test_app/resources/api_provider.dart';

class UserRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<User>> fetchUsers() => _apiProvider.fetchUsers();

  Future<User> fetchUserByID(String id) => _apiProvider.fetchUserByID(id);
}
