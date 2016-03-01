package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import units.Unit;
	
	public class GameView extends Sprite
	{
		
		private const BORDER			:uint = 50;
		private const FIGHT_POS			:uint = 150;
		
		private var _battleTextField	:TextField;

		private var _units_east	:Vector.<Unit>;
		private var _units_west	:Vector.<Unit>;
		

		public function GameView()
		{
			_units_east = new Vector.<Unit>();
			_units_west = new Vector.<Unit>();
			
			addEventListener(Event.ADDED_TO_STAGE, initBattleTextField);
		}
		
		private function initBattleTextField(e:Event): void
		{
			var txtFormat : TextFormat = new TextFormat("Arial", 16);
			
			_battleTextField = new TextField();
			_battleTextField.defaultTextFormat = txtFormat;
			_battleTextField.autoSize = TextFieldAutoSize.CENTER;
			_battleTextField.x = stage.stageWidth * .5;
			stage.addChild( _battleTextField );		
			
			updateText( "The war simulation starts soon" );
		}
		
		public function updateText( text:String ): void
		{
			_battleTextField.text = text;
		}
		
		public function addWestUnit( unit:Unit ): void
		{
			unit.x = BORDER;
			unit.y = _units_west.length * (unit.height + 10) + 20;
			addChild( unit );
			_units_west.push( unit );
		}

		public function addEastUnit( unit:Unit ): void
		{
			unit.x = stage.stageWidth - (unit.width + BORDER);
			unit.y = _units_east.length * (unit.height + 10) + 20;
			addChild( unit );
			_units_east.push( unit );
		}
		
		public function removeAll():void
		{
			while( numChildren > 0 ) removeChildAt(0);
			
			_units_west = null;
			_units_east = null;
		}
		
		public function positionUnitsForFight( unit_east:Unit, unit_west:Unit ): void
		{
			var i:uint;
			
			// Repostion to default x-pos. Remove dead west units.
			for (i = 0; i < _units_west.length; i++) 
			{
				_units_west[i].x = BORDER;
				if( _units_west[i].isDead )
				{
					removeChild( _units_west[i] );
					_units_west.splice( i, 1 );
				}
			}

			// Repostion to default x-pos. Remove dead east units.
			for (i = 0; i < _units_east.length; i++) 
			{
				_units_east[i].x = stage.stageWidth - (_units_east[i].width + BORDER);
				if( _units_east[i].isDead )
				{
					removeChild( _units_east[i] );
					_units_east.splice( i, 1 );
				}
			}
			
			// Get fighting units in position
			unit_west.x = FIGHT_POS;
			unit_east.x = stage.stageWidth - (unit_east.width + FIGHT_POS);	
		}
	}
}