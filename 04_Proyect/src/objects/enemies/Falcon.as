package objects.enemies
{
	
	public class Falcon extends GameObject
	{ 
		private var _enemy:Enemy_01;
		
		public function Falcon()
		{super();
		    
			_enemy= new Enemy_01();
			_enemy.scaleX=.6;
			_enemy.scaleY=.6;
			addChild(_enemy);
			value= 20
			
			_drag=1;
		}
		override public function update():void
		{
			

		//goes only down
			y += 1;
			
			
			
		}
	}
		
}