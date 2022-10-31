#include "BasicShaderHeader.hlsli"

// �O�p�`�̓��͂���A�_���O�o�͂���T���v��
[maxvertexcount(3)]
void main(
	point VSOutput input[1] : SV_POSITION,
	// �_�X�g���[��
	inout TriangleStream< GSOutput > output
)
{

	GSOutput element;// �o�͒��_�f�[�^
	element.normal = input[0].normal;// �@�����R�s�[
	element.uv = input[0].uv;// UV���R�s�[

	element.svpos = input[0].svpos;// ���_���W���R�s�[
	// ���_����o�́i�o�̓��X�g�ɒǉ��j
	output.Append(element);

	// 2�_��
	element.svpos = input[0].svpos + float4(10.0f, 10.0f, 0, 0);
	output.Append(element);

	// 3�_��
	element.svpos = input[0].svpos + float4(10.0f, 0.0f, 0, 0);
	output.Append(element);
}