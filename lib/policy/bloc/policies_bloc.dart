import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mimi/locator.dart';
import 'package:mimi/policy/repository/policieis_repository_impl.dart';
import 'package:mimi/utils/base_model.dart';
import './bloc.dart';

class PoliciesBloc extends Bloc<PoliciesEvent, PoliciesState> {

  final _repository = locator<PoliciesRepositoryImpl>();

  @override
  PoliciesState get initialState => LoadingPoliciesState();

  @override
  Stream<PoliciesState> mapEventToState(
    PoliciesEvent event,
  ) async* {

    if(event is FetchAllPoliciesEvent){
      yield LoadingPoliciesState();

      try {
        var snapshot = await _repository.getPolicies(event.busId);
        var policies = BaseModel.fromSnapshot(snapshot, 'Policies').items;
        yield FetchAllPoliciesState(polices: policies);
        
      } catch (e) {
        yield e is ErrorPoliciesState ? ErrorPoliciesState(error: e.error) : ErrorPoliciesState(error: 'Not backend error');
      }
    }
  }
}
