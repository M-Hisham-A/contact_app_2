class Model {
  int id;
  String name;
  String user;
  String email;
  String number;
  String website;
  String company;
  String astreet;
  String acity;
  String azip;

  Model(
      {required this.id,
      required this.name,
      required this.user,
      required this.email,
      required this.number,
      required this.website,
      required this.company,
      required this.astreet,
      required this.acity,
      required this.azip});

  factory Model.fromjson(Map<String, dynamic> json) {
    return Model(
        id: json['id'],
        name: json['name'],
        user: json['username'],
        email: json['email'],
        number: json['phone'],
        website: json['website'],
        company: json['company']['name'],
        astreet: json['address']['street'],
        acity: json['address']['city'],
        azip: json['address']['zipcode']);
  }
}
