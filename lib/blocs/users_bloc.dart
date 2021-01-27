import 'package:test_app/models/user.dart';
import 'package:test_app/resources/user_repository.dart';
import 'package:rxdart/rxdart.dart';

class UsersBloc {
  final _userRepository = UserRepository();
  final _usersFetcher = PublishSubject<List<User>>();
  final _userByIDFetcher = PublishSubject<User>();

  Observable<List<User>> get users => _usersFetcher.stream;

  Observable<User> get userByID => _userByIDFetcher.stream;

  fetchUsers() async {
    List<User> listUsers = await _userRepository.fetchUsers();
    _usersFetcher.sink.add(listUsers);
  }

  fetchUserByID(String id) async {
    User user = await _userRepository.fetchUserByID(id);
    _userByIDFetcher.sink.add(user);
  }

  dispose() {
    _usersFetcher.close();
    _userByIDFetcher.close();
  }
}

final bloc = UsersBloc();
