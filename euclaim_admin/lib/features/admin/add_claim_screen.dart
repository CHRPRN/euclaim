import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddClaimScreen extends ConsumerStatefulWidget {
  const AddClaimScreen({super.key});

  @override
  ConsumerState<AddClaimScreen> createState() => _AddClaimScreenState();
}

class _AddClaimScreenState extends ConsumerState<AddClaimScreen> {
  final _titleController = TextEditingController();
  final List<Map<String, dynamic>> _requiredDocs = [];

  void _addDocField() {
    setState(() {
      _requiredDocs.add({'label': '', 'type': 'image', 'required': true});
    });
  }

  Future<void> _saveClaim() async {
    await FirebaseFirestore.instance.collection('claims_catalog').add({
      'title': _titleController.text,
      'requiredDocs': _requiredDocs,
      'status': 'active',
    });
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aggiungi Causa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Titolo Causa'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _requiredDocs.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextField(
                          onChanged: (v) => _requiredDocs[index]['label'] = v,
                          decoration: const InputDecoration(
                            labelText: 'Nome Documento',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: DropdownButton<String>(
                          value: _requiredDocs[index]['type'],
                          items: const [
                            DropdownMenuItem(value: 'image', child: Text('Immagine')),
                            DropdownMenuItem(value: 'pdf', child: Text('PDF')),
                          ],
                          onChanged: (v) => setState(() => _requiredDocs[index]['type'] = v!),
                        ),
                      ),
                      Checkbox(
                        value: _requiredDocs[index]['required'],
                        onChanged: (v) => setState(
                          () => _requiredDocs[index]['required'] = v!,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _addDocField,
              child: const Text('Aggiungi Campo Documento'),
            ),
            ElevatedButton(
              onPressed: _saveClaim,
              child: const Text('Salva Causa'),
            ),
          ],
        ),
      ),
    );
  }
}
