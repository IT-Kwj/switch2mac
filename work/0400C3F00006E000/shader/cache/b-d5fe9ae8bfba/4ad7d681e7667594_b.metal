#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    constant _16* fp_c13 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_52 [[user(locn5)]];
    float4 m_60 [[user(locn6)]];
    float4 m_56 [[user(locn7), flat]];
    float4 m_39 [[user(locn8)]];
    float4 m_58 [[user(locn9)]];
    float4 m_54 [[user(locn10), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _67 = gl_FragCoord.w;
    float _69 = in.m_39.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _67;
    float _83 = _81 * _73;
    float _85 = _81 * _79;
    float2 _692 = float2(_83, _85);
    float2 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_692, float2(0.0), isnan(_692))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_692, float2(0.0), isnan(_692))).xw;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = in.m_41.w;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_43.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_39.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = _81 * _99;
    float _115 = _81 * _111;
    float _117 = _113 * _93;
    float _119 = _81 * _105;
    float _121 = 0.0 + _117;
    float _123 = precise::clamp(_121, 0.0, 1.0);
    float _125 = _123 * _119;
    bool _129 = _125 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _131 = isnan(_125);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _137 = _133 || _135;
    float _139 = in.m_39.y;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    if (!_137)
    {
        discard_fragment();
    }
    float _145 = _81 * _143;
    float2 _782;
    _782.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_115, _145));
    _782.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_115, _145));
    float _147 = _782.x;
    float _149 = _147 * 256.0;
    int _152 = int(_149);
    float _154 = in.m_45.w;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_45.x;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_45.y;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = _81 * _158;
    float _174 = _81 * _164;
    float _176 = _81 * _170;
    float _178 = 1.0 / _172;
    float _180 = _174 * _178;
    float _182 = _176 * _178;
    float _184 = float(uint(_152));
    float _186 = _184 * 0.00390625;
    float _188 = precise::min(_186, 2.0);
    float2 _839 = float2(_115, _145);
    float _190 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_839, float2(0.0), isnan(_839)), level(_188)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_839, float2(0.0), isnan(_839)), level(_188)).w;
    float2 _848 = float2(_180, _182);
    float _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_848, float2(0.0), isnan(_848))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_848, float2(0.0), isnan(_848))).x;
    float _194 = in.m_41.y;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_41.z;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_41.x;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = _91 * _91;
    float _214 = _81 * _198;
    float _216 = _81 * _204;
    float _218 = _81 * _210;
    float _220 = -_216;
    float _222 = _214 + _220;
    bool _224 = _214 >= _216;
    bool _226 = isnan(_214);
    bool _228 = _224 || _226;
    bool _230 = isnan(_216);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = fma(_234, _222, _216);
    float _238 = -_214;
    float _240 = _238 + _216;
    float _242 = -_218;
    float _244 = _242 + _236;
    bool _246 = _218 >= _236;
    bool _248 = isnan(_218);
    bool _250 = _246 || _248;
    bool _252 = isnan(_236);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = fma(_234, _240, _214);
    float _260 = -_236;
    float _262 = _218 + _260;
    float _264 = _214 * (*spvDescriptorSet0.fp_c9)._m0[191].w;
    float _266 = fma(_256, _244, _218);
    float _268 = fma(_256, _262, _236);
    float _270 = _234 + (-1.0);
    float _272 = -_234;
    float _274 = _272 + 0.666666686534881591796875;
    float _276 = precise::min(_258, _266);
    float _278 = -_258;
    float _280 = _278 + _266;
    float _282 = -_274;
    float _284 = _270 + _282;
    float _286 = -_276;
    float _288 = _268 + _286;
    float _290 = fma(_256, _284, _274);
    float _292 = spvFAdd(_268, 1.0000000133514319600180897396058e-10);
    float _294 = in.m_47.w;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = fma(_288, 6.0, 1.0000000133514319600180897396058e-10);
    float _302 = 1.0 / _292;
    float _304 = 1.0 / _300;
    float _306 = _288 * _302;
    float _308 = _306 * (*spvDescriptorSet0.fp_c9)._m0[191].z;
    float _310 = fma(_280, _304, _290);
    float _312 = abs(_310);
    float _314 = _312 + 0.07999999821186065673828125;
    float _316 = abs(_310);
    float _318 = _316 + 0.7466666698455810546875;
    float _320 = abs(_310);
    float _322 = _320 + 0.413333356380462646484375;
    float _324 = abs(_310);
    float _326 = fma(_324, 6.0, 0.4799999892711639404296875);
    float _328 = abs(_310);
    float _330 = fma(_328, 6.0, 4.480000019073486328125);
    float _332 = floor(_318);
    float _334 = abs(_310);
    float _336 = fma(_334, 6.0, 2.480000019073486328125);
    float _338 = _81 * _298;
    float _340 = floor(_314);
    float _342 = in.m_47.x;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = floor(_322);
    float _350 = fma(_332, -6.0, _330);
    float _352 = in.m_47.y;
    float _354 = gl_FragCoord.w;
    float _356 = _352 * _354;
    float _358 = _350 + (-3.0);
    float _360 = fma(_340, -6.0, _326);
    float _362 = abs(_358);
    float _364 = _362 + (-1.0);
    float _366 = precise::clamp(_364, 0.0, 1.0);
    float _368 = in.m_47.z;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = _360 + (-3.0);
    float _376 = _366 + (-1.0);
    float _378 = fma(_348, -6.0, _336);
    float _380 = abs(_374);
    float _382 = _380 + (-1.0);
    float _384 = precise::clamp(_382, 0.0, 1.0);
    float _386 = fma(_308, _376, 1.0);
    float _388 = _378 + (-3.0);
    float _390 = _384 + (-1.0);
    float _392 = -_264;
    float _394 = fma(_268, _386, _392);
    float _396 = abs(_388);
    float _398 = _396 + (-1.0);
    float _400 = precise::clamp(_398, 0.0, 1.0);
    float _402 = fma(_308, _390, 1.0);
    float _404 = fma(_212, _394, _264);
    float _406 = _400 + (-1.0);
    float _408 = _216 * (*spvDescriptorSet0.fp_c9)._m0[191].w;
    float _410 = _404 + 0.310000002384185791015625;
    float _412 = fma(_308, _406, 1.0);
    float _414 = _218 * (*spvDescriptorSet0.fp_c9)._m0[191].w;
    float _416 = -_408;
    float _418 = fma(_268, _412, _416);
    float _420 = -_414;
    float _422 = fma(_268, _402, _420);
    float _424 = fma(_212, _418, _408);
    float _426 = fma(_212, _422, _414);
    float _428 = _81 * _346;
    float _430 = _81 * _372;
    float _432 = _424 + 0.23999999463558197021484375;
    float _434 = _426 + 0.3400000035762786865234375;
    bool _436 = _190 >= _338;
    bool _438 = isnan(_190);
    bool _440 = _436 || _438;
    bool _442 = isnan(_338);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    float _448 = _81 * _356;
    float _450 = _446 * (*spvDescriptorSet0.fp_c9)._m0[192].x;
    float _452 = fma(_428, _450, _434);
    float _454 = fma(_448, _450, _410);
    float _456 = fma(_430, _450, _432);
    if (!_137)
    {
        out.m_50.x = _452;
        out.m_50.y = _454;
        out.m_50.z = _456;
        out.m_50.w = _117;
        return out;
    }
    float _458 = in.m_52.y;
    float _460 = gl_FragCoord.w;
    float _462 = _458 * _460;
    float _464 = in.m_52.x;
    float _466 = gl_FragCoord.w;
    float _468 = _464 * _466;
    float _470 = in.m_54.y;
    float _472 = in.m_54.x;
    float _474 = in.m_52.z;
    float _476 = gl_FragCoord.w;
    float _478 = _474 * _476;
    float _480 = in.m_45.z;
    float _482 = gl_FragCoord.w;
    float _484 = _480 * _482;
    float _486 = in.m_54.z;
    float _488 = in.m_56.x;
    float _490 = _81 * _462;
    float _492 = _81 * _468;
    float _494 = -_470;
    float _496 = _490 + _494;
    float _498 = -_472;
    float _500 = _492 + _498;
    float _502 = _81 * _478;
    float _504 = _81 * _484;
    float _506 = _496 * _496;
    float _508 = _488 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _510 = -_486;
    float _512 = _502 + _510;
    float _514 = _504 * _178;
    float _516 = fma(_500, _500, _506);
    float _518 = in.m_58.w;
    float _520 = gl_FragCoord.w;
    float _522 = _518 * _520;
    float _524 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _526 = fma(_192, (*spvDescriptorSet0.fp_c8)._m0[30].w, _524);
    float _528 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _530 = fma(_514, (*spvDescriptorSet0.fp_c8)._m0[30].w, _528);
    float _532 = fma(_512, _512, _516);
    float _534 = in.m_60.x;
    float _536 = gl_FragCoord.w;
    float _538 = _534 * _536;
    float _540 = 1.0 / _526;
    float _542 = in.m_60.y;
    float _544 = gl_FragCoord.w;
    float _546 = _542 * _544;
    float _548 = -_532;
    float _550 = fma(_508, _508, _548);
    float _552 = _454 * 0.715200006961822509765625;
    float _554 = in.m_60.z;
    float _556 = gl_FragCoord.w;
    float _558 = _554 * _556;
    float _560 = precise::max(0.0, _550);
    float _562 = 1.0 / _530;
    float _564 = in.m_60.w;
    float _566 = gl_FragCoord.w;
    float _568 = _564 * _566;
    float _570 = fma(_452, 0.2125999927520751953125, _552);
    float _572 = fma(_456, 0.072200000286102294921875, _570);
    float _574 = sqrt(_560);
    float _576 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _578 = _562 * _576;
    float _580 = 1.0 / _572;
    float _582 = _81 * _522;
    float _584 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _586 = -_578;
    float _588 = fma(_540, _584, _586);
    float _590 = _574 + _588;
    float _592 = -_582;
    float _594 = _590 + _592;
    float _596 = _594 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _598 = _596 * (-1.44269502162933349609375);
    bool _600 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _602 = exp2(_598);
    float _604 = _580 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _606 = precise::clamp(_604, 0.0, 1.0);
    float _608 = fma(_606, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _610 = _81 * _568;
    float _612 = _608 * _610;
    float _614 = _81 * _546;
    float _616 = _578;
    if (_600)
    {
        float _618 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _620 = _578 + _618;
        _616 = _620;
    }
    float _622 = _616;
    float _624 = fma(_454, _612, _614);
    float _626 = -_602;
    float _628 = _626 + 1.0;
    float _630 = precise::clamp(_628, 0.0, 1.0);
    float _632 = _622;
    if (_600)
    {
        float _634 = _622 * 8.0;
        float _636 = precise::clamp(_634, 0.0, 1.0);
        _632 = _636;
    }
    float _638 = _632;
    float _640 = _125 * _630;
    float _642 = precise::clamp(_640, 0.0, 1.0);
    float _644 = _81 * _538;
    float _646 = _81 * _558;
    float _648 = _642;
    if (_600)
    {
        float _650 = _642 * _638;
        _648 = _650;
    }
    float _652 = _648;
    float _654 = fma(_452, _612, _644);
    float _656 = fma(_456, _612, _646);
    float _658 = 0.0 + _652;
    float _660 = precise::clamp(_658, 0.0, 1.0);
    out.m_50.x = _654;
    out.m_50.y = _624;
    out.m_50.z = _656;
    out.m_50.w = _660;
    return out;
}

