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
    float _38 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _40 = gl_FragCoord.y;
    float _42 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _44 = _40 / _42;
    float _46 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _48 = _46 + (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _50 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _52 = (*spvDescriptorSet0.fp_c3)._m0[0].y * 20.0;
    float _54 = _52 * 2.0;
    float _56 = _48 * _38;
    float _58 = _56 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _62 = _58 + (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _64 = _36 + (-0.5);
    float _66 = -_60;
    float _68 = _66 + (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _70 = _64 * _54;
    float _72 = 1.0 / _68;
    float _74 = _44 + (-0.5);
    float _76 = fma(_70, _50, -2.7182800769805908203125);
    bool _80 = _62 >= _70;
    bool _82 = isnan(_62);
    bool _84 = _80 || _82;
    bool _86 = isnan(_70);
    bool _88 = _84 || _86;
    float _90 = float(_88);
    float _92 = _74 * _54;
    float _94 = -_62;
    float _96 = _70 + _94;
    float _98 = fma(_90, _76, 2.7182800769805908203125);
    bool _100 = _62 >= _92;
    bool _102 = isnan(_62);
    bool _104 = _100 || _102;
    bool _106 = isnan(_92);
    bool _108 = _104 || _106;
    float _110 = float(_108);
    float _112 = fma(_92, _50, -2.7182800769805908203125);
    float _114 = -_62;
    float _116 = _92 + _114;
    float _118 = abs(_98);
    float _120 = log2(_118);
    float _122 = fma(_110, _112, 2.7182800769805908203125);
    float _124 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _126 = _72 * _124;
    float _128 = _96 * _126;
    float _130 = _116 * _126;
    float _132 = abs(_122);
    float _134 = log2(_132);
    float _136 = -_128;
    float _138 = _136 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _140 = -_130;
    float _142 = _140 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _144 = fma(_90, _138, _128);
    float _146 = fma(_110, _142, _130);
    float _148 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _150 = _70 + _148;
    float _152 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _154 = _92 + _152;
    float _156 = _70 * _90;
    float _158 = _92 * _110;
    float _160 = _144 * _120;
    float _162 = fma(_38, _150, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _164 = _50 * _156;
    float _166 = _158 * _50;
    float _168 = fma(_154, _38, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _170 = _146 * _134;
    float _172 = exp2(_160);
    float _174 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _176 = _174 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _178 = precise::min(_164, 1.0);
    float _180 = _68 + (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _182 = precise::min(_166, 1.0);
    float _184 = fma(_90, _176, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _186 = fma(_110, _176, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _188 = exp2(_170);
    float _190 = fma(_178, -2.0, 3.0);
    float _192 = fma(_182, -2.0, 3.0);
    float _194 = _182 * _182;
    float _196 = _178 * _178;
    float _198 = -_68;
    float _200 = fma(_90, _180, _198);
    float _202 = -_68;
    float _204 = fma(_110, _180, _202);
    float _206 = _194 * _192;
    float _208 = _196 * _190;
    float _210 = fma(_200, _172, _184);
    float _212 = -_206;
    float _214 = _212 + 1.0;
    float _216 = _162 * _208;
    float _218 = fma(_204, _188, _186);
    float _220 = _168 * _206;
    float _222 = -_208;
    float _224 = _222 + 1.0;
    float _226 = fma(_218, _214, _220);
    float _228 = fma(_210, _224, _216);
    out.m_25.x = _228;
    out.m_25.y = _226;
    return out;
}

