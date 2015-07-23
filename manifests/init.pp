# base class
class hadoop inherits hadoop::params {
    class{ '::hadoop::hdfsmount': }
    Class[hadoop::hdfsmount]
}

