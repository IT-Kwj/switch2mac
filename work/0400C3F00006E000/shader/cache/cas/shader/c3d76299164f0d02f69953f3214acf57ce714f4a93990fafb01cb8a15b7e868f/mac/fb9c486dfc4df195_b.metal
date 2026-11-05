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
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_33.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_33.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _588 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_588, float2(0.0), isnan(_588))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_588, float2(0.0), isnan(_588))).x;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_35.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_37.x;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_37.y;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_33.z;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_33.w;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = _61 * _73;
    float _119 = _61 * _79;
    float _121 = _61 * _85;
    float _123 = _61 * _91;
    float _125 = _61 * _97;
    float _127 = _61 * _103;
    float _129 = _61 * _109;
    float _131 = _61 * _115;
    float2 _680 = float2(_129, _131);
    float3 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_680, float2(0.0), isnan(_680))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_680, float2(0.0), isnan(_680))).xyz;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float2 _694 = float2(_129, _131);
    float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_694, float2(0.0), isnan(_694)), int2(0, 1)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_694, float2(0.0), isnan(_694)), int2(0, 1)).xyz;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    float _151 = fma(_121, _67, _119);
    float _153 = fma(_125, _67, _123);
    float _155 = fma(_127, _67, _117);
    float _157 = 1.0 / _151;
    float _159 = _153 * _157;
    float _161 = _155 * _157;
    float2 _731 = float2(_129, _131);
    float3 _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_731, float2(0.0), isnan(_731)), int2(1, 0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_731, float2(0.0), isnan(_731)), int2(1, 0)).xyz;
    float _165 = _163.x;
    float _167 = _163.y;
    float _169 = _163.z;
    float2 _746 = float2(_129, _131);
    float3 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_746, float2(0.0), isnan(_746)), int2(1)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_746, float2(0.0), isnan(_746)), int2(1)).xyz;
    float _173 = _171.x;
    float _175 = _171.y;
    float _177 = _171.z;
    float2 _761 = float2(_63, _65);
    float4 _180 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_761, float2(0.0), isnan(_761))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_761, float2(0.0), isnan(_761))).xyzw;
    float _182 = _180.x;
    float _184 = _180.y;
    float _186 = _180.z;
    float _188 = _180.w;
    float2 _777 = float2(_159, _161);
    float4 _190 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_777, float2(0.0), isnan(_777))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_777, float2(0.0), isnan(_777))).xyzw;
    float _192 = _190.x;
    float _194 = _190.y;
    float _196 = _190.z;
    float _198 = _190.w;
    float _200 = _139 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _202 = _147 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _204 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[2].x, _200);
    float _206 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[2].x, _202);
    float _208 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[2].z, _204);
    float _210 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[2].z, _206);
    float _212 = precise::min(_208, _210);
    float _214 = precise::max(_208, _210);
    float _216 = -_65;
    float _218 = _216 + _161;
    float _220 = -_63;
    float _222 = _220 + _159;
    float _224 = _218 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _226 = _222 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _228 = _167 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _230 = _175 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _232 = _184 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _234 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[2].x, _228);
    float _236 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[2].x, _230);
    float _238 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[2].x, _232);
    float _240 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[2].z, _234);
    float _242 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[2].z, _236);
    float _244 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[2].z, _238);
    float _246 = precise::min(_240, _242);
    float _248 = precise::max(_240, _242);
    float _250 = precise::min(_212, _246);
    float _252 = precise::max(_214, _248);
    float _254 = precise::min(_244, _250);
    float _256 = precise::max(_244, _252);
    float _258 = _252 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _260 = -_254;
    float _262 = _260 + _256;
    float _264 = precise::max(_258, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _266 = _224 * _224;
    bool _270 = _262 > _264;
    float _272 = fma(_226, _226, _266);
    float _274 = _262;
    float _276 = _264;
    float _278 = _248;
    float _280 = _236;
    if (!_270)
    {
        _274 = _182;
    }
    float _282 = _274;
    float _284 = _282;
    if (!_270)
    {
        _276 = _184;
    }
    float _286 = _276;
    float _288 = _286;
    if (!_270)
    {
        _278 = _186;
    }
    float _290 = _278;
    float _292 = _290;
    if (!_270)
    {
        _280 = _188;
    }
    float _294 = _280;
    bool _296 = !_270;
    float _298 = _294;
    if (!_296)
    {
        float _300 = _208 + _240;
        float _302 = -_240;
        float _304 = _302 + _210;
        float _306 = -_208;
        float _308 = _306 + _242;
        float _310 = _210 + _300;
        float _312 = _304 + _308;
        float _314 = -_308;
        float _316 = _304 + _314;
        float _318 = _242 + _310;
        float _320 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
        float _322 = abs(_312);
        float _324 = abs(_316);
        float _326 = precise::min(_322, _324);
        float _328 = fma(_318, _320, (*spvDescriptorSet0.fp_c3)._m0[4].w);
        float _330 = precise::max(_328, _326);
        float _332 = 1.0 / _330;
        float _334 = _312 * _332;
        float _336 = _316 * _332;
        float _338 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _340 = precise::max(_334, _338);
        float _342 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _344 = precise::max(_336, _342);
        float _346 = precise::min(_340, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _348 = precise::min(_344, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _350 = -_346;
        float _352 = fma(_350, (*spvDescriptorSet0.fp_c3)._m0[1].x, _63);
        float _354 = -_346;
        float _356 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[1].z, _63);
        float _358 = fma(_346, (*spvDescriptorSet0.fp_c3)._m0[1].z, _63);
        float _360 = fma(_346, (*spvDescriptorSet0.fp_c3)._m0[1].x, _63);
        float _362 = -_348;
        float _364 = fma(_362, (*spvDescriptorSet0.fp_c3)._m0[1].w, _65);
        float _366 = fma(_348, (*spvDescriptorSet0.fp_c3)._m0[1].w, _65);
        float _368 = -_348;
        float _370 = fma(_368, (*spvDescriptorSet0.fp_c3)._m0[1].y, _65);
        float _372 = fma(_348, (*spvDescriptorSet0.fp_c3)._m0[1].y, _65);
        float2 _1090 = float2(_356, _364);
        float4 _374 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1090, float2(0.0), isnan(_1090))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1090, float2(0.0), isnan(_1090))).xyzw;
        float _376 = _374.x;
        float _378 = _374.y;
        float _380 = _374.z;
        float _382 = _374.w;
        float2 _1106 = float2(_358, _366);
        float4 _384 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1106, float2(0.0), isnan(_1106))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1106, float2(0.0), isnan(_1106))).xyzw;
        float _386 = _384.x;
        float _388 = _384.y;
        float _390 = _384.z;
        float _392 = _384.w;
        float2 _1122 = float2(_352, _370);
        float4 _394 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1122, float2(0.0), isnan(_1122))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1122, float2(0.0), isnan(_1122))).xyzw;
        float _396 = _394.x;
        float _398 = _394.y;
        float _400 = _394.z;
        float _402 = _394.w;
        float2 _1138 = float2(_360, _372);
        float4 _404 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1138, float2(0.0), isnan(_1138))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1138, float2(0.0), isnan(_1138))).xyzw;
        float _406 = _404.x;
        float _408 = _404.y;
        float _410 = _404.z;
        float _412 = _404.w;
        float _414 = _378 + _388;
        float _416 = _376 + _386;
        float _418 = _398 + _408;
        float _420 = _396 + _406;
        float _422 = _380 + _390;
        float _424 = _382 + _392;
        float _426 = _414 + _418;
        float _428 = _400 + _410;
        float _430 = _416 + _420;
        float _432 = _426 * 0.25;
        float _434 = _422 + _428;
        float _436 = _430 * 0.25;
        float _438 = _432 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _440 = _434 * 0.25;
        float _442 = fma(_436, (*spvDescriptorSet0.fp_c3)._m0[2].x, _438);
        float _444 = fma(_440, (*spvDescriptorSet0.fp_c3)._m0[2].z, _442);
        float _446 = _424 * 0.5;
        bool _448 = _444 > _252;
        bool _450 = isnan(_444);
        bool _452 = _448 || _450;
        bool _454 = isnan(_252);
        bool _456 = _452 || _454;
        float _458 = _402 + _412;
        bool _460 = _250 <= _444;
        bool _462 = !_456;
        bool _464 = _460 && _462;
        float _466 = _424 + _458;
        float _468 = _436;
        float _470 = _432;
        float _472 = _440;
        float _474 = _446;
        if (!_464)
        {
            float _476 = _416 * 0.5;
            _468 = _476;
        }
        float _478 = _468;
        if (!_464)
        {
            float _480 = _414 * 0.5;
            _470 = _480;
        }
        float _482 = _470;
        if (!_464)
        {
            float _484 = _422 * 0.5;
            _472 = _484;
        }
        float _486 = _472;
        if (_464)
        {
            float _488 = _466 * 0.25;
            _474 = _488;
        }
        float _490 = _474;
        float _492 = -_478;
        float _494 = _182 + _492;
        float _496 = -_482;
        float _498 = _184 + _496;
        float _500 = -_486;
        float _502 = _186 + _500;
        float _504 = -_490;
        float _506 = _188 + _504;
        float _508 = fma(_494, (*spvDescriptorSet0.fp_c3)._m0[5].x, _478);
        float _510 = fma(_498, (*spvDescriptorSet0.fp_c3)._m0[5].x, _482);
        float _512 = fma(_502, (*spvDescriptorSet0.fp_c3)._m0[5].x, _486);
        float _514 = fma(_506, (*spvDescriptorSet0.fp_c3)._m0[5].x, _490);
        _284 = _508;
        _292 = _512;
        _298 = _514;
        _288 = _510;
    }
    float _516 = _284;
    float _518 = _292;
    float _520 = _298;
    float _522 = _288;
    float _524 = sqrt(_272);
    float _526 = -_516;
    float _528 = _192 + _526;
    float _530 = -_518;
    float _532 = _196 + _530;
    float _534 = -_520;
    float _536 = _198 + _534;
    float _538 = 0.0 + _524;
    float _540 = precise::clamp(_538, 0.0, 1.0);
    float _542 = fma(_540, -0.5, 0.5);
    float _544 = -_522;
    float _546 = _194 + _544;
    float _548 = fma(_542, _528, _516);
    float _550 = fma(_542, _546, _522);
    float _552 = fma(_542, _532, _518);
    float _554 = fma(_542, _536, _520);
    out.m_40.x = _548;
    out.m_40.y = _550;
    out.m_40.z = _552;
    out.m_40.w = _554;
    return out;
}

