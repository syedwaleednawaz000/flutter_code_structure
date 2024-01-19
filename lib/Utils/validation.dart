
//

class ValidationUtils {
  static bool isValidEmail(String email) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static bool isValidPhoneNumber(String phoneNumber) {
    return RegExp(r"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$")
        .hasMatch(phoneNumber);
  }
}
