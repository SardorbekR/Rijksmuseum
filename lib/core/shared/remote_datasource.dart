abstract class RemoteDataSource<T, ParamType> {
  Future<T> getData(ParamType param);
}
