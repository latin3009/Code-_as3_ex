package game_view
{
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldType;

import input.ScoreCounter;
// game over view with buton, score .
public class GameOverView extends GameView
{
	public var _gov:GameOver_ui;
	private var _bk:Bk_UI;
	private var _stage:Stage;
	private var _score:ScoreCounter = new ScoreCounter();
	public var finalScore:Number=_score.FinalScore;

	public function GameOverView(stage:Stage)
	{    
		_stage=stage;
		_bk= new Bk_UI();
		_gov= new GameOver_ui();
		this.x=0;
		this.y=0;		
		addChild(_gov);
		
	    _gov.restart_btn.addEventListener(MouseEvent.CLICK, onMouseClickRestart);
	    trace(_gov.scoreF_TF);
		
	}
	private function onMouseClickRestart(event:MouseEvent):void
    {
	trace('click');
	dispatchEvent(new MouseEvent(MouseEvent.CLICK));
    }
	public function setScore(score:Number):void
	{
		_gov.scoreF_TF.text= score.toString();
	}
	
	
	 override public function activate(): void
	{
		 
		this.visible= true;
	}
	override public function deactivate():void
	{
		visible= false;
	}
	
	
}


}
