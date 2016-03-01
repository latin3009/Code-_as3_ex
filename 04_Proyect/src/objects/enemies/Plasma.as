package objects.enemies
{
	import flash.display.Stage;
	

	public class Plasma extends GameObject
	{
		private var _plasma:Plasma_ui;
		private var _target:GameObject;
		private var _time:int = 0;
		public function Plasma(target:GameObject)
		{
			_target=target;
			_plasma= new Plasma_ui();
			addChild(_plasma);
			super();
			maxSpeed=5;
		}
		override public function update():void
		{    //will crash on player
			velocity.x += (_target.x - this.x) * .1;
			velocity.y  += 4;
			_time++;
			width = 10 + Math.sin(_time / 5) * 5;
			height = 10 + Math.sin((_time + 10 ) / 5) * 5;
			super.update();
		}
		
	}
}