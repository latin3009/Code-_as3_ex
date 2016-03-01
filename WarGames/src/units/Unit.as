package units
{
	import flash.display.Sprite;

	public class Unit extends Sprite
	{
		
		protected var _health			:int = 100;
		protected var _weapon_damage	:int = 100;
		
		public function Unit(){
			
		}
		
		public function attack(unit:Unit):void{
			unit.takeDamage(weaponDamage);
		}
		
		public function takeDamage(damage:int):void {
			_health -= damage;
			trace(this, "took", damage, "damage, health is", health);
		}
		
		// this is a good example of a getter, it's used as a property
		// but it's really a function
		
		public function get isDead():Boolean {
			return _health <= 0;
		}
		
		public function get health():int {
			return _health;
		}
		
		public function get weaponDamage():int {
			return _weapon_damage;
		}
		
		// Unit's visual representation 
		protected function draw( color:uint ): void
		{
			
		}
	}
}