import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ApplicationsListScreen extends ConsumerWidget {
  const ApplicationsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gestione Pratiche')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('user_applications')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          return ListView(
            children: snapshot.data!.docs.map((doc) {
              return ListTile(
                title: Text('Pratica: ${doc.id}'),
                subtitle: Text('Stato: ${doc['status']}'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ApplicationDetailScreen(doc: doc),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class ApplicationDetailScreen extends StatelessWidget {
  final QueryDocumentSnapshot doc;
  const ApplicationDetailScreen({super.key, required this.doc});

  Future<void> _updateStatus(String status) async {
    await doc.reference.update({'status': status});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pratica ${doc.id}')),
      body: Column(
        children: [
          Text('Stato attuale: ${doc['status']}'),
          ElevatedButton(
            onPressed: () => _updateStatus('completed'),
            child: const Text('Approva'),
          ),
          ElevatedButton(
            onPressed: () => _updateStatus('rejected'),
            child: const Text('Rifiuta'),
          ),
        ],
      ),
    );
  }
}
