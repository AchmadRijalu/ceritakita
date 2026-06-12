// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_story_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DetailStoryModel {

 bool get error; String get message;@JsonKey(name: 'story') DetailStoryResult get detailStoryResult;
/// Create a copy of DetailStoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailStoryModelCopyWith<DetailStoryModel> get copyWith => _$DetailStoryModelCopyWithImpl<DetailStoryModel>(this as DetailStoryModel, _$identity);

  /// Serializes this DetailStoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailStoryModel&&(identical(other.error, error) || other.error == error)&&(identical(other.message, message) || other.message == message)&&(identical(other.detailStoryResult, detailStoryResult) || other.detailStoryResult == detailStoryResult));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,message,detailStoryResult);

@override
String toString() {
  return 'DetailStoryModel(error: $error, message: $message, detailStoryResult: $detailStoryResult)';
}


}

/// @nodoc
abstract mixin class $DetailStoryModelCopyWith<$Res>  {
  factory $DetailStoryModelCopyWith(DetailStoryModel value, $Res Function(DetailStoryModel) _then) = _$DetailStoryModelCopyWithImpl;
@useResult
$Res call({
 bool error, String message,@JsonKey(name: 'story') DetailStoryResult detailStoryResult
});


$DetailStoryResultCopyWith<$Res> get detailStoryResult;

}
/// @nodoc
class _$DetailStoryModelCopyWithImpl<$Res>
    implements $DetailStoryModelCopyWith<$Res> {
  _$DetailStoryModelCopyWithImpl(this._self, this._then);

  final DetailStoryModel _self;
  final $Res Function(DetailStoryModel) _then;

/// Create a copy of DetailStoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? error = null,Object? message = null,Object? detailStoryResult = null,}) {
  return _then(_self.copyWith(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,detailStoryResult: null == detailStoryResult ? _self.detailStoryResult : detailStoryResult // ignore: cast_nullable_to_non_nullable
as DetailStoryResult,
  ));
}
/// Create a copy of DetailStoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetailStoryResultCopyWith<$Res> get detailStoryResult {
  
  return $DetailStoryResultCopyWith<$Res>(_self.detailStoryResult, (value) {
    return _then(_self.copyWith(detailStoryResult: value));
  });
}
}


/// Adds pattern-matching-related methods to [DetailStoryModel].
extension DetailStoryModelPatterns on DetailStoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailStoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailStoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailStoryModel value)  $default,){
final _that = this;
switch (_that) {
case _DetailStoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailStoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _DetailStoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool error,  String message, @JsonKey(name: 'story')  DetailStoryResult detailStoryResult)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailStoryModel() when $default != null:
return $default(_that.error,_that.message,_that.detailStoryResult);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool error,  String message, @JsonKey(name: 'story')  DetailStoryResult detailStoryResult)  $default,) {final _that = this;
switch (_that) {
case _DetailStoryModel():
return $default(_that.error,_that.message,_that.detailStoryResult);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool error,  String message, @JsonKey(name: 'story')  DetailStoryResult detailStoryResult)?  $default,) {final _that = this;
switch (_that) {
case _DetailStoryModel() when $default != null:
return $default(_that.error,_that.message,_that.detailStoryResult);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetailStoryModel implements DetailStoryModel {
  const _DetailStoryModel({required this.error, required this.message, @JsonKey(name: 'story') required this.detailStoryResult});
  factory _DetailStoryModel.fromJson(Map<String, dynamic> json) => _$DetailStoryModelFromJson(json);

@override final  bool error;
@override final  String message;
@override@JsonKey(name: 'story') final  DetailStoryResult detailStoryResult;

/// Create a copy of DetailStoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailStoryModelCopyWith<_DetailStoryModel> get copyWith => __$DetailStoryModelCopyWithImpl<_DetailStoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailStoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailStoryModel&&(identical(other.error, error) || other.error == error)&&(identical(other.message, message) || other.message == message)&&(identical(other.detailStoryResult, detailStoryResult) || other.detailStoryResult == detailStoryResult));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,message,detailStoryResult);

@override
String toString() {
  return 'DetailStoryModel(error: $error, message: $message, detailStoryResult: $detailStoryResult)';
}


}

/// @nodoc
abstract mixin class _$DetailStoryModelCopyWith<$Res> implements $DetailStoryModelCopyWith<$Res> {
  factory _$DetailStoryModelCopyWith(_DetailStoryModel value, $Res Function(_DetailStoryModel) _then) = __$DetailStoryModelCopyWithImpl;
@override @useResult
$Res call({
 bool error, String message,@JsonKey(name: 'story') DetailStoryResult detailStoryResult
});


@override $DetailStoryResultCopyWith<$Res> get detailStoryResult;

}
/// @nodoc
class __$DetailStoryModelCopyWithImpl<$Res>
    implements _$DetailStoryModelCopyWith<$Res> {
  __$DetailStoryModelCopyWithImpl(this._self, this._then);

  final _DetailStoryModel _self;
  final $Res Function(_DetailStoryModel) _then;

/// Create a copy of DetailStoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = null,Object? message = null,Object? detailStoryResult = null,}) {
  return _then(_DetailStoryModel(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,detailStoryResult: null == detailStoryResult ? _self.detailStoryResult : detailStoryResult // ignore: cast_nullable_to_non_nullable
as DetailStoryResult,
  ));
}

/// Create a copy of DetailStoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetailStoryResultCopyWith<$Res> get detailStoryResult {
  
  return $DetailStoryResultCopyWith<$Res>(_self.detailStoryResult, (value) {
    return _then(_self.copyWith(detailStoryResult: value));
  });
}
}


