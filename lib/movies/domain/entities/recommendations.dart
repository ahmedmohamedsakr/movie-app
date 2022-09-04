class Recommendations {
  final int id;
  final String ?backdropPath;

  const Recommendations({required this.id,this.backdropPath});

  List<Object?> get props => [id, backdropPath];
}
