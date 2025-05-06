// models/todo.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Priority { low, medium, high, critical }

class Todo {
  final String id;
  final String title;
  final String? description;
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime? dueDate;
  final Priority priority;
  final String category;
  final List<String> subtasks;
  final List<String> tags;
  final String? attachmentUrl;
  final bool isRecurring;
  final String? recurrencePattern;

  Todo({
    required this.id,
    required this.title,
    this.description,
    this.isCompleted = false,
    DateTime? createdAt,
    this.dueDate,
    this.priority = Priority.medium,
    this.category = 'Personal',
    List<String>? subtasks,
    List<String>? tags,
    this.attachmentUrl,
    this.isRecurring = false,
    this.recurrencePattern,
  })  : createdAt = createdAt ?? DateTime.now(),
        subtasks = subtasks ?? [],
        tags = tags ?? [];

  String get formattedDueDate {
    if (dueDate == null) return 'No due date';
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final due = DateTime(dueDate!.year, dueDate!.month, dueDate!.day);

    if (due == today) return 'Today';
    if (due == today.add(const Duration(days: 1))) return 'Tomorrow';
    if (due == today.subtract(const Duration(days: 1))) return 'Yesterday';

    final diff = due.difference(today).inDays;
    if (diff > 0) return 'In $diff days';
    if (diff < 0) return '${-diff} days ago';

    return DateFormat('MMM d, y').format(dueDate!);
  }

  bool get isOverdue {
    if (dueDate == null) return false;
    return !isCompleted && dueDate!.isBefore(DateTime.now());
  }

  double get progress {
    if (subtasks.isEmpty) return isCompleted ? 1.0 : 0.0;
    // In a real app, we would track completed subtasks
    return 0.0;
  }

  Color get priorityColor {
    switch (priority) {
      case Priority.low:
        return Colors.green;
      case Priority.medium:
        return Colors.blue;
      case Priority.high:
        return Colors.orange;
      case Priority.critical:
        return Colors.red;
    }
  }

  Todo copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? createdAt,
    DateTime? dueDate,
    Priority? priority,
    String? category,
    List<String>? subtasks,
    List<String>? tags,
    String? attachmentUrl,
    bool? isRecurring,
    String? recurrencePattern,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      dueDate: dueDate ?? this.dueDate,
      priority: priority ?? this.priority,
      category: category ?? this.category,
      subtasks: subtasks ?? this.subtasks,
      tags: tags ?? this.tags,
      attachmentUrl: attachmentUrl ?? this.attachmentUrl,
      isRecurring: isRecurring ?? this.isRecurring,
      recurrencePattern: recurrencePattern ?? this.recurrencePattern,
    );
  }
}