/// @nodoc
mixin _$DetailStoryResult {

 String get id; String get name; String get description; String get photoUrl; DateTime get createdAt; double? get lat; double? get lon;
/// Create a copy of DetailStoryResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailStoryResultCopyWith<DetailStoryResult> get copyWith => _$DetailStoryResultCopyWithImpl<DetailStoryResult>(this as DetailStoryResult, _$identity);

  /// Serializes this DetailStoryResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailStoryResult&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,photoUrl,createdAt,lat,lon);

@override
String toString() {
  return 'DetailStoryResult(id: $id, name: $name, description: $description, photoUrl: $photoUrl, createdAt: $createdAt, lat: $lat, lon: $lon)';
}


}

/// @nodoc
abstract mixin class $DetailStoryResultCopyWith<$Res>  {
  factory $DetailStoryResultCopyWith(DetailStoryResult value, $Res Function(DetailStoryResult) _then) = _$DetailStoryResultCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, String photoUrl, DateTime createdAt, double? lat, double? lon
});




}
/// @nodoc
class _$DetailStoryResultCopyWithImpl<$Res>
    implements $DetailStoryResultCopyWith<$Res> {
  _$DetailStoryResultCopyWithImpl(this._self, this._then);

  final DetailStoryResult _self;
  final $Res Function(DetailStoryResult) _then;

/// Create a copy of DetailStoryResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? photoUrl = null,Object? createdAt = null,Object? lat = freezed,Object? lon = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,photoUrl: null == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [DetailStoryResult].
extension DetailStoryResultPatterns on DetailStoryResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailStoryResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailStoryResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailStoryResult value)  $default,){
final _that = this;
switch (_that) {
case _DetailStoryResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailStoryResult value)?  $default,){
final _that = this;
switch (_that) {
case _DetailStoryResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String photoUrl,  DateTime createdAt,  double? lat,  double? lon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailStoryResult() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.photoUrl,_that.createdAt,_that.lat,_that.lon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String photoUrl,  DateTime createdAt,  double? lat,  double? lon)  $default,) {final _that = this;
switch (_that) {
case _DetailStoryResult():
return $default(_that.id,_that.name,_that.description,_that.photoUrl,_that.createdAt,_that.lat,_that.lon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  String photoUrl,  DateTime createdAt,  double? lat,  double? lon)?  $default,) {final _that = this;
switch (_that) {
case _DetailStoryResult() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.photoUrl,_that.createdAt,_that.lat,_that.lon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetailStoryResult implements DetailStoryResult {
  const _DetailStoryResult({required this.id, required this.name, required this.description, required this.photoUrl, required this.createdAt, this.lat, this.lon});
  factory _DetailStoryResult.fromJson(Map<String, dynamic> json) => _$DetailStoryResultFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  String photoUrl;
@override final  DateTime createdAt;
@override final  double? lat;
@override final  double? lon;

/// Create a copy of DetailStoryResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailStoryResultCopyWith<_DetailStoryResult> get copyWith => __$DetailStoryResultCopyWithImpl<_DetailStoryResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailStoryResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailStoryResult&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,photoUrl,createdAt,lat,lon);

@override
String toString() {
  return 'DetailStoryResult(id: $id, name: $name, description: $description, photoUrl: $photoUrl, createdAt: $createdAt, lat: $lat, lon: $lon)';
}


}

/// @nodoc
abstract mixin class _$DetailStoryResultCopyWith<$Res> implements $DetailStoryResultCopyWith<$Res> {
  factory _$DetailStoryResultCopyWith(_DetailStoryResult value, $Res Function(_DetailStoryResult) _then) = __$DetailStoryResultCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, String photoUrl, DateTime createdAt, double? lat, double? lon
});




}
/// @nodoc
class __$DetailStoryResultCopyWithImpl<$Res>
    implements _$DetailStoryResultCopyWith<$Res> {
  __$DetailStoryResultCopyWithImpl(this._self, this._then);

  final _DetailStoryResult _self;
  final $Res Function(_DetailStoryResult) _then;

/// Create a copy of DetailStoryResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? photoUrl = null,Object? createdAt = null,Object? lat = freezed,Object? lon = freezed,}) {
  return _then(_DetailStoryResult(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,photoUrl: null == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
