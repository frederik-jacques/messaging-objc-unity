using UnityEngine;
using System.Collections;
using System.Runtime.InteropServices;

public class SceneChanger : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}

	public void ChangeScene( string scene) {
		
		Application.LoadLevel(scene);
		
	}
}
