import '../generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

/// Resource endpoints for managing player resources (wood, stone, seeds, wheat, coins).
class ResourceEndpoint extends Endpoint {
  /// Updates the player's resource state.
  Future<ResourceState> resourceChanged(
    Session session, {
    required String worldId,
    required int woodDelta,
    required int stoneDelta,
    required int seedsDelta,
    required int wheatDelta,
    required int coinsDelta,
  }) async {
    // Implementation will update resources in the database
    // For now, return a default resource state
    return ResourceState(
      wood: 80,
      stone: 50,
      seeds: 20,
      wheat: 0,
      coins: 100,
    );
  }
}