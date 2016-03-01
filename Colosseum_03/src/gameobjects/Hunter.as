package gameobjects
{
	import flash.display.Sprite;
	
	public class Hunter extends GameObject
	{
		private var _target:GameObject;
		private var _hunter:Hunter_UI;
		private var seen:Boolean=false;
		
		public function Hunter(target:GameObject)
		{
			
			super();
			_hunter= new Hunter_UI();
			addChild(_hunter);			
			_target = target;			
			_drag = .85;
			value=15;
			maxSpeed=8;
			
		}
		override public function update():void
		{	
			// regulates the identifier if player is near certain distance it will follow
		if (((_target.x <= x + 100) && (_target.y <= y + 100)) && ((_target.x >= x -100) && (_target.y >= y - 100)))
			{
				seen=true;
			}
		if(seen)
		{
			_velocity.x += (_target.x - this.x) * .005;
			_velocity.y += (_target.y - this.y) * .005;
		}
		else(!seen)
		{
			seen=false;
		}
		      
		super.update();
			
		}
	}
}