package units 
{
	import flash.display.InteractiveObject;
	
    
		
	public class UnitFactory extends Main
		
	{
				
		public function UnitFactory():void
		{
			
			
		}
		
   	
	    public static  var unit:Unit ;
		
		public static  function getRandom( ):Unit
		
		{		
		        
			switch (Math.floor(Math.random() * 10)){
								
				case 0:
					unit = new Bomber
					break;
				
				case 1:
				    unit = new Interceptor
					break;
				
				case 2:
					 unit = new Soldier
					break;
				
				case 3:
					unit = new Tank
					break;
				case 4:
					 unit = new Destroyer
					break;
				case 5:
					 unit = new  Submarine
					break;
				case 6:
					 unit = new  Bomber
					break;
				case 7:
					unit = new   Tank
					break;
				case 8:
				 unit = new  Destroyer
					break;
				case 9:
					unit = new  Soldier
					break;
			
		
		      }
			 return unit;
			
		}
		
		
		
	}
}