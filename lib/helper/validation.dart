class FormValidators {
  String? userNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    if (value.length < 3) {
      return "Name Must be At Least 3 Characters";
    } else {
      return null;
    }
  }

  String? bioValidator(String? value) {
    if (value != null) {
      if (value.length > 100) {
        return "Bio Must be At Most 100 Characters";
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  String? heightValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    int? height = int.tryParse(value);

    if (height == 0) {
      return "Height can't be zero";
    } else if (height! > 220) {
      return "Height must be \n less than  220";
    } else if (height < 0) {
      return "Height can't be negative";
    } else if (height < 140) {
      return "Height must be \n more than 140";
    } else {
      return null;
    }
  }

  String? weightValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    int? weight = int.tryParse(value);

    if (weight == 0) {
      return "Weight can't be zero";
    } else if (weight! > 220) {
      return "Weight must be \n less than  220";
    } else if (weight < 0) {
      return "Weight can't be negative";
    } else if (weight < 45) {
      return "Weight must be\n more than  45";
    } else {
      return null;
    }
  }

  String? strongPasswordValidator(String? value) {
    String? message;
    if (value == null || value.isEmpty) {
      message ??= '';
      message += 'Required Field';
    } else if (!RegExp(".*[0-9].*").hasMatch(value)) {
      message ??= '';
      message += 'Password should contain \n a numeric value 1-9. ';
    } else if (!RegExp('.*[a-z].*').hasMatch(value)) {
      message ??= '';
      message += 'Password should contain \n a lowercase letter a-z. ';
    } else if (!RegExp('.*[A-Z].*').hasMatch(value)) {
      message ??= '';
      message += 'Password should contain \n an uppercase letter A-Z. ';
    } else if (value.length < 8) {
      message ??= '';
      message += 'Password should be at least 8 Characters. ';
    }
    return message;
  }
}
