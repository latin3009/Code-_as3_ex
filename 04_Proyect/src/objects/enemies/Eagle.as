package objects.enemies
{
	import controlers.Score;
	

	public class Eagle extends GameObject
	{
		private var _bulletSlowDown:Number= 2;
		private var  _eagleOB:Eagle_ui;
		private var _time:Number=0;
	
		
		public function Eagle()
		{
			
			graphics.clear();
			_eagleOB= new Eagle_ui();
			_eagleOB.scaleX=.60;
			_eagleOB.scaleY=.60;
			addChild(_eagleOB);
			
			value= 30
			super();
		}
		
		override public function update():void
		{    //will move
			if(!_isAlive) return;
			this.y=10;
			this.x=stage.stageWidth/2 + Math.sin(_time/50)*200;
			_time ++;
			_bulletSlowDown --;
			super.update();
		}
		public function shoot():void
		{
			_bulletSlowDown= 5;
		}
		public function get canShoot():Boolean
		{
			return _bulletSlowDown <= 0 && _isAlive;
		}
		public function isDead():void
		{
			_isAlive=false;
             visible=false;
			 
			
		}
			
		
	}
}