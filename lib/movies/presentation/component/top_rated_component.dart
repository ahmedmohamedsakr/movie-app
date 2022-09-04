import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/core/utils/app_constance.dart';
import 'package:movies_app/core/utils/dummy.dart';
import 'package:movies_app/movies/presentation/controller/movies_cubit.dart';
import 'package:shimmer/shimmer.dart';

class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      buildWhen: (previous, current) => previous!=current,
      builder: (context, state) {
        log("Top Rated Builder");
        return FadeIn(
          duration: const Duration(milliseconds: 500),
          child: SizedBox(
            height: 170.0,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: MoviesCubit.get(context).topRatedMovies.length,
              itemBuilder: (context, index) {
                final movie = MoviesCubit.get(context).topRatedMovies[index];
                return Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: () {
                      /// TODO : NAVIGATE TO  MOVIE DETAILS
                    },
                    child: ClipRRect(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(8.0)),
                      child: CachedNetworkImage(
                        width: 120.0,
                        fit: BoxFit.cover,
                        imageUrl: AppConstance.imageUrl(movie.backdropPath),
                        placeholder: (context, url) =>
                            Shimmer.fromColors(
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
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
