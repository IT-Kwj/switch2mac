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
    float _46 = (*spvDescriptorSet0.fp_c3)._m0[0].y * 2.0;
    float _48 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _50 = (*spvDescriptorSet0.fp_c3)._m0[0].y + _48;
    float _52 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _54 = _52 + (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _56 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _58 = _54 * _44;
    float _60 = _58 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _62 = _36 + (-0.5);
    float _64 = _42 + (-0.5);
    float _66 = _46 * _62;
    float _68 = _46 * _64;
    float _70 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _72 = _66 + _50;
    float _74 = _68 + _50;
    bool _78 = _66 != 0.0;
    bool _80 = isnan(_66);
    bool _82 = _78 || _80;
    bool _84 = isnan(0.0);
    bool _86 = _82 || _84;
    float _88 = _72 * _56;
    float _90 = _56 * _74;
    float _92 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    bool _94 = _68 != 0.0;
    bool _96 = isnan(_68);
    bool _98 = _94 || _96;
    bool _100 = isnan(0.0);
    bool _102 = _98 || _100;
    float _104 = _60 + (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _106 = rint(_88);
    float _108 = precise::max(_106, 0.0);
    uint _111 = uint(_108);
    float _113 = -_92;
    float _115 = _113 + (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _117 = rint(_90);
    float _119 = precise::max(_117, 0.0);
    uint _121 = uint(_119);
    float _123 = 1.0 / _115;
    int _126 = int(_111) << 13;
    int _128 = _126 + 939524096;
    float _130 = as_type<float>(_128);
    if (!_86)
    {
        _130 = 0.0;
    }
    float _132 = _130;
    bool _134 = _104 >= _132;
    bool _136 = isnan(_104);
    bool _138 = _134 || _136;
    bool _140 = isnan(_132);
    bool _142 = _138 || _140;
    float _144 = float(_142);
    float _146 = fma(_70, _132, -2.7182800769805908203125);
    int _148 = int(_121) << 13;
    int _150 = _148 + 939524096;
    float _152 = -_104;
    float _154 = _152 + _132;
    float _156 = as_type<float>(_150);
    if (!_102)
    {
        _156 = 0.0;
    }
    float _158 = _156;
    float _160 = fma(_144, _146, 2.7182800769805908203125);
    float _162 = _144 * _132;
    float _164 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _166 = _123 * _164;
    bool _168 = _104 >= _158;
    bool _170 = isnan(_104);
    bool _172 = _168 || _170;
    bool _174 = isnan(_158);
    bool _176 = _172 || _174;
    float _178 = float(_176);
    float _180 = fma(_70, _158, -2.7182800769805908203125);
    float _182 = -_104;
    float _184 = _182 + _158;
    float _186 = abs(_160);
    float _188 = log2(_186);
    float _190 = _154 * _166;
    float _192 = fma(_178, _180, 2.7182800769805908203125);
    float _194 = _184 * _166;
    float _196 = -_190;
    float _198 = _196 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _200 = -_194;
    float _202 = _200 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _204 = abs(_192);
    float _206 = log2(_204);
    float _208 = fma(_144, _198, _190);
    float _210 = _115 + (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _212 = fma(_178, _202, _194);
    float _214 = _178 * _158;
    float _216 = _208 * _188;
    float _218 = _214 * _70;
    float _220 = -_115;
    float _222 = fma(_144, _210, _220);
    float _224 = -_115;
    float _226 = fma(_178, _210, _224);
    float _228 = exp2(_216);
    float _230 = precise::min(_218, 1.0);
    float _232 = _212 * _206;
    float _234 = _70 * _162;
    float _236 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _238 = _236 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _240 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _242 = _158 + _240;
    float _244 = exp2(_232);
    float _246 = precise::min(_234, 1.0);
    float _248 = fma(_144, _238, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _250 = fma(_230, -2.0, 3.0);
    float _252 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _254 = _132 + _252;
    float _256 = _230 * _230;
    float _258 = fma(_246, -2.0, 3.0);
    float _260 = _246 * _246;
    float _262 = fma(_178, _238, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _264 = fma(_44, _254, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _266 = fma(_242, _44, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _268 = _256 * _250;
    float _270 = _260 * _258;
    float _272 = fma(_222, _228, _248);
    float _274 = _266 * _268;
    float _276 = fma(_226, _244, _262);
    float _278 = -_268;
    float _280 = _278 + 1.0;
    float _282 = _264 * _270;
    float _284 = -_270;
    float _286 = _284 + 1.0;
    float _288 = fma(_276, _280, _274);
    float _290 = fma(_272, _286, _282);
    out.m_25.x = _290;
    out.m_25.y = _288;
    return out;
}

