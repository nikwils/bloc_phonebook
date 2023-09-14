part of 'post_bloc.dart';

enum PostStatus { initial, success, failure }

final class PostState extends Equatable {
  const PostState({
    this.status = PostStatus.initial,
    this.post,
  });

  final PostStatus status;
  final Result? post;

  PostState copyWith({
    PostStatus? status,
    Result? post,
    bool? hasReachedMax,
  }) {
    return PostState(
      status: status ?? this.status,
      post: post,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status,  posts: $post }''';
  }

  @override
  List<Object> get props => [status, post ?? Object()];
}
