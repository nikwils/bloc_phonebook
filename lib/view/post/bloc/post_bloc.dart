import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:phonebook_bloc/data/models/user_model.dart';

part 'post_event.dart';
part 'post_state.dart';

const throttleDuration = Duration(milliseconds: 100);
int page = 1;

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required this.httpClient, required this.postId})
      : super(const PostState()) {
    on<PostFetched>(
      _onPostFetched,
    );
  }

  final http.Client httpClient;
  final String postId;

  Future<void> _onPostFetched(
    PostFetched event,
    Emitter<PostState> emit,
  ) async {
    try {
      if (state.status == PostStatus.initial) {
        final Result post = await _fetchPost(id: postId);
        return emit(
          state.copyWith(
            status: PostStatus.success,
            post: post,
          ),
        );
      }
    } catch (_) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

  Future<Result> _fetchPost({required String id}) async {
    final url = Uri.parse(
        'https://randomuser.me/api/?inc=id,name,picture,phone&nat=in&value=$id');

    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        final data = ListUserModel.fromJson(response.body);
        return data.results.first;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    throw Exception('error fetching posts');
  }
}
