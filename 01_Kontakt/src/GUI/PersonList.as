package GUI
{
	import Tools.Slider;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import flashx.textLayout.elements.ListItemElement;
	
	public class PersonList extends Sprite
	{	
		private var _dbList:Model_Db_Com;	
		private var _bkplItem:PLItemUI;	
		private var _conteiner:Sprite;	
		private var _mask:Sprite;	
		private var _slider:Slider;
		
		
		private var person_ui:PersonListItemUI; 
		
		public function PersonList(dbList:Model_Db_Com)	
		{	
			_conteiner= new Sprite();
			_dbList= dbList;
			_dbList.addEventListener(Event.COMPLETE, onComplet);	
			_conteiner.addEventListener(MouseEvent.CLICK, onclick);
			_slider= new Slider();
			_slider.x= 311;
			_slider.y=1;
			addChild(_slider);
			_slider.addEventListener(Event.CHANGE, moveList);
		}	
		
		private function moveList(e:Event):void
		{
			var conteinerRange:Number;

			conteinerRange= _conteiner.height - _mask.height;
			_conteiner.y =  -(conteinerRange * _slider.scrollPercent);
			trace(_conteiner.y);
		}
		
		private function onclick(e:MouseEvent):void
		{
			trace(e.target);
			var listItem:PersonListItemUI;
			listItem= e.target as PersonListItemUI;//type casta eller PersonListItemUI(e.target);
			if(!listItem) return;
			trace(listItem.personData.name+' '+listItem.personData.lastName);
			
			_dbList.setSelected(listItem.personData);
		}
		public  function onComplet(e:Event):void
		{		
			trace('COMPLETE');
			_mask= new Sprite();	
			_bkplItem= new PLItemUI();
			_conteiner.mask=_mask;		
			_mask.graphics.beginFill(0x00FF00);	
			_mask.graphics.drawRect(0,0,310,265);	
			_mask.y = 25;		
			addChildAt(_bkplItem, 0);	
			addChild(_conteiner);	
			addChild(_mask);		
			for (var i:int = 0; i < _dbList.persons.length; i++) 
			{	
				person_ui= new PersonListItemUI(_dbList.persons[i]);
				person_ui.mouseChildren= false;
				person_ui.mouseEnabled= true;
				person_ui.y = 55 * i;	
				_conteiner.addChild(person_ui);	
				
				
			}	
			
		}

		public function get conteiner():Sprite
		{
			return _conteiner;
		}

	}
}