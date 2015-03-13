define filemanager::createfile(
  $path		= undef,
	$owner	= 'root',
	$group	= 'root',
	$mode		= 0600,
	$content	= undef,
	$replace = true,
	$url	= undef
) {

  	validate_string($path)
	validate_string($content)
	validate_string($url)
	validate_bool($replace)

	if($url)
	{
		
		if($replace){
			exec {"file_exist ${$path}/${$name}":
				command => '/bin/true',
			}
		}
		else
		{
			exec {"file_exist ${$path}/${$name}":
				command => '/bin/true',
				onlyif => 'test -f ${$path}/${$name}'
			}
		}

		exec { "mkdir ${$path}":
			path => '/usr/bin:/bin:/usr/sbin:/sbin',
			command => "mkdir -p ${$path}",
			unless => "test -d ${$path}"
		}

		exec { "download file ${name}":
			path => '/usr/bin:/bin:/usr/sbin:/sbin',
			command => "wget \"$url\" -O /tmp/$name",
			require => [ exec["mkdir ${$path}"], exec["file_exist ${$path}/${$name}"] ],
		}

		file { "${$path}/${$name}":
			ensure 	=> 'file',
			owner 	=> $owner,
			group		=> $group,
			mode		=> $mode,
			source	=> "/tmp/$name",
			replace => $replace,
			require => [ exec["download file ${$name}"] ],
		}

		file { "/tmp/${$name}":
			ensure => absent,
			require => [ exec["download file ${$name}"] ]
		}
	}
	else
	{
		file { "${$path}/${$name}":
			ensure 	=> 'file',
			owner 	=> $owner,
			group		=> $group,
			mode		=> $mode,
			content	=> $content,
			replace => $replace,
		}
	}
}
