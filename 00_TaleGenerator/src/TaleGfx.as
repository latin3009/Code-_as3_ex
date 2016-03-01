package
{
	import flash.crypto.generateRandomBytes;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;

	public class TaleGfx extends MovieClip
	{
		private var _adj_tf:FormTextField;
		private var _noun_tf	:FormTextField;
		private var _verb_tf	:FormTextField;
		private var _name_tf:FormTextField;
		private var myText:String = "Adjective"; 
		
		public function TaleGfx()
		{
			init();
		}
		public function init():void
		{
			
			var header : Header = new Header();
			addChild( header );
			
			_adj_tf = new FormTextField();
			_adj_tf.type = TextFieldType.INPUT; 
			_adj_tf.background = true; 
			_adj_tf.label_tf.text = myText;
			_adj_tf.y = header.y + header.height + 30;
			addChild( _adj_tf );
			
			_verb_tf = new FormTextField();
			_verb_tf.type = TextFieldType.INPUT; 
			_verb_tf.background = true;
			_verb_tf.label_tf.text = 'Verb';
			_verb_tf.y = _adj_tf.y + _adj_tf.height + 5;
			addChild( _verb_tf );
			
			_name_tf= new FormTextField;
			_name_tf.type = TextFieldType.INPUT; 
			_name_tf.background = true;
			_name_tf.label_tf.text = 'Name';
			_name_tf.y = _verb_tf.y + _verb_tf.height + 5;
			addChild( _name_tf );
			
			_noun_tf = new FormTextField();
			_noun_tf.type = TextFieldType.INPUT; 
			_noun_tf.background = true;
			_noun_tf.label_tf.text = 'Sustantive';
			_noun_tf.y = _name_tf.y + _name_tf.height + 5;
			addChild( _noun_tf );
			
		}
		
		public function clear(): void
		{
			_adj_tf.input_tf.text = '';
			_verb_tf.input_tf.text = '';
			_noun_tf.input_tf.text = '';
			_name_tf.input_tf.text = '';
		}
	
		public function get adjetive(): String
		{
			
			return _adj_tf.input_tf.text ;
		}
		
		public function get Name(): String
		{
			return _name_tf.input_tf.text;
		}
		
		public function get verb(): String
		{
			return _verb_tf.input_tf.text;
		}
		
		public function get noun(): String
		{
			return _noun_tf.input_tf.text;
		}
		
	}
}