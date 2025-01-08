class User {
  String _username = "";
  String _password = "";
  int _age = 0;
  double _height = 0.0;
  double _weight = 0.0;
  String _location = "";
  User({
    String username = "",
    String password = "",
    int age = 0,
    double height = 0.0,
    double weight = 0.0,
    String location = ""
  }) {
    _username = username;
    _password = password;
    _age = age;
    _height = height;
    _weight = weight;
    _location = location;
  }
  String getUsername() {return _username;}
  String getPassword() {return _password;}
  int getAge() {return _age;}
  double getHeight() {return _height;}
  double getWeight() {return _weight;}
  String getLocation() {return _location;}
  void setUsername(String username) {_username = username;}
  void setPassword(String password) {_password = password;}
  void setAge(int age) {_age = age;}
  void setHeight(double height) {_height = height;}
  void setWeight(double weight) {_weight = weight;}
  void setLocation(String location) {_location = location;}
}