<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="de">
<head>
	<title>PHP: rename files in current directory</title>
	<style type="text/css">
	body {font-family: verdana; font-size: 12px;}
	label {display: inline-block; width: 60px;}
	input {display: inline-block; width: 100px;}
	#button {margin-left: 63px; width: 108px;}
	.red {color: #c10000;}
	.green {color: #04b404;}
	.blue {color: #2e9afe;}
	span {display: inline-block; width: 40%;}
	span.to:before {content: ">>>"; padding-right: 20px; color: #000000;}
	span.to .new {font-weight: bold; display: inline; color: #088a29;}
	li:hover {background-color: #efefef;}
	</style>
</head>
<body>
<?php if ($_POST['FORM_SUBMIT'] == 'doRename') : ?>
	<?php
		$ignore = array('rename.php', '.htacess');
		$path = $_POST['path'];
		$append = $_POST['append'];
		if (is_dir($path))
		{
			$dir = @opendir($path);
			echo "<h1 class=\"green\">Renaming files</h1>";
			echo "<ul id=\"files\">";
			$counter = 0;
			while(false !== ($file = readdir($dir)))
			{
					if(!is_dir("$path/$file") && !in_array($file, $ignore))
					{
							$dotPos = strrpos($file, ".");
							$fileName = substr($file, 0, $dotPos);
							$fileType = substr($file, $dotPos + 1);
							$newFile = $fileName . $append . "." . $fileType;
							echo "<li><span class=\"blue from\">$file</span><span class=\"green to\">$fileName<span class=\"new\">$append</span>.$fileType</span></li>";
							rename($path."/".$file, $path."/".$newFile);
							$counter++;
					}
			}
			echo "</ul>";
			echo "<div>";
			if ($counter == 0)
			{
				echo "<div>No files found for renaming.";
			}
			else
			{
				echo "Renamed <b>$counter</b> files.";
			}
			echo "</div>";
			closedir($dir);
		}
		else
		{
			echo "<h1 class=\"red\">ERROR</h1><div class=\"red\">The definied path is not a valid directory.</div>";
		}
		echo "<div><br/><a href=\"javascript:history.back();\">Go back</a></div>";
	?>
<?php else : ?>
	<h1>Rename files</h1>
	<form method="POST">
		<input type="hidden" name="FORM_SUBMIT" value="doRename" />
		<label for="path">Path:</label>
		<input type="text" id="path" name="path" value="." required="true" />
		<br/>
		<label for="path">Append:</label>
		<input type="text" id="append" name="append" value="_0" required="true" />
		<br/>
		<input type="submit" id="button" value="Start renaming" />
	</form>
<?php endif; ?>

</body>
</html>