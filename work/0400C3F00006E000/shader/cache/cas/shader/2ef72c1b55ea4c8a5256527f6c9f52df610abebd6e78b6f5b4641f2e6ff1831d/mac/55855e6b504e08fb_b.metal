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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_C [[id(1)]];
    sampler fp_t_tcb_CSmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    sampler fp_t_tcb_CSmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ESmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_33.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_33.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _596 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_596, float2(0.0), isnan(_596))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_596, float2(0.0), isnan(_596))).x;
    float _71 = in.m_35.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_37.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_35.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_35.y;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_37.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_33.z;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_33.w;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_37.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = _63 * _75;
    float _121 = _63 * _81;
    float _123 = _63 * _105;
    float _125 = _63 * _111;
    float _127 = _63 * _117;
    float2 _679 = float2(_123, _125);
    float3 _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_679, float2(0.0), isnan(_679))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_679, float2(0.0), isnan(_679))).xyz;
    float _133 = _131.x;
    float _135 = _131.y;
    float _137 = _131.z;
    float2 _693 = float2(_123, _125);
    float3 _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_693, float2(0.0), isnan(_693)), int2(0, 1)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_693, float2(0.0), isnan(_693)), int2(0, 1)).xyz;
    float _141 = _139.x;
    float _143 = _139.y;
    float _145 = _139.z;
    float _147 = fma(_121, _69, _119);
    float _149 = _63 * _87;
    float _151 = _63 * _93;
    float _153 = _63 * _99;
    float _155 = fma(_127, _69, _149);
    float _157 = 1.0 / _147;
    float _159 = fma(_153, _69, _151);
    float _161 = _159 * _157;
    float _163 = _155 * _157;
    float2 _739 = float2(_123, _125);
    float3 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_739, float2(0.0), isnan(_739)), int2(1, 0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_739, float2(0.0), isnan(_739)), int2(1, 0)).xyz;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    float2 _754 = float2(_123, _125);
    float3 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_754, float2(0.0), isnan(_754)), int2(1)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_754, float2(0.0), isnan(_754)), int2(1)).xyz;
    float _175 = _173.x;
    float _177 = _173.y;
    float _179 = _173.z;
    float2 _769 = float2(_65, _67);
    float4 _182 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_769, float2(0.0), isnan(_769))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_769, float2(0.0), isnan(_769))).xyzw;
    float _184 = _182.x;
    float _186 = _182.y;
    float _188 = _182.z;
    float _190 = _182.w;
    float2 _785 = float2(_163, _161);
    float4 _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_785, float2(0.0), isnan(_785))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_785, float2(0.0), isnan(_785))).xyzw;
    float _194 = _192.x;
    float _196 = _192.y;
    float _198 = _192.z;
    float _200 = _192.w;
    float _202 = _135 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _204 = _143 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _206 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[2].x, _202);
    float _208 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[2].x, _204);
    float _210 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[2].z, _206);
    float _212 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[2].z, _208);
    float _214 = -_67;
    float _216 = _214 + _161;
    float _218 = -_65;
    float _220 = _218 + _163;
    float _222 = _216 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _224 = _220 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _226 = _222 * _222;
    float _228 = _169 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _230 = _177 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _232 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[2].x, _228);
    float _234 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[2].x, _230);
    float _236 = _186 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _238 = precise::min(_210, _212);
    float _240 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[2].z, _232);
    float _242 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[2].z, _234);
    float _244 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[2].x, _236);
    float _246 = precise::max(_210, _212);
    float _248 = precise::min(_240, _242);
    float _250 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[2].z, _244);
    float _252 = precise::max(_240, _242);
    float _254 = precise::min(_238, _248);
    float _256 = precise::max(_246, _252);
    float _258 = precise::min(_250, _254);
    float _260 = precise::max(_250, _256);
    float _262 = _256 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _264 = -_258;
    float _266 = _264 + _260;
    float _268 = precise::max(_262, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _270 = fma(_224, _224, _226);
    bool _274 = _266 > _268;
    float _276 = _224;
    float _278 = _266;
    float _280 = _186;
    float _282 = _184;
    if (!_274)
    {
        _276 = _184;
    }
    float _284 = _276;
    float _286 = _284;
    if (!_274)
    {
        _278 = _186;
    }
    float _288 = _278;
    float _290 = _288;
    if (!_274)
    {
        _280 = _188;
    }
    float _292 = _280;
    float _294 = _292;
    if (!_274)
    {
        _282 = _190;
    }
    float _296 = _282;
    bool _298 = !_274;
    float _300 = _296;
    if (!_298)
    {
        float _302 = -_240;
        float _304 = _302 + _212;
        float _306 = -_210;
        float _308 = _306 + _242;
        float _310 = in.m_39.z;
        float _312 = gl_FragCoord.w;
        float _314 = _310 * _312;
        float _316 = in.m_39.y;
        float _318 = gl_FragCoord.w;
        float _320 = _316 * _318;
        float _322 = in.m_39.w;
        float _324 = gl_FragCoord.w;
        float _326 = _322 * _324;
        float _328 = -_308;
        float _330 = _304 + _328;
        float _332 = _304 + _308;
        float _334 = in.m_39.x;
        float _336 = gl_FragCoord.w;
        float _338 = _334 * _336;
        float _340 = _330 * _330;
        float _342 = fma(_332, _332, _340);
        float _344 = _342 + 0.00260416674427688121795654296875;
        float _346 = rsqrt(_344);
        float _348 = _63 * _320;
        float _350 = _332 * _346;
        float _352 = _330 * _346;
        float _354 = _63 * _338;
        float _356 = _63 * _314;
        float _358 = _63 * _326;
        float _360 = abs(_350);
        float _362 = abs(_352);
        float _364 = precise::min(_360, _362);
        float _366 = -_354;
        float _368 = fma(_350, _366, _65);
        float _370 = fma(_350, _354, _65);
        float _372 = _364 * 2.0;
        float _374 = 1.0 / _372;
        float _376 = _374 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
        float _378 = _376 * 0.5;
        float _380 = fma(_350, _378, 0.5);
        float _382 = precise::clamp(_380, 0.0, 1.0);
        float _384 = fma(_352, _378, 0.5);
        float _386 = precise::clamp(_384, 0.0, 1.0);
        float _388 = _382 + (-0.5);
        float _390 = _386 + (-0.5);
        float _392 = -_348;
        float _394 = fma(_352, _392, _67);
        float _396 = fma(_352, _348, _67);
        float _398 = -_356;
        float _400 = fma(_388, _398, _65);
        float _402 = -_358;
        float _404 = fma(_390, _402, _67);
        float _406 = fma(_388, _356, _65);
        float _408 = fma(_390, _358, _67);
        float2 _1126 = float2(_368, _394);
        float4 _410 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1126, float2(0.0), isnan(_1126))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1126, float2(0.0), isnan(_1126))).xyzw;
        float _412 = _410.x;
        float _414 = _410.y;
        float _416 = _410.z;
        float _418 = _410.w;
        float2 _1142 = float2(_370, _396);
        float4 _420 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1142, float2(0.0), isnan(_1142))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1142, float2(0.0), isnan(_1142))).xyzw;
        float _422 = _420.x;
        float _424 = _420.y;
        float _426 = _420.z;
        float _428 = _420.w;
        float2 _1158 = float2(_400, _404);
        float4 _430 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1158, float2(0.0), isnan(_1158))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1158, float2(0.0), isnan(_1158))).xyzw;
        float _432 = _430.x;
        float _434 = _430.y;
        float _436 = _430.z;
        float _438 = _430.w;
        float2 _1174 = float2(_406, _408);
        float4 _440 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1174, float2(0.0), isnan(_1174))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1174, float2(0.0), isnan(_1174))).xyzw;
        float _442 = _440.x;
        float _444 = _440.y;
        float _446 = _440.z;
        float _448 = _440.w;
        float _450 = _414 + _424;
        float _452 = _416 + _426;
        float _454 = _418 + _428;
        float _456 = _434 + _444;
        float _458 = _412 + _422;
        float _460 = _432 + _442;
        float _462 = _450 + _456;
        float _464 = _436 + _446;
        float _466 = _458 + _460;
        float _468 = _462 * 0.25;
        float _470 = _452 + _464;
        float _472 = _466 * 0.25;
        float _474 = _454 * 0.5;
        float _476 = _468 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _478 = _470 * 0.25;
        float _480 = fma(_472, (*spvDescriptorSet0.fp_c3)._m0[2].x, _476);
        float _482 = fma(_478, (*spvDescriptorSet0.fp_c3)._m0[2].z, _480);
        bool _484 = _482 >= _256;
        bool _486 = isnan(_482);
        bool _488 = _484 || _486;
        bool _490 = isnan(_256);
        bool _492 = _488 || _490;
        bool _494 = _254 < _482;
        bool _496 = !_492;
        bool _498 = _494 && _496;
        float _500 = _438 + _448;
        float _502 = _454 + _500;
        float _504 = _472;
        float _506 = _468;
        float _508 = _478;
        _300 = _474;
        if (!_498)
        {
            float _510 = _458 * 0.5;
            _504 = _510;
        }
        float _512 = _504;
        _286 = _512;
        if (!_498)
        {
            float _514 = _450 * 0.5;
            _506 = _514;
        }
        float _516 = _506;
        _290 = _516;
        if (!_498)
        {
            float _518 = _452 * 0.5;
            _508 = _518;
        }
        float _520 = _508;
        _294 = _520;
        if (_498)
        {
            float _522 = _502 * 0.25;
            _300 = _522;
        }
    }
    float _524 = _286;
    float _526 = _294;
    float _528 = _300;
    float _530 = _290;
    float _532 = sqrt(_270);
    float _534 = -_524;
    float _536 = _194 + _534;
    float _538 = -_526;
    float _540 = _198 + _538;
    float _542 = -_528;
    float _544 = _200 + _542;
    float _546 = 0.0 + _532;
    float _548 = precise::clamp(_546, 0.0, 1.0);
    float _550 = fma(_548, -0.5, 0.5);
    float _552 = -_530;
    float _554 = _196 + _552;
    float _556 = fma(_550, _536, _524);
    float _558 = fma(_550, _554, _530);
    float _560 = fma(_550, _540, _526);
    float _562 = fma(_550, _544, _528);
    out.m_42.x = _556;
    out.m_42.y = _558;
    out.m_42.z = _560;
    out.m_42.w = _562;
    return out;
}

