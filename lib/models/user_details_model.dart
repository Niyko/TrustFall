class UserDetailsModel {
  int user_id;
  String mobile;
  String username;
  String password;
  String emergency_contact;
  int current_status;
  int falls_detected;
  int falls_answered;

  UserDetailsModel({
    this.user_id,
    this.mobile,
    this.username,
    this.password,
    this.emergency_contact,
    this.current_status,
    this.falls_detected,
    this.falls_answered
  });
}
