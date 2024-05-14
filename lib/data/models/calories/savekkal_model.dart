// ignore_for_file: public_member_api_docs, sort_constructors_first

class SaveKkal {
  final String addKkal;

  SaveKkal(
    this.addKkal,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'addKkal': addKkal,
    };
  }

  factory SaveKkal.fromMap(Map<String, dynamic> map) {
    return SaveKkal(
      map['addKkal'] as String,
    );
  }
}
