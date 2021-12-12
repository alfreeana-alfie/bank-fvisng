class User {
  int? id, status;
  String? name,
      email,
      phone,
      userType,
      roleType,
      roleId,
      branchId,
      profilePicture,
      email_verified_at,
      sms_verified_at,
      provider,
      provider_id,
      country_code;

  User(
      this.id,
      this.name,
      this.email,
      this.phone,
      this.roleType,
      this.roleId,
      this.branchId,
      this.status,
      this.profilePicture,
      this.email_verified_at,
      this.sms_verified_at,
      this.provider,
      this.provider_id,
      this.country_code);

  User.fromJSON(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        phone = json['phone'],
        roleType = json['roleType'],
        roleId = json['roleId'],
        branchId = json['branchId'],
        status = json['status'],
        profilePicture = json['profilePicture'],
        email_verified_at = json['email_verified_at'],
        sms_verified_at = json['sms_verified_at'],
        provider = json['provider'],
        provider_id = json['provider_id'],
        country_code = json['country_code'];
}
