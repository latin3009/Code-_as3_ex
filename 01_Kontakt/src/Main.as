package
{
	import GUI.Add_edit;
	import GUI.ContactPersonUI;
	import GUI.PersonList;
	
	import Tools.Button;
	import Tools.Slider;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	[SWF(width="600",height="400")]
	public class Main extends Sprite
	{
		private var _dbCon:Model_Db_Com;
		private var _add_edit:Add_edit;
		private var _bk_ui:BKUI;
		private var _cpUI:ContactPersonUI;
		private var _editBtn:Button;
		private var _plUI:PersonList;
	   
		private var _addBtn:addBtnUI;
		
	   
		
		public function Main() 
		{
			
				
			init();	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
			
		}
		
		private function init():void
		{
			
			initGFX();
		_addBtn.addEventListener(MouseEvent.CLICK, onAddButton_Click);
		_editBtn.addEventListener(MouseEvent.CLICK, onEditBtn_Click);
	  
		}
		
		
		private function initGFX():void
		{
			_dbCon=  new Model_Db_Com();
			_dbCon.getAll();
			
			_bk_ui = new BKUI();
			_bk_ui.x=stage.stageWidth *.5;
			_bk_ui.y=stage.stageHeight*.5;
			addChild(_bk_ui);
			_plUI= new PersonList(_dbCon);
			_plUI.x = 245;
			_plUI.y = 40;
			addChild(_plUI);
			
			_editBtn= new Button();
			_editBtn.x=60;
			_editBtn.y=350;
			addChild(_editBtn);
			_addBtn= new addBtnUI();
			_addBtn.x=240;
			_addBtn.y=350;	
			_addBtn.buttonMode= true;
			addChild(_addBtn);
			_editBtn.visible=false;
		
		
		_cpUI= new ContactPersonUI(_dbCon);
			addChild(_cpUI);
			
			_dbCon.addEventListener(Event.SELECT, showEditButton);
			
		}
		
		private function showEditButton(e:Event):void
		{
			_editBtn.visible=true;
		}
		private function onEditBtn_Click(e:MouseEvent):void
		{
			trace( ' you clicked on edit button ');
			_add_edit= new Add_edit(_dbCon);
			addChild(_add_edit);	
			_add_edit.editContact(_dbCon.personSelected);
			
		}
		
		
		private function onAddButton_Click(e:MouseEvent):void
		{
			trace( ' you clicked on add button ');
			_add_edit= new Add_edit(_dbCon);
			addChild(_add_edit);	
		
				
		}
		
		
		
		
			
		
	}
}