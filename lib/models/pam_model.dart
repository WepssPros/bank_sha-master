class PamModel {
  final int? id;
  final String? no_pam;
  final String? atas_nama;
  final String? tipe;
  final String? meter;
  final String? createdAt;
  final String? updatedAt;

  PamModel({
    this.id,
    this.no_pam,
    this.atas_nama,
    this.tipe,
    this.meter,
    this.createdAt,
    this.updatedAt,
  });

  factory PamModel.fromJson(Map<String, dynamic> json) => PamModel(
        id: json['id'],
        no_pam: json['no_pam'],
        atas_nama: json['atas_nama'],
        tipe: json['tipe'],
        meter: json['meter'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );
}
