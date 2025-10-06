import 'package:myfirstlove/src/domain/models/Role.dart';

class User {
    int? id;
    String name;
    String lastname;
    String? email;
    String phone;
    String? password;
    String? image;
    String? notificationToken;
    List<Role>? roles;

    User({
        this.id,
        required this.name,
        required this.lastname,
        this.email,
        required this.phone,
        this.password,
        this.image,
        this.notificationToken,
        this.roles,
    });
 
    //metodo que construye la respuesta del backend
    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"] ?? '',
        phone: json["phone"],
        password: json["password"] ?? '',
        image: json["image"] ?? '',
        notificationToken: json["notification_token"] ?? '',
        roles: json["roles"]!=null ?
        List<Role>.from(json["roles"].map((x) => Role.fromJson(x))):
        [],
    );
   //metodo que envia la informacion al backend
    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = <String, dynamic>{};
      data["name"] = name;
      data["lastname"] = lastname;  
      data["email"] = email;
      data["phone"] = phone;
      if(password != null && password != ''){
        data["password"] = password;
      }
      if(image != null && image != ''){
        data["image"] = image;
      }
      if(notificationToken != null && notificationToken != ''){
        data["notification_token"] = notificationToken;
      }
      if(id != null){
        data["id"] = id;
      }
      return data;

    }
}


