package objects.enemies
{
	
	public class Cobra extends GameObject
	{
		private var _enemyFollwer:Enemy_02;
		private var _target:GameObject;
		public function Cobra(target:GameObject)
		{
			_target= target;
			_enemyFollwer= new Enemy_02();
			_enemyFollwer.scaleX=.4;
			_enemyFollwer.scaleY=.4;
			addChild(_enemyFollwer);
			this.maxSpeed=1;
			
			value= 10
			
			
			
		}
		override public function update():void
		{    //will crash on player
			velocity.x += (_target.x - this.x) * .1;
			velocity.y  += (_target.y - this.y)* .1;
			super.update();
		}
	}
}