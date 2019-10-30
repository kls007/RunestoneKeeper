using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System.IO;

public class ExportAB : Editor
{
    [MenuItem("Shuai/Export AB")]
	public static void Export()
    {
        string path = Application.streamingAssetsPath;
        if (Directory.Exists(path))
        {
            Directory.Delete(path, true);
        }
        Directory.CreateDirectory(path);

        BuildPipeline.BuildAssetBundles(Application.streamingAssetsPath, BuildAssetBundleOptions.UncompressedAssetBundle, BuildTarget.StandaloneWindows);
    }
}