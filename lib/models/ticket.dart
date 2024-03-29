// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Ticket {
  final String code;
  final String userName;
  final String userPhone;
  Ticket({
    required this.code,
    required this.userName,
    required this.userPhone,
  });

  Ticket copyWith({
    String? code,
    String? userName,
    String? userPhone,
  }) {
    return Ticket(
      code: code ?? this.code,
      userName: userName ?? this.userName,
      userPhone: userPhone ?? this.userPhone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'userName': userName,
      'userPhone': userPhone,
    };
  }

  factory Ticket.fromMap(Map<String, dynamic> map) {
    return Ticket(
      code: map['code'] as String,
      userName: map['userName'] as String,
      userPhone: map['userPhone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ticket.fromJson(String source) =>
      Ticket.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Ticket(code: $code, userName: $userName, userPhone: $userPhone)';

  @override
  bool operator ==(covariant Ticket other) {
    if (identical(this, other)) return true;

    return other.code == code &&
        other.userName == userName &&
        other.userPhone == userPhone;
  }

  @override
  int get hashCode => code.hashCode ^ userName.hashCode ^ userPhone.hashCode;
}
