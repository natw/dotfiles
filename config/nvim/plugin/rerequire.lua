function _G.rerequire(package_name)
  package.loaded[package_name] = nil
  return require(package_name)
end
