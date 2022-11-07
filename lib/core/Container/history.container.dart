import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_book/Model/book.model.dart';
import 'package:flutter_search_book/components/card_book_history.component.dart';

class ContainerHistory extends StatefulWidget {
  const ContainerHistory({Key? key}) : super(key: key);

  @override
  State<ContainerHistory> createState() => _ContainerHistoryState();
}

class _ContainerHistoryState extends State<ContainerHistory> {
  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 90),
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: firestore
              .collection("books")
              .orderBy("dateRegistration", descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) return const Text('Erro ao carregar dados');
            if (!snapshot.hasData) return const CircularProgressIndicator();

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_, index) {
                return CardBookHistory(
                  book: Book.fromMap(
                    snapshot.data!.docs[index].data(),
                  ),
                );
              },
            );
          }),
    );
  }
}
