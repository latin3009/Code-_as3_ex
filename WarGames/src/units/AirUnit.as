package units
{
	
	
	import flash.display.Stage;
	
	
	public class AirUnit extends Unit
	{

		
		
		public function AirUnit()
		{
		draw(0x333333);
		}
		override public function attack(unit:Unit):void{
			if (unit  is SeaUnit )
			{
			
				trace ('you can not atack SeaUnit');
			}
			else
			{
				unit.takeDamage(weaponDamage);
			}
			
		}
		
	}
}