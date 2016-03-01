package Utilities
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Rectangle;
	import flash.ui.Mouse;

	public class Sliders extends Slider
	{
		
		private var _color:uint;
		private var _offset:Number;
		private var _max:uint;
		private var  _min:uint;
		
		
		
		
		
		public function Sliders()
		{
		
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(e:Event):void
		{
			
			thumb.x = 0;
			track.x = 0;
			thumb.addEventListener(MouseEvent.MOUSE_DOWN, onDragThumb);   
			stage.addEventListener(MouseEvent.MOUSE_UP, onReleaseThumb); 
            thumb.buttonMode= true;
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_min =0;
			_max=track.width - thumb.width ;
		}
		public function updateColors(e:Event):void
		{   
			thumb.x= mouseX + _offset;
			
			
			if(thumb.x < _min)
			{
				thumb.x = _min;
			}
			else if(thumb.x > _max)
			{
				thumb.x = _max;
				
			}
			
		
			var value:Number =thumb.x/_max;
			_color = value *255;
			trace('%',value);
			trace(_color);
		
		}

		private  function onDragThumb(e:MouseEvent):void
		{
			
			
			_offset = thumb.x - mouseX;
				thumb.x= mouseX + _offset;
				
			addEventListener(Event.ENTER_FRAME, updateColors);
				
			
			
		}			
		
		private function onReleaseThumb(e:MouseEvent):void
		{
			removeEventListener(Event.ENTER_FRAME, updateColors);
			trace('stop');
		}
		
		public function get color():uint
		{
			return _color;
		}
		
		
		
	}
}