using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace UnityEngine
{
    public class ResourceManager : MonoBehaviour
    {
        public static Dictionary<string, Sprite> dictionary_sprite = new Dictionary<string, Sprite>();
        public static Dictionary<string, GameObject> dictionary_prefab = new Dictionary<string, GameObject>();

        void Awake()
        {
            //AssetBundle sprite_assetbundle = LoadFromStreamingAssetsPath("map.unity3d");
            //foreach (var name in sprite_assetbundle.GetAllAssetNames())
            //{
            //    Sprite sprite = sprite_assetbundle.LoadAsset<Sprite>(name);
            //    dictionary_sprite.Add(name, sprite);

            //    //Debug.Log(sprite);
            //}
        
            //AssetBundle prefab_assetbundle = LoadFromStreamingAssetsPath("prefab.assetbundle");
            //foreach (var name in prefab_assetbundle.GetAllAssetNames())
            //{
            //    GameObject prefab = prefab_assetbundle.LoadAsset<GameObject>(name);
            //    dictionary_prefab.Add(name, prefab);
            //}


            //
            //foreach (var item in dictionary_sprite)
            //{
            //    Debug.Log(item.Key);
            //}
        }

        ////// 从StreamingAssetsPath加载
        public static AssetBundle LoadFromStreamingAssetsPath(string path)
        {
            AssetBundle ab = AssetBundle.LoadFromFile(Application.streamingAssetsPath + "/" + path);
            return ab;
        }

        public static Object LoadAsset(AssetBundle ab, string abName)
        {
            var o = ab.LoadAsset<Object>(abName);
            return o;
        }

        public static Sprite Texture2DToSprite(Texture2D t2d)
        {
            Sprite s = Sprite.Create(t2d, new Rect(0, 0, t2d.width, t2d.height), Vector2.zero);
            return s;
        }

        public static GameObject NewGameObject(string name)
        { 
            GameObject go = new GameObject(name);
            return go;
        }

        //public IEnumerator LoadAsyncFromStreamingAssetsPath(string assetbundle)
        //{
        //    AssetBundleCreateRequest req = AssetBundle.LoadFromFileAsync(Application.streamingAssetsPath + "/" + assetbundle);
        //    yield return req;

        //    AssetBundle ab = req.assetBundle;
        //    if (ab == null)
        //    {
        //        yield break;
        //    }

        //    var asset_req = ab.LoadAssetAsync<Sprite>("title_2");
        //    yield return asset_req;
        //    Sprite sprite = asset_req.asset as Sprite;

        //    GameObject go = new GameObject("Empty");
        //    RectTransform rt = go.AddComponent<RectTransform>();
        //    Image image = go.AddComponent<Image>();
        //    go.transform.parent = father;
        //    image.sprite = sprite;
        //    image.SetNativeSize();
        //}

        //static IEnumerator LoadAsyncCoroutine(string path, Action<AssetBundle> callback)
        //{
        //    AssetBundleCreateRequest abcr = AssetBundle.LoadFromFileAsync(path);
        //    yield return abcr;
        //    callback(abcr.assetBundle);
        //}

    }

}