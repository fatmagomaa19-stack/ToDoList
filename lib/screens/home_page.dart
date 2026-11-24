import 'package:flutter/material.dart';
import 'package:flutter_todolist1_3/providers/provider/todolist_provider.dart';
import 'package:flutter_todolist1_3/wedgits/todolist_item.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  //ShowBottonModelSheet
  @override
  Widget build(BuildContext context) {
    final providerobject = context.read<TodolistProvider>();
    return Scaffold(
      backgroundColor: Colors.teal,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final titleController = TextEditingController();
          final descController = TextEditingController();

          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (sheetContext) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("UpdateTask", style: TextStyle(color: Colors.teal)),
                    const SizedBox(height: 10),
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(hintText: ''),
                    ),
                    const SizedBox(height: 10),

                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        final title = titleController.text.trim();
                        final desc = descController.text.trim();
                        if (title.isNotEmpty) {
                          Navigator.pop(sheetContext);
                          await providerobject.adddataprovider(
                            title: title,
                            descreption: desc,
                          );
                        }
                      },
                      child: const Text('save'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer<TodolistProvider>(
        builder: (context, value, child) {
          final data = value.lists?.todolist;
          if (data == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Column(
              mainAxisSize: .max,
              children: [
                Center(
                  child: Text(
                    "TodoList",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: .start,
                  children: [
                    Icon(Icons.playlist_add_check, color: Colors.white),
                    Text(
                      "ToDayDo",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: .bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Consumer<TodolistProvider>(
                  builder: (context, value, child) {
                    final total = value.lists?.todolist.length ?? 0;
                    return Text(
                      "$total Taskes",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    );
                  },
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  width: 600,
                  height: 400,
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return TodolistItem(item: data[index]);
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
