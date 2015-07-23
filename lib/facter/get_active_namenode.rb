Facter.add(:active_namenode) do
  setcode do
    namenode = Facter::Util::Resolution.exec("ruby /tmp/get_active_namenode.rb")
    if namenode
      namenode
    else
      nil
    end
  end
end