package units
{
	import flash.display.Sprite;
	
	public class Tank extends LandUnit
	{
		public var tank:Sprite = new Sprite();
		public function Tank()
		{
			_health = 100;
			_weapon_damage = 100;
		draw(0x006600);
		addChild(tank);
		}
		override protected function draw( color:uint ): void
		{
			graphics.beginFill(0x006600);
			graphics.drawRect(0,0,30,30);
			
		}
		
		
		
	}
}