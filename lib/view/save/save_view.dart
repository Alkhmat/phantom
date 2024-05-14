import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phantom/class/app_text/app_text_class.dart';

class SaveViuw extends StatelessWidget {
  const SaveViuw({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    // final w = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white70,
          ),
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          AppText.savekkal,
          style: GoogleFonts.josefinSans(
            textStyle: TextStyle(
              fontSize: h * 0.040,
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('calories service')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white70,
              ),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return buildEmptyList();
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var document = snapshot.data!.docs[index];
              var addKkal = document['addKkal'];

              var documentId = document.id;
              return buildPersonList(addKkal, documentId, context);
            },
          );
        },
      ),
    );
  }

  Widget buildEmptyList() {
    return const Center(
      child: Text(
        AppText.saveempty,
        style: TextStyle(color: Colors.white70),
      ),
    );
  }

  Widget buildPersonList(addKkal, documentId, BuildContext ctx) {
    // принимаем ID документа

    final h = MediaQuery.of(ctx).size.height;
    // final w = MediaQuery.of(ctx).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Center(
          child: ListTile(
            title: Text('Addkkal  : $addKkal',
                style: GoogleFonts.teko(
                  textStyle:
                      TextStyle(color: Colors.black, fontSize: h * 0.040),
                )),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                deleteDocument(documentId);
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> deleteDocument(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('calories service')
          .doc(documentId)
          .delete();
    } catch (e) {
      print('Error deleting document: $e');
      // Возможно, стоит добавить здесь обработку ошибок, если удаление не удалось
    }
  }
}
