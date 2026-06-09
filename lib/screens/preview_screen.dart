import 'package:flutter/material.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Preview'),
        actions: [
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
          IconButton(icon: const Icon(Icons.delete), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // File preview area
          Expanded(
            child: Container(
              color: Colors.grey.shade100,
              child: const Center(
                child: Icon(
                  Icons.insert_drive_file,
                  size: 120,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          // File info
          Container(
            padding: const EdgeInsets.all(16),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'filename.pdf',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('Size: 2.4 MB', style: TextStyle(color: Colors.grey)),
                Text(
                  'Modified: June 2026',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
