import 'dart:convert';
import 'package:bank_sha/models/pembayaran_form_model.dart';
import 'package:bank_sha/models/tagihan_model.dart';
import 'package:bank_sha/services/auth_service.dart';
import 'package:http/http.dart' as http;

class TagihanService {
  final String baseUrl = 'http://103.186.1.163/api';

  Future<List<TagihanModel>> getTagihans() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/tagihanpams?limit=1'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      print(res.body);

      if (res.statusCode == 200) {
        List<TagihanModel> tagihans = List<TagihanModel>.from(
          jsonDecode(res.body)['data'].map(
            (tagihan) => TagihanModel.fromJson(tagihan),
          ),
        ).toList();

        return tagihans;
      }

      return throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> pembayarans(PembayaranFormModel data) async {
    try {
      print(data.toJson());
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/pembayaran'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: data.toJson(),
      );

      print(res.body);
      print(res.statusCode);

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
