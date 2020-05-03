enum TypeAuth { unauth, auth, newUser }

class TypeAuthHelper {
  static String getDescription(TypeAuth type) {
    switch (type) {
      case TypeAuth.unauth:
        return "Unauthorized";
      case TypeAuth.auth:
        return "Authorized";
      case TypeAuth.newUser:
        return "New User";
      default:
        return "";
    }
  }

  static int getId(TypeAuth type) {
    switch (type) {
      case TypeAuth.unauth:
        return 1;
      case TypeAuth.auth:
        return 2;
      case TypeAuth.newUser:
        return 3;
      default:
        return 0;
    }
  }
}
