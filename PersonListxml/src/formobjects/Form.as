package formobjects
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	
	public class Form extends Sprite
	{
		private var _firstName_tf	:FormTextField;
		private var _lastName_tf	:FormTextField;
		private var _birthday_tf	:FormTextField;
		
		private var _man_cb			:CheckBox;
		private var _woman_cb		:CheckBox;
		
		private var _addButton		:AddButton;
		
		// I construktorn lägger vi ut grafiken för formuläret
		public function Form()
		{
			var header : Header = new Header();
			addChild( header );

			_firstName_tf = new FormTextField();
			addChild( _firstName_tf );
			_firstName_tf.label_tf.text = 'Förnamn';
			_firstName_tf.y = header.y + header.height + 30;
			
			_lastName_tf = new FormTextField();
			addChild( _lastName_tf );
			_lastName_tf.label_tf.text = 'Efternamn';
			_lastName_tf.y = _firstName_tf.y + _firstName_tf.height + 5;
			
			_birthday_tf = new FormTextField();
			addChild( _birthday_tf );
			_birthday_tf.label_tf.text = 'Födelsedag';
			_birthday_tf.input_tf.restrict = '0-9';
			_birthday_tf.input_tf.maxChars = 6;
			_birthday_tf.y = _lastName_tf.y + _lastName_tf.height + 5;
			
			// Vi tar värdet från den publika statiska konstanten MAN inuti Person.
			_man_cb = new CheckBox( Person.MAN );
			addChild( _man_cb );
			// Checkboxen ska vara vald från start.
			_man_cb.changeSelectedStatus();
			_man_cb.y = _birthday_tf.y + _birthday_tf.height + 25;
			
			_woman_cb = new CheckBox( Person.WOMAN );
			addChild( _woman_cb );
			_woman_cb.x = _man_cb.width + 10;
			_woman_cb.y = _man_cb.y;
			
			_addButton = new AddButton();
			addChild( _addButton );
			_addButton.y = _man_cb.y + _man_cb.height + 20;
			
	
			_man_cb.addEventListener(MouseEvent.CLICK, onCheckBoxClick_changeSelected);
			_woman_cb.addEventListener(MouseEvent.CLICK, onCheckBoxClick_changeSelected);
		}
		
		/**
		 * Tömmer textfälten
		 **/
		public function clear(): void
		{
			_firstName_tf.input_tf.text = '';
			_lastName_tf.input_tf.text = '';
			_birthday_tf.input_tf.text = '';
		}
		
		
		/**
		 * Får tillgång till _addButton
		 **/
		public function get addButton(): Sprite
		{
			return _addButton;
		}
		
		/**
		 * Ändrar värde på _firstName_tf.input_tf.text
		 **/
		public function set firstName( name:String ): void
		{
			_firstName_tf.input_tf.text = name;
		}
		
		/**
		 * Ger värdet på det man har skrivit in i _firstName_tf.
		 **/
		public function get firstName(): String
		{
			return _firstName_tf.input_tf.text;
		}
		
		public function set lastName( name:String ): void
		{
			_lastName_tf.input_tf.text = name;
		}
		
		public function get lastName(): String
		{
			return _lastName_tf.input_tf.text;
		}
		
		
		/**
		 * Tar emot en uint och typecastar den till en String, för att den ska gå att skriva ut i textfältet.
		 **/
		public function set birthday( date:uint ): void
		{
			_birthday_tf.input_tf.text = String( date );
		}
		
		public function get birthday(): uint
		{
			return uint( _birthday_tf.input_tf.text );
		}
		
		/**
		 * Ändrar vald checkbox beroende på kön
		 **/
		public function set gender( gender:String ): void
		{
			// Kollar om det man har skickat in är en man.
			if( gender == Person.MAN )
			{
				// Om man inte redan är vald ska värdena ändras
				if( !_man_cb.isSelected )
				{
					_man_cb.changeSelectedStatus();
					_woman_cb.changeSelectedStatus();
				}
			}
			// Samma sak gäller om det är en kvinna
			else if( gender == Person.WOMAN )
			{
				if( !_woman_cb.isSelected )
				{
					_man_cb.changeSelectedStatus();
					_woman_cb.changeSelectedStatus();
				}
			}
		}
		
		/**
		 * Returnerar det kön man valt
		 **/ 
		public function get gender(): String
		{
			if( _man_cb.isSelected )
			{
				return Person.MAN;
			}
			else
			{
				return Person.WOMAN;
			}
		}
		
		// När man trycker på en av boxarna ska de byta vilken som är vald.
		private function onCheckBoxClick_changeSelected(e:MouseEvent):void
		{
			_man_cb.changeSelectedStatus();
			_woman_cb.changeSelectedStatus();
		}
	}
}