package formobjects
{
	public class CheckBox extends CheckBoxGfx
	{
		// Hålla koll om checkboxen är vald eller inte.
		private var _isSelected		:Boolean;
		
		/**
		 * Du måste skicka in vad det ska stå brevid checkboxen 
		 **/
		public function CheckBox( label:String )
		{
			// Det finns grafik som vi inte ser i klassen. Vi vill inte att den ska spelas från start.
			stop();
			
			// Ändra texten till det man har skickat in i klassen.
			label_tf.text = label;
		}
		
		/**
		 * Om den är vald ska den bli ej vald.
		 * Om den är ej vald ska den bli vald.
		 **/
		public function changeSelectedStatus(): void
		{
			if( _isSelected )
			{
				gotoAndStop(1);
				_isSelected = false;
			}
			else
			{
				gotoAndStop(2);
				_isSelected = true;
			}
		}
		
		/**
		 * Säger om den är vald eller inte
		 **/
		public function get isSelected(): Boolean
		{
			return _isSelected;
		}
	}
}