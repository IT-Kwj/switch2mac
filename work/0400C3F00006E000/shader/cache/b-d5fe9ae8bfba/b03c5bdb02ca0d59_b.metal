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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_47 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_69 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1178 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    float _98 = as_type<float>(_90);
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _96;
    float _102 = _100;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_94)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1676 = as_type<float>(_108);
        out.gl_Position.z = _1676;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_90);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    if (_138)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _98;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1745 = as_type<float>(_144);
        out.gl_Position.z = _1745;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _148 = in.m_51.y;
    float _150 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _152 = in.m_53.x;
    float _154 = in.m_53.y;
    float _156 = in.m_53.z;
    float _158 = in.m_51.z;
    int _160 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _162 = _160 != 0;
    float _164 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _166 = log2(_164);
    float _168 = in.m_44.x;
    float _170 = in.m_44.y;
    float _172 = in.m_44.z;
    int _174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _176 = _174 != 0;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _180 = _178 != 0;
    float _182 = _150 * _146;
    float _184 = in.m_51.x;
    int _186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _188 = _186 != 0;
    int _190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _192 = _190 != 0;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _196 = _194 != 0;
    float _198 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _200 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _198);
    float _202 = _148 * 2.0;
    float _204 = _166 * _126;
    float _206 = _152 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _208 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _210 = floor(_202);
    float _212 = _154 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _214 = _156 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _216 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _208);
    float _218 = _170 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _220 = _158 * 2.0;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _226 = _170 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _230 = _222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _232 = floor(_220);
    bool _234 = _210 >= 0.0;
    bool _236 = isnan(_210);
    bool _238 = _234 || _236;
    bool _240 = isnan(0.0);
    bool _242 = _238 || _240;
    float _244 = _224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _246 = _228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _248 = _170 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _250 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    int _252 = _242 ? 0 : 1;
    float _254 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].x, _218);
    bool _256 = _210 > 0.0;
    float _258 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].x, _226);
    float _260 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].x, _248);
    out.m_55.x = _230;
    out.m_55.y = _244;
    out.m_55.z = _246;
    float _262 = _184 + _148;
    float _264 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _250);
    float _266 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _216);
    float _268 = _262 + (-1.0);
    float _270 = exp2(_204);
    int _272 = ~_252;
    int _274 = _272 + 1;
    int _276 = _274 + 1;
    float _278 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].z, _260);
    float _280 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _200);
    int _282 = _276;
    if (!_256)
    {
        int _284 = ~_252;
        int _286 = _284 + 1;
        _282 = _286;
    }
    int _288 = _282;
    float _290 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].z, _258);
    float _292 = _184 * 2.0;
    float _294 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].z, _254);
    float _296 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _264);
    float _298 = _184 + _158;
    bool _300 = !_176;
    int _302 = _300 ? 0 : 1;
    float _304 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _306 = _232 > 0.0;
    float _308 = _298 + (-1.0);
    float _310 = floor(_292);
    bool _312 = _232 >= 0.0;
    bool _314 = isnan(_232);
    bool _316 = _312 || _314;
    bool _318 = isnan(0.0);
    bool _320 = _316 || _318;
    float _322 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[20].x, _182);
    float _324 = _278 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _326 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _328 = _320 ? 0 : 1;
    float _330 = -_270;
    float _332 = _330 + 1.0;
    float _334 = _290 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _336 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _338 = _324 + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _342 = 1.0 + _340;
    int _344 = ~_328;
    int _346 = _344 + 1;
    int _348 = _346 + 1;
    float _350 = _294 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _352 = _348;
    float _354 = _324;
    if (!_306)
    {
        int _356 = ~_328;
        int _358 = _356 + 1;
        _352 = _358;
    }
    int _360 = _352;
    float _362 = 1.0 / _342;
    bool _364 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _366 = isnan(0.0);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _372 = _368 || _370;
    float _374 = _338 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _376 = _148 + _158;
    bool _378 = !_196;
    float _380 = _378 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _382 = _372 ? _332 : 0.0;
    float _384 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _386 = _334 + _384;
    float _388 = floor(_322);
    bool _390 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _392 = isnan(1.0);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _398 = _394 || _396;
    float _400 = _376 + (-1.0);
    bool _402 = _310 > 0.0;
    float _404 = fma(_386, (*spvDescriptorSet0.vp_c8)._m0[28].x, _374);
    bool _406 = _310 >= 0.0;
    bool _408 = isnan(_310);
    bool _410 = _406 || _408;
    bool _412 = isnan(0.0);
    bool _414 = _410 || _412;
    float _416 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _418 = _350 + _416;
    float _420 = float(_288);
    float _422 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[28].z, _404);
    float _424 = float(_360);
    float _426 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _428 = _338 * _338;
    float _430 = _380;
    if (_398)
    {
        float _432 = _382 * _362;
        _128 = _432;
    }
    float _434 = _128;
    bool _436 = _422 >= 0.0;
    float _438 = -_388;
    float _440 = _322 + _438;
    bool _442 = !_188;
    int _444 = _442 ? 0 : 1;
    float _446 = fma(_386, _386, _428);
    int _448 = abs(as_type<int>(_380));
    int _450 = abs(_444);
    float _452 = fma(_418, _418, _446);
    float _454 = float(_448);
    float _456 = float(_450);
    int _458 = abs(_302);
    float _460 = _454 * _420;
    float _462 = _322 * 6.283185482025146484375;
    float _464 = _456 * _424;
    float _466 = in.m_57.x;
    float _468 = in.m_57.y;
    float _470 = in.m_57.z;
    int _472 = _414 ? 0 : 1;
    float _474 = rsqrt(_452);
    float _476 = float(_458);
    float _478 = -_440;
    float _480 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _482 = ~_472;
    int _484 = _482 + 1;
    int _486 = _484 + 1;
    int _488 = _486;
    int _490 = _450;
    if (_436)
    {
        out.m_47.x = 0.0;
    }
    if (_436)
    {
        _430 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _492 = _430;
    float _494 = abs(_480);
    float _496 = _476 * _494;
    if (!_402)
    {
        int _498 = ~_472;
        int _500 = _498 + 1;
        _488 = _500;
    }
    int _502 = _488;
    float _504 = rsqrt(_280);
    if (_436)
    {
        float _506 = _492 * 5.0;
        _490 = as_type<int>(_506);
    }
    int _508 = _490;
    float _510 = _462 * 0.15915493667125701904296875;
    bool _512 = !_180;
    int _514 = _512 ? 0 : 1;
    bool _516 = !_192;
    int _518 = _516 ? 0 : 1;
    if (_436)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2336 = as_type<float>(_508);
        out.gl_Position.z = _2336;
    }
    float _520 = sqrt(_280);
    float _522 = _338 * _474;
    float _524 = _386 * _474;
    if (_436)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _526 = -_522;
    float _528 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[18].w, _324);
    float _530 = _184 + (-0.5);
    float _532 = -_524;
    float _534 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[18].w, _334);
    float _536 = _418 * _474;
    float _538 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _540 = _528 + _538;
    float _542 = _464 * (-2.0);
    float _544 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _546 = _534 + _544;
    float _548 = _510 * 6.283185482025146484375;
    float _550 = cos(_548);
    float _552 = _540 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _554 = -_536;
    float _556 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[18].w, _350);
    float _558 = fma(_542, _466, _466);
    float _560 = fma(_304, _542, _304);
    float _562 = fma(_546, (*spvDescriptorSet0.vp_c8)._m0[28].x, _552);
    float _564 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _566 = _556 + _564;
    float _568 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[196].x, _558);
    float _570 = _460 * (-2.0);
    int _572 = abs(_518);
    float _574 = fma(_566, (*spvDescriptorSet0.vp_c8)._m0[28].z, _562);
    float _576 = fma(_560, _434, _568);
    float _578 = fma(_570, _470, _470);
    float _580 = _158 + (-0.5);
    float _582 = fma(_326, _570, _326);
    bool _584 = _574 >= 0.0;
    float _586 = rsqrt(_266);
    float _588 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[196].z, _578);
    float _590 = _576 * 0.15915493667125701904296875;
    float _592 = float(_502);
    float _594 = fma(_582, _434, _588);
    float _596 = float(_572);
    float _598 = rsqrt(_296);
    bool _600 = _440 < 0.5;
    float _602 = float(_600);
    float _604 = _594 * 0.15915493667125701904296875;
    float _606 = _596 * _592;
    float _608 = fma(_550, 0.5, 0.5);
    float _610 = _592;
    if (_584)
    {
        _610 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _612 = _610;
    float _614 = -_602;
    float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _618 = _606 * (-2.0);
    float _620 = _590 * 6.283185482025146484375;
    float _622 = sin(_620);
    float _624 = -_608;
    float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _628 = as_type<int>(_612);
    if (_584)
    {
        float _630 = _612 * 5.0;
        _628 = as_type<int>(_630);
    }
    int _632 = _628;
    float _634 = fma(_618, _468, _468);
    bool _636 = !_162;
    int _638 = _636 ? 0 : 1;
    if (_584)
    {
        out.m_47.x = 0.0;
    }
    float _640 = fma(_426, _618, _426);
    float _642 = _590 * 6.283185482025146484375;
    float _644 = cos(_642);
    float _646 = _148 + (-0.5);
    if (_584)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2544 = as_type<float>(_632);
        out.gl_Position.z = _2544;
    }
    int _648 = abs(_638);
    float _650 = _604 * 6.283185482025146484375;
    float _652 = sin(_650);
    if (_584)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _654 = -_324;
    float _656 = _654 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _658 = -_334;
    float _660 = _658 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _662 = float(_648);
    float _664 = -_350;
    float _666 = _664 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _668 = _656 * _656;
    int _670 = abs(_514);
    float _672 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[196].y, _634);
    float _674 = fma(_662, _626, _496);
    float _676 = fma(_660, _660, _668);
    float _678 = fma(_640, _434, _672);
    float _680 = _212 * _586;
    float _682 = fma(_666, _666, _676);
    float _684 = -_522;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[18].w, _338);
    float _688 = float(_670);
    float _690 = -_524;
    float _692 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[18].w, _386);
    float _694 = rsqrt(_682);
    float _696 = _686 * _686;
    float _698 = _214 * _598;
    float _700 = abs(_616);
    float _702 = fma(_688, _700, _674);
    float _704 = -_536;
    float _706 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _418);
    float _708 = fma(_692, _692, _696);
    float _710 = _206 * _504;
    float _712 = _702 * _520;
    float _714 = _604 * 6.283185482025146484375;
    float _716 = cos(_714);
    float _718 = fma(_706, _706, _708);
    float _720 = _678 * 0.15915493667125701904296875;
    float _722 = _680 * _712;
    float _724 = _710 * _712;
    float _726 = _622 * _652;
    float _728 = _660 * _694;
    float _730 = _698 * _712;
    float _732 = _666 * _694;
    float _734 = _656 * _694;
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _738 = _728 * _736;
    float _740 = in.m_59.x;
    float _742 = in.m_59.y;
    float _744 = in.m_59.z;
    float _746 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _748 = _732 * _746;
    float _750 = _720 * 6.283185482025146484375;
    float _752 = sin(_750);
    float _754 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _756 = -_738;
    float _758 = fma(_732, _754, _756);
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _762 = _734 * _760;
    float _764 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _766 = -_748;
    float _768 = fma(_734, _764, _766);
    float _770 = _644 * _716;
    float _772 = _758 * _758;
    float _774 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _776 = -_762;
    float _778 = fma(_728, _774, _776);
    float _780 = _622 * _716;
    float _782 = sqrt(_718);
    float _784 = fma(_768, _768, _772);
    float _786 = fma(_778, _778, _784);
    float _788 = _720 * 6.283185482025146484375;
    float _790 = cos(_788);
    float _792 = fma(_752, _726, _770);
    float _794 = fma(_752, _770, _726);
    float _796 = _722 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _798 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _800 = _644 * _652;
    bool _802 = _742 != 0.0;
    bool _804 = isnan(_742);
    bool _806 = _802 || _804;
    bool _808 = isnan(0.0);
    bool _810 = _806 || _808;
    float _812 = rsqrt(_786);
    float _814 = _474 * _782;
    float _816 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _818 = _740 == 0.0;
    bool _820 = !_810;
    bool _822 = _818 && _820;
    float _824 = _814 * _796;
    float _826 = _814 * _816;
    float _828 = _814 * _798;
    float _830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _742);
    float _832 = _652 * _790;
    float _834 = _716 * _790;
    float _836 = _622 * _790;
    float _838 = _644 * _790;
    float _840 = _824 * _830;
    float _842 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _740);
    float _844 = -_800;
    float _846 = fma(_752, _780, _844);
    float _848 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _744);
    float _850 = -_780;
    float _852 = fma(_752, _800, _850);
    float _854 = _828 * _842;
    float _856 = _792 * _840;
    float _858 = _768 * _812;
    float _860 = _758 * _812;
    float _862 = _826 * _848;
    float _864 = _778 * _812;
    float _866 = fma(_832, _854, _856);
    float _868 = _846 * _840;
    float _870 = _732 * _860;
    float _872 = _734 * _858;
    float _874 = _836 * _840;
    float _876 = fma(_834, _854, _868);
    float _878 = fma(_852, _862, _866);
    float _880 = -_870;
    float _882 = fma(_734, _864, _880);
    float _884 = -_872;
    float _886 = fma(_728, _860, _884);
    float _888 = -_752;
    float _890 = fma(_888, _854, _874);
    float _892 = fma(_794, _862, _876);
    float _894 = _882 * _878;
    float _896 = _886 * _878;
    float _898 = fma(_838, _862, _890);
    bool _900 = _744 == 0.0;
    bool _902 = _900 && _822;
    float _904 = in.m_61.x;
    float _906 = in.m_61.y;
    float _908 = in.m_61.z;
    float _910 = fma(_858, _892, _894);
    float _912 = fma(_864, _892, _896);
    float _914 = _728 * _864;
    float _916 = _792 * _886;
    float _918 = fma(_728, _898, _910);
    float _920 = fma(_732, _898, _912);
    float _922 = -_914;
    float _924 = fma(_732, _858, _922);
    float _926 = _852 * _882;
    float _928 = _334 + _918;
    float _930 = _350 + _920;
    float _932 = _792 * _924;
    float _934 = _924 * _878;
    float _936 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _938 = _928 + _936;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _942 = _930 + _940;
    float _944 = _832 * _924;
    float _946 = _852 * _886;
    float _948 = _938 * _938;
    float _950 = _942 * _942;
    float _952 = _852 * _924;
    float _954 = fma(_846, _860, _932);
    float _956 = _948 + _950;
    float _958 = _904;
    float _960 = _906;
    float _962 = _908;
    float _964 = _948;
    float _966 = _950;
    float _968 = _928;
    float _970 = _930;
    if (!_902)
    {
        float _972 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[17].y, _904);
        _958 = _972;
    }
    float _974 = _958;
    if (!_902)
    {
        float _976 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[17].y, _906);
        _960 = _976;
    }
    float _978 = _960;
    float _980 = sqrt(_956);
    float _982 = _792 * _882;
    if (!_902)
    {
        float _984 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[17].y, _908);
        _962 = _984;
    }
    float _986 = _962;
    float _988 = _832 * _882;
    float _990 = fma(_846, _864, _916);
    float _992 = fma(_846, _858, _982);
    float _994 = fma(_860, _892, _934);
    float _996 = _832 * _886;
    float _998 = fma(_834, _858, _988);
    float _1000 = fma(_834, _860, _944);
    float _1002 = fma(_734, _898, _994);
    float _1004 = fma(_836, _728, _992);
    float _1006 = fma(_834, _864, _996);
    float _1008 = fma(_794, _858, _926);
    float _1010 = _324 + _1002;
    float _1012 = fma(_794, _860, _952);
    bool _1014 = _980 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1016 = fma(_836, _734, _954);
    float _1018 = fma(_794, _864, _946);
    float _1020 = fma(_836, _732, _990);
    if (!_1014)
    {
        _354 = _1010;
    }
    float _1022 = _354;
    bool _1024 = !_1014;
    float _1026 = _1022;
    if (!_1024)
    {
        float _1028 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1032 = _980 + _1030;
        float _1034 = _1010 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1036 = rsqrt(_956);
        float _1038 = _1032 * _1028;
        float _1040 = _1038 * 0.15915493667125701904296875;
        float _1042 = _1040 * 6.283185482025146484375;
        float _1044 = sin(_1042);
        float _1046 = _1040 * 6.283185482025146484375;
        float _1048 = cos(_1046);
        float _1050 = fma(_1044, _1034, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1052 = _1036 * _1050;
        float _1054 = fma(_938, _1052, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1056 = _1048 + (-1.0);
        float _1058 = fma(_942, _1052, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1060 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1062 = _1054 + _1060;
        float _1064 = _1056 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1066 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1068 = _1058 + _1066;
        float _1070 = _1062 * _1062;
        float _1072 = fma(_1010, _1048, _1064);
        float _1074 = _1068 * _1068;
        _1026 = _1072;
        _964 = _1070;
        _966 = _1074;
        _968 = _1054;
        _970 = _1058;
    }
    float _1076 = _1026;
    float _1078 = _964;
    float _1080 = _966;
    float _1082 = _968;
    float _1084 = _970;
    float _1086 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1088 = _1076 + _1086;
    float _1090 = -_752;
    float _1092 = fma(_1090, _728, _998);
    float _1094 = -_752;
    float _1096 = fma(_1094, _734, _1000);
    float _1098 = -_752;
    float _1100 = fma(_1098, _732, _1006);
    float _1102 = fma(_1088, _1088, _1078);
    float _1104 = _1004 * _978;
    float _1106 = _1016 * _978;
    float _1108 = _1020 * _978;
    float _1110 = _1102 + _1080;
    float _1112 = fma(_838, _728, _1008);
    float _1114 = fma(_838, _734, _1012);
    float _1116 = fma(_838, _732, _1018);
    float _1118 = fma(_1092, _974, _1104);
    float _1120 = fma(_1096, _974, _1106);
    float _1122 = sqrt(_1110);
    float _1124 = fma(_1100, _974, _1108);
    float _1126 = fma(_1112, _986, _1118);
    float _1128 = fma(_1114, _986, _1120);
    float _1130 = fma(_1116, _986, _1124);
    out.m_63.x = _1126;
    out.m_63.y = _1128;
    out.m_63.z = _1130;
    bool _1132 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1134 = isnan(_1122);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1140 = _1136 || _1138;
    float _1142 = _1088;
    if (!_1140)
    {
        _1142 = 1.0;
    }
    float _1144 = _1142;
    bool _1146 = !_1140;
    float _1148 = _1144;
    if (!_1146)
    {
        bool _1150 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1152 = isnan(_1122);
        bool _1154 = _1150 || _1152;
        bool _1156 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1158 = _1154 || _1156;
        if (!_1158)
        {
            float _1160 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1162 = _1122 + _1160;
            float _1164 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1166 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1164;
            float _1168 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1170 = _1168 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1172 = 1.0 / _1166;
            float _1174 = _1162 * _1172;
            float _1176 = fma(_1174, _1170, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1148 = _1176;
            _1178 = true;
        }
        else
        {
            bool _1180 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1182 = isnan(_1122);
            bool _1184 = _1180 || _1182;
            bool _1186 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1188 = _1184 || _1186;
            if (!_1188)
            {
                float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1192 = _1122 + _1190;
                float _1194 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1196 = _1194 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1198 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1200 = _1198 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1202 = 1.0 / _1196;
                float _1204 = _1192 * _1202;
                float _1206 = fma(_1204, _1200, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1148 = _1206;
                _1178 = true;
            }
            else
            {
                _1148 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1178 = false;
    float _1208 = _1148;
    float _1210 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1212 = _1076 + _1210;
    float _1214 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1216 = _1082 + _1214;
    float _1218 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1220 = _1084 + _1218;
    float _1222 = fma(_1212, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1224 = fma(_1216, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1226 = fma(_1220, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1228 = -_522;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1222);
    float _1232 = -_524;
    float _1234 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1224);
    float _1236 = -_536;
    float _1238 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1226);
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1242 = _1230 + _1240;
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1246 = _1234 + _1244;
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1250 = _1238 + _1248;
    float _1252 = _1242 * _1242;
    float _1254 = fma(_1246, _1246, _1252);
    float _1256 = fma(_1250, _1250, _1254);
    float _1258 = rsqrt(_1256);
    float _1260 = sqrt(_1256);
    float _1262 = _1258 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1264 = _1246 * _1262;
    float _1266 = _1250 * _1262;
    float _1268 = _1264 * _1264;
    float _1270 = _1266 * _1266;
    float _1272 = _1268 + _1270;
    float _1274 = sqrt(_1272);
    bool _1276 = _1274 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1280 = _1274 + _1278;
    float _1282 = _1258;
    float _1284 = _1272;
    float _1286 = _1280;
    float _1288 = _1212;
    float _1290 = _1242;
    float _1292 = _1262;
    float _1294 = _1264;
    if (_1276)
    {
        float _1296 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1282 = _1296;
    }
    float _1298 = _1282;
    if (_1276)
    {
        float _1300 = rsqrt(_1272);
        _1284 = _1300;
    }
    float _1302 = _1284;
    if (_1276)
    {
        float _1304 = _1280 * _1298;
        _1286 = _1304;
    }
    float _1306 = _1286;
    if (_1276)
    {
        float _1308 = _1306 * 0.15915493667125701904296875;
        _1288 = _1308;
    }
    float _1310 = _1288;
    float _1312 = _1298;
    float _1314 = _1310;
    if (_1276)
    {
        float _1316 = _1310 * 6.283185482025146484375;
        float _1318 = sin(_1316);
        _1312 = _1318;
    }
    float _1320 = _1312;
    float _1322 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1324 = precise::max(0.0, _1322);
    float _1326 = _1250;
    float _1328 = _1324;
    if (_1276)
    {
        float _1330 = _1310 * 6.283185482025146484375;
        float _1332 = cos(_1330);
        _1326 = _1332;
    }
    float _1334 = _1326;
    float _1336 = -_1262;
    float _1338 = -_1324;
    float _1340 = fma(_1242, _1336, _1338);
    if (!_1276)
    {
        _1290 = _1266;
    }
    float _1342 = _1290;
    float _1344 = _1342;
    if (_1276)
    {
        float _1346 = _1340 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1328 = _1346;
    }
    float _1348 = _1328;
    float _1350 = _1320;
    float _1352 = _1348;
    if (_1276)
    {
        float _1354 = fma(_1320, _1348, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1350 = _1354;
    }
    float _1356 = _1350;
    float _1358 = _1356;
    float _1360 = _1334;
    if (_1276)
    {
        float _1362 = _1334 + (-1.0);
        _1352 = _1362;
    }
    float _1364 = _1352;
    float _1366 = _1364;
    if (_1276)
    {
        float _1368 = _1302 * _1356;
        _1292 = _1368;
    }
    float _1370 = _1292;
    if (!_1276)
    {
        _1358 = _1340;
    }
    float _1372 = _1358;
    float _1374 = _1372;
    if (_1276)
    {
        float _1376 = _1364 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1314 = _1376;
    }
    float _1378 = _1314;
    if (_1276)
    {
        float _1380 = _1264 * _1370;
        _1294 = _1380;
    }
    float _1382 = _1294;
    if (!_1276)
    {
        _1366 = _1268;
    }
    float _1384 = _1366;
    float _1386 = _1384;
    if (_1276)
    {
        float _1388 = _1266 * _1370;
        _1344 = _1388;
    }
    float _1390 = _1344;
    if (_1276)
    {
        float _1392 = fma(_1340, _1334, _1378);
        _1374 = _1392;
    }
    float _1394 = _1374;
    if (_1276)
    {
        float _1396 = _1382 * _1382;
        _1386 = _1396;
    }
    float _1398 = _1386;
    if (!_1276)
    {
        _1360 = _1270;
    }
    float _1400 = _1360;
    float _1402 = _1400;
    if (_1276)
    {
        float _1404 = _1390 * _1390;
        _1402 = _1404;
    }
    float _1406 = _1402;
    float _1408 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1410 = fma(_1394, _1394, _1398);
    float _1412 = _1410 + _1406;
    float _1414 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1418 = fma(_1260, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1416);
    float _1420 = precise::clamp(_1418, 0.0, 1.0);
    float _1422 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1424 = rsqrt(_1412);
    float _1426 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1414);
    float _1428 = -_1420;
    float _1430 = _1428 + 1.0;
    float _1432 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1422);
    float _1434 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1408);
    float _1436 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1426);
    float _1438 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1440 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1442 = abs(_1430);
    float _1444 = log2(_1442);
    float _1446 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1448 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1438);
    float _1450 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1432);
    float _1452 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1434);
    float _1454 = _1446 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1456 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1448);
    float _1458 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1460 = _1424 * _1382;
    float _1462 = -_1454;
    float _1464 = fma(_1462, _1440, 1.0);
    float _1466 = _1456 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1468 = _1452 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1470 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1472 = _1424 * _1394;
    float _1474 = _1460 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1476 = _1424 * _1390;
    float _1478 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1470);
    float _1480 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1482 = -_1474;
    float _1484 = fma(_1472, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1482);
    float _1486 = log2(_1464);
    float _1488 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1478);
    float _1490 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1492 = -_1476;
    float _1494 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1484);
    float _1496 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1498 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1488);
    float _1500 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1490);
    float _1502 = fma(_1494, -0.5, 0.5);
    float _1504 = exp2(_1480);
    float _1506 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1496);
    float _1508 = fma(_1494, 0.5, 0.5);
    float _1510 = _1472 + 1.0;
    float _1512 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1500);
    float _1514 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1506);
    float _1516 = fma(_1508, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1518 = 1.0 / _1498;
    float _1520 = _1486 * 0.693147182464599609375;
    float _1522 = fma(_1508, _1516, -0.212114393711090087890625);
    float _1524 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1512);
    float _1526 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1528 = fma(_1508, _1522, 1.570728778839111328125);
    float _1530 = sqrt(_1502);
    float _1532 = -_1472;
    float _1534 = fma(_1504, _1510, _1532);
    float _1536 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1514);
    float _1538 = fma(_1534, 0.5, 0.5);
    float _1540 = _1536 * _1518;
    float _1542 = _1524 * _1518;
    float _1544 = fma(_1540, 0.5, 0.5);
    float _1546 = fma(_1542, -0.5, 0.5);
    float _1548 = _1530 * 0.636619746685028076171875;
    float3 _4010 = float3(_1544, _1546, _1526);
    float _1550 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4010, float3(0.0), isnan(_4010)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4010, float3(0.0), isnan(_4010)), level(0.0)).x;
    float3 _4021 = float3(_1544, _1546, _1526);
    float4 _1553 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4021, float3(0.0), isnan(_4021)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4021, float3(0.0), isnan(_4021)), level(0.0)).xyzw;
    float _1555 = _1553.x;
    float _1557 = _1553.y;
    float _1559 = _1553.z;
    float _1561 = _1553.w;
    float _1563 = -_1528;
    float _1565 = fma(_1548, _1563, 1.0);
    float2 _4043 = float2(_1565, _1538);
    float3 _1569 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4043, float2(0.0), isnan(_4043)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4043, float2(0.0), isnan(_4043)), level(0.0)).xyz;
    float _1571 = _1569.x;
    float _1573 = _1569.y;
    float _1575 = _1569.z;
    float _1577 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1579 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _1581 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1579);
    float _1583 = exp2(_1577);
    out.m_65.x = _1234;
    out.m_65.y = _1230;
    out.m_65.z = _1238;
    float _1585 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1581);
    float _1587 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1585);
    float _1589 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1591 = _1587 + _1498;
    out.gl_Position.x = _1536;
    out.gl_Position.y = _1524;
    out.gl_Position.z = _1587;
    out.gl_Position.w = _1498;
    float _1593 = _1591 * 0.5;
    float _1595 = -_1583;
    float _1597 = _1595 + 1.0;
    out.m_67.w = _1589;
    float _1599 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1593;
    out.m_69.w = _1498;
    float _1601 = _1599 * _1550;
    float _1603 = -_1599;
    float _1605 = _1603 + 1.0;
    float _1607 = _1561 * _1601;
    float _1609 = _1561 * _1605;
    float _1611 = _1575 * _1601;
    float _1613 = fma(_1571, _1607, _1555);
    float _1615 = fma(_1573, _1607, _1557);
    float _1617 = fma(_1561, _1611, _1559);
    out.m_71.x = _1613;
    out.m_71.y = _1615;
    out.m_71.z = _1617;
    out.m_71.w = _1609;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1178 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    float _98 = as_type<float>(_90);
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _96;
    float _102 = _100;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_94)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1676 = as_type<float>(_108);
        out.gl_Position.z = _1676;
    }
    if (!_94)
    {
        return out;
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_90);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    if (_138)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _98;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1745 = as_type<float>(_144);
        out.gl_Position.z = _1745;
    }
    if (_138)
    {
        return out;
    }
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _148 = in.m_51.y;
    float _150 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _152 = in.m_53.x;
    float _154 = in.m_53.y;
    float _156 = in.m_53.z;
    float _158 = in.m_51.z;
    int _160 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _162 = _160 != 0;
    float _164 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _166 = log2(_164);
    float _168 = in.m_44.x;
    float _170 = in.m_44.y;
    float _172 = in.m_44.z;
    int _174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _176 = _174 != 0;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _180 = _178 != 0;
    float _182 = _150 * _146;
    float _184 = in.m_51.x;
    int _186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _188 = _186 != 0;
    int _190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _192 = _190 != 0;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _196 = _194 != 0;
    float _198 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _200 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _198);
    float _202 = _148 * 2.0;
    float _204 = _166 * _126;
    float _206 = _152 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _208 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _210 = floor(_202);
    float _212 = _154 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _214 = _156 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _216 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _208);
    float _218 = _170 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _220 = _158 * 2.0;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _226 = _170 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _230 = _222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _232 = floor(_220);
    bool _234 = _210 >= 0.0;
    bool _236 = isnan(_210);
    bool _238 = _234 || _236;
    bool _240 = isnan(0.0);
    bool _242 = _238 || _240;
    float _244 = _224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _246 = _228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _248 = _170 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _250 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    int _252 = _242 ? 0 : 1;
    float _254 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].x, _218);
    bool _256 = _210 > 0.0;
    float _258 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].x, _226);
    float _260 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].x, _248);
    out.m_55.x = _230;
    out.m_55.y = _244;
    out.m_55.z = _246;
    float _262 = _184 + _148;
    float _264 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _250);
    float _266 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _216);
    float _268 = _262 + (-1.0);
    float _270 = exp2(_204);
    int _272 = ~_252;
    int _274 = _272 + 1;
    int _276 = _274 + 1;
    float _278 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].z, _260);
    float _280 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _200);
    int _282 = _276;
    if (!_256)
    {
        int _284 = ~_252;
        int _286 = _284 + 1;
        _282 = _286;
    }
    int _288 = _282;
    float _290 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].z, _258);
    float _292 = _184 * 2.0;
    float _294 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].z, _254);
    float _296 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _264);
    float _298 = _184 + _158;
    bool _300 = !_176;
    int _302 = _300 ? 0 : 1;
    float _304 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _306 = _232 > 0.0;
    float _308 = _298 + (-1.0);
    float _310 = floor(_292);
    bool _312 = _232 >= 0.0;
    bool _314 = isnan(_232);
    bool _316 = _312 || _314;
    bool _318 = isnan(0.0);
    bool _320 = _316 || _318;
    float _322 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[20].x, _182);
    float _324 = _278 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _326 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _328 = _320 ? 0 : 1;
    float _330 = -_270;
    float _332 = _330 + 1.0;
    float _334 = _290 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _336 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _338 = _324 + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _342 = 1.0 + _340;
    int _344 = ~_328;
    int _346 = _344 + 1;
    int _348 = _346 + 1;
    float _350 = _294 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _352 = _348;
    float _354 = _324;
    if (!_306)
    {
        int _356 = ~_328;
        int _358 = _356 + 1;
        _352 = _358;
    }
    int _360 = _352;
    float _362 = 1.0 / _342;
    bool _364 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _366 = isnan(0.0);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _372 = _368 || _370;
    float _374 = _338 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _376 = _148 + _158;
    bool _378 = !_196;
    float _380 = _378 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _382 = _372 ? _332 : 0.0;
    float _384 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _386 = _334 + _384;
    float _388 = floor(_322);
    bool _390 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _392 = isnan(1.0);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _398 = _394 || _396;
    float _400 = _376 + (-1.0);
    bool _402 = _310 > 0.0;
    float _404 = fma(_386, (*spvDescriptorSet0.vp_c8)._m0[28].x, _374);
    bool _406 = _310 >= 0.0;
    bool _408 = isnan(_310);
    bool _410 = _406 || _408;
    bool _412 = isnan(0.0);
    bool _414 = _410 || _412;
    float _416 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _418 = _350 + _416;
    float _420 = float(_288);
    float _422 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[28].z, _404);
    float _424 = float(_360);
    float _426 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _428 = _338 * _338;
    float _430 = _380;
    if (_398)
    {
        float _432 = _382 * _362;
        _128 = _432;
    }
    float _434 = _128;
    bool _436 = _422 >= 0.0;
    float _438 = -_388;
    float _440 = _322 + _438;
    bool _442 = !_188;
    int _444 = _442 ? 0 : 1;
    float _446 = fma(_386, _386, _428);
    int _448 = abs(as_type<int>(_380));
    int _450 = abs(_444);
    float _452 = fma(_418, _418, _446);
    float _454 = float(_448);
    float _456 = float(_450);
    int _458 = abs(_302);
    float _460 = _454 * _420;
    float _462 = _322 * 6.283185482025146484375;
    float _464 = _456 * _424;
    float _466 = in.m_57.x;
    float _468 = in.m_57.y;
    float _470 = in.m_57.z;
    int _472 = _414 ? 0 : 1;
    float _474 = rsqrt(_452);
    float _476 = float(_458);
    float _478 = -_440;
    float _480 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _482 = ~_472;
    int _484 = _482 + 1;
    int _486 = _484 + 1;
    int _488 = _486;
    int _490 = _450;
    if (_436)
    {
        out.m_47.x = 0.0;
    }
    if (_436)
    {
        _430 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _492 = _430;
    float _494 = abs(_480);
    float _496 = _476 * _494;
    if (!_402)
    {
        int _498 = ~_472;
        int _500 = _498 + 1;
        _488 = _500;
    }
    int _502 = _488;
    float _504 = rsqrt(_280);
    if (_436)
    {
        float _506 = _492 * 5.0;
        _490 = as_type<int>(_506);
    }
    int _508 = _490;
    float _510 = _462 * 0.15915493667125701904296875;
    bool _512 = !_180;
    int _514 = _512 ? 0 : 1;
    bool _516 = !_192;
    int _518 = _516 ? 0 : 1;
    if (_436)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2336 = as_type<float>(_508);
        out.gl_Position.z = _2336;
    }
    float _520 = sqrt(_280);
    float _522 = _338 * _474;
    float _524 = _386 * _474;
    if (_436)
    {
        return out;
    }
    float _526 = -_522;
    float _528 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[18].w, _324);
    float _530 = _184 + (-0.5);
    float _532 = -_524;
    float _534 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[18].w, _334);
    float _536 = _418 * _474;
    float _538 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _540 = _528 + _538;
    float _542 = _464 * (-2.0);
    float _544 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _546 = _534 + _544;
    float _548 = _510 * 6.283185482025146484375;
    float _550 = cos(_548);
    float _552 = _540 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _554 = -_536;
    float _556 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[18].w, _350);
    float _558 = fma(_542, _466, _466);
    float _560 = fma(_304, _542, _304);
    float _562 = fma(_546, (*spvDescriptorSet0.vp_c8)._m0[28].x, _552);
    float _564 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _566 = _556 + _564;
    float _568 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[196].x, _558);
    float _570 = _460 * (-2.0);
    int _572 = abs(_518);
    float _574 = fma(_566, (*spvDescriptorSet0.vp_c8)._m0[28].z, _562);
    float _576 = fma(_560, _434, _568);
    float _578 = fma(_570, _470, _470);
    float _580 = _158 + (-0.5);
    float _582 = fma(_326, _570, _326);
    bool _584 = _574 >= 0.0;
    float _586 = rsqrt(_266);
    float _588 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[196].z, _578);
    float _590 = _576 * 0.15915493667125701904296875;
    float _592 = float(_502);
    float _594 = fma(_582, _434, _588);
    float _596 = float(_572);
    float _598 = rsqrt(_296);
    bool _600 = _440 < 0.5;
    float _602 = float(_600);
    float _604 = _594 * 0.15915493667125701904296875;
    float _606 = _596 * _592;
    float _608 = fma(_550, 0.5, 0.5);
    float _610 = _592;
    if (_584)
    {
        _610 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _612 = _610;
    float _614 = -_602;
    float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _618 = _606 * (-2.0);
    float _620 = _590 * 6.283185482025146484375;
    float _622 = sin(_620);
    float _624 = -_608;
    float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _628 = as_type<int>(_612);
    if (_584)
    {
        float _630 = _612 * 5.0;
        _628 = as_type<int>(_630);
    }
    int _632 = _628;
    float _634 = fma(_618, _468, _468);
    bool _636 = !_162;
    int _638 = _636 ? 0 : 1;
    if (_584)
    {
        out.m_47.x = 0.0;
    }
    float _640 = fma(_426, _618, _426);
    float _642 = _590 * 6.283185482025146484375;
    float _644 = cos(_642);
    float _646 = _148 + (-0.5);
    if (_584)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2544 = as_type<float>(_632);
        out.gl_Position.z = _2544;
    }
    int _648 = abs(_638);
    float _650 = _604 * 6.283185482025146484375;
    float _652 = sin(_650);
    if (_584)
    {
        return out;
    }
    float _654 = -_324;
    float _656 = _654 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _658 = -_334;
    float _660 = _658 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _662 = float(_648);
    float _664 = -_350;
    float _666 = _664 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _668 = _656 * _656;
    int _670 = abs(_514);
    float _672 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[196].y, _634);
    float _674 = fma(_662, _626, _496);
    float _676 = fma(_660, _660, _668);
    float _678 = fma(_640, _434, _672);
    float _680 = _212 * _586;
    float _682 = fma(_666, _666, _676);
    float _684 = -_522;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[18].w, _338);
    float _688 = float(_670);
    float _690 = -_524;
    float _692 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[18].w, _386);
    float _694 = rsqrt(_682);
    float _696 = _686 * _686;
    float _698 = _214 * _598;
    float _700 = abs(_616);
    float _702 = fma(_688, _700, _674);
    float _704 = -_536;
    float _706 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _418);
    float _708 = fma(_692, _692, _696);
    float _710 = _206 * _504;
    float _712 = _702 * _520;
    float _714 = _604 * 6.283185482025146484375;
    float _716 = cos(_714);
    float _718 = fma(_706, _706, _708);
    float _720 = _678 * 0.15915493667125701904296875;
    float _722 = _680 * _712;
    float _724 = _710 * _712;
    float _726 = _622 * _652;
    float _728 = _660 * _694;
    float _730 = _698 * _712;
    float _732 = _666 * _694;
    float _734 = _656 * _694;
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _738 = _728 * _736;
    float _740 = in.m_59.x;
    float _742 = in.m_59.y;
    float _744 = in.m_59.z;
    float _746 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _748 = _732 * _746;
    float _750 = _720 * 6.283185482025146484375;
    float _752 = sin(_750);
    float _754 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _756 = -_738;
    float _758 = fma(_732, _754, _756);
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _762 = _734 * _760;
    float _764 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _766 = -_748;
    float _768 = fma(_734, _764, _766);
    float _770 = _644 * _716;
    float _772 = _758 * _758;
    float _774 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _776 = -_762;
    float _778 = fma(_728, _774, _776);
    float _780 = _622 * _716;
    float _782 = sqrt(_718);
    float _784 = fma(_768, _768, _772);
    float _786 = fma(_778, _778, _784);
    float _788 = _720 * 6.283185482025146484375;
    float _790 = cos(_788);
    float _792 = fma(_752, _726, _770);
    float _794 = fma(_752, _770, _726);
    float _796 = _722 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _798 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _800 = _644 * _652;
    bool _802 = _742 != 0.0;
    bool _804 = isnan(_742);
    bool _806 = _802 || _804;
    bool _808 = isnan(0.0);
    bool _810 = _806 || _808;
    float _812 = rsqrt(_786);
    float _814 = _474 * _782;
    float _816 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _818 = _740 == 0.0;
    bool _820 = !_810;
    bool _822 = _818 && _820;
    float _824 = _814 * _796;
    float _826 = _814 * _816;
    float _828 = _814 * _798;
    float _830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _742);
    float _832 = _652 * _790;
    float _834 = _716 * _790;
    float _836 = _622 * _790;
    float _838 = _644 * _790;
    float _840 = _824 * _830;
    float _842 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _740);
    float _844 = -_800;
    float _846 = fma(_752, _780, _844);
    float _848 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _744);
    float _850 = -_780;
    float _852 = fma(_752, _800, _850);
    float _854 = _828 * _842;
    float _856 = _792 * _840;
    float _858 = _768 * _812;
    float _860 = _758 * _812;
    float _862 = _826 * _848;
    float _864 = _778 * _812;
    float _866 = fma(_832, _854, _856);
    float _868 = _846 * _840;
    float _870 = _732 * _860;
    float _872 = _734 * _858;
    float _874 = _836 * _840;
    float _876 = fma(_834, _854, _868);
    float _878 = fma(_852, _862, _866);
    float _880 = -_870;
    float _882 = fma(_734, _864, _880);
    float _884 = -_872;
    float _886 = fma(_728, _860, _884);
    float _888 = -_752;
    float _890 = fma(_888, _854, _874);
    float _892 = fma(_794, _862, _876);
    float _894 = _882 * _878;
    float _896 = _886 * _878;
    float _898 = fma(_838, _862, _890);
    bool _900 = _744 == 0.0;
    bool _902 = _900 && _822;
    float _904 = in.m_61.x;
    float _906 = in.m_61.y;
    float _908 = in.m_61.z;
    float _910 = fma(_858, _892, _894);
    float _912 = fma(_864, _892, _896);
    float _914 = _728 * _864;
    float _916 = _792 * _886;
    float _918 = fma(_728, _898, _910);
    float _920 = fma(_732, _898, _912);
    float _922 = -_914;
    float _924 = fma(_732, _858, _922);
    float _926 = _852 * _882;
    float _928 = _334 + _918;
    float _930 = _350 + _920;
    float _932 = _792 * _924;
    float _934 = _924 * _878;
    float _936 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _938 = _928 + _936;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _942 = _930 + _940;
    float _944 = _832 * _924;
    float _946 = _852 * _886;
    float _948 = _938 * _938;
    float _950 = _942 * _942;
    float _952 = _852 * _924;
    float _954 = fma(_846, _860, _932);
    float _956 = _948 + _950;
    float _958 = _904;
    float _960 = _906;
    float _962 = _908;
    float _964 = _948;
    float _966 = _950;
    float _968 = _928;
    float _970 = _930;
    if (!_902)
    {
        float _972 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[17].y, _904);
        _958 = _972;
    }
    float _974 = _958;
    if (!_902)
    {
        float _976 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[17].y, _906);
        _960 = _976;
    }
    float _978 = _960;
    float _980 = sqrt(_956);
    float _982 = _792 * _882;
    if (!_902)
    {
        float _984 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[17].y, _908);
        _962 = _984;
    }
    float _986 = _962;
    float _988 = _832 * _882;
    float _990 = fma(_846, _864, _916);
    float _992 = fma(_846, _858, _982);
    float _994 = fma(_860, _892, _934);
    float _996 = _832 * _886;
    float _998 = fma(_834, _858, _988);
    float _1000 = fma(_834, _860, _944);
    float _1002 = fma(_734, _898, _994);
    float _1004 = fma(_836, _728, _992);
    float _1006 = fma(_834, _864, _996);
    float _1008 = fma(_794, _858, _926);
    float _1010 = _324 + _1002;
    float _1012 = fma(_794, _860, _952);
    bool _1014 = _980 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1016 = fma(_836, _734, _954);
    float _1018 = fma(_794, _864, _946);
    float _1020 = fma(_836, _732, _990);
    if (!_1014)
    {
        _354 = _1010;
    }
    float _1022 = _354;
    bool _1024 = !_1014;
    float _1026 = _1022;
    if (!_1024)
    {
        float _1028 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1032 = _980 + _1030;
        float _1034 = _1010 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1036 = rsqrt(_956);
        float _1038 = _1032 * _1028;
        float _1040 = _1038 * 0.15915493667125701904296875;
        float _1042 = _1040 * 6.283185482025146484375;
        float _1044 = sin(_1042);
        float _1046 = _1040 * 6.283185482025146484375;
        float _1048 = cos(_1046);
        float _1050 = fma(_1044, _1034, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1052 = _1036 * _1050;
        float _1054 = fma(_938, _1052, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1056 = _1048 + (-1.0);
        float _1058 = fma(_942, _1052, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1060 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1062 = _1054 + _1060;
        float _1064 = _1056 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1066 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1068 = _1058 + _1066;
        float _1070 = _1062 * _1062;
        float _1072 = fma(_1010, _1048, _1064);
        float _1074 = _1068 * _1068;
        _1026 = _1072;
        _964 = _1070;
        _966 = _1074;
        _968 = _1054;
        _970 = _1058;
    }
    float _1076 = _1026;
    float _1078 = _964;
    float _1080 = _966;
    float _1082 = _968;
    float _1084 = _970;
    float _1086 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1088 = _1076 + _1086;
    float _1090 = -_752;
    float _1092 = fma(_1090, _728, _998);
    float _1094 = -_752;
    float _1096 = fma(_1094, _734, _1000);
    float _1098 = -_752;
    float _1100 = fma(_1098, _732, _1006);
    float _1102 = fma(_1088, _1088, _1078);
    float _1104 = _1004 * _978;
    float _1106 = _1016 * _978;
    float _1108 = _1020 * _978;
    float _1110 = _1102 + _1080;
    float _1112 = fma(_838, _728, _1008);
    float _1114 = fma(_838, _734, _1012);
    float _1116 = fma(_838, _732, _1018);
    float _1118 = fma(_1092, _974, _1104);
    float _1120 = fma(_1096, _974, _1106);
    float _1122 = sqrt(_1110);
    float _1124 = fma(_1100, _974, _1108);
    float _1126 = fma(_1112, _986, _1118);
    float _1128 = fma(_1114, _986, _1120);
    float _1130 = fma(_1116, _986, _1124);
    out.m_63.x = _1126;
    out.m_63.y = _1128;
    out.m_63.z = _1130;
    bool _1132 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1134 = isnan(_1122);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1140 = _1136 || _1138;
    float _1142 = _1088;
    if (!_1140)
    {
        _1142 = 1.0;
    }
    float _1144 = _1142;
    bool _1146 = !_1140;
    float _1148 = _1144;
    if (!_1146)
    {
        bool _1150 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1152 = isnan(_1122);
        bool _1154 = _1150 || _1152;
        bool _1156 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1158 = _1154 || _1156;
        if (!_1158)
        {
            float _1160 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1162 = _1122 + _1160;
            float _1164 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1166 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1164;
            float _1168 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1170 = _1168 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1172 = 1.0 / _1166;
            float _1174 = _1162 * _1172;
            float _1176 = fma(_1174, _1170, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1148 = _1176;
            _1178 = true;
        }
        else
        {
            bool _1180 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1182 = isnan(_1122);
            bool _1184 = _1180 || _1182;
            bool _1186 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1188 = _1184 || _1186;
            if (!_1188)
            {
                float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1192 = _1122 + _1190;
                float _1194 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1196 = _1194 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1198 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1200 = _1198 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1202 = 1.0 / _1196;
                float _1204 = _1192 * _1202;
                float _1206 = fma(_1204, _1200, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1148 = _1206;
                _1178 = true;
            }
            else
            {
                _1148 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1178 = false;
    float _1208 = _1148;
    float _1210 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1212 = _1076 + _1210;
    float _1214 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1216 = _1082 + _1214;
    float _1218 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1220 = _1084 + _1218;
    float _1222 = fma(_1212, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1224 = fma(_1216, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1226 = fma(_1220, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1228 = -_522;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1222);
    float _1232 = -_524;
    float _1234 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1224);
    float _1236 = -_536;
    float _1238 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1226);
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1242 = _1230 + _1240;
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1246 = _1234 + _1244;
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1250 = _1238 + _1248;
    float _1252 = _1242 * _1242;
    float _1254 = fma(_1246, _1246, _1252);
    float _1256 = fma(_1250, _1250, _1254);
    float _1258 = rsqrt(_1256);
    float _1260 = sqrt(_1256);
    float _1262 = _1258 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1264 = _1246 * _1262;
    float _1266 = _1250 * _1262;
    float _1268 = _1264 * _1264;
    float _1270 = _1266 * _1266;
    float _1272 = _1268 + _1270;
    float _1274 = sqrt(_1272);
    bool _1276 = _1274 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1280 = _1274 + _1278;
    float _1282 = _1258;
    float _1284 = _1272;
    float _1286 = _1280;
    float _1288 = _1212;
    float _1290 = _1242;
    float _1292 = _1262;
    float _1294 = _1264;
    if (_1276)
    {
        float _1296 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1282 = _1296;
    }
    float _1298 = _1282;
    if (_1276)
    {
        float _1300 = rsqrt(_1272);
        _1284 = _1300;
    }
    float _1302 = _1284;
    if (_1276)
    {
        float _1304 = _1280 * _1298;
        _1286 = _1304;
    }
    float _1306 = _1286;
    if (_1276)
    {
        float _1308 = _1306 * 0.15915493667125701904296875;
        _1288 = _1308;
    }
    float _1310 = _1288;
    float _1312 = _1298;
    float _1314 = _1310;
    if (_1276)
    {
        float _1316 = _1310 * 6.283185482025146484375;
        float _1318 = sin(_1316);
        _1312 = _1318;
    }
    float _1320 = _1312;
    float _1322 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1324 = precise::max(0.0, _1322);
    float _1326 = _1250;
    float _1328 = _1324;
    if (_1276)
    {
        float _1330 = _1310 * 6.283185482025146484375;
        float _1332 = cos(_1330);
        _1326 = _1332;
    }
    float _1334 = _1326;
    float _1336 = -_1262;
    float _1338 = -_1324;
    float _1340 = fma(_1242, _1336, _1338);
    if (!_1276)
    {
        _1290 = _1266;
    }
    float _1342 = _1290;
    float _1344 = _1342;
    if (_1276)
    {
        float _1346 = _1340 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1328 = _1346;
    }
    float _1348 = _1328;
    float _1350 = _1320;
    float _1352 = _1348;
    if (_1276)
    {
        float _1354 = fma(_1320, _1348, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1350 = _1354;
    }
    float _1356 = _1350;
    float _1358 = _1356;
    float _1360 = _1334;
    if (_1276)
    {
        float _1362 = _1334 + (-1.0);
        _1352 = _1362;
    }
    float _1364 = _1352;
    float _1366 = _1364;
    if (_1276)
    {
        float _1368 = _1302 * _1356;
        _1292 = _1368;
    }
    float _1370 = _1292;
    if (!_1276)
    {
        _1358 = _1340;
    }
    float _1372 = _1358;
    float _1374 = _1372;
    if (_1276)
    {
        float _1376 = _1364 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1314 = _1376;
    }
    float _1378 = _1314;
    if (_1276)
    {
        float _1380 = _1264 * _1370;
        _1294 = _1380;
    }
    float _1382 = _1294;
    if (!_1276)
    {
        _1366 = _1268;
    }
    float _1384 = _1366;
    float _1386 = _1384;
    if (_1276)
    {
        float _1388 = _1266 * _1370;
        _1344 = _1388;
    }
    float _1390 = _1344;
    if (_1276)
    {
        float _1392 = fma(_1340, _1334, _1378);
        _1374 = _1392;
    }
    float _1394 = _1374;
    if (_1276)
    {
        float _1396 = _1382 * _1382;
        _1386 = _1396;
    }
    float _1398 = _1386;
    if (!_1276)
    {
        _1360 = _1270;
    }
    float _1400 = _1360;
    float _1402 = _1400;
    if (_1276)
    {
        float _1404 = _1390 * _1390;
        _1402 = _1404;
    }
    float _1406 = _1402;
    float _1408 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1410 = fma(_1394, _1394, _1398);
    float _1412 = _1410 + _1406;
    float _1414 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1418 = fma(_1260, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1416);
    float _1420 = precise::clamp(_1418, 0.0, 1.0);
    float _1422 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1424 = rsqrt(_1412);
    float _1426 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1414);
    float _1428 = -_1420;
    float _1430 = _1428 + 1.0;
    float _1432 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1422);
    float _1434 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1408);
    float _1436 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1426);
    float _1438 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1440 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1442 = abs(_1430);
    float _1444 = log2(_1442);
    float _1446 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1448 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1438);
    float _1450 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1432);
    float _1452 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1434);
    float _1454 = _1446 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1456 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1448);
    float _1458 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1460 = _1424 * _1382;
    float _1462 = -_1454;
    float _1464 = fma(_1462, _1440, 1.0);
    float _1466 = _1456 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1468 = _1452 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1470 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1472 = _1424 * _1394;
    float _1474 = _1460 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1476 = _1424 * _1390;
    float _1478 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1470);
    float _1480 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1482 = -_1474;
    float _1484 = fma(_1472, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1482);
    float _1486 = log2(_1464);
    float _1488 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1478);
    float _1490 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1492 = -_1476;
    float _1494 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1484);
    float _1496 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1498 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1488);
    float _1500 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1490);
    float _1502 = fma(_1494, -0.5, 0.5);
    float _1504 = exp2(_1480);
    float _1506 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1496);
    float _1508 = fma(_1494, 0.5, 0.5);
    float _1510 = _1472 + 1.0;
    float _1512 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1500);
    float _1514 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1506);
    float _1516 = fma(_1508, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1518 = 1.0 / _1498;
    float _1520 = _1486 * 0.693147182464599609375;
    float _1522 = fma(_1508, _1516, -0.212114393711090087890625);
    float _1524 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1512);
    float _1526 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1528 = fma(_1508, _1522, 1.570728778839111328125);
    float _1530 = sqrt(_1502);
    float _1532 = -_1472;
    float _1534 = fma(_1504, _1510, _1532);
    float _1536 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1514);
    float _1538 = fma(_1534, 0.5, 0.5);
    float _1540 = _1536 * _1518;
    float _1542 = _1524 * _1518;
    float _1544 = fma(_1540, 0.5, 0.5);
    float _1546 = fma(_1542, -0.5, 0.5);
    float _1548 = _1530 * 0.636619746685028076171875;
    float3 _4010 = float3(_1544, _1546, _1526);
    float _1550 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4010, float3(0.0), isnan(_4010)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4010, float3(0.0), isnan(_4010)), level(0.0)).x;
    float3 _4021 = float3(_1544, _1546, _1526);
    float4 _1553 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4021, float3(0.0), isnan(_4021)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4021, float3(0.0), isnan(_4021)), level(0.0)).xyzw;
    float _1555 = _1553.x;
    float _1557 = _1553.y;
    float _1559 = _1553.z;
    float _1561 = _1553.w;
    float _1563 = -_1528;
    float _1565 = fma(_1548, _1563, 1.0);
    float2 _4043 = float2(_1565, _1538);
    float3 _1569 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4043, float2(0.0), isnan(_4043)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4043, float2(0.0), isnan(_4043)), level(0.0)).xyz;
    float _1571 = _1569.x;
    float _1573 = _1569.y;
    float _1575 = _1569.z;
    float _1577 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1579 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _1581 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1579);
    float _1583 = exp2(_1577);
    out.m_65.x = _1234;
    out.m_65.y = _1230;
    out.m_65.z = _1238;
    float _1585 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1581);
    float _1587 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1585);
    float _1589 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1591 = _1587 + _1498;
    out.gl_Position.x = _1536;
    out.gl_Position.y = _1524;
    out.gl_Position.z = _1587;
    out.gl_Position.w = _1498;
    float _1593 = _1591 * 0.5;
    float _1595 = -_1583;
    float _1597 = _1595 + 1.0;
    out.m_67.w = _1589;
    float _1599 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1593;
    out.m_69.w = _1498;
    float _1601 = _1599 * _1550;
    float _1603 = -_1599;
    float _1605 = _1603 + 1.0;
    float _1607 = _1561 * _1601;
    float _1609 = _1561 * _1605;
    float _1611 = _1575 * _1601;
    float _1613 = fma(_1571, _1607, _1555);
    float _1615 = fma(_1573, _1607, _1557);
    float _1617 = fma(_1561, _1611, _1559);
    out.m_71.x = _1613;
    out.m_71.y = _1615;
    out.m_71.z = _1617;
    out.m_71.w = _1609;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1178 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    float _98 = as_type<float>(_90);
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _96;
    float _102 = _100;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_94)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1676 = as_type<float>(_108);
        out.gl_Position.z = _1676;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_90);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    if (_138)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _98;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1745 = as_type<float>(_144);
        out.gl_Position.z = _1745;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _148 = in.m_51.y;
    float _150 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _152 = in.m_53.x;
    float _154 = in.m_53.y;
    float _156 = in.m_53.z;
    float _158 = in.m_51.z;
    int _160 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _162 = _160 != 0;
    float _164 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _166 = log2(_164);
    float _168 = in.m_44.x;
    float _170 = in.m_44.y;
    float _172 = in.m_44.z;
    int _174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _176 = _174 != 0;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _180 = _178 != 0;
    float _182 = _150 * _146;
    float _184 = in.m_51.x;
    int _186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _188 = _186 != 0;
    int _190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _192 = _190 != 0;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _196 = _194 != 0;
    float _198 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _200 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _198);
    float _202 = _148 * 2.0;
    float _204 = _166 * _126;
    float _206 = _152 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _208 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _210 = floor(_202);
    float _212 = _154 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _214 = _156 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _216 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _208);
    float _218 = _170 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _220 = _158 * 2.0;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _226 = _170 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _230 = _222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _232 = floor(_220);
    bool _234 = _210 >= 0.0;
    bool _236 = isnan(_210);
    bool _238 = _234 || _236;
    bool _240 = isnan(0.0);
    bool _242 = _238 || _240;
    float _244 = _224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _246 = _228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _248 = _170 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _250 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    int _252 = _242 ? 0 : 1;
    float _254 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].x, _218);
    bool _256 = _210 > 0.0;
    float _258 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].x, _226);
    float _260 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].x, _248);
    out.m_55.x = _230;
    out.m_55.y = _244;
    out.m_55.z = _246;
    float _262 = _184 + _148;
    float _264 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _250);
    float _266 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _216);
    float _268 = _262 + (-1.0);
    float _270 = exp2(_204);
    int _272 = ~_252;
    int _274 = _272 + 1;
    int _276 = _274 + 1;
    float _278 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].z, _260);
    float _280 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _200);
    int _282 = _276;
    if (!_256)
    {
        int _284 = ~_252;
        int _286 = _284 + 1;
        _282 = _286;
    }
    int _288 = _282;
    float _290 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].z, _258);
    float _292 = _184 * 2.0;
    float _294 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].z, _254);
    float _296 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _264);
    float _298 = _184 + _158;
    bool _300 = !_176;
    int _302 = _300 ? 0 : 1;
    float _304 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _306 = _232 > 0.0;
    float _308 = _298 + (-1.0);
    float _310 = floor(_292);
    bool _312 = _232 >= 0.0;
    bool _314 = isnan(_232);
    bool _316 = _312 || _314;
    bool _318 = isnan(0.0);
    bool _320 = _316 || _318;
    float _322 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[20].x, _182);
    float _324 = _278 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _326 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _328 = _320 ? 0 : 1;
    float _330 = -_270;
    float _332 = _330 + 1.0;
    float _334 = _290 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _336 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _338 = _324 + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _342 = 1.0 + _340;
    int _344 = ~_328;
    int _346 = _344 + 1;
    int _348 = _346 + 1;
    float _350 = _294 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _352 = _348;
    float _354 = _324;
    if (!_306)
    {
        int _356 = ~_328;
        int _358 = _356 + 1;
        _352 = _358;
    }
    int _360 = _352;
    float _362 = 1.0 / _342;
    bool _364 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _366 = isnan(0.0);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _372 = _368 || _370;
    float _374 = _338 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _376 = _148 + _158;
    bool _378 = !_196;
    float _380 = _378 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _382 = _372 ? _332 : 0.0;
    float _384 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _386 = _334 + _384;
    float _388 = floor(_322);
    bool _390 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _392 = isnan(1.0);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _398 = _394 || _396;
    float _400 = _376 + (-1.0);
    bool _402 = _310 > 0.0;
    float _404 = fma(_386, (*spvDescriptorSet0.vp_c8)._m0[28].x, _374);
    bool _406 = _310 >= 0.0;
    bool _408 = isnan(_310);
    bool _410 = _406 || _408;
    bool _412 = isnan(0.0);
    bool _414 = _410 || _412;
    float _416 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _418 = _350 + _416;
    float _420 = float(_288);
    float _422 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[28].z, _404);
    float _424 = float(_360);
    float _426 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _428 = _338 * _338;
    float _430 = _380;
    if (_398)
    {
        float _432 = _382 * _362;
        _128 = _432;
    }
    float _434 = _128;
    bool _436 = _422 >= 0.0;
    float _438 = -_388;
    float _440 = _322 + _438;
    bool _442 = !_188;
    int _444 = _442 ? 0 : 1;
    float _446 = fma(_386, _386, _428);
    int _448 = abs(as_type<int>(_380));
    int _450 = abs(_444);
    float _452 = fma(_418, _418, _446);
    float _454 = float(_448);
    float _456 = float(_450);
    int _458 = abs(_302);
    float _460 = _454 * _420;
    float _462 = _322 * 6.283185482025146484375;
    float _464 = _456 * _424;
    float _466 = in.m_57.x;
    float _468 = in.m_57.y;
    float _470 = in.m_57.z;
    int _472 = _414 ? 0 : 1;
    float _474 = rsqrt(_452);
    float _476 = float(_458);
    float _478 = -_440;
    float _480 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _482 = ~_472;
    int _484 = _482 + 1;
    int _486 = _484 + 1;
    int _488 = _486;
    int _490 = _450;
    if (_436)
    {
        out.m_47.x = 0.0;
    }
    if (_436)
    {
        _430 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _492 = _430;
    float _494 = abs(_480);
    float _496 = _476 * _494;
    if (!_402)
    {
        int _498 = ~_472;
        int _500 = _498 + 1;
        _488 = _500;
    }
    int _502 = _488;
    float _504 = rsqrt(_280);
    if (_436)
    {
        float _506 = _492 * 5.0;
        _490 = as_type<int>(_506);
    }
    int _508 = _490;
    float _510 = _462 * 0.15915493667125701904296875;
    bool _512 = !_180;
    int _514 = _512 ? 0 : 1;
    bool _516 = !_192;
    int _518 = _516 ? 0 : 1;
    if (_436)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2336 = as_type<float>(_508);
        out.gl_Position.z = _2336;
    }
    float _520 = sqrt(_280);
    float _522 = _338 * _474;
    float _524 = _386 * _474;
    if (_436)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _526 = -_522;
    float _528 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[18].w, _324);
    float _530 = _184 + (-0.5);
    float _532 = -_524;
    float _534 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[18].w, _334);
    float _536 = _418 * _474;
    float _538 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _540 = _528 + _538;
    float _542 = _464 * (-2.0);
    float _544 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _546 = _534 + _544;
    float _548 = _510 * 6.283185482025146484375;
    float _550 = cos(_548);
    float _552 = _540 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _554 = -_536;
    float _556 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[18].w, _350);
    float _558 = fma(_542, _466, _466);
    float _560 = fma(_304, _542, _304);
    float _562 = fma(_546, (*spvDescriptorSet0.vp_c8)._m0[28].x, _552);
    float _564 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _566 = _556 + _564;
    float _568 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[196].x, _558);
    float _570 = _460 * (-2.0);
    int _572 = abs(_518);
    float _574 = fma(_566, (*spvDescriptorSet0.vp_c8)._m0[28].z, _562);
    float _576 = fma(_560, _434, _568);
    float _578 = fma(_570, _470, _470);
    float _580 = _158 + (-0.5);
    float _582 = fma(_326, _570, _326);
    bool _584 = _574 >= 0.0;
    float _586 = rsqrt(_266);
    float _588 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[196].z, _578);
    float _590 = _576 * 0.15915493667125701904296875;
    float _592 = float(_502);
    float _594 = fma(_582, _434, _588);
    float _596 = float(_572);
    float _598 = rsqrt(_296);
    bool _600 = _440 < 0.5;
    float _602 = float(_600);
    float _604 = _594 * 0.15915493667125701904296875;
    float _606 = _596 * _592;
    float _608 = fma(_550, 0.5, 0.5);
    float _610 = _592;
    if (_584)
    {
        _610 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _612 = _610;
    float _614 = -_602;
    float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _618 = _606 * (-2.0);
    float _620 = _590 * 6.283185482025146484375;
    float _622 = sin(_620);
    float _624 = -_608;
    float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _628 = as_type<int>(_612);
    if (_584)
    {
        float _630 = _612 * 5.0;
        _628 = as_type<int>(_630);
    }
    int _632 = _628;
    float _634 = fma(_618, _468, _468);
    bool _636 = !_162;
    int _638 = _636 ? 0 : 1;
    if (_584)
    {
        out.m_47.x = 0.0;
    }
    float _640 = fma(_426, _618, _426);
    float _642 = _590 * 6.283185482025146484375;
    float _644 = cos(_642);
    float _646 = _148 + (-0.5);
    if (_584)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2544 = as_type<float>(_632);
        out.gl_Position.z = _2544;
    }
    int _648 = abs(_638);
    float _650 = _604 * 6.283185482025146484375;
    float _652 = sin(_650);
    if (_584)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _654 = -_324;
    float _656 = _654 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _658 = -_334;
    float _660 = _658 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _662 = float(_648);
    float _664 = -_350;
    float _666 = _664 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _668 = _656 * _656;
    int _670 = abs(_514);
    float _672 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[196].y, _634);
    float _674 = fma(_662, _626, _496);
    float _676 = fma(_660, _660, _668);
    float _678 = fma(_640, _434, _672);
    float _680 = _212 * _586;
    float _682 = fma(_666, _666, _676);
    float _684 = -_522;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[18].w, _338);
    float _688 = float(_670);
    float _690 = -_524;
    float _692 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[18].w, _386);
    float _694 = rsqrt(_682);
    float _696 = _686 * _686;
    float _698 = _214 * _598;
    float _700 = abs(_616);
    float _702 = fma(_688, _700, _674);
    float _704 = -_536;
    float _706 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _418);
    float _708 = fma(_692, _692, _696);
    float _710 = _206 * _504;
    float _712 = _702 * _520;
    float _714 = _604 * 6.283185482025146484375;
    float _716 = cos(_714);
    float _718 = fma(_706, _706, _708);
    float _720 = _678 * 0.15915493667125701904296875;
    float _722 = _680 * _712;
    float _724 = _710 * _712;
    float _726 = _622 * _652;
    float _728 = _660 * _694;
    float _730 = _698 * _712;
    float _732 = _666 * _694;
    float _734 = _656 * _694;
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _738 = _728 * _736;
    float _740 = in.m_59.x;
    float _742 = in.m_59.y;
    float _744 = in.m_59.z;
    float _746 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _748 = _732 * _746;
    float _750 = _720 * 6.283185482025146484375;
    float _752 = sin(_750);
    float _754 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _756 = -_738;
    float _758 = fma(_732, _754, _756);
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _762 = _734 * _760;
    float _764 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _766 = -_748;
    float _768 = fma(_734, _764, _766);
    float _770 = _644 * _716;
    float _772 = _758 * _758;
    float _774 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _776 = -_762;
    float _778 = fma(_728, _774, _776);
    float _780 = _622 * _716;
    float _782 = sqrt(_718);
    float _784 = fma(_768, _768, _772);
    float _786 = fma(_778, _778, _784);
    float _788 = _720 * 6.283185482025146484375;
    float _790 = cos(_788);
    float _792 = fma(_752, _726, _770);
    float _794 = fma(_752, _770, _726);
    float _796 = _722 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _798 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _800 = _644 * _652;
    bool _802 = _742 != 0.0;
    bool _804 = isnan(_742);
    bool _806 = _802 || _804;
    bool _808 = isnan(0.0);
    bool _810 = _806 || _808;
    float _812 = rsqrt(_786);
    float _814 = _474 * _782;
    float _816 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _818 = _740 == 0.0;
    bool _820 = !_810;
    bool _822 = _818 && _820;
    float _824 = _814 * _796;
    float _826 = _814 * _816;
    float _828 = _814 * _798;
    float _830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _742);
    float _832 = _652 * _790;
    float _834 = _716 * _790;
    float _836 = _622 * _790;
    float _838 = _644 * _790;
    float _840 = _824 * _830;
    float _842 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _740);
    float _844 = -_800;
    float _846 = fma(_752, _780, _844);
    float _848 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _744);
    float _850 = -_780;
    float _852 = fma(_752, _800, _850);
    float _854 = _828 * _842;
    float _856 = _792 * _840;
    float _858 = _768 * _812;
    float _860 = _758 * _812;
    float _862 = _826 * _848;
    float _864 = _778 * _812;
    float _866 = fma(_832, _854, _856);
    float _868 = _846 * _840;
    float _870 = _732 * _860;
    float _872 = _734 * _858;
    float _874 = _836 * _840;
    float _876 = fma(_834, _854, _868);
    float _878 = fma(_852, _862, _866);
    float _880 = -_870;
    float _882 = fma(_734, _864, _880);
    float _884 = -_872;
    float _886 = fma(_728, _860, _884);
    float _888 = -_752;
    float _890 = fma(_888, _854, _874);
    float _892 = fma(_794, _862, _876);
    float _894 = _882 * _878;
    float _896 = _886 * _878;
    float _898 = fma(_838, _862, _890);
    bool _900 = _744 == 0.0;
    bool _902 = _900 && _822;
    float _904 = in.m_61.x;
    float _906 = in.m_61.y;
    float _908 = in.m_61.z;
    float _910 = fma(_858, _892, _894);
    float _912 = fma(_864, _892, _896);
    float _914 = _728 * _864;
    float _916 = _792 * _886;
    float _918 = fma(_728, _898, _910);
    float _920 = fma(_732, _898, _912);
    float _922 = -_914;
    float _924 = fma(_732, _858, _922);
    float _926 = _852 * _882;
    float _928 = _334 + _918;
    float _930 = _350 + _920;
    float _932 = _792 * _924;
    float _934 = _924 * _878;
    float _936 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _938 = _928 + _936;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _942 = _930 + _940;
    float _944 = _832 * _924;
    float _946 = _852 * _886;
    float _948 = _938 * _938;
    float _950 = _942 * _942;
    float _952 = _852 * _924;
    float _954 = fma(_846, _860, _932);
    float _956 = _948 + _950;
    float _958 = _904;
    float _960 = _906;
    float _962 = _908;
    float _964 = _948;
    float _966 = _950;
    float _968 = _928;
    float _970 = _930;
    if (!_902)
    {
        float _972 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[17].y, _904);
        _958 = _972;
    }
    float _974 = _958;
    if (!_902)
    {
        float _976 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[17].y, _906);
        _960 = _976;
    }
    float _978 = _960;
    float _980 = sqrt(_956);
    float _982 = _792 * _882;
    if (!_902)
    {
        float _984 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[17].y, _908);
        _962 = _984;
    }
    float _986 = _962;
    float _988 = _832 * _882;
    float _990 = fma(_846, _864, _916);
    float _992 = fma(_846, _858, _982);
    float _994 = fma(_860, _892, _934);
    float _996 = _832 * _886;
    float _998 = fma(_834, _858, _988);
    float _1000 = fma(_834, _860, _944);
    float _1002 = fma(_734, _898, _994);
    float _1004 = fma(_836, _728, _992);
    float _1006 = fma(_834, _864, _996);
    float _1008 = fma(_794, _858, _926);
    float _1010 = _324 + _1002;
    float _1012 = fma(_794, _860, _952);
    bool _1014 = _980 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1016 = fma(_836, _734, _954);
    float _1018 = fma(_794, _864, _946);
    float _1020 = fma(_836, _732, _990);
    if (!_1014)
    {
        _354 = _1010;
    }
    float _1022 = _354;
    bool _1024 = !_1014;
    float _1026 = _1022;
    if (!_1024)
    {
        float _1028 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1032 = _980 + _1030;
        float _1034 = _1010 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1036 = rsqrt(_956);
        float _1038 = _1032 * _1028;
        float _1040 = _1038 * 0.15915493667125701904296875;
        float _1042 = _1040 * 6.283185482025146484375;
        float _1044 = sin(_1042);
        float _1046 = _1040 * 6.283185482025146484375;
        float _1048 = cos(_1046);
        float _1050 = fma(_1044, _1034, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1052 = _1036 * _1050;
        float _1054 = fma(_938, _1052, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1056 = _1048 + (-1.0);
        float _1058 = fma(_942, _1052, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1060 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1062 = _1054 + _1060;
        float _1064 = _1056 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1066 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1068 = _1058 + _1066;
        float _1070 = _1062 * _1062;
        float _1072 = fma(_1010, _1048, _1064);
        float _1074 = _1068 * _1068;
        _1026 = _1072;
        _964 = _1070;
        _966 = _1074;
        _968 = _1054;
        _970 = _1058;
    }
    float _1076 = _1026;
    float _1078 = _964;
    float _1080 = _966;
    float _1082 = _968;
    float _1084 = _970;
    float _1086 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1088 = _1076 + _1086;
    float _1090 = -_752;
    float _1092 = fma(_1090, _728, _998);
    float _1094 = -_752;
    float _1096 = fma(_1094, _734, _1000);
    float _1098 = -_752;
    float _1100 = fma(_1098, _732, _1006);
    float _1102 = fma(_1088, _1088, _1078);
    float _1104 = _1004 * _978;
    float _1106 = _1016 * _978;
    float _1108 = _1020 * _978;
    float _1110 = _1102 + _1080;
    float _1112 = fma(_838, _728, _1008);
    float _1114 = fma(_838, _734, _1012);
    float _1116 = fma(_838, _732, _1018);
    float _1118 = fma(_1092, _974, _1104);
    float _1120 = fma(_1096, _974, _1106);
    float _1122 = sqrt(_1110);
    float _1124 = fma(_1100, _974, _1108);
    float _1126 = fma(_1112, _986, _1118);
    float _1128 = fma(_1114, _986, _1120);
    float _1130 = fma(_1116, _986, _1124);
    out.m_63.x = _1126;
    out.m_63.y = _1128;
    out.m_63.z = _1130;
    bool _1132 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1134 = isnan(_1122);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1140 = _1136 || _1138;
    float _1142 = _1088;
    if (!_1140)
    {
        _1142 = 1.0;
    }
    float _1144 = _1142;
    bool _1146 = !_1140;
    float _1148 = _1144;
    if (!_1146)
    {
        bool _1150 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1152 = isnan(_1122);
        bool _1154 = _1150 || _1152;
        bool _1156 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1158 = _1154 || _1156;
        if (!_1158)
        {
            float _1160 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1162 = _1122 + _1160;
            float _1164 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1166 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1164;
            float _1168 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1170 = _1168 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1172 = 1.0 / _1166;
            float _1174 = _1162 * _1172;
            float _1176 = fma(_1174, _1170, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1148 = _1176;
            _1178 = true;
        }
        else
        {
            bool _1180 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1182 = isnan(_1122);
            bool _1184 = _1180 || _1182;
            bool _1186 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1188 = _1184 || _1186;
            if (!_1188)
            {
                float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1192 = _1122 + _1190;
                float _1194 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1196 = _1194 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1198 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1200 = _1198 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1202 = 1.0 / _1196;
                float _1204 = _1192 * _1202;
                float _1206 = fma(_1204, _1200, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1148 = _1206;
                _1178 = true;
            }
            else
            {
                _1148 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1178 = false;
    float _1208 = _1148;
    float _1210 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1212 = _1076 + _1210;
    float _1214 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1216 = _1082 + _1214;
    float _1218 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1220 = _1084 + _1218;
    float _1222 = fma(_1212, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1224 = fma(_1216, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1226 = fma(_1220, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1228 = -_522;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1222);
    float _1232 = -_524;
    float _1234 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1224);
    float _1236 = -_536;
    float _1238 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1226);
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1242 = _1230 + _1240;
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1246 = _1234 + _1244;
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1250 = _1238 + _1248;
    float _1252 = _1242 * _1242;
    float _1254 = fma(_1246, _1246, _1252);
    float _1256 = fma(_1250, _1250, _1254);
    float _1258 = rsqrt(_1256);
    float _1260 = sqrt(_1256);
    float _1262 = _1258 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1264 = _1246 * _1262;
    float _1266 = _1250 * _1262;
    float _1268 = _1264 * _1264;
    float _1270 = _1266 * _1266;
    float _1272 = _1268 + _1270;
    float _1274 = sqrt(_1272);
    bool _1276 = _1274 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1280 = _1274 + _1278;
    float _1282 = _1258;
    float _1284 = _1272;
    float _1286 = _1280;
    float _1288 = _1212;
    float _1290 = _1242;
    float _1292 = _1262;
    float _1294 = _1264;
    if (_1276)
    {
        float _1296 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1282 = _1296;
    }
    float _1298 = _1282;
    if (_1276)
    {
        float _1300 = rsqrt(_1272);
        _1284 = _1300;
    }
    float _1302 = _1284;
    if (_1276)
    {
        float _1304 = _1280 * _1298;
        _1286 = _1304;
    }
    float _1306 = _1286;
    if (_1276)
    {
        float _1308 = _1306 * 0.15915493667125701904296875;
        _1288 = _1308;
    }
    float _1310 = _1288;
    float _1312 = _1298;
    float _1314 = _1310;
    if (_1276)
    {
        float _1316 = _1310 * 6.283185482025146484375;
        float _1318 = sin(_1316);
        _1312 = _1318;
    }
    float _1320 = _1312;
    float _1322 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1324 = precise::max(0.0, _1322);
    float _1326 = _1250;
    float _1328 = _1324;
    if (_1276)
    {
        float _1330 = _1310 * 6.283185482025146484375;
        float _1332 = cos(_1330);
        _1326 = _1332;
    }
    float _1334 = _1326;
    float _1336 = -_1262;
    float _1338 = -_1324;
    float _1340 = fma(_1242, _1336, _1338);
    if (!_1276)
    {
        _1290 = _1266;
    }
    float _1342 = _1290;
    float _1344 = _1342;
    if (_1276)
    {
        float _1346 = _1340 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1328 = _1346;
    }
    float _1348 = _1328;
    float _1350 = _1320;
    float _1352 = _1348;
    if (_1276)
    {
        float _1354 = fma(_1320, _1348, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1350 = _1354;
    }
    float _1356 = _1350;
    float _1358 = _1356;
    float _1360 = _1334;
    if (_1276)
    {
        float _1362 = _1334 + (-1.0);
        _1352 = _1362;
    }
    float _1364 = _1352;
    float _1366 = _1364;
    if (_1276)
    {
        float _1368 = _1302 * _1356;
        _1292 = _1368;
    }
    float _1370 = _1292;
    if (!_1276)
    {
        _1358 = _1340;
    }
    float _1372 = _1358;
    float _1374 = _1372;
    if (_1276)
    {
        float _1376 = _1364 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1314 = _1376;
    }
    float _1378 = _1314;
    if (_1276)
    {
        float _1380 = _1264 * _1370;
        _1294 = _1380;
    }
    float _1382 = _1294;
    if (!_1276)
    {
        _1366 = _1268;
    }
    float _1384 = _1366;
    float _1386 = _1384;
    if (_1276)
    {
        float _1388 = _1266 * _1370;
        _1344 = _1388;
    }
    float _1390 = _1344;
    if (_1276)
    {
        float _1392 = fma(_1340, _1334, _1378);
        _1374 = _1392;
    }
    float _1394 = _1374;
    if (_1276)
    {
        float _1396 = _1382 * _1382;
        _1386 = _1396;
    }
    float _1398 = _1386;
    if (!_1276)
    {
        _1360 = _1270;
    }
    float _1400 = _1360;
    float _1402 = _1400;
    if (_1276)
    {
        float _1404 = _1390 * _1390;
        _1402 = _1404;
    }
    float _1406 = _1402;
    float _1408 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1410 = fma(_1394, _1394, _1398);
    float _1412 = _1410 + _1406;
    float _1414 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1418 = fma(_1260, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1416);
    float _1420 = precise::clamp(_1418, 0.0, 1.0);
    float _1422 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1424 = rsqrt(_1412);
    float _1426 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1414);
    float _1428 = -_1420;
    float _1430 = _1428 + 1.0;
    float _1432 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1422);
    float _1434 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1408);
    float _1436 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1426);
    float _1438 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1440 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1442 = abs(_1430);
    float _1444 = log2(_1442);
    float _1446 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1448 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1438);
    float _1450 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1432);
    float _1452 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1434);
    float _1454 = _1446 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1456 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1448);
    float _1458 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1460 = _1424 * _1382;
    float _1462 = -_1454;
    float _1464 = fma(_1462, _1440, 1.0);
    float _1466 = _1456 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1468 = _1452 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1470 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1472 = _1424 * _1394;
    float _1474 = _1460 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1476 = _1424 * _1390;
    float _1478 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1470);
    float _1480 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1482 = -_1474;
    float _1484 = fma(_1472, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1482);
    float _1486 = log2(_1464);
    float _1488 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1478);
    float _1490 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1492 = -_1476;
    float _1494 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1484);
    float _1496 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1498 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1488);
    float _1500 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1490);
    float _1502 = fma(_1494, -0.5, 0.5);
    float _1504 = exp2(_1480);
    float _1506 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1496);
    float _1508 = fma(_1494, 0.5, 0.5);
    float _1510 = _1472 + 1.0;
    float _1512 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1500);
    float _1514 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1506);
    float _1516 = fma(_1508, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1518 = 1.0 / _1498;
    float _1520 = _1486 * 0.693147182464599609375;
    float _1522 = fma(_1508, _1516, -0.212114393711090087890625);
    float _1524 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1512);
    float _1526 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1528 = fma(_1508, _1522, 1.570728778839111328125);
    float _1530 = sqrt(_1502);
    float _1532 = -_1472;
    float _1534 = fma(_1504, _1510, _1532);
    float _1536 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1514);
    float _1538 = fma(_1534, 0.5, 0.5);
    float _1540 = _1536 * _1518;
    float _1542 = _1524 * _1518;
    float _1544 = fma(_1540, 0.5, 0.5);
    float _1546 = fma(_1542, -0.5, 0.5);
    float _1548 = _1530 * 0.636619746685028076171875;
    float3 _4010 = float3(_1544, _1546, _1526);
    float _1550 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4010, float3(0.0), isnan(_4010)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4010, float3(0.0), isnan(_4010)), level(0.0)).x;
    float3 _4021 = float3(_1544, _1546, _1526);
    float4 _1553 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4021, float3(0.0), isnan(_4021)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4021, float3(0.0), isnan(_4021)), level(0.0)).xyzw;
    float _1555 = _1553.x;
    float _1557 = _1553.y;
    float _1559 = _1553.z;
    float _1561 = _1553.w;
    float _1563 = -_1528;
    float _1565 = fma(_1548, _1563, 1.0);
    float2 _4043 = float2(_1565, _1538);
    float3 _1569 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4043, float2(0.0), isnan(_4043)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4043, float2(0.0), isnan(_4043)), level(0.0)).xyz;
    float _1571 = _1569.x;
    float _1573 = _1569.y;
    float _1575 = _1569.z;
    float _1577 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1579 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _1581 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1579);
    float _1583 = exp2(_1577);
    out.m_65.x = _1234;
    out.m_65.y = _1230;
    out.m_65.z = _1238;
    float _1585 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1581);
    float _1587 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1585);
    float _1589 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1591 = _1587 + _1498;
    out.gl_Position.x = _1536;
    out.gl_Position.y = _1524;
    out.gl_Position.z = _1587;
    out.gl_Position.w = _1498;
    float _1593 = _1591 * 0.5;
    float _1595 = -_1583;
    float _1597 = _1595 + 1.0;
    out.m_67.w = _1589;
    float _1599 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1593;
    out.m_69.w = _1498;
    float _1601 = _1599 * _1550;
    float _1603 = -_1599;
    float _1605 = _1603 + 1.0;
    float _1607 = _1561 * _1601;
    float _1609 = _1561 * _1605;
    float _1611 = _1575 * _1601;
    float _1613 = fma(_1571, _1607, _1555);
    float _1615 = fma(_1573, _1607, _1557);
    float _1617 = fma(_1561, _1611, _1559);
    out.m_71.x = _1613;
    out.m_71.y = _1615;
    out.m_71.z = _1617;
    out.m_71.w = _1609;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

