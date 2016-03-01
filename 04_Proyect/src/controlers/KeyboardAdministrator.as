package controlers
{
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	public class KeyboardAdministrator
	{
		
			private var _keys:Object;
			
			public function KeyboardAdministrator(stage:Stage)
			{
				// creates a new object, same as going: new Object()		
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
				trace(keyCode);
			}
	}
	
		
		

}
	