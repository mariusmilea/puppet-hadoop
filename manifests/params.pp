# Sets default parameters
class hadoop::params {
    $nodes = hiera('hadoop::nodes', {})
}
