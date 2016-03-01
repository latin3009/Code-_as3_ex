package objects
{
	import flash.events.Event;

	public class Missile extends GameObject
	{
	
		
		
		private var _target:GameObject;
		private var _misile:Misile_uicopy;
		
		public function Missile(target:GameObject)
		{
			graphics.clear();
			_misile= new Misile_uicopy();
			
			
			addChild(_misile);
			_target = target;
			
			this.maxSpeed=4;
			
				
			velocity.y = -10;
			
		}	
		override public function update():void
		{	
			
			
			if(_target){
				velocity.x += (_target.x - this.x) * .001;
				velocity.y += (_target.y - this.y)* .001;
				this.rotation = Math.atan2(velocity.y, velocity.x) *180/Math.PI + 90;
				_drag = .98;
			} else {
				_drag = 1;
			}
			
			if(_target != null && !_target.isAlive)
			{
				_target= null;
			}
			
			super.update();
		}
		
		override protected function bounce():void
		{
			die();
		}
		
	}
}