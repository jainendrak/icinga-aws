define icinga::classicui::user(
  $passwd,
  $user   = $title,
  $ensure = present
  ) {

  htpasswd{"icinga::classicui::user::${title}":
    ensure      => $ensure,
    username    => $user,
    target      => $icinga::classicui::params::passwd_file,
    cryptpasswd => $passwd,
  }
  
  }
