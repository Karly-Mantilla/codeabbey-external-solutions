package net.riccardocossu.sandbox.rockPaperScissors.main;

import net.riccardocossu.sandbox.rockPaperScissors.controller.GameController;
import net.riccardocossu.sandbox.rockPaperScissors.listeners.SimpleConsoleOutcomeListener
import net.riccardocossu.sandbox.rockPaperScissors.listeners.SimpleGameMoveListener
import net.riccardocossu.sandbox.rockPaperScissors.listeners.SimpleGameStartListener
import net.riccardocossu.sandbox.rockPaperScissors.model.Move
import net.riccardocossu.sandbox.rockPaperScissors.model.MoveValue;

public class Game {
	def console = System.console()
	boolean isQuit = false
	GameController controller = new GameController()
	private static final List<MoveValue> VALUES =
	Collections.unmodifiableList(Arrays.asList(MoveValue.values()));
	private static final int SIZE = VALUES.size();
	private static final Random RANDOM = new Random();


	public static void main(String[] args) {
		println "Welcome to Rock Paper Scissors, plaese play againt me by following the on screen instructions"
		new Game().start()
		println "Bye!"
	}

	private Game() {
		controller.addgameOutcomeListener(new SimpleConsoleOutcomeListener())
		controller.addGameStartListener(new SimpleGameStartListener())
		controller.addGameMoveListener(new SimpleGameMoveListener())
	}

	private void start() {
		controller.newGame()
		isQuit = false
		while(!isQuit) {
			Move myMove = new Move(player: 1,move: randomMove())
			MoveValue yourMove = null
			println "\n\nR) ${MoveValue.ROCK.value}"
			println "S) ${MoveValue.SCISSORS.value}"
			println "P) ${MoveValue.PAPER.value}"
			println "N) Start new game"
			println "Q) Quit"
			String choice = console.readLine("What's yuor move? I won't cheat, I promise\n")
			switch(choice.toUpperCase()) {
				case 'N': controller.newGame()
				break
				case 'Q': isQuit = true
				break
				case 'R': yourMove = yourMove = MoveValue.ROCK
				break
				case 'S': yourMove = yourMove = MoveValue.SCISSORS
				break
				case 'P': yourMove = yourMove = MoveValue.PAPER
				break
				default: println "Invalid choice: ${choice}, please try again"
			}
			if(yourMove) {
				controller.doMove(myMove)
				controller.doMove(new Move(player: 2,move: yourMove))
			}
		}
	}

	public MoveValue randomMove()  {
		return VALUES.get(RANDOM.nextInt(SIZE));
	}
}