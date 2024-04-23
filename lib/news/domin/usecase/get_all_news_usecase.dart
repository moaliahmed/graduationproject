import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/network_error/failure.dart';
import 'package:graduation_project/news/domin/repository/base_news_repository.dart';

import '../entites/news.dart';

class GetAllNewsUsecase {
  final BaseNewsRepository baseNewsRepository;

  GetAllNewsUsecase(this.baseNewsRepository);

  Future<Either<Failure, News>> call() async {
    return await baseNewsRepository.getAllNews();
  }
}
