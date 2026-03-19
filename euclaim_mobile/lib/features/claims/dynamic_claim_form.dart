import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:euclaim_mobile/features/upload/upload_provider.dart';

class DynamicClaimForm extends ConsumerWidget {
  final String claimId;
  final List<dynamic> requiredDocs;

  const DynamicClaimForm({
    super.key,
    required this.claimId,
    required this.requiredDocs,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carica Documenti')),
      body: ListView.builder(
        itemCount: requiredDocs.length,
        itemBuilder: (context, index) {
          final doc = requiredDocs[index];
          final isRequired = doc['required'] ?? false;
          final type = doc['type'] ?? 'image';
          
          return ListTile(
            title: Text('${doc['label']}${isRequired ? ' *' : ''}'),
            subtitle: Text(type == 'pdf' ? 'Formato PDF' : 'Foto/Immagine'),
            trailing: IconButton(
              icon: Icon(type == 'pdf' ? Icons.attach_file : Icons.camera_alt),
              onPressed: () => ref
                  .read(uploadControllerProvider.notifier)
                  .uploadDocument(claimId, doc['id'], type: type),
            ),
          );
        },
      ),
    );
  }
}
