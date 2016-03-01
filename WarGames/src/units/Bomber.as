package units
{
	import flash.display.Sprite;
	
	public class Bomber extends AirUnit
	{
		public var bomber:Sprite = new Sprite();
		public function Bomber()
		{
			_health = 50;
			_weapon_damage = 100;
			super.draw(0x666666);
			addChild(bomber);
		}
		override protected function draw( color:uint ): void
		{
		graphics.beginFill(0x666666);	
		graphics.drawRoundRect(0,0,30,30,2,2);
			
		
			
		}
		
	}
}