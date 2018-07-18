<?php namespace VankoSoft\MyProjects\Helper;

class ProjectSetup
{
	protected $project;
	
	protected $installPath;
	
	public function __construct( $project, $installPath )
	{
		$this->project		= $project;
		$this->installPath	= $installPath;
	}
	
	public function setup()
	{
		$projectRoot	= $this->installPath . $this->project['project_root'];
		$documentRoot	= $this->installPath . $this->project['document_root'];
	
		// Setup
		$this->checkout( $projectRoot, 'develop' );
		$this->createApacheVirtualHost( $documentRoot );
		$this->runComposer();
		$this->registerInstalled( $this->project['dev_url'], $documentRoot );
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * @brief	Checkout source code from repository
	 *
	 * @param	string $branch
	 */
	protected function checkout( $localDir, $branch = null )
	{
		if( ! file_exists( $localDir ) )
		{
			mkdir( $localDir, 2775, true );
		}
		chdir( $localDir );
	
		// Empty directory
		if( ! ( new \FilesystemIterator( $localDir ) )->valid() )
		{
			if ( $this->project['git_username'] && $this->project['git_password'] )
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
	
		if ( $branch )
		{
			Shell::exec( "git checkout $branch" );
		}
	}
	
	protected function createApacheVirtualHost( $documentRoot )
	{
		if ( ! HttpHost::exists( 'http://' . $this->project['dev_url'] ) )
		{
			HttpHost::create( $this->project['dev_url'], $documentRoot );
		}
	}
	
	protected function runComposer()
	{
		if ( ! file_exists( 'vendor/autoload.php' ) )
		{
			//Shell::exec( "php -d memory_limit=-1 /usr/local/bin/composer install" );
			Shell::exec( "/usr/local/bin/composer install" );
		}
	}
	
	protected function registerInstalled( $hostName, $documentRoot )
	{
		$hosts		= [];
		$jsonFile	= APP_ROOT . "/installed_hosts.json";
		if ( file_exists( $jsonFile ) )
		{
			$json		= file_get_contents( $jsonFile );
			$hosts 		= json_decode( $json, true );
		}
		
		$hosts[]	= [
			'hostName'		=> $hostName,
			'documentRoot'	=> $documentRoot
		];
		
		file_put_contents( $jsonFile, json_encode( $hosts ) );
	}
}
