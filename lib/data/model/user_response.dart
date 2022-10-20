class UserResponse {
  int? status;
  String? message;
  UserData? data;

  UserResponse({this.status, this.message, this.data});

  UserResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserData {
  String? iduser;
  String? userName;
  String? userEmail;
  String? userFoto;
  String? userAsalSekolah;
  String? dateCreate;
  String? jenjang;
  String? userGender;
  String? userStatus;

  UserData(
      {this.iduser,
      this.userName,
      this.userEmail,
      this.userFoto,
      this.userAsalSekolah,
      this.dateCreate,
      this.jenjang,
      this.userGender,
      this.userStatus});

  UserData.fromJson(Map<String, dynamic> json) {
    iduser = json['iduser'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userFoto = json['user_foto'];
    userAsalSekolah = json['user_asal_sekolah'];
    dateCreate = json['date_create'];
    jenjang = json['jenjang'];
    userGender = json['user_gender'];
    userStatus = json['user_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iduser'] = iduser;
    data['user_name'] = userName;
    data['user_email'] = userEmail;
    data['user_foto'] = userFoto;
    data['user_asal_sekolah'] = userAsalSekolah;
    data['date_create'] = dateCreate;
    data['jenjang'] = jenjang;
    data['user_gender'] = userGender;
    data['user_status'] = userStatus;
    return data;
  }
}
