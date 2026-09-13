import 'package:flutter/material.dart';
import 'package:mobiarmy_flutter/features/gameplay/data/gameplay_packet_mapper.dart';
import 'package:mobiarmy_flutter/features/gameplay/game/army_game.dart';

class MatchResultOverlay extends StatelessWidget {
  const MatchResultOverlay({
    super.key,
    required this.game,
    required this.result,
    required this.onClose,
  });

  final ArmyGame game;
  final MatchResult result;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.amber, width: 2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'MATCH FINISHED',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: result.playerResults.length,
                itemBuilder: (context, index) {
                  final pr = result.playerResults[index];
                  // Ideally we match playerId with name from room state
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Player ${pr.playerId}',
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          'Exp: +${pr.exp}  Xu: +${pr.xu}',
                          style: const TextStyle(color: Colors.greenAccent, fontSize: 14),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onClose,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              child: const Text(
                'BACK TO LOBBY',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
