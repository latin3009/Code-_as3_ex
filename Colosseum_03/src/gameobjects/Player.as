package gameobjects
{
	public class Player extends GameObject
	{
		//shoot regulator
		private var _shotSlowDown:Number = 3;
		
		private var _player:Player_2;
	
		
		public function Player()
		{
			super();
			graphics.clear();
			_player= new Player_2();
			addChild(_player);
			
			
			_drag= .9;
			
		}
		
		override public function update():void
		{  super.update();
			_shotSlowDown --;
		}
		public function shoot():void
		{
			_shotSlowDown=5;
		}
		 public function move(dirX:Number,dirY:Number):void
		 {
			 _velocity.x += dirX *5;
			 _velocity.y += dirY*5;
			 
		 }
		 public function get canShoot():Boolean
		 {
			 return _shotSlowDown <= 0;
			
		 }
		 public function reset():void
		 {
			 _isAlive=true;
		 }
		  
	}
}