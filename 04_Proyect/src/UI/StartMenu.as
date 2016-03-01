package UI
{
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class StartMenu extends GameView
	{
		private var _start:StartMenu_ui;
	    private var _startBtn:Button;
		//public var _startBtb:Start_btn;
		public function StartMenu()
		{
			
			_start= new StartMenu_ui;
			
		
		
		addChild(_start);
		_startBtn= new Button();
		_startBtn._btn.text_tf.text='START';
		_startBtn.x=200;
		_startBtn.y=200;
		
		
		addChild(_startBtn);
			_startBtn.addEventListener(MouseEvent.CLICK, onmouseClick);
			
		}
		
		protected function onmouseClick(event:MouseEvent):void
		{
			trace('click');
			//dispatchEvent(new MouseEvent(MouseEvent.CLICK));
		}
		override public function activate(): void
		{
			this.visible= true;
		}
		override public function deactivate():void
		{
			visible= false;
		}
	}
}