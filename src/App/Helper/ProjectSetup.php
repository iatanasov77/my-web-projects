<?php namespace VankoSoft\MyProjects\Helper;

use GitWrapper\GitWrapper as Git;
use Symfony\Component\Process\Process;
use VankoSoft\MyProjects\Lib\Git\OutputListener;

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
		$projectRoot	= $this->installPath . DIRECTORY_SEPARATOR . $this->project['project_root'];
		$documentRoot	= $this->installPath . DIRECTORY_SEPARATOR . $this->project['document_root'];

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
	 * 
	 * @TODO Ще пробвам да разиграя чекаута с е това https://github.com/andywer/php-easygit
	 *         да видим дали ще мога да реализирам един прогрес бар
	 */
	protected function checkout( $localDir, $branch = null )
	{
	    set_time_limit( 0 );
	    
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
				$gitUrl	= sprintf(
					"https://%s:%s@%s",
					$this->project['git_username'],
					$this->project['git_password'],
					$this->project['git_url']
				);
			}
			else
			{
				$gitUrl	= sprintf(
					"https://%s",
					$this->project['git_url']
				);
			}
			
			$maxNestingLevel = ini_get( 'xdebug.max_nesting_level' );
			ini_set( 'xdebug.max_nesting_level', 9999 );
			   
		    $git  = new Git();
		    $git->addOutputListener( new OutputListener() );
		    $repo = $git->cloneRepository( $gitUrl, $localDir);
			
		    ini_set( 'xdebug.max_nesting_level', $maxNestingLevel );

			exit( 0 ); 

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
		
		$hosts[$this->project['id']]	= [
			'hostName'		=> $hostName,
			'documentRoot'	=> $documentRoot
		];
		
		file_put_contents( $jsonFile, json_encode( $hosts ) );
	}
}
