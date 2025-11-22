class CommunityModel {
  final String communityName;
  final String description;
  final String admin;
  final String adminMajorRole;
  final bool? isLocked;
  final int? groupLimit;

  CommunityModel({
    required this.communityName,
    required this.description,
    required this.admin,
    required this.adminMajorRole,
    this.isLocked,
    this.groupLimit,
  });

  factory CommunityModel.fromJson(Map<String, dynamic> json) {
    return CommunityModel(
      communityName: json["communityName"] ?? "",
      description: json["description"] ?? "",
      admin: json["admin"] ?? "",
      adminMajorRole: json["adminMajorRole"] ?? "",
      isLocked: json["access"]?["isLocked"],
      groupLimit: json["groupLimit"],
    );
  }
}
