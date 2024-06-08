final class Aircraft {
  const Aircraft({
    required this.registration,
  });

  final String registration;

  factory Aircraft.fromJson(Map<String, dynamic> json) {
    return Aircraft(
      registration: json["registration"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "registration": registration,
    };
  }

  Aircraft copyWith({
    String? registration,
  }) {
    return Aircraft(
      registration: registration ?? this.registration,
    );
  }
}
