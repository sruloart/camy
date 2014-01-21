package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

import flixel.util.FlxColor;


/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	var Stud: FlxSprite;
	var bystander: FlxSprite;
	var nogo: FlxSprite;
	var butt: FlxButton;
	var butt2: FlxButton;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		// Set a background color
		FlxG.cameras.bgColor = FlxColor.MAROON;
		// Show the mouse (in case it hasn't been disabled)
		#if !FLX_NO_MOUSE
		FlxG.mouse.show();
		#end
		
		super.create();
		
		
		Stud = new FlxSprite();
		Stud.makeGraphic(200, 200, FlxColor.WHITE,true);
		Stud.setPosition (110, 40);
		Stud.acceleration.x = 1; 
		add(Stud);
		
		bystander = new FlxSprite();
		bystander.makeGraphic(50, 50, FlxColor.CORAL, true);
		bystander.setPosition (220, 160);
		add(bystander);
		
		nogo = new FlxSprite();
		nogo.makeGraphic(50, 50, FlxColor.OLIVE, true);
		nogo.setPosition (100, 200);
		add(nogo);
	
		butt = new FlxButton (50, 50, "Fix Jitter", FixJitter);
		add(butt);
		butt2 = new FlxButton (50, 100, "Make Jitter", MakeJitter);
		add(butt2);
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{	
		super.update();
	}	

	public function FixJitter() {
	//Use a line like this to cancel the jitter effect when using FlxG.follow on an accelerating object
	FlxG.camera.follow(Stud);	
	FlxG.camera.followAdjust(Stud.acceleration.x / 100);		
	}
	
	public function MakeJitter() {
	//The camera jitters because it doesn't match the speed of the accelerating object...
	FlxG.camera.followAdjust(0, 0);
	FlxG.camera.follow(Stud);
	Stud.acceleration.x = 1; 
	}
}