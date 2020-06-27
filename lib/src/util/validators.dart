class Validators{
  // Crear regExp
  // Email:
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  // 2 funciones:
  // isValidEmail
  static isValidEmail(String email){
    return _emailRegExp.hasMatch(email);
  }

  // isValidPassword
  static isValidPassword(String password){
    //return _passwordRegExp.hasMatch(password);
    int joder = password.length;
    if (joder < 6){
      return false;
    } else {
      return true;
    }
    
  }
}