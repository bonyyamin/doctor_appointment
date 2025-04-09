class UserModel {
  final String profilePicture;
  final String fullName;
  final String dateOfBirth;
  final String gender;
  final String contact;
  final String address;
  final String bloodType;
  final List<String> medicalHistory;
  final List<String> currentMedications;
  final List<String> chronicConditions;
  final List<String> pastSurgeries;
  final List<String> appointmentHistory;

  UserModel({
    required this.profilePicture,
    required this.fullName,
    required this.dateOfBirth,
    required this.gender,
    required this.contact,
    required this.address,
    required this.bloodType,
    required this.medicalHistory,
    required this.currentMedications,
    required this.chronicConditions,
    required this.pastSurgeries,
    required this.appointmentHistory,
  });
}
