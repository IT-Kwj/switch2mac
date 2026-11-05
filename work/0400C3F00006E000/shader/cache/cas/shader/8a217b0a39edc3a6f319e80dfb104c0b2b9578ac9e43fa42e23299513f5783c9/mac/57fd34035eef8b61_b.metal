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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
};

struct main0_out
{
    float4 m_37 [[color(0)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0)]];
    float4 m_30 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_32 [[user(locn3)]];
    float4 m_28 [[user(locn4)]];
    float4 m_39 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_28.y;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_28.x;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_30.w;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_32.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = 1.0 / _48;
    float _76 = _74 * _54;
    float _78 = _76 * 5.0;
    float _80 = _74 * _60;
    float _82 = in.m_34.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = _80 * 5.0;
    float _90 = ceil(_78);
    float _92 = ceil(_88);
    float _94 = fma(_90, 0.20000000298023223876953125, -0.5);
    float _96 = _94 * _94;
    float _98 = fma(_92, 0.20000000298023223876953125, -0.5);
    float _100 = fma(_98, _98, _96);
    float _102 = _74 * _86;
    float _104 = _74 * _66;
    float _106 = sqrt(_100);
    float _108 = _106 * 2.0;
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float _112 = -_110;
    float _114 = _112 + 1.0;
    float _116 = _114 * _102;
    float _118 = _74 * _72;
    float _120 = _104 * _116;
    float _122 = precise::clamp(_120, 0.0, 1.0);
    float _124 = _122 * _118;
    bool _128 = _124 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _130 = isnan(_124);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _136 = _132 || _134;
    float _138 = in.m_30.y;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_30.x;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_30.z;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_34.x;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_34.y;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_34.z;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    if (!_136)
    {
        discard_fragment();
    }
    float _174 = _114 * _114;
    float _176 = -_174;
    float _178 = _176 + 1.0;
    float _180 = _74 * _142;
    float _182 = _74 * _148;
    float _184 = _74 * _154;
    float _186 = _180 * _178;
    float _188 = _182 * _178;
    float _190 = _184 * _178;
    float _192 = _74 * _160;
    float _194 = _74 * _166;
    float _196 = _74 * _172;
    float _198 = fma(_174, _192, _188);
    float _200 = fma(_174, _194, _186);
    float _202 = fma(_174, _196, _190);
    if (!_136)
    {
        out.m_37.x = _198;
        out.m_37.y = _200;
        out.m_37.z = _202;
        out.m_37.w = _122;
        return out;
    }
    float _204 = _200 * 0.715200006961822509765625;
    float _206 = in.m_39.w;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_39.z;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_39.x;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = fma(_198, 0.2125999927520751953125, _204);
    float _226 = in.m_39.y;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = fma(_202, 0.072200000286102294921875, _224);
    bool _234 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _236 = 1.0 / _232;
    float _238 = _236 * (*spvDescriptorSet0.fp_c15)._m0[661].z;
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = fma(_240, (*spvDescriptorSet0.fp_c15)._m0[661].y, (*spvDescriptorSet0.fp_c15)._m0[661].x);
    float _244 = _74 * _210;
    float _246 = _74 * _216;
    float _248 = _242 * _244;
    float _250 = 0.0 + _124;
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = _74 * _222;
    float _256 = _74 * _230;
    float _258 = fma(_202, _248, _246);
    float _260 = fma(_198, _248, _254);
    float _262 = fma(_200, _248, _256);
    float _264 = _246;
    if (!_234)
    {
        _264 = _252;
    }
    float _266 = _264;
    bool _268 = !_234;
    float _270 = _266;
    if (!_268)
    {
        float _272 = in.m_41.w;
        float _274 = gl_FragCoord.w;
        float _276 = _272 * _274;
        float _278 = in.m_41.z;
        float _280 = gl_FragCoord.w;
        float _282 = _278 * _280;
        float _284 = _74 * _276;
        float _286 = _74 * _282;
        float _288 = 1.0 / _284;
        float _290 = _286 * _288;
        float _292 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _294 = fma(_290, (*spvDescriptorSet0.fp_c8)._m0[30].w, _292);
        float _296 = 1.0 / _294;
        float _298 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _300 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _302 = fma(_296, _298, _300);
        float _304 = _302 * 8.0;
        float _306 = precise::clamp(_304, 0.0, 1.0);
        float _308 = _252 * _306;
        _270 = _308;
    }
    float _310 = _270;
    float _312 = 0.0 + _310;
    float _314 = precise::clamp(_312, 0.0, 1.0);
    out.m_37.x = _260;
    out.m_37.y = _262;
    out.m_37.z = _258;
    out.m_37.w = _314;
    return out;
}

