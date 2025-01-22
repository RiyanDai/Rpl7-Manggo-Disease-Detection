import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_tflit_app/models/detection_model.dart';
// ... imports existing ...
import 'package:my_tflit_app/screen/about/detail_page.dart';
import 'package:my_tflit_app/widgets/wave_background.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WaveBackground(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Riwayat', style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,

        body: ValueListenableBuilder(
          valueListenable: Hive.box<DetectionModel>('detections').listenable(),
          builder: (context, Box<DetectionModel> box, _) {
            if (box.isEmpty) {
              return const Center(
                child: Text('No detection history yet'),
              );
            }

            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                final detection = box.getAt(box.length - 1 - index)!;
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: InkWell( // Tambahkan InkWell untuk membuat card bisa diklik
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(detection: detection),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Hero( // Tambahkan Hero widget untuk animasi
                        tag: detection.imagePath,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(detection.imagePath),
                            width: 160,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        detection.label,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Accuracy: ${(detection.accuracy * 100).toStringAsFixed(2)}%',
                          ),
                          Text(
                            'Date: ${_formatDateTime(detection.timestamp)}',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () => _showDeleteConfirmationDialog(context, box, index),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  // ... existing methods ...

  void _showDeleteConfirmationDialog(BuildContext context, Box<DetectionModel> box, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this detection?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _deleteDetection(box, index);
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
  }

  void _deleteDetection(Box<DetectionModel> box, int index) {
    box.deleteAt(box.length - 1 - index);
  }
}