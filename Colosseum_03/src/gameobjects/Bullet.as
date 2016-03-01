package gameobjects
{
	public class Bullet extends GameObject
	{
		//this is the graphic of bullet to stage
		private var _bullet:Shoot_UI;
		public function Bullet(startVelocityX:Number,startVelocityY:Number)
		{
			//super();
			graphics.clear();
			_bullet = new Shoot_UI();
			addChild(_bullet);
			
			
			_velocity.x= startVelocityX;
			_velocity.y= startVelocityY;
			
			_drag= 1;
			maxSpeed= 10;
		}
		override protected function  bounce():void
		{
			die();
		}
	}
}