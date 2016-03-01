package units
{
	import flash.display.Sprite;
	import flash.display.Stage;
	
	
	public class Soldier extends LandUnit
	{
		public var soldier:Sprite = new Sprite();
		public function Soldier()
		{
			_health = 50;
			_weapon_damage = 60;
			draw(0x00cc00);
			addChild(soldier);
		}
		override protected function draw( color:uint ): void
		{
			graphics.beginFill(0x00cc00);
			graphics.drawRect(0,0,30,30);
			
			
		}
		
	}
}