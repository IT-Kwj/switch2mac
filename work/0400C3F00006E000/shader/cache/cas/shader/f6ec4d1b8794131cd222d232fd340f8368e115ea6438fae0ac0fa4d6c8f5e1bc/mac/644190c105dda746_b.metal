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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_61 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_40 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_56 [[user(locn5)]];
    float4 m_50 [[user(locn6), flat]];
    float4 m_46 [[user(locn7), flat]];
    float4 m_63 [[user(locn8)]];
    float4 m_54 [[user(locn9)]];
    float4 m_42 [[user(locn10)]];
    float4 m_44 [[user(locn11)]];
    float4 m_65 [[user(locn12)]];
    float4 m_67 [[user(locn13)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _76 = gl_FragCoord.w;
    float _78 = in.m_40.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_40.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_40.z;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_40.w;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = 1.0 / _76;
    float _104 = _102 * _82;
    float _106 = _102 * _88;
    float _108 = _102 * _94;
    float _110 = _102 * _100;
    float2 _699 = float2(_104, _106);
    float _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_699, float2(0.0), isnan(_699))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_699, float2(0.0), isnan(_699))).w;
    float2 _710 = float2(_108, _110);
    float _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_710, float2(0.0), isnan(_710))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_710, float2(0.0), isnan(_710))).w;
    float _116 = in.m_42.y;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_42.x;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_42.z;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_44.y;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_44.x;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_44.z;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_46.y;
    float _154 = in.m_46.x;
    float _156 = in.m_46.z;
    float _158 = _102 * _120;
    float _160 = _102 * _126;
    float _162 = _102 * _132;
    float _164 = _158 * _158;
    float _166 = _102 * _138;
    float _168 = 1.0 / _152;
    float _170 = fma(_160, _160, _164);
    float _172 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _174 = _166 + _172;
    float _176 = _102 * _150;
    float _178 = fma(_162, _162, _170);
    float _180 = _102 * _144;
    float _182 = _174 * _174;
    float _184 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _186 = _176 + _184;
    float _188 = 1.0 / _154;
    float _190 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _192 = _180 + _190;
    float _194 = fma(_192, _192, _182);
    float _196 = rsqrt(_178);
    float _198 = fma(_186, _186, _194);
    float _200 = 1.0 / _156;
    float _202 = _158 * _196;
    float _204 = _160 * _196;
    float _206 = _162 * _196;
    float _208 = rsqrt(_198);
    float _210 = _202 * _202;
    float _212 = in.m_48.w;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = fma(_204, _204, _210);
    float _220 = fma(_206, _206, _218);
    float _222 = rsqrt(_220);
    float _224 = _174 * _208;
    float _226 = _192 * _208;
    float _228 = _186 * _208;
    float _230 = in.m_50.x;
    float _232 = _224 * _224;
    float _234 = fma(_226, _226, _232);
    float _236 = _202 * _222;
    float _238 = _204 * _222;
    float _240 = _206 * _222;
    float _242 = fma(_228, _228, _234);
    float _244 = _236 * _168;
    float _246 = _238 * _188;
    float _248 = _240 * _200;
    float _250 = in.m_52.w;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = _244 * _244;
    float _258 = rsqrt(_242);
    float _260 = fma(_246, _246, _256);
    float _262 = fma(_248, _248, _260);
    float _264 = (*spvDescriptorSet0.fp_c9)._m0[191].x + 0.0099999904632568359375;
    float _266 = rsqrt(_262);
    float _268 = fma(_230, _264, 0.100000001490116119384765625);
    float _270 = _224 * _258;
    float _272 = in.m_54.y;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = _226 * _258;
    float _280 = _228 * _258;
    float _282 = 1.0 / _268;
    float _284 = _244 * _266;
    float _286 = _246 * _266;
    float _288 = _248 * _266;
    float _290 = _284 * _270;
    float _292 = in.m_56.x;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = fma(_286, _278, _290);
    float _300 = _102 * _216;
    float _302 = fma(_288, _280, _298);
    float _304 = fma(_300, -0.999999940395355224609375, 1.7999999523162841796875);
    float _306 = fma(_300, -0.999999940395355224609375, 2.0);
    float _308 = abs(_302);
    float _310 = _308 + (-0.100000001490116119384765625);
    float _312 = _102 * _254;
    float _314 = _310 * _282;
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = _102 * _276;
    float _320 = _312 * _318;
    float _322 = _112 + _114;
    float _324 = _322 * _312;
    float _326 = fma(_316, -2.0, 3.0);
    float _328 = _316 * _316;
    float _330 = precise::max(_304, _324);
    float _332 = fma(_326, _328, _112);
    float _334 = precise::min(_306, _330);
    float _336 = precise::max(_332, 0.89999997615814208984375);
    float _338 = -_304;
    float _340 = _338 + _334;
    float _342 = precise::min(_336, 1.10000002384185791015625);
    float _344 = _340 * 4.99999904632568359375;
    float _346 = fma(_342, 4.99999904632568359375, -4.49999904632568359375);
    float _348 = _102 * _296;
    float _350 = _344 * _320;
    float _352 = _350 * _346;
    float _354 = 0.0 + _352;
    float _356 = precise::clamp(_354, 0.0, 1.0);
    float _358 = _356 * _348;
    bool _362 = _358 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _364 = isnan(_358);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _370 = _366 || _368;
    float _372 = abs(_204);
    float _374 = abs(_202);
    float _376 = precise::max(_372, _374);
    float _378 = abs(_206);
    float _380 = precise::max(_378, _376);
    if (!_370)
    {
        discard_fragment();
    }
    float _382 = 1.0 / _380;
    float _384 = -_382;
    float _386 = _206 * _384;
    float _388 = _204 * _382;
    float _390 = _202 * _382;
    float3 _1113 = float3(_388, _390, _386);
    float3 _394 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1113, float3(0.0), isnan(_1113)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1113, float3(0.0), isnan(_1113)), level(0.0)).xyz;
    float _396 = _394.x;
    float _398 = _394.y;
    float _400 = _394.z;
    float _402 = in.m_58.x;
    float _404 = gl_FragCoord.w;
    float _406 = _402 * _404;
    float _408 = in.m_48.x;
    float _410 = gl_FragCoord.w;
    float _412 = _408 * _410;
    float _414 = in.m_58.y;
    float _416 = gl_FragCoord.w;
    float _418 = _414 * _416;
    float _420 = in.m_48.y;
    float _422 = gl_FragCoord.w;
    float _424 = _420 * _422;
    float _426 = in.m_58.z;
    float _428 = gl_FragCoord.w;
    float _430 = _426 * _428;
    float _432 = in.m_48.z;
    float _434 = gl_FragCoord.w;
    float _436 = _432 * _434;
    float _438 = in.m_58.w;
    float _440 = gl_FragCoord.w;
    float _442 = _438 * _440;
    float _444 = _312 * _350;
    float _446 = _102 * _406;
    float _448 = _102 * _412;
    float _450 = _102 * _418;
    float _452 = _102 * _424;
    float _454 = _102 * _430;
    float _456 = _102 * _436;
    float _458 = -_446;
    float _460 = _458 + _448;
    float _462 = -_450;
    float _464 = _462 + _452;
    float _466 = _102 * _442;
    float _468 = -_454;
    float _470 = _468 + _456;
    float _472 = fma(_444, _460, _446);
    float _474 = fma(_444, _464, _450);
    float _476 = fma(_444, _470, _454);
    float _478 = _466 * _472;
    float _480 = _466 * _474;
    float _482 = _466 * _476;
    if (!_370)
    {
        out.m_61.x = _478;
        out.m_61.y = _480;
        out.m_61.z = _482;
        out.m_61.w = _352;
        return out;
    }
    float _484 = in.m_63.y;
    float _486 = gl_FragCoord.w;
    float _488 = _484 * _486;
    float _490 = in.m_63.x;
    float _492 = gl_FragCoord.w;
    float _494 = _490 * _492;
    float _496 = in.m_63.z;
    float _498 = gl_FragCoord.w;
    float _500 = _496 * _498;
    float _502 = in.m_65.y;
    float _504 = gl_FragCoord.w;
    float _506 = _502 * _504;
    float _508 = in.m_65.x;
    float _510 = gl_FragCoord.w;
    float _512 = _508 * _510;
    float _514 = in.m_65.z;
    float _516 = gl_FragCoord.w;
    float _518 = _514 * _516;
    float _520 = in.m_67.x;
    float _522 = gl_FragCoord.w;
    float _524 = _520 * _522;
    float _526 = in.m_67.w;
    float _528 = gl_FragCoord.w;
    float _530 = _526 * _528;
    float _532 = in.m_67.y;
    float _534 = gl_FragCoord.w;
    float _536 = _532 * _534;
    float _538 = in.m_67.z;
    float _540 = gl_FragCoord.w;
    float _542 = _538 * _540;
    float _544 = _102 * _488;
    float _546 = _102 * _494;
    float _548 = _102 * _500;
    float _550 = fma(_398, 0.20999999344348907470703125, _544);
    float _552 = fma(_396, 0.20999999344348907470703125, _546);
    float _554 = _102 * _506;
    bool _556 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _558 = _102 * _512;
    float _560 = fma(_400, 0.20999999344348907470703125, _548);
    float _562 = _102 * _518;
    float _564 = _550 + _554;
    float _566 = _552 + _558;
    float _568 = _102 * _536;
    float _570 = _560 + _562;
    float _572 = _480 * _564;
    float _574 = _478 * _566;
    float _576 = 0.0 + _358;
    float _578 = precise::clamp(_576, 0.0, 1.0);
    float _580 = _102 * _524;
    float _582 = _102 * _530;
    float _584 = _482 * _570;
    float _586 = _102 * _542;
    float _588 = fma(_574, _582, _580);
    float _590 = fma(_572, _582, _568);
    float _592 = fma(_584, _582, _586);
    float _594 = _580;
    if (!_556)
    {
        _594 = _578;
    }
    float _596 = _594;
    bool _598 = !_556;
    float _600 = _596;
    if (!_598)
    {
        float _602 = in.m_69.w;
        float _604 = gl_FragCoord.w;
        float _606 = _602 * _604;
        float _608 = in.m_69.z;
        float _610 = gl_FragCoord.w;
        float _612 = _608 * _610;
        float _614 = _102 * _606;
        float _616 = _102 * _612;
        float _618 = 1.0 / _614;
        float _620 = _616 * _618;
        float _622 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _624 = fma(_620, (*spvDescriptorSet0.fp_c8)._m0[30].w, _622);
        float _626 = 1.0 / _624;
        float _628 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _630 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _632 = fma(_626, _628, _630);
        float _634 = _632 * 8.0;
        float _636 = precise::clamp(_634, 0.0, 1.0);
        float _638 = _578 * _636;
        _600 = _638;
    }
    float _640 = _600;
    float _642 = 0.0 + _640;
    float _644 = precise::clamp(_642, 0.0, 1.0);
    out.m_61.x = _588;
    out.m_61.y = _590;
    out.m_61.z = _592;
    out.m_61.w = _644;
    return out;
}

