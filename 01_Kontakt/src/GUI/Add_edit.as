package GUI
{
	import Tools.Button;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.sensors.Accelerometer;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	import flashx.textLayout.formats.WhiteSpaceCollapse;
	
	
	
	public class Add_edit extends Sprite
	{
		private var _add_edit :Add_editUI;
		private var _mDB:Model_Db_Com;
		
	 
		private var _updateInsteadOfSaving : Boolean;
		
	
		
		
		
		//put out grafic to edit add person
		public function Add_edit(dbList:Model_Db_Com)
		{
			_mDB= dbList;
			initGfx();
		
		
			_add_edit._save_btn.addEventListener(MouseEvent.CLICK, onClickSaveButton);
            
		}
		private function initGfx():void
		{
			
			_add_edit = new Add_editUI();
			
			_add_edit.x=0;
			_add_edit.y = 25;
			addChild( _add_edit );
			
			_add_edit._inName_tf.text = "name"
				_add_edit.inLname_tf.text="last name"
			
			
			
			
		}
		private function onClickSaveButton(e:MouseEvent):void
		{
			
		
			var firstName:String= _add_edit._inName_tf.text;
			var lastName:String =_add_edit.inLname_tf.text;
			
			if (_updateInsteadOfSaving) {
				var p:Object= 
					{
						id: _mDB.personSelected.id,
						first_name: firstName,
						last_name: lastName
					};
			
				
				_mDB.editPerson(p);
			
				
				trace('updated');
			}
		
			else {
				trace('clicked save button');
				addNewContact(firstName, lastName);
			
			}
			
			deactivate();
		}
		
		public function editContact(person:Person_Data):void
		{
			_add_edit._inName_tf.text =_mDB.personSelected.name;
			_add_edit.inLname_tf.text=_mDB.personSelected.lastName;
		
			_updateInsteadOfSaving = true;
			
		}
		
		
		
		
		private function onSaveButtonCLick_createNewContact(e:MouseEvent):void
		{
			trace( ' you clicked on add button ');
			
			addNewContact( _add_edit.firstName, _add_edit.lastName);
			
			// rensar _form
			_add_edit.clear();			
		}
		private function addNewContact(firstName:String, lastName:String): void
		{
			var personObject:Object =
				{
				first_name: firstName,
				last_name:lastName
				
		   	    };
			
			_mDB.savePerson(personObject);
			
			trace('added');
			trace(personObject);
			
			
			
			
		}
		
		private function clear():void
		{
			_add_edit.inLname_tf.text= ' ';
			_add_edit._inName_tf.text=' ';
		}
		private function deactivate():void
		{
			this.visible= false;
		}
		
		
		
		
	}
}