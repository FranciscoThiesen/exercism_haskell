{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_phone_number (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,6,1,8] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/random_person/Exercism/haskell/phone-number/.stack-work/install/x86_64-osx/37852d29ab741eb0fd40210a6353cca662e9292461e039c466c7aca960be6bfd/8.10.7/bin"
libdir     = "/Users/random_person/Exercism/haskell/phone-number/.stack-work/install/x86_64-osx/37852d29ab741eb0fd40210a6353cca662e9292461e039c466c7aca960be6bfd/8.10.7/lib/x86_64-osx-ghc-8.10.7/phone-number-1.6.1.8-Fct2fLBaOUyWgng34rkH9-test"
dynlibdir  = "/Users/random_person/Exercism/haskell/phone-number/.stack-work/install/x86_64-osx/37852d29ab741eb0fd40210a6353cca662e9292461e039c466c7aca960be6bfd/8.10.7/lib/x86_64-osx-ghc-8.10.7"
datadir    = "/Users/random_person/Exercism/haskell/phone-number/.stack-work/install/x86_64-osx/37852d29ab741eb0fd40210a6353cca662e9292461e039c466c7aca960be6bfd/8.10.7/share/x86_64-osx-ghc-8.10.7/phone-number-1.6.1.8"
libexecdir = "/Users/random_person/Exercism/haskell/phone-number/.stack-work/install/x86_64-osx/37852d29ab741eb0fd40210a6353cca662e9292461e039c466c7aca960be6bfd/8.10.7/libexec/x86_64-osx-ghc-8.10.7/phone-number-1.6.1.8"
sysconfdir = "/Users/random_person/Exercism/haskell/phone-number/.stack-work/install/x86_64-osx/37852d29ab741eb0fd40210a6353cca662e9292461e039c466c7aca960be6bfd/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "phone_number_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "phone_number_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "phone_number_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "phone_number_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "phone_number_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "phone_number_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
