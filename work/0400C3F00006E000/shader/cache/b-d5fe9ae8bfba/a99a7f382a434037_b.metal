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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_52 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_56 [[user(locn3)]];
    float4 m_42 [[user(locn4)]];
    float4 m_46 [[user(locn5), flat]];
    float4 m_48 [[user(locn6)]];
    float4 m_50 [[user(locn7), flat]];
    float4 m_61 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _68 = gl_FragCoord.w;
    float _70 = in.m_42.z;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_42.w;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_42.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_42.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = 1.0 / _68;
    float _96 = _94 * _74;
    float _98 = _94 * _80;
    float _100 = _94 * _86;
    float _102 = _94 * _92;
    float2 _508 = float2(_96, _98);
    float2 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_508, float2(0.0), isnan(_508))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_508, float2(0.0), isnan(_508))).xy;
    float _108 = _106.x;
    float _110 = _106.y;
    float2 _523 = float2(_100, _102);
    float2 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_523, float2(0.0), isnan(_523))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_523, float2(0.0), isnan(_523))).xy;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = in.m_44.w;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_46.y;
    float _126 = in.m_46.x;
    float _128 = in.m_44.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_44.y;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_48.y;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_48.x;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_50.z;
    float _154 = _94 * _122;
    float _156 = 1.0 / _154;
    float _158 = rint(_152);
    float _160 = precise::max(_158, 0.0);
    uint _163 = uint(_160);
    uint _165 = clamp(_163, 0u, 65535u);
    float _167 = _124 * _108;
    float _169 = _124 * _110;
    float _171 = _94 * _132;
    float _173 = fma(_114, _126, _167);
    float _175 = fma(_116, _126, _169);
    float _177 = _94 * _138;
    float _179 = _94 * _144;
    float _181 = _94 * _150;
    float _183 = _171 * _156;
    float _185 = _177 * _156;
    float _187 = _179 + _175;
    float _189 = _181 + _173;
    float2 _630 = float2(_183, _185);
    float _191 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_630, float2(0.0), isnan(_630))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_630, float2(0.0), isnan(_630))).x;
    float3 _642 = float3(_189, _187, float(int(_165)));
    float3 _646 = select(_642, float3(0.0), isnan(_642));
    float4 _194 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _646.xy, uint(rint(_646.z))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _646.xy, uint(rint(_646.z))).xyzw;
    float _196 = _194.x;
    float _198 = _194.y;
    float _200 = _194.z;
    float _202 = _194.w;
    float _204 = in.m_44.z;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_52.w;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_54.w;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_56.x;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _230 = _94 * _208;
    float _232 = _94 * _220;
    float _234 = _230 * _156;
    float _236 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _238 = fma(_234, (*spvDescriptorSet0.fp_c8)._m0[30].w, _236);
    float _240 = _94 * _214;
    float _242 = 1.0 / _238;
    float _244 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _246 = _242 * _244;
    float _248 = in.m_54.z;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_52.x;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = in.m_52.y;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _268 = fma(_191, (*spvDescriptorSet0.fp_c8)._m0[30].w, _266);
    float _270 = 1.0 / _268;
    float _272 = -_240;
    float _274 = _202 + _272;
    float _276 = _232 * _274;
    float _278 = 0.0 + _276;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _284 = -_246;
    float _286 = fma(_270, _282, _284);
    float _288 = _286 * _228;
    float _290 = precise::clamp(_288, 0.0, 1.0);
    float _292 = _94 * _226;
    float _294 = _280 * _290;
    float _296 = _294 * _292;
    bool _300 = _296 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _302 = isnan(_296);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _308 = _304 || _306;
    float _310 = in.m_54.y;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = in.m_54.x;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = in.m_52.z;
    float _324 = gl_FragCoord.w;
    float _326 = _322 * _324;
    if (!_308)
    {
        discard_fragment();
    }
    float _328 = _198 * _198;
    float _330 = _200 * _200;
    float _332 = -_328;
    float _334 = _332 + 1.0;
    float _336 = -_330;
    float _338 = _336 + 1.0;
    float _340 = _94 * _314;
    float _342 = _196 * _196;
    float _344 = _94 * _320;
    float _346 = _94 * _252;
    float _348 = _340 * _334;
    float _350 = -_342;
    float _352 = _350 + 1.0;
    float _354 = _94 * _326;
    float _356 = _346 * _338;
    float _358 = _94 * _264;
    float _360 = _344 * _352;
    float _362 = _94 * _258;
    float _364 = fma(_330, _354, _356);
    float _366 = fma(_328, _358, _348);
    float _368 = fma(_342, _362, _360);
    if (!_308)
    {
        out.m_59.x = _368;
        out.m_59.y = _366;
        out.m_59.z = _364;
        out.m_59.w = _276;
        return out;
    }
    float _370 = _366 * 0.715200006961822509765625;
    float _372 = in.m_61.w;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = in.m_61.x;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = in.m_61.y;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = fma(_368, 0.2125999927520751953125, _370);
    float _392 = in.m_61.z;
    float _394 = gl_FragCoord.w;
    float _396 = _392 * _394;
    float _398 = fma(_364, 0.072200000286102294921875, _390);
    bool _400 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _402 = 1.0 / _398;
    float _404 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_400)
    {
        float _406 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _408 = _246 + _406;
        _404 = _408;
    }
    float _410 = _404;
    float _412 = _402 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _414 = precise::clamp(_412, 0.0, 1.0);
    float _416 = fma(_414, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _418 = _94 * _376;
    float _420 = _94 * _388;
    float _422 = _416 * _418;
    float _424 = 0.0 + _296;
    float _426 = precise::clamp(_424, 0.0, 1.0);
    float _428 = _418;
    float _430 = _426;
    if (_400)
    {
        float _432 = _410 * 8.0;
        float _434 = precise::clamp(_432, 0.0, 1.0);
        _428 = _434;
    }
    float _436 = _428;
    float _438 = _94 * _382;
    float _440 = _94 * _396;
    float _442 = fma(_366, _422, _420);
    if (_400)
    {
        float _444 = _426 * _436;
        _430 = _444;
    }
    float _446 = _430;
    float _448 = fma(_368, _422, _438);
    float _450 = fma(_364, _422, _440);
    float _452 = 0.0 + _446;
    float _454 = precise::clamp(_452, 0.0, 1.0);
    out.m_59.x = _448;
    out.m_59.y = _442;
    out.m_59.z = _450;
    out.m_59.w = _454;
    return out;
}

