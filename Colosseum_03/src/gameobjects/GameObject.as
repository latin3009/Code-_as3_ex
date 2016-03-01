package gameobjects
{
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class GameObject extends Sprite
	{
		
		//lagg stutsa i vägerna
		
		public var _velocity:Point;	
		protected var _drag:Number = .9;
		protected var _isAlive:Boolean= true;
		protected var _radius:Number= 5;
		public  var dis:Number;
		public var value:Number=0;
		protected var maxSpeed:Number = 10;		
		
		public function GameObject()
		{	//dif posicion in stage
			x= Math.random() * 500;
			y= Math.random() * 500;
			
			_velocity = new Point();			
			// speed
			_velocity.x = Math.random() - .5;	
			_velocity.y = Math.random() - .5;	
		}			
		
		public function update():void
		{		
			if(!_isAlive) return;
			if(_velocity.length > maxSpeed)
		{		
				_velocity.normalize(maxSpeed);
		}	
			x += _velocity.x;	
			y += _velocity.y;	
			
			_velocity.x *= _drag;
			_velocity.y *= _drag;	
			// sets boundries to objects not to go out of stage 
			if( this.x > stage.stageWidth)
			{
				this.x = stage.stageWidth;
				_velocity.x  *= -10;
				bounce();
			}
			else if(this.x < 0)
			{
				this.x=0;
				_velocity.x *=-10;
				bounce();
			}
			if( this.y> stage.stageHeight )
			{
				this.y= stage.stageHeight;
				_velocity.y  *= -10;
				bounce();
			}
			else if(this.y < 0)
			{
				this.y=0;
				_velocity.y *=-10;
				bounce();
			}
		}
		protected function bounce():void		
		{
				
			
		}
		public function colitionIdentifier(object:GameObject):Boolean
		{// identifies collition betwen objects
			var distX:Number= this.x -  object.x;
			var distY:Number= this.y -  object.y;
			
			dis = Math.sqrt(distX * distX + distY * distY);
			
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