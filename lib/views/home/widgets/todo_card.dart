// views/home/widgets/todo_card.dart
import 'package:flutter/material.dart';
import '../../../models/todo.dart';
import 'priority_indicator.dart';
import 'category_chip.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final VoidCallback onTap;

  const TodoCard({
    Key? key,
    required this.todo,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  PriorityIndicator(priority: todo.priority),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      todo.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        decoration: todo.isCompleted
                            ? TextDecoration.lineThrough
                            : null,
                        color: todo.isCompleted
                            ? Colors.grey
                            : Theme.of(context).textTheme.bodyText1?.color,
                      ),
                    ),
                  ),
                  Checkbox(
                    value: todo.isCompleted,
                    onChanged: (value) => onTap(),
                    shape: CircleBorder(),
                  ),
                ],
              ),
              if (todo.description != null) ...[
                const SizedBox(height: 8),
                Text(
                  todo.description!,
                  style: TextStyle(
                    color: Colors.grey[600],
                    decoration: todo.isCompleted
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
              ],
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  CategoryChip(name: todo.category),
                  if (todo.dueDate != null)
                    Chip(
                      label: Text(
                        todo.formattedDueDate,
                        style: TextStyle(
                          color: todo.isOverdue
                              ? Colors.red
                              : Theme.of(context).textTheme.bodyText2?.color,
                        ),
                      ),
                      backgroundColor: todo.isOverdue
                          ? Colors.red.withOpacity(0.1)
                          : Theme.of(context).chipTheme.backgroundColor,
                      avatar: Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: todo.isOverdue
                            ? Colors.red
                            : Theme.of(context).iconTheme.color,
                      ),
                    ),
                  if (todo.tags.isNotEmpty)
                    ...todo.tags.map((tag) => Chip(
                      label: Text(tag),
                      labelStyle: TextStyle(fontSize: 12),
                      visualDensity: VisualDensity.compact,
                    )),
                ],
              ),
              if (todo.subtasks.isNotEmpty) ...[
                const SizedBox(height: 12),
                LinearProgressIndicator(
                  value: todo.progress,
                  backgroundColor: Colors.grey[200],
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(height: 4),
                Text(
                  '${(todo.progress * 100).toInt()}% completed',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}