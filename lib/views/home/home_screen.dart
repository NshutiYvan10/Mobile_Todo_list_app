// views/home/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/todo.dart';
import '../../services/todo_service.dart';
import 'add_edit_todo.dart';
import 'todo_details.dart';
import 'widgets/todo_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';
  String _selectedCategory = 'All';
  bool _isGridView = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todoService = Provider.of<TodoService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('TaskMaster Pro'),
        actions: [
          IconButton(
            icon: Icon(_isGridView ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _isGridView = !_isGridView),
          ),
          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: _showFilterDialog,
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _showSearchDialog,
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Settings'),
                value: 'settings',
              ),
              PopupMenuItem(
                child: Text('Profile'),
                value: 'profile',
              ),
            ],
            onSelected: (value) {
              if (value == 'settings') {
                // Navigate to settings
              } else if (value == 'profile') {
                // Navigate to profile
              }
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Active'),
            Tab(text: 'Completed'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _addNewTodo(context),
        label: const Text('Add Task'),
        icon: const Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTodoList(todoService.getFilteredTodos(
            searchQuery: _searchQuery,
            category: _selectedCategory,
          )),
          _buildTodoList(todoService.getActiveTodos(
            searchQuery: _searchQuery,
            category: _selectedCategory,
          )),
          _buildTodoList(todoService.getCompletedTodos(
            searchQuery: _searchQuery,
            category: _selectedCategory,
          )),
        ],
      ),
    );
  }

  Widget _buildTodoList(List<Todo> todos) {
    if (todos.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.assignment, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'No tasks found',
              style: TextStyle(color: Colors.grey[600], fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Tap the + button to add a new task',
              style: TextStyle(color: Colors.grey[500]),
            ),
          ],
        ),
      );
    }

    if (_isGridView) {
      return GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: todos.length,
        itemBuilder: (context, index) => TodoCard(
          todo: todos[index],
          onTap: () => _showTodoDetails(context, todos[index]),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: todos.length,
      itemBuilder: (context, index) => TodoCard(
        todo: todos[index],
        onTap: () => _showTodoDetails(context, todos[index]),
      ),
    );
  }

  Future<void> _addNewTodo(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditTodo(),
        fullscreenDialog: true,
      ),
    );

    if (result == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Task added successfully')),
      );
    }
  }

  void _showTodoDetails(BuildContext context, Todo todo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TodoDetailsScreen(todo: todo),
      ),
    );
  }

  Future<void> _showSearchDialog() async {
    final query = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Search Tasks'),
        content: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search by title or description',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) => _searchQuery = value,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, _searchQuery),
            child: const Text('Search'),
          ),
        ],
      ),
    );

    if (query != null) {
      setState(() => _searchQuery = query);
    }
  }

  Future<void> _showFilterDialog() async {
    final categories = Provider.of<TodoService>(context, listen: false).categories;

    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text('Filter Tasks'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Category:'),
                Wrap(
                  spacing: 8,
                  children: [
                    ChoiceChip(
                      label: const Text('All'),
                      selected: _selectedCategory == 'All',
                      onSelected: (selected) {
                        if (selected) {
                          setState(() => _selectedCategory = 'All');
                        }
                      },
                    ),
                    ...categories.map((category) => ChoiceChip(
                      label: Text(category.name),
                      selected: _selectedCategory == category.name,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() => _selectedCategory = category.name);
                        }
                      },
                    )).toList(),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Sort by:'),
                // Add sort options here
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, {
                  'category': _selectedCategory,
                  // Add other filter params
                }),
                child: const Text('Apply'),
              ),
            ],
          );
        },
      ),
    );

    if (result != null) {
      setState(() {
        _selectedCategory = result['category'] ?? 'All';
      });
    }
  }
}