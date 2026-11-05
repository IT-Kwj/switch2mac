#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    texture2d<float, access::write> fp_i_tcb_48_ [[id(1)]];
    texture2d<float, access::write> fp_i_tcb_4A_ [[id(2)]];
};

fragment void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    float _32 = gl_FragCoord.x;
    float _34 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _36 = _32 / _34;
    float _38 = gl_FragCoord.y;
    float _40 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _42 = _38 / _40;
    float _44 = as_type<float>(gl_SubgroupInvocationID);
    int _47 = as_type<int>(_44) & 3;
    bool _51 = _47 != 0;
    float _53 = trunc(_36);
    int _55 = int(_53);
    float _57 = trunc(_42);
    int _59 = int(_57);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(0.0), uint2(int2(_55, _59)));
    if (_51)
    {
        return;
    }
    int _61 = _55 >> 31;
    int _63 = _59 >> 31;
    int _65 = _61 & 1;
    int _67 = _63 & 1;
    int _69 = _55 + _65;
    int _71 = _59 + _67;
    int _73 = _69 >> 1;
    int _75 = _71 >> 1;
    spvDescriptorSet0.fp_i_tcb_4A_.write(float4(0.0), uint2(int2(_73, _75)));
}

