import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:tv/presentation/bloc/tv_bloc.dart';
import 'package:tv/presentation/widgets/tv_card_list.dart';

class TopRatedTVPage extends StatefulWidget {
  const TopRatedTVPage({super.key});

  @override
  State<TopRatedTVPage> createState() => _TopRatedTVPageState();
}

class _TopRatedTVPageState extends State<TopRatedTVPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<GetTopRatedTVBloc>().add(OnTopRatedTV()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated TV Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<GetTopRatedTVBloc, TVState>(
          builder: (context, state) {
            if (state is TVLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TVHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = state.result[index];
                  return TVCard(tv);
                },
                itemCount: state.result.length,
              );
            } else {
              return const Center(
                key: Key('error_message'),
                child: Text('Failed'),
              );
            }
          },
        ),
      ),
    );
  }
}
