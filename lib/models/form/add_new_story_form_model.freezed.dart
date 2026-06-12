// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_new_story_form_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddNewStoryFormModel {

 String? get headline; String? get description; XFile? get photo; double? get lat; double? get lon;
/// Create a copy of AddNewStoryFormModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddNewStoryFormModelCopyWith<AddNewStoryFormModel> get copyWith => _$AddNewStoryFormModelCopyWithImpl<AddNewStoryFormModel>(this as AddNewStoryFormModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddNewStoryFormModel&&(identical(other.headline, headline) || other.headline == headline)&&(identical(other.description, description) || other.description == description)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon));
}


@override
int get hashCode => Object.hash(runtimeType,headline,description,photo,lat,lon);

@override
String toString() {
  return 'AddNewStoryFormModel(headline: $headline, description: $description, photo: $photo, lat: $lat, lon: $lon)';
}


}

/// @nodoc
abstract mixin class $AddNewStoryFormModelCopyWith<$Res>  {
  factory $AddNewStoryFormModelCopyWith(AddNewStoryFormModel value, $Res Function(AddNewStoryFormModel) _then) = _$AddNewStoryFormModelCopyWithImpl;
@useResult
$Res call({
 String? headline, String? description, XFile? photo, double? lat, double? lon
});




}
/// @nodoc
class _$AddNewStoryFormModelCopyWithImpl<$Res>
    implements $AddNewStoryFormModelCopyWith<$Res> {
  _$AddNewStoryFormModelCopyWithImpl(this._self, this._then);

  final AddNewStoryFormModel _self;
  final $Res Function(AddNewStoryFormModel) _then;

/// Create a copy of AddNewStoryFormModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? headline = freezed,Object? description = freezed,Object? photo = freezed,Object? lat = freezed,Object? lon = freezed,}) {
  return _then(_self.copyWith(
headline: freezed == headline ? _self.headline : headline // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as XFile?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddNewStoryFormModel].
extension AddNewStoryFormModelPatterns on AddNewStoryFormModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddNewStoryFormModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddNewStoryFormModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddNewStoryFormModel value)  $default,){
final _that = this;
switch (_that) {
case _AddNewStoryFormModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddNewStoryFormModel value)?  $default,){
final _that = this;
switch (_that) {
case _AddNewStoryFormModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? headline,  String? description,  XFile? photo,  double? lat,  double? lon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddNewStoryFormModel() when $default != null:
return $default(_that.headline,_that.description,_that.photo,_that.lat,_that.lon);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? headline,  String? description,  XFile? photo,  double? lat,  double? lon)  $default,) {final _that = this;
switch (_that) {
case _AddNewStoryFormModel():
return $default(_that.headline,_that.description,_that.photo,_that.lat,_that.lon);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? headline,  String? description,  XFile? photo,  double? lat,  double? lon)?  $default,) {final _that = this;
switch (_that) {
case _AddNewStoryFormModel() when $default != null:
return $default(_that.headline,_that.description,_that.photo,_that.lat,_that.lon);case _:
  return null;

}
}

}

/// @nodoc


class _AddNewStoryFormModel implements AddNewStoryFormModel {
  const _AddNewStoryFormModel({this.headline, this.description, this.photo, this.lat, this.lon});
  

@override final  String? headline;
@override final  String? description;
@override final  XFile? photo;
@override final  double? lat;
@override final  double? lon;

/// Create a copy of AddNewStoryFormModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddNewStoryFormModelCopyWith<_AddNewStoryFormModel> get copyWith => __$AddNewStoryFormModelCopyWithImpl<_AddNewStoryFormModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddNewStoryFormModel&&(identical(other.headline, headline) || other.headline == headline)&&(identical(other.description, description) || other.description == description)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon));
}


@override
int get hashCode => Object.hash(runtimeType,headline,description,photo,lat,lon);

@override
String toString() {
  return 'AddNewStoryFormModel(headline: $headline, description: $description, photo: $photo, lat: $lat, lon: $lon)';
}


}

/// @nodoc
abstract mixin class _$AddNewStoryFormModelCopyWith<$Res> implements $AddNewStoryFormModelCopyWith<$Res> {
  factory _$AddNewStoryFormModelCopyWith(_AddNewStoryFormModel value, $Res Function(_AddNewStoryFormModel) _then) = __$AddNewStoryFormModelCopyWithImpl;
@override @useResult
$Res call({
 String? headline, String? description, XFile? photo, double? lat, double? lon
});




}
/// @nodoc
class __$AddNewStoryFormModelCopyWithImpl<$Res>
    implements _$AddNewStoryFormModelCopyWith<$Res> {
  __$AddNewStoryFormModelCopyWithImpl(this._self, this._then);

  final _AddNewStoryFormModel _self;
  final $Res Function(_AddNewStoryFormModel) _then;

/// Create a copy of AddNewStoryFormModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? headline = freezed,Object? description = freezed,Object? photo = freezed,Object? lat = freezed,Object? lon = freezed,}) {
  return _then(_AddNewStoryFormModel(
headline: freezed == headline ? _self.headline : headline // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as XFile?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
