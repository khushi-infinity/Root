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
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
import '../auth/email_idp_endpoint.dart' as _iuc1hd5t;
import '../auth/jwt_refresh_endpoint.dart' as _inwq3ztq;
import '../greetings/greeting_endpoint.dart' as _il624ik7;
import '../world/crop_endpoint.dart' as _iad64bvi;
import '../world/resource_endpoint.dart' as _iwpffhf6;
import '../world/world_endpoint.dart' as _i2bq08kl;
import '../world/world_object_endpoint.dart' as _ily2exim;

class Endpoints extends _is.EndpointDispatch {
  @override
  void initializeEndpoints(_is.Server server) {
    var endpoints = <String, _is.Endpoint>{
      'emailIdp': _iuc1hd5t.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _inwq3ztq.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'greeting': _il624ik7.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
      'crop': _iad64bvi.CropEndpoint()
        ..initialize(
          server,
          'crop',
          null,
        ),
      'resource': _iwpffhf6.ResourceEndpoint()
        ..initialize(
          server,
          'resource',
          null,
        ),
      'world': _i2bq08kl.WorldEndpoint()
        ..initialize(
          server,
          'world',
          null,
        ),
      'worldObject': _ily2exim.WorldObjectEndpoint()
        ..initialize(
          server,
          'worldObject',
          null,
        ),
    };
    connectors['emailIdp'] = _is.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _is.MethodConnector(
          name: 'login',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint).login(
                    session,
                    email: params['email'],
                    password: params['password'],
                  ),
        ),
        'startRegistration': _is.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _is.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _is.ParameterDescription(
              name: 'accountRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _is.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _is.ParameterDescription(
              name: 'registrationToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _is.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _is.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _is.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _is.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _is.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'newPassword': _is.ParameterDescription(
              name: 'newPassword',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
        'hasAccount': _is.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['jwtRefresh'] = _is.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _is.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _is.ParameterDescription(
              name: 'refreshToken',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['jwtRefresh'] as _inwq3ztq.JwtRefreshEndpoint)
                      .refreshAccessToken(
                        session,
                        refreshToken: params['refreshToken'],
                      ),
        ),
      },
    );
    connectors['greeting'] = _is.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _is.MethodConnector(
          name: 'hello',
          params: {
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['greeting'] as _il624ik7.GreetingEndpoint).hello(
                    session,
                    params['name'],
                  ),
        ),
      },
    );
    connectors['crop'] = _is.EndpointConnector(
      name: 'crop',
      endpoint: endpoints['crop']!,
      methodConnectors: {
        'plantCrop': _is.MethodConnector(
          name: 'plantCrop',
          params: {
            'worldId': _is.ParameterDescription(
              name: 'worldId',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'positionX': _is.ParameterDescription(
              name: 'positionX',
              type: _is.getType<double>(),
              nullable: false,
            ),
            'positionY': _is.ParameterDescription(
              name: 'positionY',
              type: _is.getType<double>(),
              nullable: false,
            ),
            'z': _is.ParameterDescription(
              name: 'z',
              type: _is.getType<double>(),
              nullable: false,
            ),
            'ownerId': _is.ParameterDescription(
              name: 'ownerId',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['crop'] as _iad64bvi.CropEndpoint).plantCrop(
                    session,
                    worldId: params['worldId'],
                    positionX: params['positionX'],
                    positionY: params['positionY'],
                    z: params['z'],
                    ownerId: params['ownerId'],
                  ),
        ),
        'waterCrop': _is.MethodConnector(
          name: 'waterCrop',
          params: {
            'worldId': _is.ParameterDescription(
              name: 'worldId',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'cropId': _is.ParameterDescription(
              name: 'cropId',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'ownerId': _is.ParameterDescription(
              name: 'ownerId',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['crop'] as _iad64bvi.CropEndpoint).waterCrop(
                    session,
                    worldId: params['worldId'],
                    cropId: params['cropId'],
                    ownerId: params['ownerId'],
                  ),
        ),
        'harvestCrop': _is.MethodConnector(
          name: 'harvestCrop',
          params: {
            'worldId': _is.ParameterDescription(
              name: 'worldId',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'cropId': _is.ParameterDescription(
              name: 'cropId',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'ownerId': _is.ParameterDescription(
              name: 'ownerId',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['crop'] as _iad64bvi.CropEndpoint).harvestCrop(
                    session,
                    worldId: params['worldId'],
                    cropId: params['cropId'],
                    ownerId: params['ownerId'],
                  ),
        ),
        'updateCropStage': _is.MethodConnector(
          name: 'updateCropStage',
          params: {
            'worldId': _is.ParameterDescription(
              name: 'worldId',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'cropId': _is.ParameterDescription(
              name: 'cropId',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'newStage': _is.ParameterDescription(
              name: 'newStage',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'ownerId': _is.ParameterDescription(
              name: 'ownerId',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['crop'] as _iad64bvi.CropEndpoint).updateCropStage(
                    session,
                    worldId: params['worldId'],
                    cropId: params['cropId'],
                    newStage: params['newStage'],
                    ownerId: params['ownerId'],
                  ),
        ),
      },
    );
    connectors['resource'] = _is.EndpointConnector(
      name: 'resource',
      endpoint: endpoints['resource']!,
      methodConnectors: {
        'resourceChanged': _is.MethodConnector(
          name: 'resourceChanged',
          params: {
            'worldId': _is.ParameterDescription(
              name: 'worldId',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'woodDelta': _is.ParameterDescription(
              name: 'woodDelta',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'stoneDelta': _is.ParameterDescription(
              name: 'stoneDelta',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'seedsDelta': _is.ParameterDescription(
              name: 'seedsDelta',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'wheatDelta': _is.ParameterDescription(
              name: 'wheatDelta',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'coinsDelta': _is.ParameterDescription(
              name: 'coinsDelta',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['resource'] as _iwpffhf6.ResourceEndpoint)
                  .resourceChanged(
                    session,
                    worldId: params['worldId'],
                    woodDelta: params['woodDelta'],
                    stoneDelta: params['stoneDelta'],
                    seedsDelta: params['seedsDelta'],
                    wheatDelta: params['wheatDelta'],
                    coinsDelta: params['coinsDelta'],
                  ),
        ),
      },
    );
    connectors['world'] = _is.EndpointConnector(
      name: 'world',
      endpoint: endpoints['world']!,
      methodConnectors: {
        'getOrCreateDemoWorld': _is.MethodConnector(
          name: 'getOrCreateDemoWorld',
          params: {
            'worldId': _is.ParameterDescription(
              name: 'worldId',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['world'] as _i2bq08kl.WorldEndpoint)
                  .getOrCreateDemoWorld(
                    session,
                    worldId: params['worldId'],
                  ),
        ),
        'getWorldSnapshot': _is.MethodConnector(
          name: 'getWorldSnapshot',
          params: {
            'worldId': _is.ParameterDescription(
              name: 'worldId',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['world'] as _i2bq08kl.WorldEndpoint)
                  .getWorldSnapshot(
                    session,
                    params['worldId'],
                  ),
        ),
        'joinDemoWorld': _is.MethodConnector(
          name: 'joinDemoWorld',
          params: {
            'worldId': _is.ParameterDescription(
              name: 'worldId',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'displayName': _is.ParameterDescription(
              name: 'displayName',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['world'] as _i2bq08kl.WorldEndpoint).joinDemoWorld(
                    session,
                    params['worldId'],
                    params['displayName'],
                  ),
        ),
        'resetDemoWorld': _is.MethodConnector(
          name: 'resetDemoWorld',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['world'] as _i2bq08kl.WorldEndpoint)
                  .resetDemoWorld(session),
        ),
      },
    );
    connectors['worldObject'] = _is.EndpointConnector(
      name: 'worldObject',
      endpoint: endpoints['worldObject']!,
      methodConnectors: {
        'placeWorldObject': _is.MethodConnector(
          name: 'placeWorldObject',
          params: {
            'worldId': _is.ParameterDescription(
              name: 'worldId',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'type': _is.ParameterDescription(
              name: 'type',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'positionX': _is.ParameterDescription(
              name: 'positionX',
              type: _is.getType<double>(),
              nullable: false,
            ),
            'positionY': _is.ParameterDescription(
              name: 'positionY',
              type: _is.getType<double>(),
              nullable: false,
            ),
            'z': _is.ParameterDescription(
              name: 'z',
              type: _is.getType<double>(),
              nullable: false,
            ),
            'rotationY': _is.ParameterDescription(
              name: 'rotationY',
              type: _is.getType<double>(),
              nullable: false,
            ),
            'ownerId': _is.ParameterDescription(
              name: 'ownerId',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'state': _is.ParameterDescription(
              name: 'state',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'cropStage': _is.ParameterDescription(
              name: 'cropStage',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['worldObject'] as _ily2exim.WorldObjectEndpoint)
                      .placeWorldObject(
                        session,
                        worldId: params['worldId'],
                        type: params['type'],
                        positionX: params['positionX'],
                        positionY: params['positionY'],
                        z: params['z'],
                        rotationY: params['rotationY'],
                        ownerId: params['ownerId'],
                        state: params['state'],
                        cropStage: params['cropStage'],
                      ),
        ),
        'removeWorldObject': _is.MethodConnector(
          name: 'removeWorldObject',
          params: {
            'worldId': _is.ParameterDescription(
              name: 'worldId',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'objectId': _is.ParameterDescription(
              name: 'objectId',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['worldObject'] as _ily2exim.WorldObjectEndpoint)
                      .removeWorldObject(
                        session,
                        params['worldId'],
                        params['objectId'],
                      ),
        ),
        'updateWorldObject': _is.MethodConnector(
          name: 'updateWorldObject',
          params: {
            'worldId': _is.ParameterDescription(
              name: 'worldId',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'objectId': _is.ParameterDescription(
              name: 'objectId',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'state': _is.ParameterDescription(
              name: 'state',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'cropStage': _is.ParameterDescription(
              name: 'cropStage',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'isWatered': _is.ParameterDescription(
              name: 'isWatered',
              type: _is.getType<bool?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['worldObject'] as _ily2exim.WorldObjectEndpoint)
                      .updateWorldObject(
                        session,
                        params['worldId'],
                        params['objectId'],
                        state: params['state'],
                        cropStage: params['cropStage'],
                        isWatered: params['isWatered'],
                      ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _iais.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _iacs.Endpoints()
      ..initializeEndpoints(server);
  }
}
