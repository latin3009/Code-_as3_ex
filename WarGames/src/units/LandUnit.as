package units
{
	
	import flash.display.Stage;
	
	public class LandUnit extends Unit
	{
		public function LandUnit()
		{
			super();
		}
		override public function attack(unit:Unit):void{
			if (unit  is AirUnit )
			{
				
				trace ('you can not atack AirUnit');
			}
			else
			{
				unit.takeDamage(weaponDamage);
			}
			
		}
		
	}
}