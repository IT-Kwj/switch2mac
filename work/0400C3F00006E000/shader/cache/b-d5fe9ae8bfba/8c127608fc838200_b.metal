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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_43 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
    float4 m_56 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_39.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_39.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float2 _489 = float2(_79, _81);
    float2 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_489, float2(0.0), isnan(_489))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_489, float2(0.0), isnan(_489))).xy;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = in.m_41.w;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_43.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_45.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_41.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_41.y;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_45.y;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = _77 * _95;
    float _129 = _77 * _101;
    float _131 = _77 * _107;
    float _133 = _77 * _113;
    float _135 = 1.0 / _127;
    float _137 = 0.0 + _129;
    float _139 = precise::clamp(_137, 0.0, 1.0);
    float _141 = _77 * _119;
    float _143 = _77 * _125;
    float _145 = _139 * 0.25;
    float _147 = _133 * _135;
    float _149 = _141 * _135;
    float _151 = fma(_89, _145, _143);
    float _153 = fma(_87, _145, _131);
    float2 _588 = float2(_147, _149);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_588, float2(0.0), isnan(_588))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_588, float2(0.0), isnan(_588))).x;
    float2 _596 = float2(_153, _151);
    float4 _158 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_596, float2(0.0), isnan(_596))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_596, float2(0.0), isnan(_596))).xyzw;
    float _160 = _158.x;
    float _162 = _158.y;
    float _164 = _158.z;
    float _166 = _158.w;
    float _168 = in.m_41.z;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_47.w;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_49.x;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = _77 * _172;
    float _188 = _186 * _135;
    float _190 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _192 = fma(_188, (*spvDescriptorSet0.fp_c8)._m0[30].w, _190);
    float _194 = 1.0 / _192;
    float _196 = _77 * _178;
    float _198 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _200 = _194 * _198;
    float _202 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _204 = fma(_155, (*spvDescriptorSet0.fp_c8)._m0[30].w, _202);
    float _206 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _208 = _196 * _166;
    float _210 = precise::clamp(_208, 0.0, 1.0);
    float _212 = _77 * _184;
    float _214 = 1.0 / _204;
    float _216 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _218 = -_200;
    float _220 = fma(_214, _216, _218);
    float _222 = _220 * _206;
    float _224 = precise::clamp(_222, 0.0, 1.0);
    float _226 = _210 * _224;
    float _228 = _226 * _212;
    bool _232 = _228 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _234 = isnan(_228);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _240 = _236 || _238;
    float _242 = -_139;
    float _244 = _242 + 1.0;
    float _246 = _200;
    if (!_240)
    {
        discard_fragment();
    }
    float2 _727 = float2(0.0, _244);
    float3 _250 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_727, float2(0.0), isnan(_727))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_727, float2(0.0), isnan(_727))).xyz;
    float _252 = _250.x;
    float _254 = _250.y;
    float _256 = _250.z;
    float _258 = in.m_51.x;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = in.m_51.y;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = in.m_51.z;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = in.m_47.x;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = in.m_47.y;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = in.m_47.z;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = precise::max(_129, -0.60352802276611328125);
    float _296 = _162 * _162;
    float _298 = _164 * _164;
    float _300 = precise::min(_294, 1.20902001857757568359375);
    float _302 = fma(_300, -0.55170953273773193359375, 0.66702783107757568359375);
    float _304 = fma(_300, 0.55170953273773193359375, 0.33297216892242431640625);
    float _306 = _302 * _302;
    float _308 = -_304;
    float _310 = fma(_308, _304, 1.0);
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = _306 * _306;
    float _316 = fma(_314, 9.75, 0.25);
    float _318 = _77 * _262;
    float _320 = _77 * _268;
    float _322 = _77 * _274;
    float _324 = _77 * _280;
    float _326 = _252 * 2.0;
    float _328 = _254 * 2.0;
    float _330 = _256 * 2.0;
    float _332 = _160 * _160;
    float _334 = -_326;
    float _336 = fma(_318, _316, _334);
    float _338 = -_328;
    float _340 = fma(_320, _316, _338);
    float _342 = -_330;
    float _344 = fma(_322, _316, _342);
    float _346 = _77 * _286;
    float _348 = fma(_312, _336, _326);
    float _350 = fma(_312, _340, _328);
    float _352 = fma(_312, _344, _330);
    float _354 = _77 * _292;
    float _356 = -_348;
    float _358 = fma(_316, _324, _356);
    float _360 = -_350;
    float _362 = fma(_316, _346, _360);
    float _364 = -_352;
    float _366 = fma(_316, _354, _364);
    float _368 = fma(_332, _358, _348);
    float _370 = fma(_296, _362, _350);
    float _372 = fma(_298, _366, _352);
    float _374 = _336;
    if (!_240)
    {
        out.m_54.x = _368;
        out.m_54.y = _370;
        out.m_54.z = _372;
        out.m_54.w = _210;
        return out;
    }
    float _376 = _370 * 0.715200006961822509765625;
    float _378 = in.m_56.w;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = in.m_56.x;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = in.m_56.y;
    float _392 = gl_FragCoord.w;
    float _394 = _390 * _392;
    float _396 = fma(_368, 0.2125999927520751953125, _376);
    float _398 = in.m_56.z;
    float _400 = gl_FragCoord.w;
    float _402 = _398 * _400;
    float _404 = fma(_372, 0.072200000286102294921875, _396);
    bool _406 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _408 = 1.0 / _404;
    if (_406)
    {
        float _410 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _412 = _200 + _410;
        _246 = _412;
    }
    float _414 = _246;
    if (_406)
    {
        float _416 = _414 * 8.0;
        float _418 = precise::clamp(_416, 0.0, 1.0);
        _374 = _418;
    }
    float _420 = _374;
    float _422 = _408 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _424 = precise::clamp(_422, 0.0, 1.0);
    float _426 = fma(_424, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _428 = _77 * _382;
    float _430 = _77 * _388;
    float _432 = _77 * _394;
    float _434 = _426 * _428;
    float _436 = 0.0 + _228;
    float _438 = precise::clamp(_436, 0.0, 1.0);
    float _440 = _77 * _402;
    float _442 = fma(_368, _434, _430);
    float _444 = _438;
    if (_406)
    {
        float _446 = _438 * _420;
        _444 = _446;
    }
    float _448 = _444;
    float _450 = fma(_370, _434, _432);
    float _452 = fma(_372, _434, _440);
    float _454 = 0.0 + _448;
    float _456 = precise::clamp(_454, 0.0, 1.0);
    out.m_54.x = _442;
    out.m_54.y = _450;
    out.m_54.z = _452;
    out.m_54.w = _456;
    return out;
}

