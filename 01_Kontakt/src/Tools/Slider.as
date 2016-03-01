package Tools
{
	import GUI.PersonList;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.ui.Mouse;
	
		
		
		
	public class Slider extends Slider_UI
	{
		
		private var _max:uint;
		private var  _min:uint;
		private var _yoffset:Number;
		private var _personList:PersonList;
		private var _uppBtn:SliderUpButtonUI;
		private var _downBtn:SliderDownButtonUI;
		private var _scrollPercent:Number = 0;
		private var  _thumbRange:Number;
       

		
		
		public function Slider() 
		{
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			
			
		}
		private function init(e:Event):void
		{
			
			
			thumb_ui.y = 0;
			track_ui.y = 0;
			thumb_ui.addEventListener(MouseEvent.MOUSE_DOWN, onMoveThumb);   
			stage.addEventListener(MouseEvent.MOUSE_UP, onReleasThumb); 
			thumb_ui.buttonMode= true;
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_min =8 ;
			_max=(track_ui.height - thumb_ui.height) -8 ;
			
		}
		
		public function updateValue(e:Event):void
		{   
			thumb_ui.y= mouseY + _yoffset;
			_thumbRange= track_ui.height - thumb_ui.height;
			
			if(thumb_ui.y < _min)
			{
				thumb_ui.y = _min;
			}
			else if(thumb_ui.y > _max)
			{
				thumb_ui.y = _max;
				
			}
			_scrollPercent = (thumb_ui.y - track_ui.y) / _thumbRange;
            trace(_scrollPercent);
			
			dispatchEvent(new Event(Event.CHANGE));
			
		}
		
		
		private function onMoveThumb(event:MouseEvent):void
		{
			
			_yoffset = thumb_ui.y - mouseY;
			addEventListener(Event.ENTER_FRAME, updateValue);
			
			
		}
		
		
		private function onReleasThumb(e:MouseEvent):void
		{
			removeEventListener(Event.ENTER_FRAME, updateValue);
			
			trace('mouse up');
		}

		public function get scrollPercent():Number
		{
			return _scrollPercent;
		}
		
		
		
		
		
	}
}