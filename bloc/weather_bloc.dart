import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutterxkrishno_2/models/models.dart';
import 'package:flutterxkrishno_2/repositories/repositories.dart';
import './bloc.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc( this.weatherRepository): assert(weatherRepository !=null);

  


  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
  if (event is FetchWeather){
    yield WeatherLoading();
    try {
      final Weather weather =await weatherRepository.getWeather(event.city);
      yield WeatherLoaded(weather:weather);

    }catch(_){
      yield WeatherError();
    }
  }
  }

  @override
 
  WeatherState get initialState => WeatherEmpty();
}
