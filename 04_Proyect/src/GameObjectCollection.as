package
{
	import flash.display.Sprite;
	import flash.net.drm.VoucherAccessInfo;
	import flash.sensors.Accelerometer;
	public class GameObjectCollection extends  Sprite
	{
		private var _collection:Vector.<GameObject>;
		
		
		public function GameObjectCollection()
		{
			_collection= new Vector.<GameObject>();
			super();
		}
		public function add(object:GameObject):GameObject
		{
			_collection.push(object);
			addChild(object);
			
			return object;
			
		}
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
			
			public function clear():void
			{
				while (numChildren) removeChildAt(0);
				_collection.splice(0, _collection.length);
				
			}
			
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
	