import 'dart:math';

class UserModel {
  String? email;
  List<Equipment>? equipment;
  String? userId;
  String? gymName;
  String? image;
  String? lastActive;
  String? location;
  String? logo;
  String? name;
  String? ofMember;
  String? ofPremises;
  String? role;
  bool? status;
  String? website;
  String? experienceLevel;
  

  UserModel({
    this.email,
    this.equipment,
    this.userId,
    this.gymName,
    this.image,
    this.lastActive,
    this.location,
    this.logo,
    this.name,
    this.ofMember,
    this.ofPremises,
    this.role,
    this.status,
    this.website,
    this.experienceLevel
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      equipment: List<Equipment>.from(json['equipment'].map((x) => Equipment.fromJson(x))),
      userId: json['user_id'],
      gymName: json['gym_name'],
      image: json['image'],
      lastActive: json['last_active'],
      location: json['location'],
      logo: json['logo'],
      name: json['name'],
      ofMember: json['of_member'],
      ofPremises: json['of_premises'],
      role: json['role'],
      status: json['status'],
      website: json['website'],
      experienceLevel: json['experiance_level'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'equipment': equipment?.map((e) => e.toJson()).toList(),
      'user_id': userId,
      'gym_name': gymName,
      'image': image,
      'last_active': lastActive,
      'location': location,
      'logo': logo,
      'name': name,
      'of_member': ofMember,
      'of_premises': ofPremises,
      'role': role,
      'status': status,
      'website': website,
      'experiance_level': experienceLevel,
    };
  }
}

class Equipment {
  bool? connectivity;
  String? equipmentId;
  String? qrCode;
  String? userID;

  Equipment({
    this.connectivity,
    this.equipmentId,
    this.qrCode,
    this.userID
  });

  factory Equipment.fromJson(Map<String, dynamic> json) {
    return Equipment(
      connectivity: json['connectivity'],
      equipmentId: json['equipment_id'],
      qrCode: json['qr_code'],
      userID: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'connectivity': connectivity,
      'equipment_id': equipmentId,
      'qr_code': qrCode,
      'user_id': userID,
    };
  }
}
