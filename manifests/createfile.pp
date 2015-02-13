define filemanager::createfile(
  $path		= undef,
	$owner	= 'root',
	$group	= 'root',
	$mode		= 600,
	$content	= undef,
	$replace = true,
) {

  validate_string($path)
	validate_string($content)
	validate_bool($replace)

	file { $path:
		ensure 	=> 'file',
		owner 	=> $owner,
		group		=> $group,
		mode		=> $mode,
		content	=> $content,
		replace => $replace,
	}
}
