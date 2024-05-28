import 'package:bank_sha/models/pam_model.dart';

class TagihanModel {
  final int id;
  final int userId;
  final int pamId;
  final String tanggalTagihan;
  final double harga;
  final String dueDate;
  final String statusPembayaran;
  final String? deletedAt;
  final String createdAt;
  final String updatedAt;
  final String meterAwal;
  final String meterAkhir;
  final String pemakaian;
  final PamModel noPam;

  TagihanModel({
    required this.id,
    required this.userId,
    required this.pamId,
    required this.tanggalTagihan,
    required this.harga,
    required this.dueDate,
    required this.statusPembayaran,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.meterAwal,
    required this.meterAkhir,
    required this.pemakaian,
    required this.noPam,
  });

  factory TagihanModel.fromJson(Map<String, dynamic> json) {
    return TagihanModel(
      id: json['id'],
      userId: json['user_id'],
      pamId: json['pam_id'],
      tanggalTagihan: json['tanggal_tagihan'],
      harga: double.parse(json['harga']),
      dueDate: json['due_date'],
      statusPembayaran: json['status_pembayaran'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      meterAwal: json['meter_awal'],
      meterAkhir: json['meter_akhir'],
      pemakaian: json['pemakaian'],
      noPam: PamModel.fromJson(json['no_pam']),
    );
  }
}
