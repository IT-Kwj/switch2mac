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

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
};

struct main0_out
{
    float4 m_25 [[color(0)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _32 = gl_FragCoord.x;
    float _34 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _36 = _32 / _34;
    float _38 = gl_FragCoord.y;
    float _40 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _42 = _38 / _40;
    float _44 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _46 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _48 = _46 + (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _50 = (*spvDescriptorSet0.fp_c3)._m0[0].y * 2.0;
    float _52 = _48 * _44;
    float _54 = _52 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _56 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _58 = fma(_54, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _60 = _54 + (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _62 = _36 + (-0.5);
    float _64 = _42 + (-0.5);
    float _66 = _50 * _62;
    float _68 = _50 * _64;
    float _70 = _66 * 2.0;
    float _72 = fma(_66, 38.0, -18.0);
    float _74 = -_58;
    float _76 = _74 + (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _78 = 1.0 / _76;
    float _80 = precise::max(_70, _72);
    float _82 = fma(_68, 38.0, -18.0);
    float _84 = _68 * 2.0;
    bool _88 = _60 >= _80;
    bool _90 = isnan(_60);
    bool _92 = _88 || _90;
    bool _94 = isnan(_80);
    bool _96 = _92 || _94;
    float _98 = float(_96);
    float _100 = fma(_80, _56, -2.7182800769805908203125);
    float _102 = -_60;
    float _104 = _80 + _102;
    float _106 = precise::max(_84, _82);
    float _108 = fma(_98, _100, 2.7182800769805908203125);
    bool _110 = _60 >= _106;
    bool _112 = isnan(_60);
    bool _114 = _110 || _112;
    bool _116 = isnan(_106);
    bool _118 = _114 || _116;
    float _120 = float(_118);
    float _122 = fma(_106, _56, -2.7182800769805908203125);
    float _124 = -_60;
    float _126 = _106 + _124;
    float _128 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _130 = _78 * _128;
    float _132 = fma(_120, _122, 2.7182800769805908203125);
    float _134 = abs(_108);
    float _136 = log2(_134);
    float _138 = _104 * _130;
    float _140 = _126 * _130;
    float _142 = _80 * _98;
    float _144 = -_138;
    float _146 = _144 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _148 = -_140;
    float _150 = _148 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _152 = abs(_132);
    float _154 = log2(_152);
    float _156 = _56 * _142;
    float _158 = fma(_98, _146, _138);
    float _160 = fma(_120, _150, _140);
    float _162 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _164 = _80 + _162;
    float _166 = _106 * _120;
    float _168 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _170 = _106 + _168;
    float _172 = _158 * _136;
    float _174 = _166 * _56;
    float _176 = fma(_44, _164, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _178 = precise::min(_156, 1.0);
    float _180 = fma(_170, _44, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _182 = exp2(_172);
    float _184 = precise::min(_174, 1.0);
    float _186 = _160 * _154;
    float _188 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _190 = _188 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _192 = _76 + (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _194 = fma(_178, -2.0, 3.0);
    float _196 = fma(_184, -2.0, 3.0);
    float _198 = _184 * _184;
    float _200 = exp2(_186);
    float _202 = fma(_98, _190, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _204 = _178 * _178;
    float _206 = -_76;
    float _208 = fma(_98, _192, _206);
    float _210 = fma(_120, _190, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _212 = -_76;
    float _214 = fma(_120, _192, _212);
    float _216 = _198 * _196;
    float _218 = _204 * _194;
    float _220 = fma(_208, _182, _202);
    float _222 = -_216;
    float _224 = _222 + 1.0;
    float _226 = _176 * _218;
    float _228 = -_218;
    float _230 = _228 + 1.0;
    float _232 = fma(_214, _200, _210);
    float _234 = _180 * _216;
    float _236 = fma(_232, _224, _234);
    float _238 = fma(_220, _230, _226);
    out.m_25.x = _238;
    out.m_25.y = _236;
    return out;
}

