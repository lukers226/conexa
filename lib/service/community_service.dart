import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/community_model.dart';

class CommunityService {
  static const String baseUrl = "http://192.168.2.182:5000/api/community";

  Future<List<CommunityModel>> getAllCommunities() async {
    final url = Uri.parse("$baseUrl/all");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => CommunityModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load communities");
    }
  }
}
