package Tools
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.filters.BevelFilter;
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	
	public class Button extends Sprite
	{
		private var _button:Sprite;
		private var _text:TextField;
		public function Button( )
		{
			
			
			init();
		}
		
		private function init():void
		{
			_text= new TextField;
			
			mouseChildren= false;
			buttonMode=true;
			_button = new Sprite();
			
			_button.graphics.beginFill(0x656565);
			_button.graphics.drawRect(0,0,46,20);
			_button.filters=[new DropShadowFilter(4,45)];
			_button.filters=[new BevelFilter(2,45)];
			_text.text="   Edit";
			_text.width=46;
			_text.height=20;
			
			
			_text.textColor=0x000000;
			_text.x=_button.width /2 -_text.width /2;
			_text.y=_button.y;
			
			
			
			addChild(_button);
			addChild(_text);
			addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		}
		private function onMouseOut(e:MouseEvent):void
		{
					
		}
		
		private function onMouseOver(e:MouseEvent):void
		{
			
		}
		
	}
}