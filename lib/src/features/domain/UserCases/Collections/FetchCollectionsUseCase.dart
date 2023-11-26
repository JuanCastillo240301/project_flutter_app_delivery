

import 'package:project_flutter_app_delivery/src/features/data/Repositories/Collections/CollectionsRepository.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Collections/CollectionsEntity.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Interfaces/Interfaces.dart';

abstract class FetchCollectionUseCase {
  Future<CollectionsEntity> execute();
}

class DefaultFetchCollectionUseCase extends FetchCollectionUseCase {
  
  // * Dependencies
  final CollectionsRepository _collectionsRepository;

  DefaultFetchCollectionUseCase({ CollectionsRepository? collectionsRepository })
      : _collectionsRepository =
            collectionsRepository ?? DefaultCollectionsRepository();

  @override
  Future<CollectionsEntity> execute() async {
    final response = await _collectionsRepository.fetchCollections();
    return CollectionsEntity.fromMap(response.toMap());
  }
}
