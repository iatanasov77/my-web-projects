<?php namespace VankoSoft\MyProjects\Component\Helper;

class Shell
{
	public static function exec( $cmd )
	{
		while (@ ob_end_flush()); // end all output buffers if any
		
		$proc = popen("$cmd 2>&1 ; echo Exit status : $?", 'r');
		
		$live_output     = "";
		$complete_output = "";
		
		while (!feof($proc))
		{
			$live_output     = fread($proc, 4096);
			$complete_output = $complete_output . $live_output;
			echo "$live_output<br>";
			@flush();
		}
		
		pclose($proc);
		
		// get exit status
		preg_match('/[0-9]+$/', $complete_output, $matches);
		
		// return exit status and intended output
		return array (
				'exit_status'  => $matches[0],
				'output'       => str_replace("Exit status : " . $matches[0], '', $complete_output)
		);
	}
}
