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
    constant _16* fp_c9 [[id(0)]];
};

struct main0_out
{
    float4 m_33 [[color(0)]];
};

struct main0_in
{
    float4 m_26 [[user(locn0)]];
    float4 m_28 [[user(locn2)]];
    float4 m_24 [[user(locn3)]];
    float4 m_30 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _40 = gl_FragCoord.w;
    float _42 = in.m_24.w;
    float _44 = gl_FragCoord.w;
    float _46 = _42 * _44;
    float _48 = in.m_24.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_26.w;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_28.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = 1.0 / _40;
    float _68 = _66 * _46;
    float _70 = _66 * _52;
    float _72 = _66 * _58;
    float _74 = _66 * _64;
    float _76 = 1.0 / _68;
    float _78 = _70 * _76;
    float _80 = _78 * 2.0;
    float _82 = precise::clamp(_80, 0.0, 1.0);
    float _84 = _82 * _82;
    float _86 = -_84;
    float _88 = _86 + 1.0;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c9)._m0[194].z, _84);
    float _92 = _72 * _90;
    float _94 = precise::clamp(_92, 0.0, 1.0);
    float _96 = _94 * _74;
    bool _100 = _96 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _102 = isnan(_96);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _108 = _104 || _106;
    float _110 = in.m_30.y;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_30.x;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_30.z;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    if (!_108)
    {
        discard_fragment();
    }
    float _128 = in.m_24.y;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_26.z;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = _66 * _114;
    float _142 = _66 * _120;
    float _144 = _66 * _126;
    float _146 = _140 * _140;
    float _148 = fma(_142, _142, _146);
    float _150 = fma(_144, _144, _148);
    float _152 = rsqrt(_150);
    float _154 = _66 * _132;
    float _156 = _154 * _76;
    float _158 = _140 * _152;
    float _160 = _142 * _152;
    float _162 = _144 * _152;
    float _164 = _156 * _156;
    float _166 = _158 * _158;
    float _168 = in.m_26.x;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = fma(_78, _78, _164);
    float _176 = fma(_160, _160, _166);
    float _178 = in.m_26.y;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = fma(_162, _162, _176);
    float _186 = sqrt(_174);
    float _188 = rsqrt(_184);
    float _190 = fma(_186, -0.707106530666351318359375, 1.0);
    float _192 = _190 * _190;
    float _194 = _162 * _188;
    float _196 = _158 * _188;
    float _198 = _192 * _192;
    float _200 = _66 * _172;
    float _202 = _194 * 0.577381789684295654296875;
    float _204 = _198 * _198;
    float _206 = fma(_196, 0.816474258899688720703125, _202);
    float _208 = precise::clamp(_206, 0.0, 1.0);
    float _210 = -(*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _212 = _210 + 1.0;
    float _214 = _204 * 9.0;
    float _216 = fma(_208, _212, (*spvDescriptorSet0.fp_c9)._m0[194].w);
    float _218 = _66 * _182;
    float _220 = _66 * _138;
    float _222 = _200 * _216;
    float _224 = _218 * _216;
    float _226 = _220 * _216;
    float _228 = fma(_222, _214, _222);
    float _230 = fma(_224, _214, _224);
    float _232 = fma(_226, _214, _226);
    float _234 = _204 + _228;
    float _236 = _204 + _230;
    float _238 = _204 + _232;
    if (!_108)
    {
        out.m_33.x = _234;
        out.m_33.y = _236;
        out.m_33.z = _238;
        out.m_33.w = _94;
        return out;
    }
    float _240 = 0.0 + _96;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    out.m_33.x = _234;
    out.m_33.y = _236;
    out.m_33.z = _238;
    out.m_33.w = _242;
    return out;
}

