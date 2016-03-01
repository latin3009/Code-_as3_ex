package gameobjects
{
	import flash.display.Sprite;
	
	public class Drone extends GameObject
	{
		private var _drone:Drone_ui;
		
		public function Drone()
		{// drone enemy
			super();
			_drone= new Drone_ui();
			addChild(_drone);
			//how mutch of velocity looses 1 is nothing and .5 is half.
			_drag = 1;	
			value=5;
			//regulates max velocity
			maxSpeed=2;
			//gives max random velocity and direction(-.5 *20 gives minus 10 till 10 x y axes)
			this._velocity.x= (Math.random()-.5) * 20;
			this._velocity.y= (Math.random()-.5) * 20;
		}
		override public function update():void
		{			
			

			super.update();
		}
	}
}