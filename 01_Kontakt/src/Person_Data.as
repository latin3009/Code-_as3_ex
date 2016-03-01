package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	
	public class Person_Data extends EventDispatcher
	{
		
		private var _name:String;
		private var _lastName:String;
		private var _id:uint;
		private var _image_url:String;
		private var _loader:Loader;
		private var _bitmap:Bitmap;
		public static  const LOADED :String = 'Loaded';
		public function Person_Data(name:String, lastName:String,id:uint,image:String)
		{
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			_loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgress);
			_loader.load( new URLRequest( image ));
			
			_name= name;
			_lastName= lastName;
			_id=id;
			_image_url=image;
			trace(_id);
			//trace(_name);
			//trace(_lastName);
			//trace(_image_url);
			
		}
		private function onComplete(e:Event):void
		{
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onComplete);
			_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);
			_loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, onProgress);
			//trace('Image Loaded');
			_bitmap=Bitmap(_loader.content);
			dispatchEvent(new Event(LOADED));
			
		}
		protected function onProgress(e:ProgressEvent):void
		{
			//trace('loaded:',uint( e.bytesLoaded / e.bytesTotal * 100)+ '%');
		}
		
		private function onIOError(e:IOErrorEvent):void
		{
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onComplete);
			_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);
			
		}
		
			
		public function get name():String
		{
			return _name;
		}

		public function get lastName():String
		{
			return _lastName;
		}

		public function get id():uint
		{
			return _id;
		}

		public function get bitmap():BitmapData
		{
			return _bitmap.bitmapData;
		}
		


	}
}