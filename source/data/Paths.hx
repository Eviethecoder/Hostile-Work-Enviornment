package data;

import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;

class Paths
{
	inline static public function image(key:String, ?library:String):String
	{
		var lib = library != null ? library : "images";
		var path = 'assets/' + lib + '/' + key + '.png';
		FlxG.bitmap.add(path, false); // Precache image
		return path;
	}

	/**
	 * Returns the path to a sound and preloads it using FlxG.sound.load.
	 */
	inline static public function sound(key:String, ?library:String):String
	{
		var lib = library != null ? library : "sounds";
		var path = 'assets/' + lib + '/' + key + '.ogg';
		// Preload sound (loads into cache, but doesn't play)
		FlxG.sound.load(path, 1, false, null, true);
		return path;
	}

	inline static public function font(key:String, ?library:String):String
	{
		var path = 'assets/fonts/' + key + '.ttf';
		// Preload sound (loads into cache, but doesn't play)

		return path;
	}

	/**
	 * Returns the path to a spritesheet XML and precaches it using FlxAtlasFrames.
	 */
	inline static public function spritesheetXML(key:String, ?library:String):String
	{
		var lib = library != null ? library : "images";
		var imagePath = 'assets/' + lib + '/' + key + '.png';
		var xmlPath = 'assets/' + lib + '/' + key + '.xml';
		// Precache atlas frames (loads and caches the frames for the spritesheet)
		try
		{
			var xml = Xml.parse(sys.io.File.getContent(xmlPath));
			FlxAtlasFrames.fromSparrow(FlxG.bitmap.add(imagePath, false), xml);
		}
		catch (e:Dynamic)
		{
			trace(e);
		}
		return xmlPath;
	}
}
