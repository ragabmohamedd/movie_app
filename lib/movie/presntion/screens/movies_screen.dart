import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapp/core/services/service_locator.dart';
import 'package:moviesapp/core/utils/app_string.dart';
import 'package:moviesapp/movie/presntion/components/now_playing_component.dart';
import 'package:moviesapp/movie/presntion/components/popular_component.dart';
import 'package:moviesapp/movie/presntion/components/top_rated_component.dart';
import 'package:moviesapp/movie/presntion/controller/movies/movies_bloc.dart';
import 'package:moviesapp/movie/presntion/controller/movies/movies_event.dart';
import 'package:moviesapp/movie/presntion/controller/movies/movies_state.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MoviesBloc(sl(), sl(), sl())
          ..add(GetNowPlayingMoviesEvent())
          ..add(GetpoPularMoviesEvent())
          ..add(GetTopRatedMoviesEvent()),
        child: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            return SingleChildScrollView(
              key: const Key('movieScrollView'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NowPlayingComponent(),

                  Container(
                    margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.topRated,
                          style: GoogleFonts.poppins(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            /// TODO : NAVIGATION TO POPULAR SCREEN
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Text(AppString.seeMore),
                                Icon(Icons.arrow_forward_ios, size: 16.0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  PopularComponent(),

                  Container(
                    margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.topRated,
                          style: GoogleFonts.poppins(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            /// TODO : NAVIGATION TO Top Rated Movies Screen
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Text('See More'),
                                Icon(Icons.arrow_forward_ios, size: 16.0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  TopRatedComponent(),

                  const SizedBox(height: 50.0),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
