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
    float4 m_45 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
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
    float2 _479 = float2(_99, _101);
    float4 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_479, float2(0.0), isnan(_479))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_479, float2(0.0), isnan(_479))).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float2 _498 = float2(_103, _105);
    float4 _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_498, float2(0.0), isnan(_498))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_498, float2(0.0), isnan(_498))).xyzw;
    float _124 = _122.x;
    float _126 = _122.y;
    float _128 = _122.z;
    float _130 = _122.w;
    float2 _514 = float2(_107, _109);
    float4 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_514, float2(0.0), isnan(_514))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_514, float2(0.0), isnan(_514))).xyzw;
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
    float _154 = in.m_45.w;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_47.x;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = _97 * _146;
    float _168 = in.m_43.x;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_45.x;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_43.y;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_45.y;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = _120 * _130;
    float _194 = _97 * _158;
    float _196 = _192 * _140;
    float _198 = _196 * _166;
    float _200 = _97 * _152;
    float _202 = _200 * _198;
    float _204 = _194 * _202;
    float _206 = _97 * _164;
    float _208 = 0.0 + _204;
    float _210 = precise::clamp(_208, 0.0, 1.0);
    float _212 = _210 * _206;
    bool _216 = _212 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _218 = isnan(_212);
    bool _220 = _216 || _218;
    bool _222 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _224 = _220 || _222;
    float _226 = in.m_43.z;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = in.m_45.z;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = in.m_41.x;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = in.m_41.y;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    if (!_224)
    {
        discard_fragment();
    }
    float _250 = in.m_41.z;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = _114 * _114;
    float _258 = _116 * _116;
    float _260 = _124 * _124;
    float _262 = _126 * _126;
    float _264 = _134 * _134;
    float _266 = _118 * _118;
    float _268 = _256 * _260;
    float _270 = _258 * _262;
    float _272 = _128 * _128;
    float _274 = _136 * _136;
    float _276 = _268 * _264;
    float _278 = _97 * _172;
    float _280 = _266 * _272;
    float _282 = _270 * _274;
    float _284 = _97 * _178;
    float _286 = _97 * _184;
    float _288 = _138 * _138;
    float _290 = _97 * _190;
    float _292 = _97 * _230;
    float _294 = _97 * _236;
    float _296 = -_284;
    float _298 = _278 + _296;
    float _300 = _280 * _288;
    float _302 = -_290;
    float _304 = _286 + _302;
    float _306 = -_294;
    float _308 = _292 + _306;
    float _310 = fma(_276, _298, _284);
    float _312 = _97 * _242;
    float _314 = fma(_282, _304, _290);
    float _316 = fma(_300, _308, _294);
    float _318 = _97 * _248;
    float _320 = _310 * _312;
    float _322 = _97 * _254;
    float _324 = _314 * _318;
    float _326 = _316 * _322;
    if (!_224)
    {
        out.m_50.x = _320;
        out.m_50.y = _324;
        out.m_50.z = _326;
        out.m_50.w = _204;
        return out;
    }
    float _328 = _324 * 0.715200006961822509765625;
    float _330 = 0.0 + _212;
    float _332 = precise::clamp(_330, 0.0, 1.0);
    float _334 = fma(_320, 0.2125999927520751953125, _328);
    bool _336 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _338 = fma(_326, 0.072200000286102294921875, _334);
    float _340 = 1.0 / _338;
    float _342 = _340 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _344 = precise::clamp(_342, 0.0, 1.0);
    float _346 = fma(_344, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _348 = _320 * _346;
    float _350 = _324 * _346;
    float _352 = _326 * _346;
    float _354 = _346;
    if (!_336)
    {
        _354 = _332;
    }
    float _356 = _354;
    bool _358 = !_336;
    float _360 = _356;
    if (!_358)
    {
        float _362 = in.m_52.w;
        float _364 = gl_FragCoord.w;
        float _366 = _362 * _364;
        float _368 = in.m_52.z;
        float _370 = gl_FragCoord.w;
        float _372 = _368 * _370;
        float _374 = _97 * _366;
        float _376 = _97 * _372;
        float _378 = 1.0 / _374;
        float _380 = _376 * _378;
        float _382 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _384 = fma(_380, (*spvDescriptorSet0.fp_c8)._m0[30].w, _382);
        float _386 = 1.0 / _384;
        float _388 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _390 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _392 = fma(_386, _388, _390);
        float _394 = _392 * 8.0;
        float _396 = precise::clamp(_394, 0.0, 1.0);
        float _398 = _332 * _396;
        _360 = _398;
    }
    float _400 = _360;
    float _402 = 0.0 + _400;
    float _404 = precise::clamp(_402, 0.0, 1.0);
    out.m_50.x = _348;
    out.m_50.y = _350;
    out.m_50.z = _352;
    out.m_50.w = _404;
    return out;
}

