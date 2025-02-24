import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/user_service.dart';

class UserProvider extends ChangeNotifier {
  final UserService _userService = UserService();
  List<User> _users = [];
  List<User> _filteredUsers = [];
  bool _isLoading = false;
  String _error = '';

  List<User> get users => _filteredUsers;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchUsers() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _users = await _userService.getUsers();
      _filteredUsers = List.from(_users);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void filterUsers(String query) {
    _filteredUsers = _users
        .where((user) =>
            user.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  Future<void> addUser(User user) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final newUser = await _userService.createUser(user);
      _users.add(newUser);
      _filteredUsers = List.from(_users);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}