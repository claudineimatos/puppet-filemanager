class filemanager(
  $files = {},
) {

  validate_hash($files)

	create_resources(filemanager::createfile, $files)

}
