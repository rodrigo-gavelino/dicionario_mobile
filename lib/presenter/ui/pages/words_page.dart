import 'package:dicionario_mobile/@core/routes/app_named_routes.dart';
import 'package:dicionario_mobile/presenter/cubits/words/words_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordsPage extends StatefulWidget {
  const WordsPage({super.key});

  @override
  State<WordsPage> createState() => _WordsPageState();
}

class _WordsPageState extends State<WordsPage> {
  late WordsCubit _wordsCubit;

  @override
  void initState() {
    super.initState();
    _wordsCubit = context.read<WordsCubit>()..getWordsList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(
              text: 'Words List',
            ),
            Tab(
              text: 'History',
            ),
            Tab(
              text: 'Favorites',
            ),
          ]),
        ),
        body: BlocBuilder<WordsCubit, WordsState>(
          bloc: _wordsCubit,
          builder: (context, state) {
            if (state is WordsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WordsLoadedState) {
              return TabBarView(
                children: [
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: state.words.words.length,
                    itemBuilder: (context, index) {
                      final word = state.words.words[index];
                      return GridTile(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppNamedRoutes.wordDetails,
                              arguments: word.word,
                            );
                          },
                          child: Card(
                            child: Center(
                              child: Text(word.word),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: state.words.words.length,
                    itemBuilder: (context, index) {
                      final word = state.words.words[index];
                      return GridTile(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppNamedRoutes.wordDetails,
                              arguments: word.word,
                            );
                          },
                          child: Card(
                            child: Center(
                              child: Text(word.word),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: state.words.words.length,
                    itemBuilder: (context, index) {
                      final word = state.words.words[index];
                      return GridTile(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppNamedRoutes.wordDetails,
                              arguments: word.word,
                            );
                          },
                          child: Card(
                            child: Center(
                              child: Text(word.word),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            } else if (state is WordsErrorState) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
