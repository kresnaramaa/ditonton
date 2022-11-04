import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:search/domain/usecases/search_tv.dart';
import 'package:tv/domain/entities/tv.dart';

part 'search_tv_event.dart';
part 'search_tv_state.dart';

class SearchTVBloc extends Bloc<SearchTvEvent, SearchTvState> {
  final SearchTV _searchTv;

  SearchTVBloc(this._searchTv) : super(SearchTvEmpty()) {
    on<OnQueryTvChanged>(
      (event, emit) async {
        final query = event.query;

        emit(SearchTvLoading());
        final result = await _searchTv.execute(query);

        result.fold(
          (failure) {
            emit(SearchTvError(failure.message));
          },
          (data) {
            emit(SearchTvHasData(data));
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
