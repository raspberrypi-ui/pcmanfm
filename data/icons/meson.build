icon_sizes = ['16x16', '24x24', '32x32', '48x48']
icon_names = ['fm-compact', 'fm-details', 'fm-icons', 'fm-new', 'fm-thumbs']

foreach size : icon_sizes
  icon_files = []
  foreach name : icon_names
    icon_files += 'hicolor' / size / 'actions' / (name + '.png')
  endforeach
  install_data(icon_files,
    install_dir : get_option('datadir') / 'icons' / 'hicolor' / size / 'actions',
  )
endforeach
