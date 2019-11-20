{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_Homework1 (
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
version = Version [1,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/naifalrashed/Developer/haskell/learning/homework1/.stack-work/install/x86_64-osx/f3612c0c16f4db74d72fe96271457ca13937a6cfa1ba1941a6c7c5f8a8ec3015/8.6.4/bin"
libdir     = "/Users/naifalrashed/Developer/haskell/learning/homework1/.stack-work/install/x86_64-osx/f3612c0c16f4db74d72fe96271457ca13937a6cfa1ba1941a6c7c5f8a8ec3015/8.6.4/lib/x86_64-osx-ghc-8.6.4/Homework1-1.0-JYu4DJUlMGeFV6n3eer1k0-Homework1"
dynlibdir  = "/Users/naifalrashed/Developer/haskell/learning/homework1/.stack-work/install/x86_64-osx/f3612c0c16f4db74d72fe96271457ca13937a6cfa1ba1941a6c7c5f8a8ec3015/8.6.4/lib/x86_64-osx-ghc-8.6.4"
datadir    = "/Users/naifalrashed/Developer/haskell/learning/homework1/.stack-work/install/x86_64-osx/f3612c0c16f4db74d72fe96271457ca13937a6cfa1ba1941a6c7c5f8a8ec3015/8.6.4/share/x86_64-osx-ghc-8.6.4/Homework1-1.0"
libexecdir = "/Users/naifalrashed/Developer/haskell/learning/homework1/.stack-work/install/x86_64-osx/f3612c0c16f4db74d72fe96271457ca13937a6cfa1ba1941a6c7c5f8a8ec3015/8.6.4/libexec/x86_64-osx-ghc-8.6.4/Homework1-1.0"
sysconfdir = "/Users/naifalrashed/Developer/haskell/learning/homework1/.stack-work/install/x86_64-osx/f3612c0c16f4db74d72fe96271457ca13937a6cfa1ba1941a6c7c5f8a8ec3015/8.6.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Homework1_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Homework1_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "Homework1_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "Homework1_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Homework1_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Homework1_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
