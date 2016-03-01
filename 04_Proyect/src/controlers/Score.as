package controlers
{
	import flash.display.Sprite;
	
	public class Score extends Sprite
	{
		public var points:Number=0;
		public function Score()
		{
			resetvalue();
		}
		public function addToValue(amountToAdd:Number):void
		{
			points += amountToAdd;
			//trace('current value',currValue);
			
		}
		//gets final score
		public function get FinalScore():Number			
		{
			return points;
			trace('final',points);
		}
		public function resetvalue():void
		{
			points=0;
			
		}
	}
}