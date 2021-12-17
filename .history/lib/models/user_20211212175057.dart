class User {
  int? id, status;
  String? name,
      email,
      phone,
      userType,
      roleType,
      roledID,
      branch_id,
      profile_picture,
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
      this.role_type,
      this.role_id,
      this.branch_id,
      this.status,
      this.profile_picture,
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
        role_type = json['role_type'],
        role_id = json['role_id'],
        branch_id = json['branch_id'],
        status = json['status'],
        profile_picture = json['profile_picture'],
        email_verified_at = json['email_verified_at'],
        sms_verified_at = json['sms_verified_at'],
        provider = json['provider'],
        provider_id = json['provider_id'],
        country_code = json['country_code'];
}