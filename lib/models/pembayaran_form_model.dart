class PembayaranFormModel {
  final String? tagihan_pam_id;

  PembayaranFormModel({
    this.tagihan_pam_id,
  });

  PembayaranFormModel copyWith({
    String? tagihan_pam_id,
  }) =>
      PembayaranFormModel(
        tagihan_pam_id: tagihan_pam_id ?? this.tagihan_pam_id,
      );

  Map<String, dynamic> toJson() => {
        'tagihan_pam_id': tagihan_pam_id,
      };
}
