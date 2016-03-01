package objects.players
{
	public class Player extends GameObject
		
	{
		
		private var _bulletSlowDown:Number= 2;
	 	private var _player:MyShip_ui;
		
		public function Player()
		{
			super();
			//trace('update');
			graphics.clear();
			_player= new MyShip_ui();
			addChild(_player);
			y= 550;
		
			_drag=.9;
			
			
			
		}
		override public function update():void
		{
			//trace('update');
			super.update();
			_bulletSlowDown --;
			
		
		
			
		}
		public function shoot():void
		{
			_bulletSlowDown= 5;
		}
		public function move(dirX:Number,dirY:Number):void
		{
			if( this.x > stage.stageWidth )
			{
				this.x = stage.stageWidth;
				velocity.x  *= -10;
				super.bounce();
			}
			else if(this.x < 0)
			{
				this.x=0 + this.width;
				velocity.x *=10;
				super.bounce();
			}
			velocity.x += dirX *5;
			velocity.y+= dirY *5;
		}
		public function get canShoot():Boolean
		{
			return _bulletSlowDown <= 0;
		}
		
		public function fire():void
		{
			_bulletSlowDown= 30;
		}
		public function reset():void
		{
			_isAlive=true;
		}
		
	}
}