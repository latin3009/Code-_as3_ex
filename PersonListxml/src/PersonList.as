package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.net.NetConnection;
	import flash.net.Responder;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import formobjects.CheckBox;
	import formobjects.Form;
	
	[SWF(width="730")]
	public class PersonList extends Sprite
	{
		private var _form				:Form;
		
		private var _xPosMultiplier		:uint;
		private var _yPosMultiplier		:uint;
		
		private var _personLoader:URLLoader;
		
		private var _netCon:NetConnection;
		
		public function PersonList()
		{	
			init();
			
		}
		private function init():void
		{
			initForm();
			loadPerson();
			coninit();
		}
		
		private function loadPerson():void
		{
			_personLoader= new URLLoader();
			_personLoader.addEventListener(Event.COMPLETE, onComplete_addPerson);
			_personLoader.addEventListener(IOErrorEvent.IO_ERROR, onIO_Error);
			_personLoader.load( new URLRequest('../assets/persons.xml'));
			
			
		}		
		
		private function onIO_Error(e:IOErrorEvent):void
		{
			trace('IO Error',e.text);			
		}
		
		private function onComplete_addPerson(e:Event):void
		{
			_personLoader.removeEventListener(Event.COMPLETE, onComplete_addPerson);
			_personLoader.removeEventListener(IOErrorEvent.IO_ERROR, onIO_Error);
			
			var xml:XML  = XML(_personLoader.data);
			var personList:XMLList = new XMLList(xml.persons.person);
			
			for each (var person:XML in personList) 
			{
				addNewPerson(person.firstName,person.lastname,person.birthday,person.gender);
			}
			
		}
		
		private function coninit():void
		{
			_netCon = NetConnection();
			_netCon.connect('http://www.antonstrand.se/antonstrand/Amfphp/');
			var resp:Responder = new Responder(onSucsses, onFailure);
			_netCon.call('PersonList.getPersons', resp);
		}
		
		private function onSucsses(respond:Object):void
		{
			trace(respond);
			if(respond is Array)
			{
				for each (var person:Object in respond) 
				{
					trace('Person:',person.id,person.first_name,person.last_name,person.birthday,person.gender);
				}	
				
			}
			else
			{
				trace(respond);
			}
			
			
			
			
		}	
		private function onFailure(respond:Object):void
		{
			
			trace(respond);
		}	
		
		// Lägga ut en instans av formuläret (Form) och sätta en lyssnare på addButton
		private function initForm(): void
		{
			_form = new Form();
			addChild( _form );		
			_form.x = 20;
			
			_form.addButton.addEventListener(MouseEvent.CLICK, onAddButtonCLick_createNewPerson);
		}
		
		private function onAddButtonCLick_createNewPerson(e:MouseEvent):void
		{
			trace( ' you clicked on add button ');
		
			// Skapar en ny instans av Person och skickar in värdena från _form.
			
			addNewPerson(_form.firstName, _form.lastName, 
				_form.birthday, _form.gender);
			
			// Placerar ut instansen beroende på _x och _yPosMultiplier
			
			// ränsar _form
			_form.clear();			
		}
		
		private function onPersonClick_showInfo(e:MouseEvent):void
		{
			// Gör en lokal variabel av e.target som vi säger är en Person
			var targetPerson : Person = Person( e.target );
			
			// Hämtar informationen från den valda personen och skickar in det i formuläret igen.
			_form.firstName = targetPerson.firstName;
			_form.lastName = targetPerson.lastName;
			_form.birthday = targetPerson.birthday;
			_form.gender = targetPerson.gender;
			
			trace( targetPerson.firstName );
			trace( targetPerson.lastName );
			trace( targetPerson.birthday );
			trace( targetPerson.gender );
			trace( targetPerson.time );
		}
		private function addNewPerson(FirstName:String,lastName:String,birthday:uint,gender:String):void
		{
			var newPerson : Person = new Person( FirstName, lastName, 
				birthday, gender);
			
			addChild( newPerson );
			newPerson.x = (_xPosMultiplier * newPerson.width) + _form.x * 2 + _form.width;
			newPerson.y = (_yPosMultiplier * newPerson.height) + 10;
			
			_xPosMultiplier++;
			
			// Ska byta rad vid behov
			if( _xPosMultiplier > 6 )
			{
				_xPosMultiplier = 0;
				_yPosMultiplier++;
			}
			newPerson.addEventListener(MouseEvent.CLICK, onPersonClick_showInfo);
			
		}
	}
}