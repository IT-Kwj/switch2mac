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
    float4 m_30 [[user(locn0)]];
    float4 m_32 [[user(locn1)]];
    float4 m_34 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
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
    float _68 = in.m_32.w;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_34.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = 1.0 / _48;
    float _82 = _80 * _54;
    float _84 = _80 * _60;
    float _86 = _82 * _82;
    float _88 = fma(_84, _84, _86);
    float _90 = sqrt(_88);
    float _92 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _94 = (*spvDescriptorSet0.fp_c9)._m0[194].w + _92;
    float _96 = 1.0 / _94;
    float _98 = _90 * 2.0;
    float _100 = precise::clamp(_98, 0.0, 1.0);
    float _102 = -_100;
    float _104 = _102 + 1.0;
    float _106 = precise::max(_104, (*spvDescriptorSet0.fp_c9)._m0[194].z);
    float _108 = precise::min(_106, (*spvDescriptorSet0.fp_c9)._m0[194].w);
    float _110 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _112 = _108 + _110;
    float _114 = _112 * _96;
    float _116 = _80 * _66;
    float _118 = _80 * _72;
    float _120 = _80 * _78;
    float _122 = _114 * _116;
    float _124 = _118 * _122;
    float _126 = precise::clamp(_124, 0.0, 1.0);
    float _128 = _126 * _120;
    bool _132 = _128 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _134 = isnan(_128);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _140 = _136 || _138;
    float _142 = in.m_32.y;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_32.x;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_32.z;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_30.x;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_30.y;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = in.m_30.z;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    if (!_140)
    {
        discard_fragment();
    }
    float _178 = _114 * _114;
    float _180 = -_178;
    float _182 = _180 + 1.0;
    float _184 = _80 * _146;
    float _186 = _80 * _152;
    float _188 = _80 * _158;
    float _190 = _184 * _182;
    float _192 = _186 * _182;
    float _194 = _188 * _182;
    float _196 = _80 * _164;
    float _198 = _80 * _170;
    float _200 = _80 * _176;
    float _202 = fma(_178, _196, _192);
    float _204 = fma(_178, _198, _190);
    float _206 = fma(_178, _200, _194);
    if (!_140)
    {
        out.m_37.x = _202;
        out.m_37.y = _204;
        out.m_37.z = _206;
        out.m_37.w = _126;
        return out;
    }
    float _208 = _204 * 0.715200006961822509765625;
    float _210 = in.m_39.w;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_39.z;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_39.x;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = fma(_202, 0.2125999927520751953125, _208);
    float _230 = in.m_39.y;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = fma(_206, 0.072200000286102294921875, _228);
    bool _238 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _240 = 1.0 / _236;
    float _242 = _240 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = fma(_244, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _248 = _80 * _214;
    float _250 = _80 * _220;
    float _252 = _246 * _248;
    float _254 = 0.0 + _128;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = _80 * _226;
    float _260 = _80 * _234;
    float _262 = fma(_206, _252, _250);
    float _264 = fma(_202, _252, _258);
    float _266 = fma(_204, _252, _260);
    float _268 = _250;
    if (!_238)
    {
        _268 = _256;
    }
    float _270 = _268;
    bool _272 = !_238;
    float _274 = _270;
    if (!_272)
    {
        float _276 = in.m_41.w;
        float _278 = gl_FragCoord.w;
        float _280 = _276 * _278;
        float _282 = in.m_41.z;
        float _284 = gl_FragCoord.w;
        float _286 = _282 * _284;
        float _288 = _80 * _280;
        float _290 = _80 * _286;
        float _292 = 1.0 / _288;
        float _294 = _290 * _292;
        float _296 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _298 = fma(_294, (*spvDescriptorSet0.fp_c8)._m0[30].w, _296);
        float _300 = 1.0 / _298;
        float _302 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _304 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _306 = fma(_300, _302, _304);
        float _308 = _306 * 8.0;
        float _310 = precise::clamp(_308, 0.0, 1.0);
        float _312 = _256 * _310;
        _274 = _312;
    }
    float _314 = _274;
    float _316 = 0.0 + _314;
    float _318 = precise::clamp(_316, 0.0, 1.0);
    out.m_37.x = _264;
    out.m_37.y = _266;
    out.m_37.z = _262;
    out.m_37.w = _318;
    return out;
}

