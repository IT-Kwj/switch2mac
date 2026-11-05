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
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_43 [[user(locn6)]];
    float4 m_56 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_39.w;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_39.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_39.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_41.z;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_41.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_41.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_41.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_43.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_43.y;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = 1.0 / _63;
    float _121 = _119 * _69;
    float _123 = _119 * _75;
    float _125 = _119 * _81;
    float _127 = _119 * _87;
    float _129 = 1.0 / _121;
    float _131 = _119 * _93;
    float _133 = _119 * _99;
    float _135 = _119 * _111;
    float _137 = _119 * _117;
    float _139 = _123 * _129;
    float _141 = _125 * _129;
    float _143 = _119 * _105;
    float2 _595 = float2(_139, _141);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_595, float2(0.0), isnan(_595))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_595, float2(0.0), isnan(_595))).x;
    float2 _606 = float2(_127, _131);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_606, float2(0.0), isnan(_606))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_606, float2(0.0), isnan(_606))).w;
    float2 _614 = float2(_133, _143);
    float4 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_614, float2(0.0), isnan(_614))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_614, float2(0.0), isnan(_614))).xyzw;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = _150.z;
    float _158 = _150.w;
    float2 _630 = float2(_135, _137);
    float4 _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_630, float2(0.0), isnan(_630))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_630, float2(0.0), isnan(_630))).xyzw;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = _160.w;
    float _170 = in.m_39.z;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_45.w;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_47.w;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_49.w;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_51.x;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _202 = _119 * _174;
    float _204 = _202 * _129;
    float _206 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _208 = fma(_204, (*spvDescriptorSet0.fp_c8)._m0[30].w, _206);
    float _210 = 1.0 / _208;
    float _212 = _119 * _180;
    float _214 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _216 = _210 * _214;
    float _218 = in.m_45.x;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_49.z;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_49.y;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _238 = fma(_145, (*spvDescriptorSet0.fp_c8)._m0[30].w, _236);
    float _240 = _158 + _147;
    float _242 = -_168;
    float _244 = _242 + 1.0;
    float _246 = 1.0 / _238;
    float _248 = _119 * _186;
    float _250 = _240 * _244;
    float _252 = _119 * _198;
    float _254 = -_212;
    float _256 = fma(_250, _248, _254);
    float _258 = _119 * _192;
    float _260 = _256 * 4.0;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = _258 * _262;
    float _266 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _268 = -_216;
    float _270 = fma(_246, _266, _268);
    float _272 = 0.0 + _264;
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = _270 * _200;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = _274 * _278;
    float _282 = _280 * _252;
    bool _286 = _282 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _288 = isnan(_282);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _294 = _290 || _292;
    float _296 = in.m_45.y;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = in.m_45.z;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = in.m_49.x;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    if (!_294)
    {
        discard_fragment();
    }
    float _314 = in.m_47.x;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = in.m_47.y;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = in.m_47.z;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = _152 * _152;
    float _334 = -_162;
    float _336 = _334 + 1.0;
    float _338 = _154 * _154;
    float _340 = -_164;
    float _342 = _340 + 1.0;
    float _344 = _156 * _156;
    float _346 = _332 * _336;
    float _348 = -_166;
    float _350 = _348 + 1.0;
    float _352 = _338 * _342;
    float _354 = _119 * _222;
    float _356 = _119 * _234;
    float _358 = _344 * _350;
    float _360 = _119 * _300;
    float _362 = _119 * _306;
    float _364 = _119 * _228;
    float _366 = _119 * _312;
    float _368 = -_356;
    float _370 = _360 + _368;
    float _372 = -_364;
    float _374 = _362 + _372;
    float _376 = -_366;
    float _378 = _354 + _376;
    float _380 = fma(_352, _370, _356);
    float _382 = fma(_358, _374, _364);
    float _384 = fma(_346, _378, _366);
    float _386 = _119 * _318;
    float _388 = _119 * _324;
    float _390 = _119 * _330;
    float _392 = _384 * _386;
    float _394 = _380 * _388;
    float _396 = _382 * _390;
    if (!_294)
    {
        out.m_54.x = _392;
        out.m_54.y = _394;
        out.m_54.z = _396;
        out.m_54.w = _264;
        return out;
    }
    float _398 = _394 * 0.715200006961822509765625;
    float _400 = in.m_56.w;
    float _402 = gl_FragCoord.w;
    float _404 = _400 * _402;
    float _406 = in.m_56.x;
    float _408 = gl_FragCoord.w;
    float _410 = _406 * _408;
    float _412 = in.m_56.y;
    float _414 = gl_FragCoord.w;
    float _416 = _412 * _414;
    float _418 = fma(_392, 0.2125999927520751953125, _398);
    float _420 = in.m_56.z;
    float _422 = gl_FragCoord.w;
    float _424 = _420 * _422;
    float _426 = fma(_396, 0.072200000286102294921875, _418);
    bool _428 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _430 = 1.0 / _426;
    float _432 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_428)
    {
        float _434 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _436 = _216 + _434;
        _432 = _436;
    }
    float _438 = _432;
    float _440 = _430 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _442 = precise::clamp(_440, 0.0, 1.0);
    float _444 = fma(_442, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _446 = _119 * _404;
    float _448 = _119 * _416;
    float _450 = _444 * _446;
    float _452 = 0.0 + _282;
    float _454 = precise::clamp(_452, 0.0, 1.0);
    float _456 = _446;
    float _458 = _454;
    if (_428)
    {
        float _460 = _438 * 8.0;
        float _462 = precise::clamp(_460, 0.0, 1.0);
        _456 = _462;
    }
    float _464 = _456;
    float _466 = _119 * _410;
    float _468 = _119 * _424;
    float _470 = fma(_394, _450, _448);
    if (_428)
    {
        float _472 = _454 * _464;
        _458 = _472;
    }
    float _474 = _458;
    float _476 = fma(_392, _450, _466);
    float _478 = fma(_396, _450, _468);
    float _480 = 0.0 + _474;
    float _482 = precise::clamp(_480, 0.0, 1.0);
    out.m_54.x = _476;
    out.m_54.y = _470;
    out.m_54.z = _478;
    out.m_54.w = _482;
    return out;
}

