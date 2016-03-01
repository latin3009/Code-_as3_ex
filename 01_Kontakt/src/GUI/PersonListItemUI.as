package GUI
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import org.osmf.elements.ImageLoader;
	
	public class PersonListItemUI extends Sprite
	{	
		private var _fullName:InputFullName_tf;
		private var _bitmap:Bitmap;
		private var _personData:Person_Data;	
		private var _loadUI:Loading;
		
		public function PersonListItemUI(personData:Person_Data)
		{	
	
			
			_personData=  personData;
			_personData.addEventListener(Person_Data.LOADED, onImageLoaded_addImage);	
			
			_fullName= new InputFullName_tf();
			_fullName.x= 60;
			_fullName.y = 10;
			_fullName.buttonMode=true;
			_fullName._input_tf.text=_personData.name+" "+_personData.lastName;
			addChild(_fullName);
		}	
		
		private function onImageLoaded_addImage(e:Event):void	
		{		
			_bitmap = new Bitmap(_personData.bitmap);//skapa en bitmap	
			_bitmap.x=1;
			_bitmap.width=50;
			_bitmap.height=50;	
			addChild(_bitmap);	
		}

		public function get personData():Person_Data
		{
			return _personData;
		}

	}
}
	