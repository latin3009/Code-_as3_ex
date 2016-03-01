package input
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;

	public class KeyboardManager
	{
		private var _keys:Object;
		public function KeyboardManager(stage:Stage)
		{
			// creates a new object		
			_keys = {};		
			stage.addEventListener(KeyboardEvent.KEY_DOWN, handleKey);	
			stage.addEventListener(KeyboardEvent.KEY_UP, handleKey);
			
		}
		
		
		private function handleKey(e:KeyboardEvent):void
		{	
				// if e.type equals KeyboardEvent.KEY_DOWN, isDown is true, if not, it's false		
				var isDown:Boolean = e.type == KeyboardEvent.KEY_DOWN;				
				// store that value in the object, it will be created if needed		
				_keys[e.keyCode] = isDown;		
			}		
			public function isDown(keyCode:int):Boolean
			{			// read the value from the keys object, non-created values return as false		
				return _keys[keyCode];	
			}
			
			
		}
	}
