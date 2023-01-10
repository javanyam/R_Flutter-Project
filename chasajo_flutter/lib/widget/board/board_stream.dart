import 'package:cha_sa_jo_flutter/model/boardtype.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BoardStream extends StatefulWidget {
  const BoardStream({super.key});

  @override
  State<BoardStream> createState() => _BoardStreamState();
}

class _BoardStreamState extends State<BoardStream> {
  final user = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('carboard')
          .orderBy('initdate', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final documents = snapshot.data!.docs; // docs : 내용물
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: documents.map((e) => _buildItemWidget(e)).toList(),
          ),
        );
      },
    );
  }

  Widget _buildItemWidget(DocumentSnapshot doc) {
    final board = Board(
      title: doc['title'],
      content: doc['content'],
      creator: doc['creator'],
      initdate: doc['initdate'],
      count: doc['count'],
    );
    return Container(
      height: 100,
      child: GestureDetector(
        onTap: () {
          _moveDetail(doc, board);
        },
        child: Card(
          child: ListTile(
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${board.title}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Icon(Icons.people),
                    Text(' ${board.creator}  '),
                    Icon(Icons.message),
                    Text(' ${board.count} '),
                    Icon(Icons.remove_red_eye_outlined),
                    Text(' ${board.count}'),
                    Spacer(),
                    Text(
                        '${board.initdate.toDate().toLocal().toString().substring(0, 16)}')
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _moveDetail(DocumentSnapshot doc, final board) async {
    // (nickname != board.creator)
    //     ? FirebaseFirestore.instance
    //         .collection('carboard')
    //         .doc(doc.id)
    //         .update({"count": doc['count'] + 1})
    //     : false;
    // await Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => DetailPage(
    //       id: doc.id,
    //       title: doc['title'],
    //       content: doc['content'],
    //       creator: doc['creator'],
    //       initdate: doc['initdate'],
    //       count: doc['count'],
    //     ),
    //   ),
    // );
  }
}