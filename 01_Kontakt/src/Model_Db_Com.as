package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.NetConnection;
	import flash.net.Responder;
	import flash.sensors.Accelerometer;

	
	public class Model_Db_Com  extends EventDispatcher
	{
		private var _persons:Vector.<Person_Data>;
		private var _netCon:NetConnection;
		private var _resp:Responder;
		private var _personSelected:Person_Data;
		
		public function Model_Db_Com()
		{
			_persons= new Vector.<Person_Data>;
			
		
			_netCon= new NetConnection;
			_netCon.connect('http://fla12.riol.se/amf/');
			
			
			
    
		}
		public function getAll():void
		{
			_netCon.call('kontaktService.getAllPersons', new Responder(onResult));
		}
		public function get persons():Vector.<Person_Data>
		{
			return _persons;
		}
		public function editPerson(person:Object):void
		{
			_netCon.call('kontaktService.updatePerson',null, person );
			trace('person edited');
		}
		public function deletePerson():void
		{
			_netCon.call('kontaktService.deletePerson', null, 590);
		}
		 public function savePerson(person:Object):void
		 {
			 _netCon.call('kontaktService.savePerson', null,person);
		 }
		 
		 public function setSelected(person_data:Person_Data):void
		 {
			 _personSelected=person_data ;
			 dispatchEvent(new Event(Event.SELECT));
		 }
	
		 
		
		private function onResult(o:Object):void
		{
					
			var i :uint;
			var arr:Array= o as Array;

			for (i=0; i<arr.length; i++) {
				var person : Object;
				
				person = arr[i];
				persons.push(new Person_Data(person.first_name,person.last_name,person.id,person.image_url ));
			    }
		
		dispatchEvent(new Event(Event.COMPLETE));
	      }

		public function get personSelected():Person_Data
		{
			return _personSelected;
		}

	}
}