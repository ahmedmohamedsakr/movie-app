import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/core/utils/app_constance.dart';
import 'package:movies_app/core/utils/dummy.dart';
import 'package:movies_app/movies/domain/entities/genres.dart';
import 'package:movies_app/movies/domain/entities/recommendations.dart';
import 'package:movies_app/movies/presentation/controller/movies_cubit.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_cubit.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_state.dart';
import 'package:shimmer/shimmer.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('movie detail builder');
    return BlocProvider(
      create: (context) => MoviesDetailsCubit()
        ..getMovieDetails(movieId: id)
        ..getMovieRecommendations(movieId: id),
      // lazy: false,
      child: const Scaffold(
        body: MovieDetailContent(),
      ),
    );
  }
}

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesDetailsCubit, MoviesDetailsState>(
      builder: (context, state) {
        // var movie = sl<MoviesDetailsCubit>().movieDetails;
        // var recommend = sl<MoviesDetailsCubit>().movieRecommendations;

        if (MoviesDetailsCubit.get(context).movieRecommendations !=[] &&MoviesDetailsCubit.get(context).movieDetails !=null) {
          return CustomScrollView(
            key: const Key('movieDetailScrollView'),
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 250.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: FadeIn(
                    duration: const Duration(milliseconds: 500),
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black,
                            Colors.black,
                            Colors.transparent,
                          ],
                          stops: [0.0, 0.5, 1.0, 1.0],
                        ).createShader(
                          Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                        );
                      },
                      blendMode: BlendMode.dstIn,
                      child: CachedNetworkImage(
                        width: MediaQuery.of(context).size.width,

                        ///backdropPath
                        imageUrl: AppConstance.imageUrl(
                            MoviesDetailsCubit.get(context)
                                .movieDetails!
                                .backdropPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: FadeInUp(
                  from: 20,
                  duration: const Duration(milliseconds: 500),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///title
                        Text(
                            MoviesDetailsCubit.get(context).movieDetails!.title,
                            style: GoogleFonts.poppins(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.2,
                            )),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2.0,
                                horizontal: 8.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text(
                                ///releaseDate
                                MoviesDetailsCubit.get(context)
                                    .movieDetails!
                                    .releaseDate
                                    .split('-')[0],
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20.0,
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  ///voteAverage
                                  (MoviesDetailsCubit.get(context)
                                      .movieDetails!
                                      .voteAverage /
                                      2)
                                      .toStringAsFixed(1),
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  ///voteAverage
                                  '(${MoviesDetailsCubit.get(context).movieDetails!.voteAverage})',
                                  style: const TextStyle(
                                    fontSize: 1.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 16.0),
                            Text(
                              ///showDuration
                              _showDuration(MoviesDetailsCubit.get(context)
                                  .movieDetails!
                                  .runtime),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          ///overview
                          MoviesDetailsCubit.get(context)
                              .movieDetails!
                              .overview,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          ///Genres
                          'Genres: ${_showGenres(MoviesDetailsCubit.get(context).movieDetails!.genres)}',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                sliver: SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      'More like this'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
              // Tab(text: 'More like this'.toUpperCase()),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),

                ///recommendations
                sliver: _showRecommendations(
                    MoviesDetailsCubit.get(context).movieRecommendations),
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  String _showGenres(List<Genres> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  Widget _showRecommendations(List<Recommendations> movieRecommendations) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final recommendation = movieRecommendations[index];
          return FadeInUp(
            from: 20,
            duration: const Duration(milliseconds: 500),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              child: CachedNetworkImage(
                imageUrl: AppConstance.imageUrl(recommendation.backdropPath!),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[850]!,
                  highlightColor: Colors.grey[800]!,
                  child: Container(
                    height: 170.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: 180.0,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        childCount: movieRecommendations.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.7,
        crossAxisCount: 3,
      ),
    );

    // if (state is MovieRecommendationSuccessState) {
    //   return SliverGrid(
    //     delegate: SliverChildBuilderDelegate(
    //       (context, index) {
    //         final recommendation =
    //             sl<MoviesDetailsCubit>().movieRecommendations[index];
    //         return FadeInUp(
    //           from: 20,
    //           duration: const Duration(milliseconds: 500),
    //           child: ClipRRect(
    //             borderRadius: const BorderRadius.all(Radius.circular(4.0)),
    //             child: CachedNetworkImage(
    //               imageUrl:
    //                   AppConstance.imageUrl(recommendation.backdropPath!),
    //               placeholder: (context, url) => Shimmer.fromColors(
    //                 baseColor: Colors.grey[850]!,
    //                 highlightColor: Colors.grey[800]!,
    //                 child: Container(
    //                   height: 170.0,
    //                   width: 120.0,
    //                   decoration: BoxDecoration(
    //                     color: Colors.black,
    //                     borderRadius: BorderRadius.circular(8.0),
    //                   ),
    //                 ),
    //               ),
    //               errorWidget: (context, url, error) =>
    //                   const Icon(Icons.error),
    //               height: 180.0,
    //               fit: BoxFit.cover,
    //             ),
    //           ),
    //         );
    //       },
    //       childCount: sl<MoviesDetailsCubit>().movieRecommendations.length,
    //     ),
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //       mainAxisSpacing: 8.0,
    //       crossAxisSpacing: 8.0,
    //       childAspectRatio: 0.7,
    //       crossAxisCount: 3,
    //     ),
    //   );
    // } else if (state is MovieRecommendationErrorState) {
    //   return Center(child: Text(state.error));
    // } else {
    //   return const Center(
    //     child: CircularProgressIndicator(),
    //   );
    // }
  }
}
