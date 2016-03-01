package game_view 
{
	import flash.display.Sprite;
	
	// simple view to regulate witch vy is visible or not
	
	public class GameView extends Sprite
	{
	   
	
		public function GameView()
		{
			
		}
		
		public function activate():void
		{
			visible=true;
		}
		public function deactivate():void
		{
			visible=false;
		}
	}
}