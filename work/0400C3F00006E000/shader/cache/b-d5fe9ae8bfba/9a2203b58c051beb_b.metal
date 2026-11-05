#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
};

struct main0_out
{
    float4 m_27 [[color(0)]];
};

struct main0_in
{
    float4 m_24 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _34 = gl_FragCoord.w;
    float _36 = in.m_24.y;
    float _38 = gl_FragCoord.w;
    float _40 = _36 * _38;
    float _42 = in.m_24.x;
    float _44 = gl_FragCoord.w;
    float _46 = _42 * _44;
    bool _50 = (*spvDescriptorSet0.fp_c3)._m0[6].w > (-1.0999999631167156621813774108887e-06);
    bool _52 = (*spvDescriptorSet0.fp_c3)._m0[6].w >= (-1.0999999631167156621813774108887e-06);
    bool _54 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].w);
    bool _56 = _52 || _54;
    bool _58 = isnan(-1.0999999631167156621813774108887e-06);
    bool _60 = _56 || _58;
    float _62 = 1.0 / _34;
    float _64 = _62 * _40;
    float _66 = _62 * _46;
    float _68 = abs((*spvDescriptorSet0.fp_c3)._m0[6].w);
    float _70 = -_68;
    float _72 = fma(_70, 2.0, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _74 = precise::max(0.0, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _76 = _64 + (-0.5);
    float _78 = _66 + (-0.5);
    float _80 = precise::max(0.0, _72);
    float _82 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[7].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _84 = _78 + (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _86 = _82 * _82;
    float _88 = -_80;
    float _90 = _74 + _88;
    float _92 = fma(_84, _84, _86);
    int _95 = _60 ? 0 : 1;
    float _97 = 1.0 / _90;
    int _99 = ~_95;
    int _101 = _99 + 1;
    int _103 = _101 + 1;
    int _105 = _103;
    if (!_50)
    {
        int _107 = ~_95;
        int _109 = _107 + 1;
        _105 = _109;
    }
    int _111 = _105;
    float _113 = sqrt(_92);
    float _115 = -_80;
    float _117 = _113 + _115;
    float _119 = float(_111);
    float _121 = _117 * _97;
    float _123 = precise::clamp(_121, 0.0, 1.0);
    float _125 = fma(_123, -2.0, 3.0);
    float _127 = _123 * _123;
    float _129 = fma(_127, _125, -0.5);
    float _131 = fma(_129, _119, 0.5);
    float _133 = precise::max(_131, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    out.m_27.x = _133;
    return out;
}

