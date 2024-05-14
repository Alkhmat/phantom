// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  final String useremail;
  final String userpassword;
  final String usernic;
  final String image;
  final String uid;

  UserModel(
      this.useremail, this.userpassword, this.uid, this.usernic, this.image);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'useremail': useremail,
      'userpassword': userpassword,
      'uid': uid,
      'nic': usernic,
      'imageURL': image,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['useremail'] as String,
      map['userpassword'] as String,
      map['uid'] as String,
      map['nic'] as String,
      map['image url'] as String,
    );
  }
}
