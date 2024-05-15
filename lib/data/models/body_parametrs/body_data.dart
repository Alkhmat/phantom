class BodyParameters {
  final double height;
  final int parameter1;
  final int parameter2;

  BodyParameters({
    required this.height,
    required this.parameter1,
    required this.parameter2,
  });

  // Метод для преобразования данных в формат Map для сохранения в Firestore
  Map<String, dynamic> toMap() {
    return {
      'height': height,
      'parameter1': parameter1,
      'parameter2': parameter2,
    };
  }

  // Статический метод для создания объекта BodyParameters из данных, полученных из Firestore
  static BodyParameters fromMap(Map<String, dynamic> map) {
    return BodyParameters(
      height: map['height'],
      parameter1: map['parameter1'],
      parameter2: map['parameter2'],
    );
  }

  // Метод для создания копии объекта с измененными полями
  BodyParameters copyWith({
    double? height,
    int? parameter1,
    int? parameter2,
  }) {
    return BodyParameters(
      height: height ?? this.height,
      parameter1: parameter1 ?? this.parameter1,
      parameter2: parameter2 ?? this.parameter2,
    );
  }
}
