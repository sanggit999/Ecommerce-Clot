class UserEntity {
  final String userId;
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String image;
  final int gender;

  const UserEntity({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.image,
    required this.gender,
  });
}
