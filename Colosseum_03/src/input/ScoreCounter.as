package input
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class ScoreCounter extends Sprite
	{
		public var currValue:Number=0;
		public function ScoreCounter()
		{
			resetvalue();
		}
		//save the  points
		public function addToValue(amountToAdd:Number):void
		{
			currValue += amountToAdd;
			//trace('current value',currValue);
			
		}
		//gets final score
		public function get FinalScore():Number			
		{
			return currValue;
			trace('final',currValue);
		}
		public function resetvalue():void
		{
			currValue=0;
			
		}		
	}
}