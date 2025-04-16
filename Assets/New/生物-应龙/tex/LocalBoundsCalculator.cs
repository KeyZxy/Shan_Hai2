using UnityEngine;

public class LocalBoundsCalculator : MonoBehaviour
{
    
    public Material wingMaterial;
    public Vector2 GetLocalXBounds()
    {
        MeshFilter meshFilter = GetComponent<MeshFilter>();
        if (meshFilter == null || meshFilter.mesh == null)
        {
            Debug.LogError("MeshFilter not found!");
            return Vector2.zero;
        }

        Vector3[] vertices = meshFilter.mesh.vertices;
        if (vertices.Length == 0)
        {
            Debug.Log("No vertices!");
            return Vector2.zero;
        }

        float minX = float.MaxValue;
        float maxX = float.MinValue;

        foreach (Vector3 vertex in vertices)
        {
            // 顶点坐标已经是局部坐标系下的坐标
            if (vertex.x < minX) minX = vertex.x;
            if (vertex.x > maxX) maxX = vertex.x;
        }

        return new Vector2(minX, maxX);
    }

    void Start()
    {
        Vector2 xBounds = GetLocalXBounds();
        Debug.Log($"Local X Bounds: Min = {xBounds.x}, Max = {xBounds.y}");
        wingMaterial.SetFloat("_xMax",xBounds.y);
    }
}