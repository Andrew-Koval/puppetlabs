# === Class: subversion::svn_repos
#
#  Creation of subversion repositories
#
# === Parameters
#
# None
#
# === Variables
#
# None
#
# === Examples
#
# None
#
# === Authors
#
# Andriy Koval <akova@softserveinc.com>
#
# === Copyright
#
# Copyright 2017 Andriy Koval
#

class subversion::svn_repos (
  $svn_repos	  = hiera('svn_repos'),
  $svn_repo1	  = $svn_repos['repo1'],
  $reponame_repo1 = $svn_repo1['svn_repo'],
  $svn_repo2	  = $svn_repos['repo2'],
  $reponame_repo2 = $svn_repo2['svn_repo'],
  $svn_repo3	  = $svn_repos['repo3'],
  $reponame_repo3 = $svn_repo3['svn_repo'],
){

  $repos = ["$reponame_repo1", "$reponame_repo2", "$reponame_repo3"]
  notice ($repos)

  $repos.each |$reponames|
    {
     svn_repos{ $reponames: repo_name => $reponames }
    }
}  

  define svn_repos(
    $repo_name = $name
  ){
    vcsrepo { "/var/www/svn/${repo_name}":
      ensure   => present,
      provider => svn,
    }
    notice("Repository $name is created")
  }

  class {'subversion::svn_repos':}
