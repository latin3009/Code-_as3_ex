package GUI
{	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.sampler.NewObjectSample;
	import flash.text.TextField;
	
	public class ContactPersonUI extends Sprite	
	{	
		private var _name:Name_disp_tf;
		
		private var _bitmap:Bitmap;
		private var _personData:Person_Data;	
	    private var _mdb:Model_Db_Com;
		private var _cp:PreviewBK;
		private  var targetContact:Person_Data	
		
		public function ContactPersonUI(modelDB:Model_Db_Com)	
		{		
			_mdb= modelDB;
			_mdb.addEventListener(Event.SELECT, onSelected_showInfo);
			
			_cp= new PreviewBK();	
			this.x=40;
			this.y=40;
			addChild(_cp);
			 //skapa en bitmap
			_bitmap= new Bitmap();
			_bitmap.x =_cp.x+5;	
			_bitmap.y=_cp.y+5;	
			
		
			
			addChild(_bitmap);	
			_name = new Name_disp_tf();
			
			
			_name.x= _bitmap.x ;	
	
			_name.y= 210;	
			
			addChild(_name);	
		
			
		}	
		private function onSelected_showInfo(e:Event):void	
		{
			targetContact= _mdb.personSelected;

			_name.Name_Disp_tf.text =targetContact.name +' '+ targetContact.lastName;	
			
			_bitmap.bitmapData = targetContact.bitmap;
			_bitmap.width=160;	
			_bitmap.height=160;
		}	
	}
}
		
			
		
	