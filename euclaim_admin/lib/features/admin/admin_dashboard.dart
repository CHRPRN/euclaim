import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'add_claim_screen.dart';
import 'applications_list_screen.dart';

class AdminDashboard extends ConsumerWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => _addClaim(context),
            child: const Text('Aggiungi Nuova Causa'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ApplicationsListScreen()),
            ),
            child: const Text('Gestisci Pratiche'),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('claims_catalog')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const CircularProgressIndicator();
                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    return ListTile(title: Text(doc['title']));
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _addClaim(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddClaimScreen()),
    );
  }
}
