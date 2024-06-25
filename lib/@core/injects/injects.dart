import 'dart:io';

import 'package:dicionario_mobile/@core/externals/cache/cache_adapter.dart';
import 'package:dicionario_mobile/@core/externals/cache/cache_adapter_impl.dart';
import 'package:dicionario_mobile/@core/externals/client/client_adapter.dart';
import 'package:dicionario_mobile/@core/externals/client/client_adapter_impl.dart';
import 'package:dicionario_mobile/application/usecases/get_word_details/get_word_details_usecase.dart';
import 'package:dicionario_mobile/application/usecases/get_word_details/get_word_details_usecase_impl.dart';
import 'package:dicionario_mobile/application/usecases/get_words_list/get_words_list_usecase.dart';
import 'package:dicionario_mobile/application/usecases/get_words_list/get_words_list_usecase_impl.dart';
import 'package:dicionario_mobile/domain/repositories/words_repository.dart';
import 'package:dicionario_mobile/infrastructure/datasources/get_word_details/local/get_local_word_details_datasource.dart';
import 'package:dicionario_mobile/infrastructure/datasources/get_word_details/local/get_local_word_details_datasource_impl.dart';
import 'package:dicionario_mobile/infrastructure/datasources/get_word_details/remote/get_remote_word_details_datasource.dart';
import 'package:dicionario_mobile/infrastructure/datasources/get_word_details/remote/get_remote_word_details_datasource_impl.dart';
import 'package:dicionario_mobile/infrastructure/datasources/get_words_list/get_words_list_datasource.dart';
import 'package:dicionario_mobile/infrastructure/datasources/get_words_list/get_words_list_datasource_impl.dart';
import 'package:dicionario_mobile/infrastructure/repositories/words_repository_impl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<HttpClient>(HttpClient());

  locator.registerSingleton<ClientAdapter>(
      ClientAdapterImpl(httpClient: locator.call<HttpClient>()));

  locator.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());

  locator.registerSingleton<CacheAdapter>(
    CacheAdapterImpl(storage: locator.call<FlutterSecureStorage>()),
  );

  locator.registerFactory<GetWordsListDatasource>(
    () => GetWordsListDatasourceImpl(),
  );
  locator.registerFactory<GetRemoteWordDetailsDatasource>(
    () => GetRemoteWordDetailsDatasourceImpl(
      client: locator.call<ClientAdapter>(),
      cacheAdapter: locator.call<CacheAdapter>(),
    ),
  );

  locator.registerFactory<GetLocalWordDetailsDatasource>(
    () => GetLocalWordDetailsDatasourceImpl(
      cacheAdapter: locator.call<CacheAdapter>(),
    ),
  );
  locator.registerFactory<WordsRepository>(
    () => WordsRepositoryImpl(
      getWordsListDatasource: locator.call<GetWordsListDatasource>(),
      getRemoteWordDetailsDatasource:
          locator.call<GetRemoteWordDetailsDatasource>(),
      getLocalWordDetailsDatasource:
          locator.call<GetLocalWordDetailsDatasource>(),
    ),
  );
  locator.registerFactory<GetWordsListUsecase>(
    () => GetWordsListUsecaseImpl(
      wordsRepository: locator.call<WordsRepository>(),
    ),
  );
  locator.registerFactory<GetWordDetailsUsecase>(
    () => GetWordDetailsUsecaseImpl(
      wordsRepository: locator.call<WordsRepository>(),
    ),
  );
}
