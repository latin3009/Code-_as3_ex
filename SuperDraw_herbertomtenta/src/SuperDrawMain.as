package
{

		
	import Utilities.Pensil;
	import Utilities.Sliders;
	
	import com.adobe.images.PNGEncoder;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.LineScaleMode;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;

	[SWF =60]
	[SWF(width=500, height=480)]
	
	public class SuperDrawMain extends Sprite
	{ //make all the variables needed
		
		public var _bk:Background;
		private var _saveB	:Button;
		private var _loadB	:Button;	
		
		
		private var _bitmap:Bitmap;
		private var _bitmapData:BitmapData;
		private var fileref:FileReference;		
		private var loader:Loader;
		private var _pensil		:Pensil;
		private var _mtx			:Matrix;
		private var redSlider:Sliders;
		private var blueSlider:Sliders;
		private var greenSlider:Sliders;		
		private var newClick:Boolean=true;
		private var isPressed:Boolean;
		public var colorTransform:ColorTransform;
		
		
		
		//main function initialize program
		public function SuperDrawMain()
		{   //event listener to stage before start if we have conection to stage
			init();
		}
		
		public function init(): void
		{// init function to all our assets
	
			_pensil = new Pensil();
			_mtx = new Matrix();
			_bk = new Background();
			_bk.x= 0;
			_bk.y= 0;
			addChild(_bk);	
			_bitmapData = new BitmapData(480,400,false,0xffffff);
			_bitmap = new Bitmap(_bitmapData);//skapa en bitmap
				
			
			_bitmap.x=10;
			_bitmap.y=30;		 
			
			addChild(_bitmap);
			fileref = new FileReference();
			buttonsInit();			
		    
			initSliders();
			Load();
			
		    draw();
			//add events to buttons
			_saveB.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);	
			_saveB. addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			_loadB.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);	
			_loadB. addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);			
			_saveB.addEventListener(MouseEvent.CLICK, handleClickSave);
			_loadB.addEventListener(MouseEvent.CLICK, handleMouseEvent);
			
			stage.addEventListener(Event.ENTER_FRAME, tracer);			
			stage.addEventListener(MouseEvent.MOUSE_DOWN, handleClick);
			
			
		
			
			
			
					
			fileref.addEventListener(Event.SELECT, handleFileSelected);
			fileref.addEventListener(Event.COMPLETE, handleFileLoadComplete);
			
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, handleError);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, handleComplete);
			
		}
		
	
		public function buttonsInit( ):void
		{  
			//sets butons to stage
			_saveB= new Button();
			_loadB= new Button();
			_saveB.label.text='Save';
			_loadB.label.text='Load';			
			_saveB.x = 400;
			_saveB.y = 440;			
			_loadB.x = _saveB.x*.7;
			_loadB.y = _saveB.y;
			addChild( _saveB );
			addChild( _loadB );
			_saveB.mouseChildren= false
	    	_loadB.mouseChildren= false
		   _saveB.buttonMode = true;
		   _loadB.buttonMode = true;
		
						
		}
		
		public function initSliders(thumbColor:uint= 0x0000ff):void
		{  // adds sliders to stage
			redSlider= new Sliders();
			blueSlider= new Sliders();
			greenSlider= new Sliders();			
			redSlider.x= 10;
			redSlider.y= 440;
			greenSlider.x= redSlider.x+90;
			greenSlider.y= redSlider.y;
			blueSlider.x = greenSlider.x+ 90;
			blueSlider.y = greenSlider.y;
			
			addChild(redSlider);
			addChild(greenSlider);
			addChild(blueSlider);
			
			
				
			
			
		}
		

		
		
		
		
		
		private function onMouseOver(e:MouseEvent):void
		{ //gives efect to mouse
			_saveB.scaleX = _saveB.scaleY = 1.1;	
			_loadB.scaleX = _loadB.scaleY = 1.1;
			trace('mouse over');
		  
					
		}
		private function onMouseOut(e:MouseEvent):void
		{// gives efect to mouse
			_saveB.scaleX = _saveB.scaleY = 1;	
			_loadB.scaleX = _loadB.scaleY = 1;
			trace('Mouse out');
			
					
		}
		
		
		
		
			public function Load():void 
			{
				// loads file to stage from disc
				fileref = new FileReference();
				
				
				loader = new Loader();
				
				
			}
			// loads
			
			
			private function handleMouseEvent(_loadB:MouseEvent):void {
				fileref.browse([ new FileFilter("En fin bild", "*.gif;*.jpg;*.png") ]);
			}
			//selectes file
			private function handleFileSelected(e:Event):void {
				trace("file selected");
				fileref.load();
			}
			
			private function handleFileLoadComplete(e:Event):void {
				trace("file loaded");
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, handleLoadedImageComplete_draw);
				loader.loadBytes(fileref.data);
			}
			
			private function handleLoadedImageComplete_draw(e:Event):void
			{
				trace('draw image');
				_bitmapData.draw(loader);
			}
			
			private function handleError(e:IOErrorEvent):void {
				trace("Inte bra");
			}
			
			private function handleComplete(e:Event):void {
				trace("Bra!");
			}
			
			// saves image
			private function handleClickSave(_saveB:MouseEvent):void {
				 var filereference:FileReference;
				filereference = new FileReference();
				var data:ByteArray = PNGEncoder.encode(_bitmapData);
				filereference.save(data, "minbild.png");
			}
			
			
			
			private function draw():void
			{				
				
				_pensil.graphics.lineStyle(Math.random()*15, ( Math.random() * 0xffffff));
				// nollställer och ger ett nytt x- och y-värde.
				_mtx.identity();	
				_mtx.translate( mouseX-10,mouseY-30);
				
			colorTransform = new ColorTransform(0,0,0,1,redSlider.color, greenSlider.color, blueSlider.color, 0);
				_pensil.transform.colorTransform = colorTransform;

				// It will paint were the pensil is.
				_bitmapData.draw( _pensil, _mtx, colorTransform );		
			}
			
			private function tracer(e:Event):void
			{			//itt will trace and listen where mouse is	
				var _x:uint=(e.target.mouseX);
				var _y:uint=(e.target.mouseY);			
				
				if(isPressed)
				{					
					draw();
					stage.addEventListener(MouseEvent.MOUSE_UP, onRelease)
				}
				
			}
			
			
		
						
			private function handleClick(e:MouseEvent):void
			{  //it will look if ouse is clicked
				isPressed =true;
				trace("clicked");
			
				newClick=false;
			}
			
			
			private function onRelease(e:MouseEvent):void
			{		// if mouse is pressed
				isPressed=false;
				newClick=true;
				
				_pensil.graphics.endFill();
				
			
				
				trace("released!");
			}
			

			
			
			

			
					
			
	}
		
     
}