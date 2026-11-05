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
    float4 m_29 [[color(0)]];
};

struct main0_in
{
    float4 m_26 [[user(locn0)]];
    float4 m_24 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _36 = gl_FragCoord.w;
    float _38 = in.m_24.y;
    float _40 = gl_FragCoord.w;
    float _42 = _38 * _40;
    float _44 = in.m_24.x;
    float _46 = gl_FragCoord.w;
    float _48 = _44 * _46;
    float _50 = in.m_26.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = 1.0 / _36;
    float _58 = _56 * _42;
    float _60 = fma(_58, 6.283185482025146484375, -1.57079637050628662109375);
    float _62 = fma(_58, 6.283185482025146484375, -1.37079632282257080078125);
    float _64 = _60 * 0.15915493667125701904296875;
    float _66 = _62 * 0.15915493667125701904296875;
    float _68 = _56 * _48;
    float _70 = _64 * 6.283185482025146484375;
    float _72 = sin(_70);
    float _74 = _56 * _54;
    float _76 = _66 * 6.283185482025146484375;
    float _78 = sin(_76);
    float _80 = fma(_68, 2.5000002384185791015625, -1.5000002384185791015625);
    float _82 = precise::clamp(_80, 0.0, 1.0);
    float _84 = fma(_72, 0.5, 0.5);
    float _86 = _68 * 2.5;
    float _88 = precise::clamp(_86, 0.0, 1.0);
    float _90 = fma(_88, -2.0, 3.0);
    float _92 = abs(_84);
    float _94 = log2(_92);
    float _96 = _88 * _88;
    float _98 = fma(_78, 1.44269502162933349609375, -1.44269502162933349609375);
    float _100 = _90 * _96;
    float _102 = exp2(_98);
    float _104 = fma((*spvDescriptorSet0.fp_c3)._m0[1].w, 5.0, -4.0);
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = fma((*spvDescriptorSet0.fp_c3)._m0[1].w, 5.000000476837158203125, -4.000000476837158203125);
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float _112 = fma((*spvDescriptorSet0.fp_c3)._m0[1].w, 2.0, -0.4000000059604644775390625);
    float _114 = precise::clamp(_112, 0.0, 1.0);
    float _116 = (*spvDescriptorSet0.fp_c3)._m0[1].w * 10.0;
    float _118 = precise::clamp(_116, 0.0, 1.0);
    float _120 = -_106;
    float _122 = _120 + 1.0;
    float _124 = fma(_110, -2.0, 3.0);
    float _126 = _110 * _110;
    float _128 = _94 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _130 = fma(_82, -2.0, 3.0);
    float _132 = _82 * _82;
    float _134 = fma(_118, -2.0, 3.0);
    float _136 = exp2(_128);
    float _138 = _118 * _118;
    float _140 = -_132;
    float _142 = fma(_130, _140, 1.0);
    float _144 = -_126;
    float _146 = fma(_124, _144, 1.0);
    float _148 = _134 * _138;
    float _150 = _100 * _142;
    float _152 = _102 * _102;
    float _154 = _114 * _122;
    float _156 = _152 * _152;
    float _158 = _146 * _148;
    float _160 = _102 * _156;
    float _162 = _136 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _164 = _158 * _74;
    float _166 = _150 * _150;
    float _168 = _150 * _162;
    float _170 = _164 * _136;
    float _172 = _160 * _166;
    float _174 = _168 * 0.100000001490116119384765625;
    float _176 = _150 * _170;
    float _178 = _158 * _172;
    float _180 = _174 * _154;
    float _182 = _180 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _184 = _180 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    out.m_29.x = _182;
    out.m_29.y = _176;
    out.m_29.z = _184;
    out.m_29.w = _178;
    return out;
}

