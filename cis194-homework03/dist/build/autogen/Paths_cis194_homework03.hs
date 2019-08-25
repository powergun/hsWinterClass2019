{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_cis194_homework03 (
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
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/wein/.cabal/bin"
libdir     = "/home/wein/.cabal/lib/x86_64-linux-ghc-8.0.2/cis194-homework03-0.1.0.0-IPgOwKHkGG9D3AiY8d4HeS"
dynlibdir  = "/home/wein/.cabal/lib/x86_64-linux-ghc-8.0.2"
datadir    = "/home/wein/.cabal/share/x86_64-linux-ghc-8.0.2/cis194-homework03-0.1.0.0"
libexecdir = "/home/wein/.cabal/libexec"
sysconfdir = "/home/wein/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "cis194_homework03_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "cis194_homework03_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "cis194_homework03_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "cis194_homework03_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "cis194_homework03_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "cis194_homework03_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
