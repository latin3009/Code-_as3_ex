package units
{
	

	import flash.display.Stage;	
	
	public class SeaUnit extends Unit
	{
		public function SeaUnit()
		{
			super();
		}
		override public function attack(unit:Unit):void{
			if (unit  is LandUnit )
			{
				
				trace ('you can not atack LandUnit');
			}
			else
			{
				unit.takeDamage(weaponDamage);
			}
			
		}
				
		
		/*override public function takeDamage(damage:int):void
		{
			if (AirUnit)
			{
				_weapon_damage =0;
				trace ('you can not atack SeaUnit');
			}
		}*/
		
	}
}