import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:phonebook_bloc/data/models/user_model.dart';

part 'posts_event.dart';
part 'posts_state.dart';

const throttleDuration = Duration(milliseconds: 100);
int page = 1;

class PostsBloc extends Bloc<PostEvent, PostState> {
  PostsBloc({required this.httpClient}) : super(const PostState()) {
    on<PostFetched>(
      _onPostFetched,
      transformer: droppable(),
    );
  }

  final http.Client httpClient;

  Future<void> _onPostFetched(
    PostFetched event,
    Emitter<PostState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == PostsStatus.initial) {
        final posts = await _fetchPosts();
        return emit(
          state.copyWith(
            status: PostsStatus.success,
            posts: posts,
            hasReachedMax: false,
          ),
        );
      }

      final List<Result> posts = await _fetchPosts(state.posts.length);
      posts.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: PostsStatus.success,
                posts: List.of(state.posts)..addAll(posts),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: PostsStatus.failure));
    }
  }

  Future<List<Result>> _fetchPosts([int startIndex = 0]) async {
    final url = Uri.parse(
        'https://randomuser.me/api/?results=20&inc=id,name,picture,phone&nat=in&page=$page');

    final response = await http.get(url);
    page += 1;
    try {
      if (response.statusCode == 200) {
        final data = ListUserModel.fromJson(response.body);
        return data.results;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    throw Exception('error fetching posts');
  }
}
