package gameobjects
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import flashx.textLayout.elements.SpecialCharacterElement;
	
	public class Follower extends  GameObject
	{				
		private var _target:GameObject;
		private var _follower:Follower_UI;
		private var _a:Boolean= true;
		private var _time:int = 0;
	    
		private var _followVertical:Boolean;
		
		public function Follower(target:GameObject)
		{		
			_follower= new Follower_UI();
			   
		    addChild(_follower);
        
	        _target = target;	
		   _drag = .70;	
		   value=10;
		   
		   _followVertical = Math.random() < .5;
		 maxSpeed=8;
	    }
		override public function update():void
		{	
			 //changes  mass to make efect of pulse
			_time++;
			width = 20 + Math.sin(_time / 5) * 5;
			height = 20 + Math.sin((_time + 10 ) / 5) * 5;
			//changes direction to the followers from vertical to horizontal axes
			if (_time % 30 == 0){
				_followVertical = !_followVertical;
			}
			
		 	this.maxSpeed=1;
			//make them follow only vertica and orizontal
			if(_followVertical){
				_velocity.y  += (_target.y - this.y)* .1;	
			} else {
				_velocity.x += (_target.x - this.x)* .1;
			}
			
			super.update();
			
			
		}
		private function move(dirX:Number,dirY:Number):void
		{
			_velocity.x += dirX *5;
			_velocity.y += dirY*5;
			
		}
		
		
		
		

	}
}
		
		
