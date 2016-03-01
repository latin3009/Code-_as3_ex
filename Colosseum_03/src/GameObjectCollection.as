package 
{
	import flash.display.Sprite;
	import flash.net.drm.VoucherAccessInfo;
	import flash.sensors.Accelerometer;
	
	import gameobjects.GameObject;
	// collection od objects in game
	public class GameObjectCollection extends Sprite
	{
		public var _collection:Vector.<GameObject>; 
		
		
		public function GameObjectCollection()
		{   
		
			_collection= new Vector.<GameObject>();
			
			super();
		}
		//adds object
		public function add(object:GameObject):GameObject
		{
			_collection.push(object);
			addChild(object);
			return object;		
		}
		//removes object
		public function removeObject(object:GameObject):void
		{
			removeChild(object);
			for (var i:int= 0; i<_collection.length;  i++) 
			{
				if(_collection[i] == object)
				{
					_collection.splice(i,1);
					return;
				}				
			}			
		}
		//clear colection
		public function clear():void
		{
			while (numChildren) removeChildAt(0);
			_collection.splice(0, _collection.length);
		   
		}
		//updates collection
		public function update():void
		{
			for (var i:int = _collection.length - 1; i >= 0; i --)				
			{
				var go:GameObject= _collection[i];
				if(go.isAlive)
				{
					go.update();
				} else
				{
					removeObject(go);
				}
			}
			
		}
		//get size of collection
		public function get collectionSize():int
		{
			return _collection.length;
			
		}
			
		public function get collection():	Vector.<GameObject>
		{
			return _collection;
		}
   }			
}
			

		