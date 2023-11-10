class BannersData {
  final int? id;
  final String? image;

  BannersData(this.id, this.image);

  @override
  List<Object?> get props => [id, image];
}