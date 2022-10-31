#include "BasicShaderHeader.hlsli"

// 三角形の入力から、点を三つ出力するサンプル
[maxvertexcount(6)]
void main(
	triangle VSOutput input[3] : SV_POSITION,
	// 点ストリーム
	inout TriangleStream< GSOutput > output
)
{
	for (uint i = 0; i < 3; i++)
	{
		GSOutput element;// 出力頂点データ
		element.svpos = input[i].svpos;// 頂点座標をコピー
		element.normal = input[i].normal;// 法線をコピー
		element.uv = input[i].uv*2.0f;// UVをコピー

		// 頂点を一つ出力（出力リストに追加）
		output.Append(element);
	}

	// 現在のストリップを集りょゆ
	output.RestartStrip();

	for (uint i = 0; i < 3; i++)
	{
		GSOutput element;// 出力頂点データ
		element.svpos = input[i].svpos+float4(20.0f,0.0f,0.0f,0.0f);// 頂点座標をコピー
		element.normal = input[i].normal;// 法線をコピー
		element.uv = input[i].uv * 5.0f;// UVをコピー

		// 頂点を一つ出力（出力リストに追加）
		output.Append(element);
	}
}