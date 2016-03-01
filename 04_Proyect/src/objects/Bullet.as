package objects
{
	public class Bullet extends GameObject
	{
		private var _bullet:Bull_ui;
		
		public function Bullet(startVelocityX:Number,startVelocityY:Number)
		{	
			graphics.clear();
			_bullet= new Bull_ui();		
			addChild(_bullet);			
			velocity.x= startVelocityX;
			velocity.y= startVelocityY;
			
			_drag= 1;
			maxSpeed= 10;
		//	super();
		}
		override protected function bounce():void
		{
			die();
		}
	}
}