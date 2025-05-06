// services/todo_service.dart
import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../models/category.dart';

class TodoService with ChangeNotifier {
  final List<Todo> _todos = [];
  final List<Category> _categories = [
    Category(id: '1', name: 'Personal', color: Colors.blue),
    Category(id: '2', name: 'Work', color: Colors.green),
    Category(id: '3', name: 'Study', color: Colors.purple),
    Category(id: '4', name: 'Health', color: Colors.red),
    Category(id: '5', name: 'Finance', color: Colors.orange),
  ];

  List<Todo> get todos => _todos;
  List<Category> get categories => _categories;

  List<Todo> getFilteredTodos({
    String searchQuery = '',
    String category = 'All',
  }) {
    return _todos.where((todo) {
      final matchesSearch = searchQuery.isEmpty ||
          todo.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
          (todo.description?.toLowerCase().contains(searchQuery.toLowerCase()) ?? false);

      final matchesCategory = category == 'All' || todo.category == category;

      return matchesSearch && matchesCategory;
    }).toList();
  }

  List<Todo> getActiveTodos({
    String searchQuery = '',
    String category = 'All',
  }) {
    return getFilteredTodos(searchQuery: searchQuery, category: category)
        .where((todo) => !todo.isCompleted)
        .toList();
  }

  List<Todo> getCompletedTodos({
    String searchQuery = '',
    String category = 'All',
  }) {
    return getFilteredTodos(searchQuery: searchQuery, category: category)
        .where((todo) => todo.isCompleted)
        .toList();
  }

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void updateTodo(String id, Todo updatedTodo) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index] = updatedTodo;
      notifyListeners();
    }
  }

  void toggleTodoCompletion(String id) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index] = _todos[index].copyWith(
        isCompleted: !_todos[index].isCompleted,
      );
      notifyListeners();
    }
  }

  void deleteTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  void addCategory(Category category) {
    _categories.add(category);
    notifyListeners();
  }
}