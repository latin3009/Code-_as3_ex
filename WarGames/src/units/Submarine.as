package units
{
	import flash.display.Sprite;
	
	public class Submarine extends SeaUnit
	{
		public var submarine:Sprite = new Sprite();
		public function Submarine()
		{
			_health = 50;
			_weapon_damage = 80;
			draw(0x0099ff);
			addChild(submarine);
		}
		override protected function draw( color:uint ): void
		{
			graphics.beginFill(0x0099ff);
			graphics.drawCircle(0,0,15);
			
			
		}
		
		
		
	}
}