import 'package:dicionario_mobile/@core/injects/injects.dart';
import 'package:dicionario_mobile/@core/routes/app_named_routes.dart';
import 'package:dicionario_mobile/application/usecases/get_word_details/get_word_details_usecase.dart';
import 'package:dicionario_mobile/application/usecases/get_words_list/get_words_list_usecase.dart';
import 'package:dicionario_mobile/presenter/cubits/word_details/word_details_cubit.dart';
import 'package:dicionario_mobile/presenter/cubits/words/words_cubit.dart';
import 'package:dicionario_mobile/presenter/ui/pages/word_details_page.dart';
import 'package:dicionario_mobile/presenter/ui/pages/words_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppNamedRoutes.initialRoute: (context) => BlocProvider<WordsCubit>(
          create: (context) => WordsCubit(
            getWordsListUsecase: locator.call<GetWordsListUsecase>(),
          ),
          child: const WordsPage(),
        ),
    AppNamedRoutes.wordDetails: (context) => BlocProvider<WordDetailsCubit>(
          create: (context) => WordDetailsCubit(
            getWordDetailsUsecase: locator.call<GetWordDetailsUsecase>(),
          ),
          child: const WordDetailsPage(),
        ),
  };
}
