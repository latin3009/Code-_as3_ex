package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.filters.BevelFilter;
	import flash.filters.DropShadowFilter;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;

	// sets stage to a larger size
	[SWF(width="900")]
	public class TaleGenerator extends Sprite
	{
		private  var _urlLoader:URLLoader;
		private var _form:TaleGfx;			
	    private var _genBtn:Sprite;
		private var loadedText:String;
		
		public function TaleGenerator()
		{
			initGfx();			
		}
		
		private function initGfx():void
		{
			
			_form= new TaleGfx();
			addChild(_form);
		
			init();
		}
		
		private function init():void
		{
			_urlLoader = new URLLoader();
			_urlLoader.addEventListener(Event.COMPLETE, onComplete_showText);
			_urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			//lladda in text från vår  externa txt-fil. länken pekar dit den ligger.
			
			_urlLoader.load(new URLRequest('../Assets/Tales.xml'));	
			_genBtn= new Sprite();
			_genBtn.graphics.beginFill(0xc4c4c4);
			_genBtn.graphics.drawRoundRect(80,250,120,30,2,2);
			_genBtn.filters=[new BevelFilter(2,45)];
			_genBtn.filters=[new DropShadowFilter(4,45)];
				
			_genBtn.buttonMode=true;
			_genBtn.mouseEnabled= true;
			
			addChild(_genBtn);
			_genBtn.addEventListener(MouseEvent.CLICK,  onClick);
		}
		
		public function get addButton(): Sprite
		{
			return _genBtn;
		}
		
		private function onComplete_showText(e:Event):void
		{
			
			_urlLoader.data;
		
			_urlLoader.removeEventListener(Event.COMPLETE, onComplete_showText);
			_urlLoader.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);
			var xml:XML= XML(_urlLoader.data);
		
			//hur man kan spara den inladdade texten i en sträng
			 loadedText = xml.Tale;
		
		}
		
		private function onClick(Event:MouseEvent):void
		{
			
			var str:String = loadedText;
			str = change_paterns("{Adjetive}", str, _form.adjetive.split(','));
			str = change_paterns("{Sustantive}",str, _form.noun.split(',' ));
			str = change_paterns("{Name}",str, _form.Name.split(','));
			str = change_paterns("{Verb}",str,_form.verb.split(','));
			trace(str);
			var tf:TextField = new TextField();
			var myText:XML= new XML();
			 
			tf.height = 200; 
			tf.multiline = true; 
			tf.wordWrap = true; 
			tf.border = true; 
			tf.autoSize;
			tf.selectable=false
			 
			tf.htmlText = myText; 
			addChild(tf);
			tf.x= 350;
			tf.y = 10;
			tf.width=500;
			tf.text= str;
	
			trace('button click');
		}
		
		private function change_paterns(patern:String,story:String,words:Array):String	
		{
			while(story.indexOf(patern)>=0)
			{
				var id:int = Math.random() * words.length;
				story = story.replace(patern, words[id]);
			}
			
			return story;
		}
		
		private function onIOError(e:IOErrorEvent):void
		{
			trace('IO Error', e.text);
			
		}
		
	}
	
}
	

	
	

