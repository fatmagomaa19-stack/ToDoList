import 'package:flutter/material.dart';
import 'package:flutter_todolist1_3/model/todolist_model.dart';
import 'package:flutter_todolist1_3/providers/provider/todolist_provider.dart';
import 'package:provider/provider.dart';

class TodolistItem extends StatelessWidget {
  ToDoListModel item;
  TodolistItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final providerobject = context.read<TodolistProvider>();
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: ListTile(
        leading: Text(item.title, style: TextStyle(color: Colors.black)),
        trailing: Row(
          mainAxisSize: .min,
          children: [
            IconButton(
              onPressed: () {
                Text("UpdateTask", style: TextStyle(color: Colors.teal));
                final editController = TextEditingController(text: item.title);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (sheetContext) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: 16,
                        left: 16,
                        right: 16,
                        bottom: 16,
                      ),
                      child: Column(
                        mainAxisSize: .min,
                        children: [
                          TextField(
                            controller: editController,
                            autofocus: true,
                            decoration: const InputDecoration(
                              hintText: 'title',
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () async {
                              final newTitle = editController.text.trim();
                              if (newTitle.isNotEmpty) {
                                Navigator.pop(sheetContext);
                                await providerobject.updatedataprovider(
                                  id: item.id,
                                  title: newTitle,
                                );
                              }
                            },
                            child: const Text('Save'),
                          ),
                        ],
                      ),
                    );
                  },
                );
                // providerobject.updatedataprovider(id: item.id, title: item.title);
              },
              icon: Icon(Icons.edit, color: Colors.blue),
            ),
            IconButton(
              onPressed: () {
                providerobject.deletedataprovider(id: item.id);
              },
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
