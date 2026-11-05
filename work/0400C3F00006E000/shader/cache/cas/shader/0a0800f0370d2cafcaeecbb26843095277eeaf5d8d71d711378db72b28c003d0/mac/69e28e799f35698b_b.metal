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
    float4 m_37 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
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
    float2 _610 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_610, float2(0.0), isnan(_610))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_610, float2(0.0), isnan(_610))).x;
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
    float _121 = _63 * _105;
    float _123 = _63 * _111;
    float _125 = -_69;
    float _127 = -(*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _129 = _125 + _127;
    float _131 = _63 * _81;
    float _133 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[12].y, (*spvDescriptorSet0.fp_c3)._m0[12].w);
    float _135 = _119 * _133;
    float _137 = fma(_131, _129, _135);
    float _139 = _63 * _87;
    float _141 = _63 * _93;
    float _143 = _139 * _133;
    float _145 = 1.0 / _137;
    float _147 = _141 * _133;
    float _149 = _63 * _99;
    float2 _731 = float2(_121, _123);
    float3 _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_731, float2(0.0), isnan(_731))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_731, float2(0.0), isnan(_731))).xyz;
    float _155 = _153.x;
    float _157 = _153.y;
    float _159 = _153.z;
    float2 _745 = float2(_121, _123);
    float3 _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_745, float2(0.0), isnan(_745)), int2(0, 1)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_745, float2(0.0), isnan(_745)), int2(0, 1)).xyz;
    float _163 = _161.x;
    float _165 = _161.y;
    float _167 = _161.z;
    float _169 = _63 * _117;
    float _171 = fma(_149, _129, _147);
    float _173 = fma(_169, _129, _143);
    float _175 = _171 * _145;
    float _177 = _173 * _145;
    float2 _778 = float2(_121, _123);
    float3 _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_778, float2(0.0), isnan(_778)), int2(1, 0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_778, float2(0.0), isnan(_778)), int2(1, 0)).xyz;
    float _181 = _179.x;
    float _183 = _179.y;
    float _185 = _179.z;
    float2 _793 = float2(_121, _123);
    float3 _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_793, float2(0.0), isnan(_793)), int2(1)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_793, float2(0.0), isnan(_793)), int2(1)).xyz;
    float _189 = _187.x;
    float _191 = _187.y;
    float _193 = _187.z;
    float2 _808 = float2(_65, _67);
    float4 _196 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_808, float2(0.0), isnan(_808))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_808, float2(0.0), isnan(_808))).xyzw;
    float _198 = _196.x;
    float _200 = _196.y;
    float _202 = _196.z;
    float _204 = _196.w;
    float2 _824 = float2(_177, _175);
    float4 _206 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_824, float2(0.0), isnan(_824))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_824, float2(0.0), isnan(_824))).xyzw;
    float _208 = _206.x;
    float _210 = _206.y;
    float _212 = _206.z;
    float _214 = _206.w;
    float _216 = -_67;
    float _218 = _216 + _175;
    float _220 = -_65;
    float _222 = _220 + _177;
    float _224 = _218 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _226 = _222 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _228 = _224 * _224;
    float _230 = _157 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _232 = _165 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _234 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[2].x, _230);
    float _236 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[2].x, _232);
    float _238 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[2].z, _234);
    float _240 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[2].z, _236);
    float _242 = _183 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _244 = _191 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _246 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[2].x, _242);
    float _248 = fma(_189, (*spvDescriptorSet0.fp_c3)._m0[2].x, _244);
    float _250 = _200 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _252 = precise::min(_238, _240);
    float _254 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[2].z, _246);
    float _256 = fma(_193, (*spvDescriptorSet0.fp_c3)._m0[2].z, _248);
    float _258 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[2].x, _250);
    float _260 = precise::max(_238, _240);
    float _262 = precise::min(_254, _256);
    float _264 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[2].z, _258);
    float _266 = precise::max(_254, _256);
    float _268 = precise::min(_252, _262);
    float _270 = precise::max(_260, _266);
    float _272 = precise::min(_264, _268);
    float _274 = precise::max(_264, _270);
    float _276 = _270 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _278 = -_272;
    float _280 = _278 + _274;
    float _282 = precise::max(_276, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _284 = fma(_226, _226, _228);
    bool _288 = _280 > _282;
    float _290 = _226;
    float _292 = _280;
    float _294 = _200;
    float _296 = _198;
    if (!_288)
    {
        _290 = _198;
    }
    float _298 = _290;
    float _300 = _298;
    if (!_288)
    {
        _292 = _200;
    }
    float _302 = _292;
    float _304 = _302;
    if (!_288)
    {
        _294 = _202;
    }
    float _306 = _294;
    float _308 = _306;
    if (!_288)
    {
        _296 = _204;
    }
    float _310 = _296;
    bool _312 = !_288;
    float _314 = _310;
    if (!_312)
    {
        float _316 = -_254;
        float _318 = _316 + _240;
        float _320 = -_238;
        float _322 = _320 + _256;
        float _324 = in.m_39.z;
        float _326 = gl_FragCoord.w;
        float _328 = _324 * _326;
        float _330 = in.m_39.y;
        float _332 = gl_FragCoord.w;
        float _334 = _330 * _332;
        float _336 = in.m_39.w;
        float _338 = gl_FragCoord.w;
        float _340 = _336 * _338;
        float _342 = -_322;
        float _344 = _318 + _342;
        float _346 = _318 + _322;
        float _348 = in.m_39.x;
        float _350 = gl_FragCoord.w;
        float _352 = _348 * _350;
        float _354 = _344 * _344;
        float _356 = fma(_346, _346, _354);
        float _358 = _356 + 0.00260416674427688121795654296875;
        float _360 = rsqrt(_358);
        float _362 = _63 * _334;
        float _364 = _346 * _360;
        float _366 = _344 * _360;
        float _368 = _63 * _352;
        float _370 = _63 * _328;
        float _372 = _63 * _340;
        float _374 = abs(_364);
        float _376 = abs(_366);
        float _378 = precise::min(_374, _376);
        float _380 = -_368;
        float _382 = fma(_364, _380, _65);
        float _384 = fma(_364, _368, _65);
        float _386 = _378 * 2.0;
        float _388 = 1.0 / _386;
        float _390 = _388 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
        float _392 = _390 * 0.5;
        float _394 = fma(_364, _392, 0.5);
        float _396 = precise::clamp(_394, 0.0, 1.0);
        float _398 = fma(_366, _392, 0.5);
        float _400 = precise::clamp(_398, 0.0, 1.0);
        float _402 = _396 + (-0.5);
        float _404 = _400 + (-0.5);
        float _406 = -_362;
        float _408 = fma(_366, _406, _67);
        float _410 = fma(_366, _362, _67);
        float _412 = -_370;
        float _414 = fma(_402, _412, _65);
        float _416 = -_372;
        float _418 = fma(_404, _416, _67);
        float _420 = fma(_402, _370, _65);
        float _422 = fma(_404, _372, _67);
        float2 _1164 = float2(_382, _408);
        float4 _424 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1164, float2(0.0), isnan(_1164))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1164, float2(0.0), isnan(_1164))).xyzw;
        float _426 = _424.x;
        float _428 = _424.y;
        float _430 = _424.z;
        float _432 = _424.w;
        float2 _1180 = float2(_384, _410);
        float4 _434 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1180, float2(0.0), isnan(_1180))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1180, float2(0.0), isnan(_1180))).xyzw;
        float _436 = _434.x;
        float _438 = _434.y;
        float _440 = _434.z;
        float _442 = _434.w;
        float2 _1196 = float2(_414, _418);
        float4 _444 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1196, float2(0.0), isnan(_1196))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1196, float2(0.0), isnan(_1196))).xyzw;
        float _446 = _444.x;
        float _448 = _444.y;
        float _450 = _444.z;
        float _452 = _444.w;
        float2 _1212 = float2(_420, _422);
        float4 _454 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1212, float2(0.0), isnan(_1212))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1212, float2(0.0), isnan(_1212))).xyzw;
        float _456 = _454.x;
        float _458 = _454.y;
        float _460 = _454.z;
        float _462 = _454.w;
        float _464 = _428 + _438;
        float _466 = _430 + _440;
        float _468 = _432 + _442;
        float _470 = _448 + _458;
        float _472 = _426 + _436;
        float _474 = _446 + _456;
        float _476 = _464 + _470;
        float _478 = _450 + _460;
        float _480 = _472 + _474;
        float _482 = _476 * 0.25;
        float _484 = _466 + _478;
        float _486 = _480 * 0.25;
        float _488 = _468 * 0.5;
        float _490 = _482 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _492 = _484 * 0.25;
        float _494 = fma(_486, (*spvDescriptorSet0.fp_c3)._m0[2].x, _490);
        float _496 = fma(_492, (*spvDescriptorSet0.fp_c3)._m0[2].z, _494);
        bool _498 = _496 >= _270;
        bool _500 = isnan(_496);
        bool _502 = _498 || _500;
        bool _504 = isnan(_270);
        bool _506 = _502 || _504;
        bool _508 = _268 < _496;
        bool _510 = !_506;
        bool _512 = _508 && _510;
        float _514 = _452 + _462;
        float _516 = _468 + _514;
        float _518 = _486;
        float _520 = _482;
        float _522 = _492;
        _314 = _488;
        if (!_512)
        {
            float _524 = _472 * 0.5;
            _518 = _524;
        }
        float _526 = _518;
        _300 = _526;
        if (!_512)
        {
            float _528 = _464 * 0.5;
            _520 = _528;
        }
        float _530 = _520;
        _304 = _530;
        if (!_512)
        {
            float _532 = _466 * 0.5;
            _522 = _532;
        }
        float _534 = _522;
        _308 = _534;
        if (_512)
        {
            float _536 = _516 * 0.25;
            _314 = _536;
        }
    }
    float _538 = _300;
    float _540 = _308;
    float _542 = _314;
    float _544 = _304;
    float _546 = sqrt(_284);
    float _548 = -_538;
    float _550 = _208 + _548;
    float _552 = -_540;
    float _554 = _212 + _552;
    float _556 = -_542;
    float _558 = _214 + _556;
    float _560 = 0.0 + _546;
    float _562 = precise::clamp(_560, 0.0, 1.0);
    float _564 = fma(_562, -0.5, 0.5);
    float _566 = -_544;
    float _568 = _210 + _566;
    float _570 = fma(_564, _550, _538);
    float _572 = fma(_564, _568, _544);
    float _574 = fma(_564, _554, _540);
    float _576 = fma(_564, _558, _542);
    out.m_42.x = _570;
    out.m_42.y = _572;
    out.m_42.z = _574;
    out.m_42.w = _576;
    return out;
}

