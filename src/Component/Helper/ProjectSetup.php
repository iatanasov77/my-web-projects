<?php namespace VankoSoft\MyProjects\Component\Helper;

class ProjectSetup
{
	protected $project;
	
	protected $installPath;
	
	public function __construct( $project, $installPath )
	{
		$this->project	= $project;
		$this->installPath;
	}
	
	/**
	 * @brief	Checkout source code from repository
	 * 
	 * @param	string $branch
	 */
	public function checkout( $branch = null )
	{
		if ( $project['git_username'] && $project['git_password'] )
		{
			$cmdGitClone	= sprintf(
				"git clone https://%s:%s@%s %s",
				$this->project['git_username'],
				$this->project['git_password'],
				$this->project['git_url'],
				'.'
			);
		}
		else
		{
			$cmdGitClone	= sprintf(
				"git clone https://%s %s",
				$this->project['git_url'],
				'.'
			);
		}
		
		Shell::exec( $cmdGitClone );
	}

	public function createApacheVirtualHost( $documentRoot )
	{
		$cmdMkVhost	= sprintf( "sudo php /usr/local/bin/mkvhost -t simple -s %s -d %s", $this->project['dev_url'], $documentRoot );
		Shell::exec( $cmdMkVhost );
	}
	
	public function runComposer()
	{
		Shell::exec( "php -d memory_limit=-1 /usr/local/bin/composer install" );
	}
	
	public function setup()
	{
		$projectRoot	= $this->installPath . $this->project['project_root'];
		$documentRoot	= $this->installPath . $this->project['document_root'];
		
		// Create project folder
		mkdir( $projectRoot, 2775, true );
		chdir( $projectRoot );
		
		// Setup
		$this->checkout();
		$this->createApacheVirtualHost( $documentRoot );
		$this->runComposer();
	}
}
