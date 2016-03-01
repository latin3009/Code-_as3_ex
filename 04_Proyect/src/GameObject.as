package
{
	import flash.display.Sprite;
	import flash.geom.Point;

	public class GameObject extends Sprite
	{
		
		public var velocity:Point;
		protected var _drag:Number = .9;
		protected var _isAlive:Boolean= true;
		protected var _radius:Number= 20;
		public var value:Number= 0;
		
		protected var maxSpeed:Number = 10;		
		
		
		public function GameObject()
		{
		     x= Math.random()* 500;
		   	y = Math.random() * 500 ;
		    velocity= new Point();
		 
			
			// dir allltid mot hoger men si es - 5 -+ parameters
			velocity.x= Math.random() -.5;
			velocity.y= Math.random()-.5;
			
		}
		
		public function update():void
		{
			   
			  if(!_isAlive) return;
			  if(velocity.length> maxSpeed)
			  {
				  velocity.normalize( maxSpeed);
			  }
			  x += velocity.x;
			  y += velocity.y;
			  velocity.x *= _drag;
			  velocity.y *= _drag;
			 
			//  trace('update');
			
		}
		protected function bounce():void		
		{
			
			
		}
		public function colitionIdentifier(object:GameObject):Boolean
		{
			var distX:Number= this.x -  object.x;
			var distY:Number= this.y -  object.y;
			
			var dis:Number = Math.sqrt(distX * distX + distY * distY);
			
			return this._radius + object._radius > dis; 
		}
		public function die():void
		{
			_isAlive=false;
		}
		public function  get isAlive():Boolean
		{
			return _isAlive;
		}
	}
}