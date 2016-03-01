package
{
	import UI.GameOverMenu;
	import UI.StartMenu;
	
	import controlers.KeyboardAdministrator;
	import controlers.Score;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	
	import objects.Bullet;
	import objects.Missile;
	import objects.enemies.Cobra;
	import objects.enemies.Eagle;
	import objects.enemies.Falcon;
	import objects.enemies.Plasma;
	import objects.players.Player;

[SWF(width="600", height="600")]
public class Main extends Sprite
{
	
	private var _enemies:GameObjectCollection;
	private var _bullets:GameObjectCollection;
	private var _misiles:GameObjectCollection;
	private var _plasma:GameObjectCollection;
	private var _player:Player;
	private var _keyBoard:KeyboardAdministrator;
	private var _bk:Back_g;
	private var _startM:StartMenu;
	private var _gameVIEW:GameView;
	private var _gameOverMenu:GameOverMenu;
	private var _score_TF:TextField;
	private var  _enemy2:Eagle;
	 public var  score:Score;
	private var _timer:Timer= new Timer(5000);
	public function Main()
	{
		_startM= new StartMenu;
		_startM.x=0;
		_startM.y= 0;
	   
		addChild(_startM);
		_startM.addEventListener(MouseEvent.CLICK, init);
		
			
		trace('start');
		
	}
	
	public function init(e:MouseEvent):void
	{
		_startM.deactivate();
		 _gameVIEW= new GameView();
		 addChild(_gameVIEW);
	     score= new Score();
		_keyBoard = new KeyboardAdministrator(stage);
		_bk= new Back_g();
		addChild(_bk);
		_score_TF= new TextField();
		addChild(_score_TF);
		_player=  new Player();
		
		addChild(_player);
		
		_enemy2= new Eagle();
		_enemy2.x=30;
		_enemy2.y=10;
	     addChild(_enemy2);
		
		_enemies = new GameObjectCollection();	
		//puts my colection on the horizont
		_enemies.y= 30; //Math.random()*500;
		addChild(_enemies);
		_bullets= new GameObjectCollection();
		addChild(_bullets);
		_plasma= new GameObjectCollection();
			addChild(_plasma);
		_misiles= new GameObjectCollection();
		addChild(_misiles);
		
		_gameOverMenu= new GameOverMenu;
		_gameOverMenu.x=0;
		_gameOverMenu.y=0;
		
		_gameOverMenu._reStartBtn.addEventListener(MouseEvent.CLICK, reset);
			
		addEventListener(Event.ENTER_FRAME, handleEnterFrame);
		//reset function for game
		stage.addEventListener(KeyboardEvent.KEY_DOWN, handleKeyDown);
		stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		_timer.addEventListener(TimerEvent.TIMER, eagleShoot);
		_timer.start();
		reset();
	}
	
	public function onClickRestart(event:Event):void
	{
		_gameOverMenu.deactivate();
		reset();
		
		
	}
	private function reset(e:Event = null):void
	{
		_gameOverMenu.deactivate();
		
		trace('reset');
		_enemies.clear();
		_bullets.clear();
		_misiles.clear();
		_plasma.clear();
		score.resetvalue();
		_timer.delay= 7000;
		_enemy2.isAlive;
		_player.reset();
		
		for (var i:int = 0; i < 5; i++) 
		{
			var enemy:Falcon= new Falcon;
			var enemy1:Cobra;
			_enemies.add(enemy);			
			enemy1= new Cobra(_player);
			_enemies.add(enemy1);
			
		
		}
	}
	
	
	
	public function handleEnterFrame(e:Event):void
	{
		_player.update();
		_enemies.update();
		_bullets.update();
		_misiles.update();
		_enemy2.update();
		_plasma.update();
	
		
		var explotion:Explosion_ui;
		var bullet:Bullet
		
		for each(bullet in _bullets.collection) 
		{
				if(bullet.colitionIdentifier(_enemy2) && _enemy2.isAlive)
				{  
					explotion = new Explosion_ui();
					explotion.x= bullet.x;
					explotion.y= bullet.y;
					addChild(explotion);
					_enemy2.isDead();
					bullet.die();
					score.addToValue(_enemy2.value);
				}
		}
		
		for each( var enemy:GameObject in _enemies.collection)
		{
			for each(bullet in _bullets.collection) 
			{
				if(bullet.colitionIdentifier(enemy))
				{  
					explotion = new Explosion_ui();
					explotion.x= bullet.x;
					explotion.y= bullet.y;
					addChild(explotion);
					enemy.die();
					bullet.die();
					score.addToValue(enemy.value);
				}
				
				
			}
			
			
			for each(var misile:Missile in _misiles.collection) 
			{
				if(misile.colitionIdentifier(enemy))
				{
					explotion = new Explosion_ui();
					explotion.x= misile.x;
					explotion.y= misile.y;
					addChild(explotion);
					enemy.die();
					misile.die();
					score.addToValue(enemy.value);
				}
				
			}
			
		}
		
		for each(enemy in _enemies.collection)
		{
		if(enemy.colitionIdentifier(_player) && _player.isAlive){
			explotion = new Explosion_ui();
			explotion.x= enemy.x;
			explotion.y= enemy.y;
			addChild(explotion);
			_player.die();
			addChild(_gameOverMenu);
			_gameOverMenu.visible= true;
			_gameOverMenu.setScore(score.FinalScore);
			}
		
				
		}
		for each( var plasma:GameObject in _plasma.collection)
		{
			if(plasma.colitionIdentifier(_player) && _player.isAlive){
				explotion = new Explosion_ui();
				explotion.x= plasma.x;
				explotion.y= plasma.y;
				addChild(explotion);
				
				_player.die();
				plasma.die();
				addChild(_gameOverMenu);
				_gameOverMenu.visible= true;
				_gameOverMenu.setScore(score.FinalScore);
				
		}
		     
			}
			
		if (_keyBoard.isDown(Keyboard.RIGHT))
		{
			_player.move(1,0);
		}
		else if (_keyBoard.isDown(Keyboard.LEFT))
		{
			_player.move(-1,0);
		}
		if (_keyBoard.isDown(Keyboard.SPACE))
		{
			fire();
		}
		//_bk.Score_tf.text=score.points.toString();
		if((_enemies.collectionSize==0 && _enemy2.isDead()) && _player.isAlive==false)
		{
			addChild(_gameOverMenu);
			_gameOverMenu.setScore(score.FinalScore);
		}
	}
	
	private function shoot():void
	{
		if(!_player.canShoot)return
			
		var velocityX:Number= Math.sin(-(_player.rotation -180)/180 *Math.PI) * 5;
		var velocityY:Number=Math.cos(-(_player.rotation -180 )/180 *Math.PI) * 5;
		velocityX += _player.velocity.x/50;
		velocityY+= _player.velocity.y/50;
		var bullet:Bullet= new Bullet(velocityX,velocityY);
		bullet.x = _player.x;
		bullet.y = _player.y;		
		_bullets.add(bullet);
		
		_player.shoot();
		
	}
	
	private function onMouseDown(e:MouseEvent):void
	{
		shoot();
	}	
	private function fire():void
	{
		if(!_player.canShoot)return
		
		var random:int = Math.floor(Math.random() * _enemies.collectionSize);
		var randomEnemy:GameObject;
		if(_enemies.collectionSize > 0) randomEnemy = _enemies.collection[random];
		var misile:Missile= new Missile(randomEnemy);
		misile.x = _player.x;
		misile.y = _player.y;
		_misiles.add(misile);
		_player.fire();
		
		
	}
	private function eagleShoot(e:TimerEvent):void
	{
		if(_timer.delay >= 2000)
		{
			_timer.delay -= 1000;
		}
		if(!_enemy2.canShoot)return
		
		var plasmaShot:Plasma= new Plasma(_player);
		plasmaShot.x = _enemy2.x;
		plasmaShot.y = _enemy2.y;	
		_plasma.add(plasmaShot);
	}
	
	private function handleKeyDown(e:KeyboardEvent):void
	{
		if(e.keyCode == Keyboard.ESCAPE)reset();
		
		
	}
}
}