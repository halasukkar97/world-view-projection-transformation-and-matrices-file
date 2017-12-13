

cbuffer CBuffer0
{
	matrix WVPMatrix; //64 bytes
	float red_fraction;  //4bytes	
	float scale;//4bytes
	float2 packing; // 8 bytes

					// total 80 bytes
}


struct Vout
{
	float4 position : SV_POSITION;
	float4 color : COLOR;
};

Vout VShader(float4 position : POSITION, float4 color : COLOR)
{
	Vout output;

	color.r *= red_fraction;
	/*output.position = position;*/

	//output.position.x *=  scale;
	//output.position.y *=  1.0-scale;
	//output.position.xy *= scale;

	output.position = mul(WVPMatrix, position);

	output.color = color;
	return output;
}

float4 PShader(float4 position : SV_POSITION, float4 color : COLOR) : SV_TARGET
{
	return color;
}

