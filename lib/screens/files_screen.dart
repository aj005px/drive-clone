import 'package:flutter/material.dart';

class FilesScreen extends StatelessWidget {
  const FilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Files')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: Icon(
                index % 2 == 0 ? Icons.folder : Icons.insert_drive_file,
                color: index % 2 == 0 ? Colors.amber : Colors.blue,
                size: 40,
              ),
              title: Text(index % 2 == 0 ? 'Folder $index' : 'File $index.pdf'),
              subtitle: Text(
                index % 2 == 0 ? '${index + 1} items' : '${index + 1} MB',
              ),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
              onTap: () {},
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
