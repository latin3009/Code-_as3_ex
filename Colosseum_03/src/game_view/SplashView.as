package game_view
{
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	public class SplashView extends Sprite
	{
		private var _splash:Spl_ui;
		public var _startG_btn:Start_btn;
		
		public function SplashView()
		{
			
			_splash= new Spl_ui();
			_splash.x=0;
			_splash.y=0;
			addChild(_splash);
			_startG_btn= new Start_btn;
		_startG_btn.mouseEnabled=true;
			
		_startG_btn.addEventListener(MouseEvent.CLICK, onmouseClick);
			
		}
		protected function onmouseClick(event:MouseEvent):void
		{
			trace('click');
			dispatchEvent(new MouseEvent(MouseEvent.CLICK));
		}
		 public function activate(): void
		{
			this.visible= true;
		}
		
		 public function deactivate():void
		{
			visible=false;
		}
	}
}