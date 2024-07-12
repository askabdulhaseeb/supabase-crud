class AppValidator {
  static String? email(String? value) {
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value!)) {
      return 'Email is Invalid';
    }
    return null;
  }

  static String? password(String? value) {
    if ((value?.trim().length ?? 0) < 6) {
      return 'Password should be greater then 6 digits';
    }
    return null;
  }

  static String? isEmpty(String? value) {
    return (value!.isEmpty) ? 'Field could not be empty' : null;
  }

  static String? lessThen2(String? value) {
    return (value!.length < 2) ? 'Enter more then 1 characters' : null;
  }

  static String? lessThen3(String? value) {
    return (value!.length < 3) ? 'Enter more then 2 characters' : null;
  }

  static String? lessThen4(String? value) {
    return (value!.length < 4) ? 'Enter more then 3 characters' : null;
  }

  static String? lessThen5(String? value) {
    return (value!.length < 5) ? 'Enter more then 4 characters' : null;
  }

  static String? greaterThen(String? input, double compairWith) {
    return ((double.tryParse(input ?? '0') ?? 0.0) > compairWith)
        ? null
        : 'New input must be greater then $compairWith';
  }

  static String? lessThen(String? input, double compairWith) {
    return ((double.tryParse(input ?? '0') ?? (compairWith + 1)) < compairWith)
        ? null
        : 'New input must be Less then $compairWith';
  }

  static String? confirmPasword(String first, String second) {
    return first.trim() == second.trim()
        ? null
        : 'Password & Confirm Password must be same';
  }

  static String? retaunNull(String? value) => null;
}
