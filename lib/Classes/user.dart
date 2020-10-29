
class user {

  String userId;
  String firstName;
  String lastName;
  int birthDate;
  String email;
  String password;
  int xpId;

  void setUser(Map input){
    userId = input["userId"];
    firstName = input["firstName"];
    lastName = input["lastName"];
    birthDate = input["birthDate"];
    email = input["email"];
    password = input["password"];
    xpId = input["xpId"];
  }
}
