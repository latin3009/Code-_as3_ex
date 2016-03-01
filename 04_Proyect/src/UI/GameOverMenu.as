package UI
{
	import flash.events.MouseEvent;
	

	public class GameOverMenu extends GameView
	{
		private var _gOver:GOmenu_ui;
	    public var _reStartBtn:Button;
		
		
		public function GameOverMenu()
		{
			
			_gOver= new GOmenu_ui();			
			addChild(_gOver);
		    _reStartBtn= new Button();
	        _reStartBtn.x=210;
			_reStartBtn.y=100;
			_reStartBtn._btn.text_tf.text='RESTART';
			addChild(_reStartBtn);
			_gOver.score_tf.textColor=0x000000;
			
			
		}
		
		override public function activate(): void
		{
			this.visible= true;
		}
		override public function deactivate():void
		{
			visible= false;
		}
		
		public function setScore(FinalScore:Number):void
		{
			_gOver.score_tf.text=FinalScore.toString();
			
		}
	}
}