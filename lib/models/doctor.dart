class Doctor {
  final String name;
  final String specialty;
  final String image;
  final String available;
  final String fee;
  final String feeTitle;

  Doctor({
    required this.name,
    required this.specialty,
    required this.image,
    required this.available,
    required this.fee,
    required this.feeTitle,
  });

  factory Doctor.fromMap(Map<String, String> map) {
    return Doctor(
      name: map['name'] ?? '',
      specialty: map['specialty'] ?? '',
      image: map['image'] ?? '',
      available: map['available'] ?? '',
      fee: map['fee'] ?? '',
      feeTitle: map['feeTitle'] ?? '',
    );
  }
}
