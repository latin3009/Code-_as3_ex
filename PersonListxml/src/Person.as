package
{
	import flash.display.Sprite;

	public class Person extends Sprite
	{
		// Tillgängliga över allt så länge man skriver skriver klassnamnet
		public static const MAN		:String = 'Man';
		public static const WOMAN	:String = 'Kvinna';
		
		// Spara info om person
		private var _firstName	:String;
		private var _lastName	:String;
		private var _gender		:String;
		private var _time		:String;

		private var _birthday	:uint;
		
		private var _date		:Date;
		
		/**
		 * Skicka in information on personen
		 **/										// gender har ett default värde och måste inte skickas in.
		public function Person( fName:String, lName:String, birthday:uint, gender:String = 'default' )
		{
			// Sätter värdet på våra variabler
			this._firstName = fName;
			this._lastName = lName;
			this._birthday = birthday;
			this._gender = gender;
			
			
			_date = new Date();
			// Hämtar tiden från datorn.
			this._time = String(_date.hours+':'+_date.minutes+':'+_date.seconds);
			
			initGfx();
		}
		
		// Skapar grafik med slumpad färg
		private function initGfx(): void
		{
			graphics.beginFill( Math.random() * 0xFFFFFF );
			graphics.drawRect(0, 0, 50, 50);
		}
		
		/* Nedan hämtas värdena från respektive variabel.
		   Returvärdet är detsamma som variabelns datatyp
		*/
		
		public function get firstName(): String
		{
			return _firstName;
		}

		public function get lastName():String
		{
			return _lastName;
		}

		public function get birthday(): uint
		{
			return _birthday;
		}
		
		public function get gender():String
		{
			return _gender;
		}
		
		public function get time():String
		{
			return _time;
		}


	}
}