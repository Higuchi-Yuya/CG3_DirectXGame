#include "BasicShaderHeader.hlsli"

// �O�p�`�̓��͂���A�_���O�o�͂���T���v��
[maxvertexcount(6)]
void main(
	triangle VSOutput input[3] : SV_POSITION,
	// �_�X�g���[��
	inout TriangleStream< GSOutput > output
)
{
	for (uint i = 0; i < 3; i++)
	{
		GSOutput element;// �o�͒��_�f�[�^
		element.svpos = input[i].svpos;// ���_���W���R�s�[
		element.normal = input[i].normal;// �@�����R�s�[
		element.uv = input[i].uv*2.0f;// UV���R�s�[

		// ���_����o�́i�o�̓��X�g�ɒǉ��j
		output.Append(element);
	}

	// ���݂̃X�g���b�v���W����
	output.RestartStrip();

	for (uint i = 0; i < 3; i++)
	{
		GSOutput element;// �o�͒��_�f�[�^
		element.svpos = input[i].svpos+float4(20.0f,0.0f,0.0f,0.0f);// ���_���W���R�s�[
		element.normal = input[i].normal;// �@�����R�s�[
		element.uv = input[i].uv * 5.0f;// UV���R�s�[

		// ���_����o�́i�o�̓��X�g�ɒǉ��j
		output.Append(element);
	}
}