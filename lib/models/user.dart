class User {
  String userId;
  String userEmail;

  User({
    required this.userId,
    required this.userEmail,
  });

  User.defaultUser()
      : userId = '',
        userEmail = '';
}
