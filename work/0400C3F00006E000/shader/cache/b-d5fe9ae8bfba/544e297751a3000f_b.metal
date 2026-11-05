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
};

fragment void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], float4 gl_FragCoord [[position]])
{
    float _30 = as_type<float>(gl_SubgroupInvocationID);
    int _33 = as_type<int>(_30) & 3;
    bool _37 = _33 != 0;
    if (_37)
    {
        return;
    }
    float _39 = gl_FragCoord.x;
    float _41 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _43 = _39 / _41;
    float _45 = gl_FragCoord.y;
    float _47 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _49 = _45 / _47;
    float _51 = trunc(_43);
    int _53 = int(_51);
    float _55 = trunc(_49);
    int _57 = int(_55);
    int _59 = _53 >> 31;
    int _61 = _59 & 1;
    int _63 = _57 >> 31;
    int _65 = _53 + _61;
    int _67 = _63 & 1;
    int _69 = _57 + _67;
    int _71 = _65 >> 1;
    int _73 = _69 >> 1;
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(0.0), uint2(int2(_71, _73)));
}

