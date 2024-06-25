import 'package:dicionario_mobile/presenter/cubits/word_details/word_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordDetailsPage extends StatefulWidget {
  const WordDetailsPage({super.key});

  @override
  State<WordDetailsPage> createState() => _WordDetailsPageState();
}

class _WordDetailsPageState extends State<WordDetailsPage> {
  late WordDetailsCubit _wordDetailsCubit;

  @override
  void initState() {
    super.initState();
    _wordDetailsCubit = context.read<WordDetailsCubit>();
    Future.microtask(() {
      final args = ModalRoute.of(context)!.settings.arguments;
      _wordDetailsCubit.getWordDetails(args as String);
    });
  }

  @override
  Widget build(BuildContext context) {
    final word = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        title: Text(word ?? ''),
      ),
      body: BlocBuilder<WordDetailsCubit, WordDetailsState>(
        bloc: _wordDetailsCubit,
        builder: (context, state) {
          if (state is WordDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WordDetailsLoaded) {
            return Center(
              child: Text(state.wordDetails.word),
            );
          } else if (state is WordDetailsError) {
            return Center(
              child: Text(state.message),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
