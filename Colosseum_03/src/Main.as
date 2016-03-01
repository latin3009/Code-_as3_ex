package
{
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.globalization.Collator;
import flash.text.TextField;
import flash.ui.Keyboard;
import flash.ui.Mouse;
import flash.utils.Timer;

import game_view.GameOverView;
import game_view.GameView;
import game_view.SplashView;

import gameobjects.Bullet;
import gameobjects.Drone;
import gameobjects.Follower;
import gameobjects.GameObject;
import gameobjects.Hunter;
import gameobjects.Player;

import input.KeyboardManager;
import input.ScoreCounter;

import org.osmf.events.TimeEvent;

// setting the stage form
	[SWF(width="700", height="375")]
	public class Main extends Sprite
	{
	private var _enemies:GameObjectCollection;	
	private var _bullets:GameObjectCollection;
	private var _keyboard:KeyboardManager;
	private var _player:Player;
	private var _gameView:GameView;
	private var _gameOver_ui:GameOverView;
	private var  _bk:Bk_UI;
	private var _spl_ui:SplashView;	
	private var _timer:Timer= new Timer(7000);
    private var isMouseDown:Boolean=false;

	
     public var scoreCounter:ScoreCounter
	public function Main()
	{ //start menu vi.
		_spl_ui = new SplashView();	
		_spl_ui.x=0;
		_spl_ui.y=0;
		addChild(_spl_ui);	
		_spl_ui.addEventListener(MouseEvent.CLICK,init );
	    
	}
	
	private function init(e:MouseEvent):void
	{	// setts the game parts to stage
			_spl_ui.deactivate();
			
			trace('startGame');
				
			_bk = new Bk_UI();
			addChild(_bk);
			scoreCounter= new ScoreCounter;
			_keyboard= new KeyboardManager(stage);
			_player= new Player;
			addChild(	_player);
			
			_enemies= new GameObjectCollection();	 				 
			addChild(_enemies);
			   _bullets= new GameObjectCollection();
			addChild(_bullets);
			
			_gameOver_ui= new GameOverView(stage);
			addChild(_gameOver_ui);
			
			_gameOver_ui.deactivate();
			addEventListener(Event.ENTER_FRAME, handleEnterFrame);
			_gameOver_ui._gov.restart_btn.addEventListener(MouseEvent.CLICK, handleKeyDown);
			_timer.addEventListener(TimerEvent.TIMER, spawn);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			_timer.start();
			

	        reset();
		}
	
	
	//reset the game if needed
	private function reset():void
	{
		
		    trace("reset");
		    _enemies.clear();
		    _bullets.clear();
			scoreCounter.resetvalue();
			_player.reset();
			_timer.delay= 7000;
			
	// spawns enemyes
		for (var i:int = 0; i < 5; i++) 
		{
			var follower:Follower= new Follower(_player);
		    var drone:Drone= new Drone();
			var hunter:Hunter= new Hunter(_player);
		    _enemies.add(follower);
	        _enemies.add(drone);
		    _enemies.add(hunter);
	
		}
		//player stays within stage parameters
		    _player.x= Settings.STAGE_W/2 ;
		    _player.y=Settings.STAGE_H /2;
	}
	// timer to spawn my enemies continuosly
	protected function spawn(event:TimerEvent):void
	{  
		
		if(_timer.delay >= 2000)
		{
			_timer.delay -= 1000;
		}
		
		var follower:Follower= new Follower(_player);
		var drone:Drone= new Drone();
		var hunter:Hunter= new Hunter(_player);
		
		_enemies.add(follower);
		_enemies.add(drone);
		_enemies.add(hunter);		
	
	}
		
	private function handleEnterFrame(e:Event):void
	{
	   //my objects updates
		_enemies.update();
		_player.update();
	    _bullets.update();
				//player movment toward mouse
		var mouseDirX:Number=  mouseX -  _player.x  ;
		var mouseDirY:Number=  mouseY -  _player.y ;
		_player.rotation= Math.atan2(mouseDirY, mouseDirX)/ Math.PI * 180;
	//colition betwen bullets and enemyes
		for each( var enemy:GameObject in _enemies.collection)
		{
			for each(var bullet:Bullet in _bullets.collection) 
			{
				if(bullet.colitionIdentifier(enemy))
				{
					
					enemy.die();
				    bullet.die();
					
						scoreCounter.addToValue(enemy.value);
				}
								
			}
			
			
			
			if(_player.colitionIdentifier(enemy))
			{
				_player.die();
				
				_gameOver_ui.activate();
				_gameOver_ui.setScore(scoreCounter.FinalScore);
			}
		}
			
			//keyboard control
		if (_keyboard.isDown(Keyboard.UP))
		{
			_player.move(0,-1);
			
		}
		else if (_keyboard.isDown(Keyboard.DOWN))
		{
			_player.move(0,1);
		}
		if (_keyboard.isDown(Keyboard.RIGHT))
		{
			_player.move(1,0);
		}
		else if (_keyboard.isDown(Keyboard.LEFT))
		{
			_player.move(-1,0);
		}
		
		if(isMouseDown)
		{
			if(_player.canShoot)
			{
				shoot();
				
			}
			
		}
		
		
		
		
		   _bk.score_TF.text=scoreCounter.currValue.toString();
		  
	}
	//shoot control
	private function shoot():void
	{
		if(!_player.canShoot) return;
		
		var velocityX:Number= Math.sin(-(_player.rotation -90)/180 *Math.PI) * 10;
			var velocityY:Number=Math.cos(-(_player.rotation -90)/180 *Math.PI) * 10;
			velocityX += _player._velocity.x/50;
			velocityY+= _player._velocity.y/50;
			var bullet:Bullet= new Bullet(velocityX,velocityY);
		    
			bullet.x = _player.x;
			bullet.y = _player.y;
			
		    _bullets.add(bullet);
			
			_player.shoot();
			
	}
	private function onMouseDown(event:MouseEvent):void
	{
		isMouseDown=true;	
	}	
	
	private function onMouseUp(event:MouseEvent):void
	{
		isMouseDown=false;	
	}
	
	private function handleKeyDown(e:MouseEvent):void
	{
		
		if (MouseEvent) reset();
		_gameOver_ui.deactivate();
	}
}
}