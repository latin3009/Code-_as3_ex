package UI
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class Button extends Sprite
	{
		
		public var _btn:Start_btn;
	
		public function Button()
		{    
			_btn= new Start_btn();
			_btn.mouseEnabled=true;
			_btn.mouseChildren= false;
			_btn.textColor=0xffffff;
			
			addChild(_btn);
			
			
		}
	}
}