class Errorvalidation {
  email(value) {
    if (value == null || value.isEmpty || !value.contains("@")) {
      return ('Enter Valid Email Address');
    }
  }

  name(value) {
    if (value == null || value.isEmpty && value.length <= 3) {
      return ('Name have atleast 3 letter');
    }
  }

  userid(value) {
    if (value == null || value.isEmpty) {
      return ('Enter Valid Userid ');
    }
  }

  pincode(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your pincode';
    }
    if (!RegExp(r'^\d{6}$').hasMatch(value)) {
      return 'Please enter a valid pincode';
    }
    return null;
  }

  username(value) {
    if (value != null && value.isEmpty) {
      return ('Enter the details ');
    }
  }

  password(value) {
    if (value != null && value.isEmpty) {
      return ('Enter the details ');
    }
  }
}
