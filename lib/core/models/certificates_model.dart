class CertificatesModel {
  final String course;
  final String issuedBy;
  final Uri viewCredential;
  final String image;
  CertificatesModel(
      {required this.issuedBy,
      required this.viewCredential,
      required this.image,
      required this.course});
}
