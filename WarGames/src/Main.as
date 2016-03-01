package
{
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import units.Unit;
	import units.UnitFactory;
	
	[SWF(height="430")]
	public class Main extends Sprite
	{
		private static const NUM_UNITS:int = 10;
		
		private var _units_east:UnitCollection;
		private var _units_west:UnitCollection;
		
		private var _gameView:GameView;
		
		private var _battleDelay:Timer;
		
		public function Main()
		{
			_units_east = new UnitCollection();
			_units_west = new UnitCollection();
			
			// take care of the visible
			_gameView = new GameView();
			addChild( _gameView );
				
			var i:int;
			var unit:Unit;	
			
			// create random units for east
			for (i = 0; i < NUM_UNITS; i++){
				unit = UnitFactory.getRandom();
				_units_east.add(unit);
				// position and make east unit visible
				_gameView.addEastUnit(unit);
			}
			
			// create random units for west
			for (i = 0; i < NUM_UNITS; i++){
				unit = UnitFactory.getRandom();
				_units_west.add(unit);
				// position and make west unit visible
				_gameView.addWestUnit(unit);
			}
			
			// Start the battle delay
			initBattleDelayTimer();
		}
		
		private function initBattleDelayTimer():void
		{
			// A timer that determines when a new fight will begin
			_battleDelay = new Timer( 5000 );
			_battleDelay.addEventListener(TimerEvent.TIMER, onBattleDelayTimer_startNewFight);
			_battleDelay.start();
		}
		
		private function onBattleDelayTimer_startNewFight(e:TimerEvent):void
		{
			 // keeps going until one of the collections is empty
			if(_units_east.size > 0 && _units_west.size > 0) {
				var unit_east:Unit = _units_east.getRandom();
				var unit_west:Unit = _units_west.getRandom();
					
				fight(unit_east, unit_west);
					
				if(unit_east.isDead){
					trace("East lost unit:", unit_east);
					_units_east.remove(unit_east);
					_gameView.updateText( "East lost unit: "+ String(unit_east) );
				}
					
				if(unit_west.isDead){
					trace("West lost unit:", unit_west);
					_gameView.updateText( "West lost unit: "+ String(unit_west) );
					_units_west.remove(unit_west);
				}
					
				// traces an empty line to space out the output a bit
				trace("");
			}
			else
			{
				// figures out who won
				if(_units_east.size > _units_west.size){
					trace("East wins!");
					_gameView.updateText( "East wins!" );
				} else if(_units_east.size < _units_west.size){
					trace("West wins!");
					_gameView.updateText( "West wins!" );
				} else {
					trace("It's a draw!");
					_gameView.updateText( "It's a draw!" );
				}
				
				// No more fights
				_battleDelay.stop();
				
				// Remove exisiting units
				_gameView.removeAll();
			}
		}
		
		private function fight(unit_east:Unit, unit_west:Unit):void {
			
			_gameView.positionUnitsForFight( unit_east, unit_west );
			
			// randomly selects who goes first
			if(Math.random() > .5){
				trace("East goes first");
				_gameView.updateText( "East goes first" );
				// make sure units are alive before letting them attack
				if(!unit_east.isDead) unit_east.attack(unit_west);
				if(!unit_west.isDead) unit_west.attack(unit_east);
			} else {
				trace("West goes first");
				_gameView.updateText( "West goes first" );
				if(!unit_west.isDead) unit_west.attack(unit_east);
				if(!unit_east.isDead) unit_east.attack(unit_west);
			}
		}
	}
}