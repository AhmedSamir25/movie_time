import 'package:go_router/go_router.dart';
import 'package:movietime/features/home/data/model/movie_model.dart';
import 'package:movietime/features/home/presentation/view/home_view.dart';
import 'package:movietime/features/home_detils/presentation/view/home_view_detils.dart';

abstract class AppRouter {
  static const detailsView = '/detailsView';
  static final router = GoRouter(routes: [
    GoRoute(
    path: '/',
  builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: detailsView,
    builder: (context, state) =>  HomeDetilsView(
      movieModel: state.extra as MovieModel,
    ),
    ),
  ]
  );
}