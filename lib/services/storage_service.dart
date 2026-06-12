import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StorageService {
  final supabase = Supabase.instance.client;

  Future<String?> uploadFile() async {
    FilePickerResult? result = await FilePicker.pickFiles();
    if (result == null) return null;

    PlatformFile file = result.files.first;
    final filePath = file.path!;
    final fileName = file.name;
    final userId = supabase.auth.currentUser!.id;

    await supabase.storage
        .from('files')
        .upload('$userId/$fileName', File(filePath));

    final url = supabase.storage
        .from('files')
        .getPublicUrl('$userId/$fileName');

    return url;
  }

  Future<List<FileObject>> getFiles() async {
    final userId = supabase.auth.currentUser!.id;
    final files = await supabase.storage.from('files').list(path: userId);
    return files;
  }

  Future<void> deleteFile(String fileName) async {
    final userId = supabase.auth.currentUser!.id;
    await supabase.storage.from('files').remove(['$userId/$fileName']);
  }

  String getFileUrl(String fileName) {
    final userId = supabase.auth.currentUser!.id;
    return supabase.storage.from('files').getPublicUrl('$userId/$fileName');
  }
}
