part of 'posts_bloc.dart';

enum PostsStatus { initial, success, failure }

final class PostState extends Equatable {
  const PostState({
    this.status = PostsStatus.initial,
    this.posts = const <Result>[],
    this.hasReachedMax = false,
  });

  final PostsStatus status;
  final List<Result> posts;
  final bool hasReachedMax;

  PostState copyWith({
    PostsStatus? status,
    List<Result>? posts,
    bool? hasReachedMax,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, posts: ${posts.length} }''';
  }

  @override
  List<Object> get props => [status, posts, hasReachedMax];
}
