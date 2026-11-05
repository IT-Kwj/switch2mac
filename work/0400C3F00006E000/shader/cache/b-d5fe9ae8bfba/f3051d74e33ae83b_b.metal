#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_37.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.w;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_39.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_39.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = 1.0 / _59;
    float _99 = _97 * _65;
    float _101 = _97 * _71;
    float _103 = _97 * _77;
    float _105 = _97 * _83;
    float _107 = _97 * _89;
    float _109 = _97 * _95;
    float2 _469 = float2(_99, _101);
    float4 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_469, float2(0.0), isnan(_469))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_469, float2(0.0), isnan(_469))).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float2 _488 = float2(_103, _105);
    float4 _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_488, float2(0.0), isnan(_488))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_488, float2(0.0), isnan(_488))).xyzw;
    float _124 = _122.x;
    float _126 = _122.y;
    float _128 = _122.z;
    float _130 = _122.w;
    float2 _504 = float2(_107, _109);
    float4 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_504, float2(0.0), isnan(_504))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_504, float2(0.0), isnan(_504))).xyzw;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _132.z;
    float _140 = _132.w;
    float _142 = in.m_41.w;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_43.w;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_45.x;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = _97 * _146;
    float _162 = in.m_43.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_47.x;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_43.y;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_47.y;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_41.z;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = _97 * _190;
    float _194 = _120 * _130;
    float _196 = _194 * _140;
    float _198 = _97 * _152;
    float _200 = _196 * _160;
    float _202 = _97 * _158;
    float _204 = _198 * _200;
    float _206 = 0.0 + _204;
    float _208 = precise::clamp(_206, 0.0, 1.0);
    float _210 = _208 * _202;
    bool _214 = _210 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _216 = isnan(_210);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _222 = _218 || _220;
    float _224 = in.m_43.z;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_47.z;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_41.x;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_41.y;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    if (!_222)
    {
        discard_fragment();
    }
    float _248 = _124 * _124;
    float _250 = _116 * _116;
    float _252 = _126 * _126;
    float _254 = _114 * _114;
    float _256 = _118 * _118;
    float _258 = _128 * _128;
    float _260 = _250 * _252;
    float _262 = _254 * _248;
    float _264 = _134 * _134;
    float _266 = _136 * _136;
    float _268 = _256 * _258;
    float _270 = _138 * _138;
    float _272 = _262 * _264;
    float _274 = _260 * _266;
    float _276 = _97 * _166;
    float _278 = _97 * _228;
    float _280 = _97 * _234;
    float _282 = _97 * _172;
    float _284 = _97 * _178;
    float _286 = _97 * _184;
    float _288 = _268 * _270;
    float _290 = -_280;
    float _292 = _278 + _290;
    float _294 = -_282;
    float _296 = _276 + _294;
    float _298 = -_286;
    float _300 = _284 + _298;
    float _302 = _97 * _240;
    float _304 = fma(_288, _292, _280);
    float _306 = fma(_272, _296, _282);
    float _308 = fma(_274, _300, _286);
    float _310 = _97 * _246;
    float _312 = _304 * _192;
    float _314 = _306 * _302;
    float _316 = _308 * _310;
    if (!_222)
    {
        out.m_50.x = _314;
        out.m_50.y = _316;
        out.m_50.z = _312;
        out.m_50.w = _204;
        return out;
    }
    float _318 = _316 * 0.715200006961822509765625;
    float _320 = 0.0 + _210;
    float _322 = precise::clamp(_320, 0.0, 1.0);
    float _324 = fma(_314, 0.2125999927520751953125, _318);
    bool _326 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _328 = fma(_312, 0.072200000286102294921875, _324);
    float _330 = 1.0 / _328;
    float _332 = _330 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _334 = precise::clamp(_332, 0.0, 1.0);
    float _336 = fma(_334, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _338 = _314 * _336;
    float _340 = _316 * _336;
    float _342 = _312 * _336;
    float _344 = _336;
    if (!_326)
    {
        _344 = _322;
    }
    float _346 = _344;
    bool _348 = !_326;
    float _350 = _346;
    if (!_348)
    {
        float _352 = in.m_52.w;
        float _354 = gl_FragCoord.w;
        float _356 = _352 * _354;
        float _358 = in.m_52.z;
        float _360 = gl_FragCoord.w;
        float _362 = _358 * _360;
        float _364 = _97 * _356;
        float _366 = _97 * _362;
        float _368 = 1.0 / _364;
        float _370 = _366 * _368;
        float _372 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _374 = fma(_370, (*spvDescriptorSet0.fp_c8)._m0[30].w, _372);
        float _376 = 1.0 / _374;
        float _378 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _380 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _382 = fma(_376, _378, _380);
        float _384 = _382 * 8.0;
        float _386 = precise::clamp(_384, 0.0, 1.0);
        float _388 = _322 * _386;
        _350 = _388;
    }
    float _390 = _350;
    float _392 = 0.0 + _390;
    float _394 = precise::clamp(_392, 0.0, 1.0);
    out.m_50.x = _338;
    out.m_50.y = _340;
    out.m_50.z = _342;
    out.m_50.w = _394;
    return out;
}

