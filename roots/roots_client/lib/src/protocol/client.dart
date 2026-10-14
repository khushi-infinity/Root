/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _ida;
import 'package:http/http.dart' as _i85jenna;
import 'package:roots_client/src/protocol/greetings/greeting.dart' as _i3w4psbb;
import 'package:roots_client/src/protocol/player.dart' as _i1vagm0s;
import 'package:roots_client/src/protocol/resource_state.dart' as _il0593sa;
import 'package:roots_client/src/protocol/world.dart' as _i3gf8rgv;
import 'package:roots_client/src/protocol/world_object.dart' as _iid1bzvy;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'protocol.dart' as _il2as5qe;

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
/// {@category Endpoint}
class EndpointEmailIdp extends _iaic.EndpointEmailIdpBase {
  EndpointEmailIdp(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  /// Logs in the user and returns a new session.
  ///
  /// Throws an [EmailAccountLoginException] in case of errors, with reason:
  /// - [EmailAccountLoginExceptionReason.invalidCredentials] if the email or
  ///   password is incorrect.
  /// - [EmailAccountLoginExceptionReason.tooManyAttempts] if there have been
  ///   too many failed login attempts.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _ida.Future<_iacc.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_iacc.AuthSuccess>(
    'emailIdp',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

  /// Starts the registration for a new user account with an email-based login
  /// associated to it.
  ///
  /// Upon successful completion of this method, an email will have been
  /// sent to [email] with a verification link, which the user must open to
  /// complete the registration.
  ///
  /// Always returns a account request ID, which can be used to complete the
  /// registration. If the email is already registered, the returned ID will not
  /// be valid.
  @override
  _ida.Future<_isc.UuidValue> startRegistration({required String email}) =>
      caller.callServerEndpoint<_isc.UuidValue>(
        'emailIdp',
        'startRegistration',
        {'email': email},
      );

  /// Verifies an account request code and returns a token
  /// that can be used to complete the account creation.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if no request exists
  ///   for the given [accountRequestId] or [verificationCode] is invalid.
  @override
  _ida.Future<String> verifyRegistrationCode({
    required _isc.UuidValue accountRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyRegistrationCode',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a new account registration, creating a new auth user with a
  /// profile and attaching the given email account to it.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if the [registrationToken]
  ///   is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  ///
  /// Returns a session for the newly created user.
  @override
  _ida.Future<_iacc.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_iacc.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {
      'registrationToken': registrationToken,
      'password': password,
    },
  );

  /// Requests a password reset for [email].
  ///
  /// If the email address is registered, an email with reset instructions will
  /// be send out. If the email is unknown, this method will have no effect.
  ///
  /// Always returns a password reset request ID, which can be used to complete
  /// the reset. If the email is not registered, the returned ID will not be
  /// valid.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to request a password reset.
  ///
  @override
  _ida.Future<_isc.UuidValue> startPasswordReset({required String email}) =>
      caller.callServerEndpoint<_isc.UuidValue>(
        'emailIdp',
        'startPasswordReset',
        {'email': email},
      );

  /// Verifies a password reset code and returns a finishPasswordResetToken
  /// that can be used to finish the password reset.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to verify the password reset.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// If multiple steps are required to complete the password reset, this endpoint
  /// should be overridden to return credentials for the next step instead
  /// of the credentials for setting the password.
  @override
  _ida.Future<String> verifyPasswordResetCode({
    required _isc.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyPasswordResetCode',
    {
      'passwordResetRequestId': passwordResetRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a password reset request by setting a new password.
  ///
  /// The [verificationCode] returned from [verifyPasswordResetCode] is used to
  /// validate the password reset request.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.policyViolation] if the new
  ///   password does not comply with the password policy.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _ida.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>(
    'emailIdp',
    'finishPasswordReset',
    {
      'finishPasswordResetToken': finishPasswordResetToken,
      'newPassword': newPassword,
    },
  );

  @override
  _ida.Future<bool> hasAccount() => caller.callServerEndpoint<bool>(
    'emailIdp',
    'hasAccount',
    {},
  );
}

/// By extending [RefreshJwtTokensEndpoint], the JWT token refresh endpoint
/// is made available on the server and enables automatic token refresh on the client.
/// {@category Endpoint}
class EndpointJwtRefresh extends _iacc.EndpointRefreshJwtTokens {
  EndpointJwtRefresh(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'jwtRefresh';

  /// Creates a new token pair for the given [refreshToken].
  ///
  /// If [refreshToken] is omitted, cookie-mode web clients fall back to the
  /// configured HttpOnly refresh cookie. When neither source is present this
  /// throws [RefreshTokenNotFoundException], the same public "no usable refresh
  /// credential" exception used for unknown refresh tokens.
  ///
  /// Can throw the following exceptions:
  /// -[RefreshTokenMalformedException]: refresh token is malformed and could
  ///   not be parsed. Not expected to happen for tokens issued by the server.
  /// -[RefreshTokenNotFoundException]: refresh token is unknown to the server.
  ///   Either the token was deleted or generated by a different server.
  /// -[RefreshTokenExpiredException]: refresh token has expired. Will happen
  ///   only if it has not been used within configured `refreshTokenLifetime`.
  /// -[RefreshTokenInvalidSecretException]: refresh token is incorrect, meaning
  ///   it does not refer to the current secret refresh token. This indicates
  ///   either a malfunctioning client or a malicious attempt by someone who has
  ///   obtained the refresh token. In this case the underlying refresh token
  ///   will be deleted, and access to it will expire fully when the last access
  ///   token is elapsed.
  ///
  /// This endpoint is unauthenticated, meaning the client won't include any
  /// authentication information with the call.
  @override
  _ida.Future<_iacc.AuthSuccess> refreshAccessToken({String? refreshToken}) =>
      caller.callServerEndpoint<_iacc.AuthSuccess>(
        'jwtRefresh',
        'refreshAccessToken',
        {'refreshToken': refreshToken},
        authenticated: false,
      );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _isc.EndpointRef {
  EndpointGreeting(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _ida.Future<_i3w4psbb.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i3w4psbb.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

/// Crop endpoints for planting, watering, and harvesting wheat.
/// {@category Endpoint}
class EndpointCrop extends _isc.EndpointRef {
  EndpointCrop(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'crop';

  /// Plants wheat in a field plot.
  _ida.Future<_iid1bzvy.WorldObject> plantCrop({
    required String worldId,
    required double positionX,
    required double positionY,
    required double z,
    required String ownerId,
  }) => caller.callServerEndpoint<_iid1bzvy.WorldObject>(
    'crop',
    'plantCrop',
    {
      'worldId': worldId,
      'positionX': positionX,
      'positionY': positionY,
      'z': z,
      'ownerId': ownerId,
    },
  );

  /// Waters a crop, marking it as watered and potentially advancing growth.
  _ida.Future<_iid1bzvy.WorldObject> waterCrop({
    required String worldId,
    required String cropId,
    required String ownerId,
  }) => caller.callServerEndpoint<_iid1bzvy.WorldObject>(
    'crop',
    'waterCrop',
    {
      'worldId': worldId,
      'cropId': cropId,
      'ownerId': ownerId,
    },
  );

  /// Harvests a mature wheat crop.
  _ida.Future<_iid1bzvy.WorldObject> harvestCrop({
    required String worldId,
    required String cropId,
    required String ownerId,
  }) => caller.callServerEndpoint<_iid1bzvy.WorldObject>(
    'crop',
    'harvestCrop',
    {
      'worldId': worldId,
      'cropId': cropId,
      'ownerId': ownerId,
    },
  );

  /// Updates the crop stage (used by server-side scheduling).
  _ida.Future<_iid1bzvy.WorldObject> updateCropStage({
    required String worldId,
    required String cropId,
    required int newStage,
    required String ownerId,
  }) => caller.callServerEndpoint<_iid1bzvy.WorldObject>(
    'crop',
    'updateCropStage',
    {
      'worldId': worldId,
      'cropId': cropId,
      'newStage': newStage,
      'ownerId': ownerId,
    },
  );
}

/// Resource endpoints for managing player resources (wood, stone, seeds, wheat, coins).
/// {@category Endpoint}
class EndpointResource extends _isc.EndpointRef {
  EndpointResource(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'resource';

  /// Updates the player's resource state.
  _ida.Future<_il0593sa.ResourceState> resourceChanged({
    required String worldId,
    required int woodDelta,
    required int stoneDelta,
    required int seedsDelta,
    required int wheatDelta,
    required int coinsDelta,
  }) => caller.callServerEndpoint<_il0593sa.ResourceState>(
    'resource',
    'resourceChanged',
    {
      'worldId': worldId,
      'woodDelta': woodDelta,
      'stoneDelta': stoneDelta,
      'seedsDelta': seedsDelta,
      'wheatDelta': wheatDelta,
      'coinsDelta': coinsDelta,
    },
  );
}

/// World endpoints for managing the shared farm world.
///
/// These endpoints handle world creation, snapshot retrieval,
/// player joining, and world reset functionality.
/// {@category Endpoint}
class EndpointWorld extends _isc.EndpointRef {
  EndpointWorld(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'world';

  /// Gets or creates the demo world, or returns an existing world by ID.
  ///
  /// If [worldId] is provided, retrieves the existing world.
  /// Otherwise, creates a new demo world with initial resources and state.
  _ida.Future<_i3gf8rgv.World> getOrCreateDemoWorld({String? worldId}) =>
      caller.callServerEndpoint<_i3gf8rgv.World>(
        'world',
        'getOrCreateDemoWorld',
        {'worldId': worldId},
      );

  /// Gets a world snapshot for the given world ID.
  _ida.Future<_i3gf8rgv.World> getWorldSnapshot(String worldId) =>
      caller.callServerEndpoint<_i3gf8rgv.World>(
        'world',
        'getWorldSnapshot',
        {'worldId': worldId},
      );

  /// Joins a demo world with a display name.
  _ida.Future<_i1vagm0s.Player> joinDemoWorld(
    String worldId,
    String displayName,
  ) => caller.callServerEndpoint<_i1vagm0s.Player>(
    'world',
    'joinDemoWorld',
    {
      'worldId': worldId,
      'displayName': displayName,
    },
  );

  /// Resets the demo world to its initial state.
  _ida.Future<void> resetDemoWorld() => caller.callServerEndpoint<void>(
    'world',
    'resetDemoWorld',
    {},
  );
}

/// World object endpoints for placing, removing, and updating objects
/// in the shared farm world.
/// {@category Endpoint}
class EndpointWorldObject extends _isc.EndpointRef {
  EndpointWorldObject(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'worldObject';

  /// Places a world object (structure, crop, or resource) in the world.
  _ida.Future<_iid1bzvy.WorldObject> placeWorldObject({
    required String worldId,
    required String type,
    required double positionX,
    required double positionY,
    required double z,
    required double rotationY,
    required String ownerId,
    required String state,
    required int cropStage,
  }) => caller.callServerEndpoint<_iid1bzvy.WorldObject>(
    'worldObject',
    'placeWorldObject',
    {
      'worldId': worldId,
      'type': type,
      'positionX': positionX,
      'positionY': positionY,
      'z': z,
      'rotationY': rotationY,
      'ownerId': ownerId,
      'state': state,
      'cropStage': cropStage,
    },
  );

  /// Removes a world object from the world.
  _ida.Future<void> removeWorldObject(
    String worldId,
    String objectId,
  ) => caller.callServerEndpoint<void>(
    'worldObject',
    'removeWorldObject',
    {
      'worldId': worldId,
      'objectId': objectId,
    },
  );

  /// Updates a world object's state.
  _ida.Future<_iid1bzvy.WorldObject> updateWorldObject(
    String worldId,
    String objectId, {
    String? state,
    int? cropStage,
    bool? isWatered,
  }) => caller.callServerEndpoint<_iid1bzvy.WorldObject>(
    'worldObject',
    'updateWorldObject',
    {
      'worldId': worldId,
      'objectId': objectId,
      'state': state,
      'cropStage': cropStage,
      'isWatered': isWatered,
    },
  );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _iaic.Caller(client);
    serverpod_auth_core = _iacc.Caller(client);
  }

  late final _iaic.Caller serverpod_auth_idp;

  late final _iacc.Caller serverpod_auth_core;
}

class Client extends _isc.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _isc.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_isc.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
    _i85jenna.Client? httpClientOverride,
  }) : super(
         host,
         _il2as5qe.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
         httpClientOverride: httpClientOverride,
       ) {
    emailIdp = EndpointEmailIdp(this);
    jwtRefresh = EndpointJwtRefresh(this);
    greeting = EndpointGreeting(this);
    crop = EndpointCrop(this);
    resource = EndpointResource(this);
    world = EndpointWorld(this);
    worldObject = EndpointWorldObject(this);
    modules = Modules(this);
  }

  late final EndpointEmailIdp emailIdp;

  late final EndpointJwtRefresh jwtRefresh;

  late final EndpointGreeting greeting;

  late final EndpointCrop crop;

  late final EndpointResource resource;

  late final EndpointWorld world;

  late final EndpointWorldObject worldObject;

  late final Modules modules;

  @override
  Map<String, _isc.EndpointRef> get endpointRefLookup => {
    'emailIdp': emailIdp,
    'jwtRefresh': jwtRefresh,
    'greeting': greeting,
    'crop': crop,
    'resource': resource,
    'world': world,
    'worldObject': worldObject,
  };

  @override
  Map<String, _isc.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}
