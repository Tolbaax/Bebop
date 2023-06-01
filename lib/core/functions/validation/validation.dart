class Validators {
  static String? validateName(String value) {
    if (value.isEmpty) {
      return 'Name cannot be empty';
    }

    if (value.length < 3) {
      return 'Name must be at least 3 characters long';
    } else if (value.length > 30) {
      return 'Name cannot exceed 30 characters';
    }

    return null;
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email cannot be empty';
    }
    final RegExp emailRegex = RegExp(r'^[\w.-]+@[\w-]+(\.[\w-]+)*\.[\w-]{2,}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    // Check if the value contains spaces
    if (value.contains(' ')) {
      return 'Email address cannot contain spaces';
    }

    // Check if the value has a valid domain name
    final List<String> valueParts = value.split('@');
    if (valueParts.length != 2) {
      return 'Please enter a valid email address';
    }
    final String domainName = valueParts[1];
    if (domainName.isEmpty || !domainName.contains('.')) {
      return 'Please enter a valid email address';
    }

    // Check if the value has a valid top-level domain name
    final List<String> domainParts = domainName.split('.');
    final String tld = domainParts.last;
    if (tld.length < 2 || tld.length > 6) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    return null;
  }

  static String? validateConfirmPassword(String value, String password) {
    if (value.isEmpty) {
      return 'Confirm password is required';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }

  static String? validateBabyHeight(String value) {
    final RegExp _heightRegex = RegExp(r'^\d{1,3}(\.\d{1,2})?$');

    if (value.isEmpty) {
      return 'Enter baby height';
    }

    if (!_heightRegex.hasMatch(value)) {
      return 'Enter valid height';
    }

    double? height = double.tryParse(value);
    if (height == null || height > 190) {
      return 'Enter valid height';
    }

    return null;
  }

  static String? validateBabyWeight(String value) {
    final RegExp _heightRegex = RegExp(r'^\d{1,3}(\.\d{1,2})?$');

    if (value.isEmpty) {
      return 'Enter baby weight';
    }

    if (!_heightRegex.hasMatch(value)) {
      return 'Enter valid weight';
    }

    double? weight = double.tryParse(value);
    if (weight == null || weight > 100) {
      return 'Enter valid weight';
    }

    return null;
  }

  static String? validateMemoryTitle(String value) {
    if (value.isEmpty) {
      return 'Title cannot be empty';
    }

    if (value.length < 3) {
      return 'Title must be at least 3 characters long';
    } else if (value.length > 30) {
      return 'Title cannot exceed 30 characters';
    }

    return null;
  }

  static String? validateMemoryDesc(String value) {
    if (value.isEmpty) {
      return 'Desc cannot be empty';
    }

    if (value.length < 10) {
      return 'Desc must be at least 10 characters long';
    }

    return null;
  }
}
