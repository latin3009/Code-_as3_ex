package units
{
	import flash.display.Sprite;
	
	
	public class Interceptor extends AirUnit
	{
		
		public function Interceptor()
		{
		var interceptor:Sprite = new Sprite();
			_health = 80;
			_weapon_damage = 60;
		 draw(0x333333);
			 
		
		 addChild(interceptor);
	
		}
		
		override protected function draw( color:uint ): void
		{
			
		graphics.beginFill(0x333333);
		graphics.drawRoundRect(0,0,30,30,2,2);
		    
			
    		
			
		} 
		
		
		
			
	
	}
	
	
}