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
    float4 m_43 [[user(locn3)]];
    float4 m_28 [[user(locn4)]];
    float4 m_39 [[user(locn6)]];
    float4 m_41 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _50 = gl_FragCoord.w;
    float _52 = in.m_28.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_28.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_30.w;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_32.w;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_34.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = 1.0 / _50;
    float _84 = _82 * _56;
    float _86 = _82 * _62;
    float _88 = _84 * _84;
    float _90 = fma(_86, _86, _88);
    float _92 = sqrt(_90);
    float _94 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _96 = (*spvDescriptorSet0.fp_c9)._m0[194].w + _94;
    float _98 = 1.0 / _96;
    float _100 = _92 * 2.0;
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = -_102;
    float _106 = _104 + 1.0;
    float _108 = precise::max(_106, (*spvDescriptorSet0.fp_c9)._m0[194].z);
    float _110 = precise::min(_108, (*spvDescriptorSet0.fp_c9)._m0[194].w);
    float _112 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _114 = _110 + _112;
    float _116 = _114 * _98;
    float _118 = _82 * _68;
    float _120 = _82 * _74;
    float _122 = _82 * _80;
    float _124 = _116 * _118;
    float _126 = _120 * _124;
    float _128 = precise::clamp(_126, 0.0, 1.0);
    float _130 = _128 * _122;
    bool _134 = _130 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _136 = isnan(_130);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _142 = _138 || _140;
    float _144 = in.m_32.y;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_32.x;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_32.z;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_30.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_30.y;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_30.z;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    if (!_142)
    {
        discard_fragment();
    }
    float _180 = _116 * _116;
    float _182 = -_180;
    float _184 = _182 + 1.0;
    float _186 = _82 * _148;
    float _188 = _82 * _154;
    float _190 = _82 * _160;
    float _192 = _186 * _184;
    float _194 = _188 * _184;
    float _196 = _190 * _184;
    float _198 = _82 * _166;
    float _200 = _82 * _172;
    float _202 = _82 * _178;
    float _204 = fma(_180, _198, _194);
    float _206 = fma(_180, _200, _192);
    float _208 = fma(_180, _202, _196);
    if (!_142)
    {
        out.m_37.x = _204;
        out.m_37.y = _206;
        out.m_37.z = _208;
        out.m_37.w = _128;
        return out;
    }
    float _210 = _206 * 0.715200006961822509765625;
    float _212 = in.m_39.y;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_41.w;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_41.z;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = fma(_204, 0.2125999927520751953125, _210);
    float _232 = in.m_41.x;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = in.m_41.y;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = fma(_208, 0.072200000286102294921875, _230);
    bool _246 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _248 = 1.0 / _244;
    float _250 = _248 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = _82 * _216;
    float _256 = fma(_252, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _258 = _82 * _222;
    float _260 = _82 * _228;
    float _262 = _130 * _254;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = _82 * _242;
    float _268 = _256 * _258;
    float _270 = _82 * _236;
    float _272 = fma(_208, _268, _260);
    float _274 = fma(_204, _268, _270);
    float _276 = fma(_206, _268, _266);
    float _278 = _260;
    if (!_246)
    {
        _278 = _264;
    }
    float _280 = _278;
    bool _282 = !_246;
    float _284 = _280;
    if (!_282)
    {
        float _286 = in.m_43.w;
        float _288 = gl_FragCoord.w;
        float _290 = _286 * _288;
        float _292 = in.m_43.z;
        float _294 = gl_FragCoord.w;
        float _296 = _292 * _294;
        float _298 = _82 * _290;
        float _300 = _82 * _296;
        float _302 = 1.0 / _298;
        float _304 = _300 * _302;
        float _306 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _308 = fma(_304, (*spvDescriptorSet0.fp_c8)._m0[30].w, _306);
        float _310 = 1.0 / _308;
        float _312 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _314 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _316 = fma(_310, _312, _314);
        float _318 = _316 * 8.0;
        float _320 = precise::clamp(_318, 0.0, 1.0);
        float _322 = _264 * _320;
        _284 = _322;
    }
    float _324 = _284;
    float _326 = 0.0 + _324;
    float _328 = precise::clamp(_326, 0.0, 1.0);
    out.m_37.x = _274;
    out.m_37.y = _276;
    out.m_37.z = _272;
    out.m_37.w = _328;
    return out;
}

