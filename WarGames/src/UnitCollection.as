package 
{
	import units.Unit;
	
	public class UnitCollection 
	{
		
		
		private var _units:Vector.<Unit> = new Vector.<Unit>();
		
		public function UnitCollection()
		{
			
			
			
			
		}		
		public function add(unit:Unit):void 
		{
			_units.push(unit);
			trace("Added item:", unit);
			
		}
		public function getRandom():Unit
		{
			
				if (_units.length == 0) return null;
				var randIndex:uint = Math.floor(Math.random() * _units.length);
				return _units[randIndex];
		}
		public function remove(unit:Unit):void
		{
			 
			 _units.splice(_units.indexOf(unit),1 );
					
		}
			
		public function get size():uint
		{
		return _units.length;
		}
		
		
		
	
	}
}