package units
{
	import flash.display.Sprite;
	
	public class Destroyer extends SeaUnit
	{
		public var destroyer:Sprite = new Sprite();
		
		public function Destroyer()
		{
			_health = 70;
			_weapon_damage = 80;
			draw(0x0000cc);
			addChild(destroyer);
			
		}
		override protected function draw( color:uint ): void
		{
			graphics.beginFill(0x0000cc);
			graphics.drawCircle(0,0,15);
			
			
		}
		
	}
}