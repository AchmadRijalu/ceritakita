// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stories_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StoriesModel {

 bool get error; String get message; List<StoryResult> get listStory;
/// Create a copy of StoriesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoriesModelCopyWith<StoriesModel> get copyWith => _$StoriesModelCopyWithImpl<StoriesModel>(this as StoriesModel, _$identity);

  /// Serializes this StoriesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoriesModel&&(identical(other.error, error) || other.error == error)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.listStory, listStory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,message,const DeepCollectionEquality().hash(listStory));

@override
String toString() {
  return 'StoriesModel(error: $error, message: $message, listStory: $listStory)';
}


}

/// @nodoc
abstract mixin class $StoriesModelCopyWith<$Res>  {
  factory $StoriesModelCopyWith(StoriesModel value, $Res Function(StoriesModel) _then) = _$StoriesModelCopyWithImpl;
@useResult
$Res call({
 bool error, String message, List<StoryResult> listStory
});




}
/// @nodoc
class _$StoriesModelCopyWithImpl<$Res>
    implements $StoriesModelCopyWith<$Res> {
  _$StoriesModelCopyWithImpl(this._self, this._then);

  final StoriesModel _self;
  final $Res Function(StoriesModel) _then;

/// Create a copy of StoriesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? error = null,Object? message = null,Object? listStory = null,}) {
  return _then(_self.copyWith(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,listStory: null == listStory ? _self.listStory : listStory // ignore: cast_nullable_to_non_nullable
as List<StoryResult>,
  ));
}

}


/// Adds pattern-matching-related methods to [StoriesModel].
extension StoriesModelPatterns on StoriesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoriesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoriesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoriesModel value)  $default,){
final _that = this;
switch (_that) {
case _StoriesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoriesModel value)?  $default,){
final _that = this;
switch (_that) {
case _StoriesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool error,  String message,  List<StoryResult> listStory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoriesModel() when $default != null:
return $default(_that.error,_that.message,_that.listStory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool error,  String message,  List<StoryResult> listStory)  $default,) {final _that = this;
switch (_that) {
case _StoriesModel():
return $default(_that.error,_that.message,_that.listStory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool error,  String message,  List<StoryResult> listStory)?  $default,) {final _that = this;
switch (_that) {
case _StoriesModel() when $default != null:
return $default(_that.error,_that.message,_that.listStory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoriesModel implements StoriesModel {
  const _StoriesModel({required this.error, required this.message, required final  List<StoryResult> listStory}): _listStory = listStory;
  factory _StoriesModel.fromJson(Map<String, dynamic> json) => _$StoriesModelFromJson(json);

@override final  bool error;
@override final  String message;
 final  List<StoryResult> _listStory;
@override List<StoryResult> get listStory {
  if (_listStory is EqualUnmodifiableListView) return _listStory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_listStory);
}


/// Create a copy of StoriesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoriesModelCopyWith<_StoriesModel> get copyWith => __$StoriesModelCopyWithImpl<_StoriesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoriesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoriesModel&&(identical(other.error, error) || other.error == error)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._listStory, _listStory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,message,const DeepCollectionEquality().hash(_listStory));

@override
String toString() {
  return 'StoriesModel(error: $error, message: $message, listStory: $listStory)';
}


}

/// @nodoc
abstract mixin class _$StoriesModelCopyWith<$Res> implements $StoriesModelCopyWith<$Res> {
  factory _$StoriesModelCopyWith(_StoriesModel value, $Res Function(_StoriesModel) _then) = __$StoriesModelCopyWithImpl;
@override @useResult
$Res call({
 bool error, String message, List<StoryResult> listStory
});




}
/// @nodoc
class __$StoriesModelCopyWithImpl<$Res>
    implements _$StoriesModelCopyWith<$Res> {
  __$StoriesModelCopyWithImpl(this._self, this._then);

  final _StoriesModel _self;
  final $Res Function(_StoriesModel) _then;

/// Create a copy of StoriesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = null,Object? message = null,Object? listStory = null,}) {
  return _then(_StoriesModel(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,listStory: null == listStory ? _self._listStory : listStory // ignore: cast_nullable_to_non_nullable
as List<StoryResult>,
  ));
}


}


/// @nodoc
mixin _$StoryResult {

 String get id; String get name; String get description; String get photoUrl; DateTime get createdAt; double? get lat; double? get lon;
/// Create a copy of StoryResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoryResultCopyWith<StoryResult> get copyWith => _$StoryResultCopyWithImpl<StoryResult>(this as StoryResult, _$identity);

  /// Serializes this StoryResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryResult&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,photoUrl,createdAt,lat,lon);

@override
String toString() {
  return 'StoryResult(id: $id, name: $name, description: $description, photoUrl: $photoUrl, createdAt: $createdAt, lat: $lat, lon: $lon)';
}


}

/// @nodoc
abstract mixin class $StoryResultCopyWith<$Res>  {
  factory $StoryResultCopyWith(StoryResult value, $Res Function(StoryResult) _then) = _$StoryResultCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, String photoUrl, DateTime createdAt, double? lat, double? lon
});




}
/// @nodoc
class _$StoryResultCopyWithImpl<$Res>
    implements $StoryResultCopyWith<$Res> {
  _$StoryResultCopyWithImpl(this._self, this._then);

  final StoryResult _self;
  final $Res Function(StoryResult) _then;

/// Create a copy of StoryResult
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


/// Adds pattern-matching-related methods to [StoryResult].
extension StoryResultPatterns on StoryResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoryResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoryResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoryResult value)  $default,){
final _that = this;
switch (_that) {
case _StoryResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoryResult value)?  $default,){
final _that = this;
switch (_that) {
case _StoryResult() when $default != null:
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
case _StoryResult() when $default != null:
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
case _StoryResult():
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
case _StoryResult() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.photoUrl,_that.createdAt,_that.lat,_that.lon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoryResult implements StoryResult {
  const _StoryResult({required this.id, required this.name, required this.description, required this.photoUrl, required this.createdAt, this.lat, this.lon});
  factory _StoryResult.fromJson(Map<String, dynamic> json) => _$StoryResultFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  String photoUrl;
@override final  DateTime createdAt;
@override final  double? lat;
@override final  double? lon;

/// Create a copy of StoryResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoryResultCopyWith<_StoryResult> get copyWith => __$StoryResultCopyWithImpl<_StoryResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoryResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoryResult&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,photoUrl,createdAt,lat,lon);

@override
String toString() {
  return 'StoryResult(id: $id, name: $name, description: $description, photoUrl: $photoUrl, createdAt: $createdAt, lat: $lat, lon: $lon)';
}


}

/// @nodoc
abstract mixin class _$StoryResultCopyWith<$Res> implements $StoryResultCopyWith<$Res> {
  factory _$StoryResultCopyWith(_StoryResult value, $Res Function(_StoryResult) _then) = __$StoryResultCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, String photoUrl, DateTime createdAt, double? lat, double? lon
});




}
/// @nodoc
class __$StoryResultCopyWithImpl<$Res>
    implements _$StoryResultCopyWith<$Res> {
  __$StoryResultCopyWithImpl(this._self, this._then);

  final _StoryResult _self;
  final $Res Function(_StoryResult) _then;

/// Create a copy of StoryResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? photoUrl = null,Object? createdAt = null,Object? lat = freezed,Object? lon = freezed,}) {
  return _then(_StoryResult(
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
