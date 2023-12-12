
class Lexica {
  final String id;
  final String promptid;
  final int width;
  final int height;
  final String userid;

  Lexica({
    required this.id,
    required this.promptid,
    required this.width,
    required this.height,
    required this.userid,
  });

  factory Lexica.fromJson(Map<String, dynamic> json) {
    return Lexica(
      id: json['id'],
      promptid: json['promptid'],
      width: json['width'],
      height: json['height'],
      userid: json['userid'],
    );
  }
}
