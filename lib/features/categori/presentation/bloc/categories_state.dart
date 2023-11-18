part of 'categories_bloc.dart';

@immutable
class CategoriesState extends Equatable{
  final List<dynamic>? categoriesList;
  final FormzSubmissionStatus? status;
  const CategoriesState({this.status,this.categoriesList});
  CategoriesState copyWith({
    final List<dynamic>? categoriesList,
    final FormzSubmissionStatus? status,
})=>CategoriesState(
    categoriesList:categoriesList??this.categoriesList,
    status:status??this.status,
  );
  @override
  List<Object?> get props => [categoriesList,status];
}


