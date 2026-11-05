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
    float4 m_57 [[user(locn0)]];
    float4 m_47 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_61 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _618 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_44.w;
    float _79 = trunc(_77);
    int _82 = int(_79);
    bool _86 = _82 >= 1;
    float _88 = 0.0;
    float _90 = as_type<float>(_82);
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _88;
    if (!_86)
    {
        out.m_47.x = 0.0;
    }
    int _94 = 0;
    if (!_86)
    {
        float _96 = _92 * 5.0;
        _94 = as_type<int>(_96);
    }
    int _98 = _94;
    int _100 = _98;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1183 = as_type<float>(_98);
        out.gl_Position.z = _1183;
    }
    if (!_86)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _102 = in.m_49.w;
    bool _104 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = -_102;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_112)
    {
        float _118 = float(_82);
        _90 = _118;
    }
    float _120 = _90;
    bool _122 = _116 >= _120;
    bool _124 = !_112;
    bool _126 = _122 || _124;
    float _128 = _120;
    if (_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    if (_126)
    {
        out.m_47.x = 0.0;
    }
    if (_126)
    {
        float _132 = _130 * 5.0;
        _100 = as_type<int>(_132);
    }
    int _134 = _100;
    if (_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1252 = as_type<float>(_134);
        out.gl_Position.z = _1252;
    }
    if (_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _136 = in.m_51.x;
    float _138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _140 = _116 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _142 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    int _154 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _156 = _154 != 0;
    float _158 = _140 * _138;
    float _160 = 0.0;
    float _162 = _142;
    if (!_152)
    {
        float _164 = _142 * _142;
        float _166 = _164 * 0.5;
        _160 = _166;
    }
    float _168 = _160;
    float _170 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[20].x, _158);
    float _172 = _168;
    if (!_152)
    {
        float _174 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _174;
    }
    float _176 = _172;
    float _178 = in.m_49.x;
    float _180 = in.m_49.y;
    float _182 = in.m_49.z;
    float _184 = _170 * 6.283185482025146484375;
    float _186 = floor(_170);
    float _188 = _184 * 0.15915493667125701904296875;
    float _190 = _188 * 6.283185482025146484375;
    float _192 = cos(_190);
    float _194 = -_186;
    float _196 = _170 + _194;
    bool _198 = !_152;
    float _200 = _176;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _142 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _142);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_152;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _142 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _162 = _254;
    }
    float _256 = _162;
    int _258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _260 = _258 != 0;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _264 = _262 != 0;
    float _266 = in.m_53.x;
    float _268 = in.m_53.y;
    float _270 = in.m_53.z;
    float _272 = in.m_53.w;
    bool _274 = !_156;
    int _276 = _274 ? 0 : 1;
    float _278 = in.m_44.x;
    float _280 = in.m_44.y;
    float _282 = in.m_44.z;
    bool _284 = !_260;
    int _286 = _284 ? 0 : 1;
    float _288 = fma(_192, 0.5, 0.5);
    int _290 = abs(_286);
    int _292 = abs(_276);
    float _294 = -_196;
    float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _298 = _196 < 0.5;
    float _300 = float(_298);
    float _302 = in.m_55.x;
    float _304 = in.m_55.y;
    float _306 = in.m_55.z;
    float _308 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _310 = !_264;
    int _312 = _310 ? 0 : 1;
    float _314 = -_300;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _318 = float(_290);
    float _320 = -_288;
    float _322 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _324 = abs(_312);
    float _326 = fma(_256, _178, _308);
    float _328 = float(_292);
    float _330 = abs(_296);
    float _332 = _318 * _330;
    float _334 = float(_324);
    float _336 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _338 = _268 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _340 = fma(_328, _322, _332);
    float _342 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _344 = fma(_256, _180, _336);
    float _346 = _266 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _348 = abs(_316);
    float _350 = fma(_334, _348, _340);
    float _352 = fma(_256, _182, _342);
    float _354 = _270 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _356 = fma(_344, _272, _280);
    float _358 = _350 * _338;
    float _360 = _350 * _346;
    float _362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _304);
    float _364 = _350 * _354;
    float _366 = _358 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _368 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _302);
    float _370 = _360 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _372 = fma(_326, _272, _278);
    float _374 = _366 * _362;
    float _376 = _356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _378 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _306);
    float _380 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _382 = fma(_352, _272, _282);
    float _384 = _370 * _368;
    float _386 = _356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _388 = _374 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _390 = _374 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _392 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[4].x, _376);
    float _394 = _380 * _378;
    float _396 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[6].x, _386);
    float _398 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[24].x, _388);
    float _400 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[26].x, _390);
    float _402 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[4].z, _392);
    float _404 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[6].z, _396);
    float _406 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[24].z, _398);
    float _408 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[26].z, _400);
    float _410 = _402 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _412 = _404 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _414 = _406 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _416 = _408 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _418 = _356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _420 = _374 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _422 = _410 + _414;
    float _424 = _412 + _416;
    float _426 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[5].x, _418);
    float _428 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[25].x, _420);
    float _430 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _432 = _422 + _430;
    float _434 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _436 = _424 + _434;
    float _438 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[5].z, _426);
    float _440 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[25].z, _428);
    float _442 = _432 * _432;
    float _444 = _436 * _436;
    float _446 = _438 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _448 = _440 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _450 = _442 + _444;
    float _452 = _446 + _448;
    float _454 = sqrt(_450);
    bool _456 = _454 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _458 = _440;
    float _460 = _448;
    float _462 = _418;
    float _464 = _424;
    float _466 = _422;
    float _468 = _450;
    if (!_456)
    {
        _458 = _424;
    }
    float _470 = _458;
    float _472 = _470;
    if (!_456)
    {
        _460 = _444;
    }
    float _474 = _460;
    float _476 = _474;
    if (!_456)
    {
        _462 = _442;
    }
    float _478 = _462;
    float _480 = _478;
    if (!_456)
    {
        _464 = _452;
    }
    float _482 = _464;
    bool _484 = !_456;
    float _486 = _482;
    if (!_484)
    {
        float _488 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _490 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _492 = _454 + _490;
        float _494 = rsqrt(_450);
        float _496 = _492 * _488;
        float _498 = _452 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _500 = _496 * 0.15915493667125701904296875;
        float _502 = _500 * 6.283185482025146484375;
        float _504 = sin(_502);
        float _506 = _500 * 6.283185482025146484375;
        float _508 = cos(_506);
        float _510 = fma(_504, _498, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _512 = _494 * _510;
        float _514 = _508 + (-1.0);
        float _516 = fma(_432, _512, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _518 = fma(_436, _512, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _520 = _514 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _522 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _524 = _516 + _522;
        float _526 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _528 = _518 + _526;
        float _530 = fma(_452, _508, _520);
        float _532 = _524 * _524;
        float _534 = _528 * _528;
        _486 = _530;
        _480 = _532;
        _476 = _534;
        _466 = _516;
        _472 = _518;
    }
    float _536 = _486;
    float _538 = _480;
    float _540 = _476;
    float _542 = _466;
    float _544 = _472;
    float _546 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _548 = _536 + _546;
    float _550 = fma(_548, _548, _538);
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _554 = _550 + _540;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _560 = _552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _564 = sqrt(_554);
    float _566 = _558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _568 = _556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _560;
    out.m_57.y = _566;
    out.m_57.z = _568;
    out.m_57.w = _562;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    bool _570 = _564 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _572 = isnan(_564);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _578 = _574 || _576;
    float _580 = _558;
    float _582 = _536;
    if (!_578)
    {
        _580 = 1.0;
    }
    float _584 = _580;
    bool _586 = !_578;
    float _588 = _584;
    if (!_586)
    {
        bool _590 = _564 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _592 = isnan(_564);
        bool _594 = _590 || _592;
        bool _596 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _598 = _594 || _596;
        if (!_598)
        {
            float _600 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _602 = _564 + _600;
            float _604 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _606 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _604;
            float _608 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _610 = _608 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _612 = 1.0 / _606;
            float _614 = _602 * _612;
            float _616 = fma(_614, _610, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _588 = _616;
            _618 = true;
        }
        else
        {
            bool _620 = _564 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _622 = isnan(_564);
            bool _624 = _620 || _622;
            bool _626 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _628 = _624 || _626;
            if (!_628)
            {
                float _630 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _632 = _564 + _630;
                float _634 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _636 = _634 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _638 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _640 = _638 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _642 = 1.0 / _636;
                float _644 = _632 * _642;
                float _646 = fma(_644, _640, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _588 = _646;
                _618 = true;
            }
            else
            {
                _588 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _618 = false;
    float _648 = _588;
    float _650 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _652 = _542 + _650;
    float _654 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _656 = _536 + _654;
    float _658 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _660 = _544 + _658;
    bool _662 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _664 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _666 = _662 || _664;
    bool _668 = isnan(0.5);
    bool _670 = _666 || _668;
    float _672 = fma(_652, _648, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _674 = fma(_656, _648, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _676 = fma(_660, _648, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _678 = _660;
    float _680 = _648;
    float _682 = _672;
    if (_670)
    {
        _678 = _672;
    }
    float _684 = _678;
    float _686 = _684;
    if (_670)
    {
        _582 = _674;
    }
    float _688 = _582;
    float _690 = _688;
    if (_670)
    {
        _680 = _676;
    }
    float _692 = _680;
    float _694 = _692;
    if (!_670)
    {
        float _696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _698 = _446 + _696;
        float _700 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _702 = _410 + _700;
        float _704 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _706 = _698 * _698;
        float _708 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _710 = _412 + _708;
        float _712 = fma(_702, _702, _706);
        float _714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _716 = fma(_710, _710, _712);
        float _718 = sqrt(_716);
        float _720 = _704 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _722 = precise::min(_718, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _724 = _722 * _714;
        float _726 = -_410;
        float _728 = _726 + _672;
        float _730 = _720 * _724;
        float _732 = -_446;
        float _734 = _732 + _674;
        float _736 = -_412;
        float _738 = _736 + _676;
        float _740 = fma(_728, _730, _410);
        float _742 = fma(_734, _730, _446);
        float _744 = fma(_738, _730, _412);
        _690 = _742;
        _686 = _740;
        _694 = _744;
        _682 = _730;
    }
    float _746 = _690;
    float _748 = _686;
    float _750 = _694;
    float _752 = _682;
    float _754 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _756 = _746 + _754;
    float _758 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _760 = _748 + _758;
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _764 = _750 + _762;
    float _766 = _756 * _756;
    float _768 = fma(_760, _760, _766);
    float _770 = fma(_764, _764, _768);
    float _772 = rsqrt(_770);
    float _774 = _772 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _776 = _760 * _774;
    float _778 = _764 * _774;
    float _780 = _776 * _776;
    float _782 = _778 * _778;
    float _784 = _780 + _782;
    float _786 = sqrt(_784);
    bool _788 = _786 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _790 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _792 = _786 + _790;
    float _794 = _764;
    float _796 = _772;
    float _798 = _792;
    float _800 = _752;
    float _802 = _756;
    float _804 = _776;
    if (_788)
    {
        float _806 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _794 = _806;
    }
    float _808 = _794;
    if (_788)
    {
        float _810 = rsqrt(_784);
        _796 = _810;
    }
    float _812 = _796;
    float _814 = _812;
    if (_788)
    {
        float _816 = _792 * _808;
        _798 = _816;
    }
    float _818 = _798;
    if (_788)
    {
        float _820 = _818 * 0.15915493667125701904296875;
        _800 = _820;
    }
    float _822 = _800;
    float _824 = _808;
    if (_788)
    {
        float _826 = _822 * 6.283185482025146484375;
        float _828 = sin(_826);
        _824 = _828;
    }
    float _830 = _824;
    float _832 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _834 = precise::max(0.0, _832);
    float _836 = _766;
    float _838 = _834;
    if (_788)
    {
        float _840 = _822 * 6.283185482025146484375;
        float _842 = cos(_840);
        _836 = _842;
    }
    float _844 = _836;
    float _846 = -_774;
    float _848 = -_834;
    float _850 = fma(_756, _846, _848);
    if (!_788)
    {
        _802 = _780;
    }
    float _852 = _802;
    float _854 = _852;
    if (_788)
    {
        float _856 = _850 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _838 = _856;
    }
    float _858 = _838;
    float _860 = sqrt(_770);
    float _862 = _830;
    float _864 = _858;
    if (_788)
    {
        float _866 = fma(_830, _858, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _862 = _866;
    }
    float _868 = _862;
    float _870 = _868;
    if (_788)
    {
        float _872 = _844 + (-1.0);
        _864 = _872;
    }
    float _874 = _864;
    float _876 = _874;
    if (_788)
    {
        float _878 = _812 * _868;
        _468 = _878;
    }
    float _880 = _468;
    if (!_788)
    {
        _814 = _850;
    }
    float _882 = _814;
    float _884 = _882;
    if (_788)
    {
        float _886 = _874 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _876 = _886;
    }
    float _888 = _876;
    float _890 = _888;
    if (_788)
    {
        float _892 = _776 * _880;
        _804 = _892;
    }
    float _894 = _804;
    if (!_788)
    {
        _870 = _778;
    }
    float _896 = _870;
    float _898 = _896;
    if (_788)
    {
        float _900 = _778 * _880;
        _898 = _900;
    }
    float _902 = _898;
    if (_788)
    {
        float _904 = fma(_850, _844, _888);
        _884 = _904;
    }
    float _906 = _884;
    if (_788)
    {
        float _908 = _894 * _894;
        _854 = _908;
    }
    float _910 = _854;
    if (!_788)
    {
        _890 = _782;
    }
    float _912 = _890;
    float _914 = _912;
    if (_788)
    {
        float _916 = _902 * _902;
        _914 = _916;
    }
    float _918 = _914;
    float _920 = fma(_906, _906, _910);
    float _922 = _920 + _918;
    float _924 = _746 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _926 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _928 = fma(_860, (*spvDescriptorSet0.vp_c15)._m0[23].w, _926);
    float _930 = precise::clamp(_928, 0.0, 1.0);
    float _932 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _934 = rsqrt(_922);
    float _936 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[2].x, _924);
    float _938 = _746 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _940 = -_930;
    float _942 = _940 + 1.0;
    float _944 = _746 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _946 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[2].z, _936);
    float _948 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[1].x, _938);
    float _950 = _746 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _952 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[0].x, _944);
    float _954 = _946 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _956 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[1].z, _948);
    float _958 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[3].x, _950);
    float _960 = abs(_942);
    float _962 = log2(_960);
    float _964 = _954 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _966 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[0].z, _952);
    float _968 = _956 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _970 = _934 * _894;
    float _972 = -_964;
    float _974 = fma(_972, _932, 1.0);
    float _976 = _966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _978 = _968 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _980 = _934 * _906;
    float _982 = _970 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _984 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[3].z, _958);
    float _986 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[7].x, _978);
    float _988 = _934 * _902;
    float _990 = -_982;
    float _992 = fma(_980, (*spvDescriptorSet0.vp_c15)._m0[21].y, _990);
    float _994 = _984 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _996 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[7].z, _986);
    float _998 = _962 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1000 = -_988;
    float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c15)._m0[21].z, _992);
    float _1004 = _968 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1006 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[7].w, _996);
    float _1008 = exp2(_998);
    float _1010 = fma(_1002, -0.5, 0.5);
    float _1012 = _968 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1014 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1004);
    float _1016 = fma(_1002, 0.5, 0.5);
    float _1018 = _980 + 1.0;
    float _1020 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1012);
    float _1022 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1014);
    float _1024 = log2(_974);
    float _1026 = fma(_1016, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1028 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1022);
    float _1030 = fma(_1016, _1026, -0.212114393711090087890625);
    float _1032 = 1.0 / _1006;
    float _1034 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1020);
    float _1036 = -_980;
    float _1038 = fma(_1008, _1018, _1036);
    float _1040 = fma(_1016, _1030, 1.570728778839111328125);
    float _1042 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1034);
    float _1044 = fma(_1038, 0.5, 0.5);
    float _1046 = sqrt(_1010);
    float _1048 = _1024 * 0.693147182464599609375;
    float _1050 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1052 = _1028 * _1032;
    float _1054 = _1042 * _1032;
    float _1056 = fma(_1052, 0.5, 0.5);
    float _1058 = fma(_1054, -0.5, 0.5);
    float _1060 = _1046 * 0.636619746685028076171875;
    float3 _2761 = float3(_1056, _1058, _1050);
    float _1062 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2761, float3(0.0), isnan(_2761)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2761, float3(0.0), isnan(_2761)), level(0.0)).x;
    float _1064 = -_1040;
    float _1066 = fma(_1060, _1064, 1.0);
    float3 _2777 = float3(_1056, _1058, _1050);
    float4 _1069 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2777, float3(0.0), isnan(_2777)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2777, float3(0.0), isnan(_2777)), level(0.0)).xyzw;
    float _1071 = _1069.x;
    float _1073 = _1069.y;
    float _1075 = _1069.z;
    float _1077 = _1069.w;
    float2 _2794 = float2(_1066, _1044);
    float3 _1081 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2794, float2(0.0), isnan(_2794)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2794, float2(0.0), isnan(_2794)), level(0.0)).xyz;
    float _1083 = _1081.x;
    float _1085 = _1081.y;
    float _1087 = _1081.z;
    float _1089 = _962 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1091 = _968 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _1093 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1091);
    float _1095 = exp2(_1089);
    float _1097 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1093);
    float _1099 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1097);
    out.gl_Position.x = _1028;
    out.gl_Position.y = _1042;
    out.gl_Position.z = _1099;
    out.gl_Position.w = _1006;
    float _1101 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1103 = -_1095;
    float _1105 = _1103 + 1.0;
    out.m_61.w = _1101;
    float _1107 = _1105 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1109 = -_1107;
    float _1111 = _1109 + 1.0;
    float _1113 = _1107 * _1062;
    float _1115 = _1077 * _1113;
    float _1117 = _1087 * _1113;
    float _1119 = fma(_1083, _1115, _1071);
    float _1121 = fma(_1085, _1115, _1073);
    float _1123 = _1077 * _1111;
    float _1125 = fma(_1077, _1117, _1075);
    out.m_63.x = _1119;
    out.m_63.y = _1121;
    out.m_63.z = _1125;
    out.m_63.w = _1123;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _618 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_44.w;
    float _79 = trunc(_77);
    int _82 = int(_79);
    bool _86 = _82 >= 1;
    float _88 = 0.0;
    float _90 = as_type<float>(_82);
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _88;
    if (!_86)
    {
        out.m_47.x = 0.0;
    }
    int _94 = 0;
    if (!_86)
    {
        float _96 = _92 * 5.0;
        _94 = as_type<int>(_96);
    }
    int _98 = _94;
    int _100 = _98;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1183 = as_type<float>(_98);
        out.gl_Position.z = _1183;
    }
    if (!_86)
    {
        return out;
    }
    float _102 = in.m_49.w;
    bool _104 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = -_102;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_112)
    {
        float _118 = float(_82);
        _90 = _118;
    }
    float _120 = _90;
    bool _122 = _116 >= _120;
    bool _124 = !_112;
    bool _126 = _122 || _124;
    float _128 = _120;
    if (_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    if (_126)
    {
        out.m_47.x = 0.0;
    }
    if (_126)
    {
        float _132 = _130 * 5.0;
        _100 = as_type<int>(_132);
    }
    int _134 = _100;
    if (_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1252 = as_type<float>(_134);
        out.gl_Position.z = _1252;
    }
    if (_126)
    {
        return out;
    }
    float _136 = in.m_51.x;
    float _138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _140 = _116 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _142 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    int _154 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _156 = _154 != 0;
    float _158 = _140 * _138;
    float _160 = 0.0;
    float _162 = _142;
    if (!_152)
    {
        float _164 = _142 * _142;
        float _166 = _164 * 0.5;
        _160 = _166;
    }
    float _168 = _160;
    float _170 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[20].x, _158);
    float _172 = _168;
    if (!_152)
    {
        float _174 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _174;
    }
    float _176 = _172;
    float _178 = in.m_49.x;
    float _180 = in.m_49.y;
    float _182 = in.m_49.z;
    float _184 = _170 * 6.283185482025146484375;
    float _186 = floor(_170);
    float _188 = _184 * 0.15915493667125701904296875;
    float _190 = _188 * 6.283185482025146484375;
    float _192 = cos(_190);
    float _194 = -_186;
    float _196 = _170 + _194;
    bool _198 = !_152;
    float _200 = _176;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _142 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _142);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_152;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _142 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _162 = _254;
    }
    float _256 = _162;
    int _258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _260 = _258 != 0;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _264 = _262 != 0;
    float _266 = in.m_53.x;
    float _268 = in.m_53.y;
    float _270 = in.m_53.z;
    float _272 = in.m_53.w;
    bool _274 = !_156;
    int _276 = _274 ? 0 : 1;
    float _278 = in.m_44.x;
    float _280 = in.m_44.y;
    float _282 = in.m_44.z;
    bool _284 = !_260;
    int _286 = _284 ? 0 : 1;
    float _288 = fma(_192, 0.5, 0.5);
    int _290 = abs(_286);
    int _292 = abs(_276);
    float _294 = -_196;
    float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _298 = _196 < 0.5;
    float _300 = float(_298);
    float _302 = in.m_55.x;
    float _304 = in.m_55.y;
    float _306 = in.m_55.z;
    float _308 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _310 = !_264;
    int _312 = _310 ? 0 : 1;
    float _314 = -_300;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _318 = float(_290);
    float _320 = -_288;
    float _322 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _324 = abs(_312);
    float _326 = fma(_256, _178, _308);
    float _328 = float(_292);
    float _330 = abs(_296);
    float _332 = _318 * _330;
    float _334 = float(_324);
    float _336 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _338 = _268 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _340 = fma(_328, _322, _332);
    float _342 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _344 = fma(_256, _180, _336);
    float _346 = _266 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _348 = abs(_316);
    float _350 = fma(_334, _348, _340);
    float _352 = fma(_256, _182, _342);
    float _354 = _270 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _356 = fma(_344, _272, _280);
    float _358 = _350 * _338;
    float _360 = _350 * _346;
    float _362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _304);
    float _364 = _350 * _354;
    float _366 = _358 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _368 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _302);
    float _370 = _360 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _372 = fma(_326, _272, _278);
    float _374 = _366 * _362;
    float _376 = _356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _378 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _306);
    float _380 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _382 = fma(_352, _272, _282);
    float _384 = _370 * _368;
    float _386 = _356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _388 = _374 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _390 = _374 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _392 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[4].x, _376);
    float _394 = _380 * _378;
    float _396 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[6].x, _386);
    float _398 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[24].x, _388);
    float _400 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[26].x, _390);
    float _402 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[4].z, _392);
    float _404 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[6].z, _396);
    float _406 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[24].z, _398);
    float _408 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[26].z, _400);
    float _410 = _402 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _412 = _404 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _414 = _406 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _416 = _408 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _418 = _356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _420 = _374 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _422 = _410 + _414;
    float _424 = _412 + _416;
    float _426 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[5].x, _418);
    float _428 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[25].x, _420);
    float _430 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _432 = _422 + _430;
    float _434 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _436 = _424 + _434;
    float _438 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[5].z, _426);
    float _440 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[25].z, _428);
    float _442 = _432 * _432;
    float _444 = _436 * _436;
    float _446 = _438 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _448 = _440 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _450 = _442 + _444;
    float _452 = _446 + _448;
    float _454 = sqrt(_450);
    bool _456 = _454 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _458 = _440;
    float _460 = _448;
    float _462 = _418;
    float _464 = _424;
    float _466 = _422;
    float _468 = _450;
    if (!_456)
    {
        _458 = _424;
    }
    float _470 = _458;
    float _472 = _470;
    if (!_456)
    {
        _460 = _444;
    }
    float _474 = _460;
    float _476 = _474;
    if (!_456)
    {
        _462 = _442;
    }
    float _478 = _462;
    float _480 = _478;
    if (!_456)
    {
        _464 = _452;
    }
    float _482 = _464;
    bool _484 = !_456;
    float _486 = _482;
    if (!_484)
    {
        float _488 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _490 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _492 = _454 + _490;
        float _494 = rsqrt(_450);
        float _496 = _492 * _488;
        float _498 = _452 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _500 = _496 * 0.15915493667125701904296875;
        float _502 = _500 * 6.283185482025146484375;
        float _504 = sin(_502);
        float _506 = _500 * 6.283185482025146484375;
        float _508 = cos(_506);
        float _510 = fma(_504, _498, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _512 = _494 * _510;
        float _514 = _508 + (-1.0);
        float _516 = fma(_432, _512, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _518 = fma(_436, _512, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _520 = _514 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _522 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _524 = _516 + _522;
        float _526 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _528 = _518 + _526;
        float _530 = fma(_452, _508, _520);
        float _532 = _524 * _524;
        float _534 = _528 * _528;
        _486 = _530;
        _480 = _532;
        _476 = _534;
        _466 = _516;
        _472 = _518;
    }
    float _536 = _486;
    float _538 = _480;
    float _540 = _476;
    float _542 = _466;
    float _544 = _472;
    float _546 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _548 = _536 + _546;
    float _550 = fma(_548, _548, _538);
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _554 = _550 + _540;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _560 = _552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _564 = sqrt(_554);
    float _566 = _558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _568 = _556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _560;
    out.m_57.y = _566;
    out.m_57.z = _568;
    out.m_57.w = _562;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    bool _570 = _564 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _572 = isnan(_564);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _578 = _574 || _576;
    float _580 = _558;
    float _582 = _536;
    if (!_578)
    {
        _580 = 1.0;
    }
    float _584 = _580;
    bool _586 = !_578;
    float _588 = _584;
    if (!_586)
    {
        bool _590 = _564 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _592 = isnan(_564);
        bool _594 = _590 || _592;
        bool _596 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _598 = _594 || _596;
        if (!_598)
        {
            float _600 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _602 = _564 + _600;
            float _604 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _606 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _604;
            float _608 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _610 = _608 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _612 = 1.0 / _606;
            float _614 = _602 * _612;
            float _616 = fma(_614, _610, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _588 = _616;
            _618 = true;
        }
        else
        {
            bool _620 = _564 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _622 = isnan(_564);
            bool _624 = _620 || _622;
            bool _626 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _628 = _624 || _626;
            if (!_628)
            {
                float _630 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _632 = _564 + _630;
                float _634 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _636 = _634 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _638 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _640 = _638 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _642 = 1.0 / _636;
                float _644 = _632 * _642;
                float _646 = fma(_644, _640, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _588 = _646;
                _618 = true;
            }
            else
            {
                _588 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _618 = false;
    float _648 = _588;
    float _650 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _652 = _542 + _650;
    float _654 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _656 = _536 + _654;
    float _658 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _660 = _544 + _658;
    bool _662 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _664 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _666 = _662 || _664;
    bool _668 = isnan(0.5);
    bool _670 = _666 || _668;
    float _672 = fma(_652, _648, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _674 = fma(_656, _648, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _676 = fma(_660, _648, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _678 = _660;
    float _680 = _648;
    float _682 = _672;
    if (_670)
    {
        _678 = _672;
    }
    float _684 = _678;
    float _686 = _684;
    if (_670)
    {
        _582 = _674;
    }
    float _688 = _582;
    float _690 = _688;
    if (_670)
    {
        _680 = _676;
    }
    float _692 = _680;
    float _694 = _692;
    if (!_670)
    {
        float _696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _698 = _446 + _696;
        float _700 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _702 = _410 + _700;
        float _704 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _706 = _698 * _698;
        float _708 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _710 = _412 + _708;
        float _712 = fma(_702, _702, _706);
        float _714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _716 = fma(_710, _710, _712);
        float _718 = sqrt(_716);
        float _720 = _704 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _722 = precise::min(_718, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _724 = _722 * _714;
        float _726 = -_410;
        float _728 = _726 + _672;
        float _730 = _720 * _724;
        float _732 = -_446;
        float _734 = _732 + _674;
        float _736 = -_412;
        float _738 = _736 + _676;
        float _740 = fma(_728, _730, _410);
        float _742 = fma(_734, _730, _446);
        float _744 = fma(_738, _730, _412);
        _690 = _742;
        _686 = _740;
        _694 = _744;
        _682 = _730;
    }
    float _746 = _690;
    float _748 = _686;
    float _750 = _694;
    float _752 = _682;
    float _754 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _756 = _746 + _754;
    float _758 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _760 = _748 + _758;
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _764 = _750 + _762;
    float _766 = _756 * _756;
    float _768 = fma(_760, _760, _766);
    float _770 = fma(_764, _764, _768);
    float _772 = rsqrt(_770);
    float _774 = _772 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _776 = _760 * _774;
    float _778 = _764 * _774;
    float _780 = _776 * _776;
    float _782 = _778 * _778;
    float _784 = _780 + _782;
    float _786 = sqrt(_784);
    bool _788 = _786 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _790 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _792 = _786 + _790;
    float _794 = _764;
    float _796 = _772;
    float _798 = _792;
    float _800 = _752;
    float _802 = _756;
    float _804 = _776;
    if (_788)
    {
        float _806 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _794 = _806;
    }
    float _808 = _794;
    if (_788)
    {
        float _810 = rsqrt(_784);
        _796 = _810;
    }
    float _812 = _796;
    float _814 = _812;
    if (_788)
    {
        float _816 = _792 * _808;
        _798 = _816;
    }
    float _818 = _798;
    if (_788)
    {
        float _820 = _818 * 0.15915493667125701904296875;
        _800 = _820;
    }
    float _822 = _800;
    float _824 = _808;
    if (_788)
    {
        float _826 = _822 * 6.283185482025146484375;
        float _828 = sin(_826);
        _824 = _828;
    }
    float _830 = _824;
    float _832 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _834 = precise::max(0.0, _832);
    float _836 = _766;
    float _838 = _834;
    if (_788)
    {
        float _840 = _822 * 6.283185482025146484375;
        float _842 = cos(_840);
        _836 = _842;
    }
    float _844 = _836;
    float _846 = -_774;
    float _848 = -_834;
    float _850 = fma(_756, _846, _848);
    if (!_788)
    {
        _802 = _780;
    }
    float _852 = _802;
    float _854 = _852;
    if (_788)
    {
        float _856 = _850 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _838 = _856;
    }
    float _858 = _838;
    float _860 = sqrt(_770);
    float _862 = _830;
    float _864 = _858;
    if (_788)
    {
        float _866 = fma(_830, _858, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _862 = _866;
    }
    float _868 = _862;
    float _870 = _868;
    if (_788)
    {
        float _872 = _844 + (-1.0);
        _864 = _872;
    }
    float _874 = _864;
    float _876 = _874;
    if (_788)
    {
        float _878 = _812 * _868;
        _468 = _878;
    }
    float _880 = _468;
    if (!_788)
    {
        _814 = _850;
    }
    float _882 = _814;
    float _884 = _882;
    if (_788)
    {
        float _886 = _874 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _876 = _886;
    }
    float _888 = _876;
    float _890 = _888;
    if (_788)
    {
        float _892 = _776 * _880;
        _804 = _892;
    }
    float _894 = _804;
    if (!_788)
    {
        _870 = _778;
    }
    float _896 = _870;
    float _898 = _896;
    if (_788)
    {
        float _900 = _778 * _880;
        _898 = _900;
    }
    float _902 = _898;
    if (_788)
    {
        float _904 = fma(_850, _844, _888);
        _884 = _904;
    }
    float _906 = _884;
    if (_788)
    {
        float _908 = _894 * _894;
        _854 = _908;
    }
    float _910 = _854;
    if (!_788)
    {
        _890 = _782;
    }
    float _912 = _890;
    float _914 = _912;
    if (_788)
    {
        float _916 = _902 * _902;
        _914 = _916;
    }
    float _918 = _914;
    float _920 = fma(_906, _906, _910);
    float _922 = _920 + _918;
    float _924 = _746 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _926 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _928 = fma(_860, (*spvDescriptorSet0.vp_c15)._m0[23].w, _926);
    float _930 = precise::clamp(_928, 0.0, 1.0);
    float _932 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _934 = rsqrt(_922);
    float _936 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[2].x, _924);
    float _938 = _746 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _940 = -_930;
    float _942 = _940 + 1.0;
    float _944 = _746 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _946 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[2].z, _936);
    float _948 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[1].x, _938);
    float _950 = _746 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _952 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[0].x, _944);
    float _954 = _946 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _956 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[1].z, _948);
    float _958 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[3].x, _950);
    float _960 = abs(_942);
    float _962 = log2(_960);
    float _964 = _954 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _966 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[0].z, _952);
    float _968 = _956 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _970 = _934 * _894;
    float _972 = -_964;
    float _974 = fma(_972, _932, 1.0);
    float _976 = _966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _978 = _968 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _980 = _934 * _906;
    float _982 = _970 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _984 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[3].z, _958);
    float _986 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[7].x, _978);
    float _988 = _934 * _902;
    float _990 = -_982;
    float _992 = fma(_980, (*spvDescriptorSet0.vp_c15)._m0[21].y, _990);
    float _994 = _984 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _996 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[7].z, _986);
    float _998 = _962 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1000 = -_988;
    float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c15)._m0[21].z, _992);
    float _1004 = _968 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1006 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[7].w, _996);
    float _1008 = exp2(_998);
    float _1010 = fma(_1002, -0.5, 0.5);
    float _1012 = _968 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1014 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1004);
    float _1016 = fma(_1002, 0.5, 0.5);
    float _1018 = _980 + 1.0;
    float _1020 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1012);
    float _1022 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1014);
    float _1024 = log2(_974);
    float _1026 = fma(_1016, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1028 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1022);
    float _1030 = fma(_1016, _1026, -0.212114393711090087890625);
    float _1032 = 1.0 / _1006;
    float _1034 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1020);
    float _1036 = -_980;
    float _1038 = fma(_1008, _1018, _1036);
    float _1040 = fma(_1016, _1030, 1.570728778839111328125);
    float _1042 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1034);
    float _1044 = fma(_1038, 0.5, 0.5);
    float _1046 = sqrt(_1010);
    float _1048 = _1024 * 0.693147182464599609375;
    float _1050 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1052 = _1028 * _1032;
    float _1054 = _1042 * _1032;
    float _1056 = fma(_1052, 0.5, 0.5);
    float _1058 = fma(_1054, -0.5, 0.5);
    float _1060 = _1046 * 0.636619746685028076171875;
    float3 _2761 = float3(_1056, _1058, _1050);
    float _1062 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2761, float3(0.0), isnan(_2761)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2761, float3(0.0), isnan(_2761)), level(0.0)).x;
    float _1064 = -_1040;
    float _1066 = fma(_1060, _1064, 1.0);
    float3 _2777 = float3(_1056, _1058, _1050);
    float4 _1069 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2777, float3(0.0), isnan(_2777)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2777, float3(0.0), isnan(_2777)), level(0.0)).xyzw;
    float _1071 = _1069.x;
    float _1073 = _1069.y;
    float _1075 = _1069.z;
    float _1077 = _1069.w;
    float2 _2794 = float2(_1066, _1044);
    float3 _1081 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2794, float2(0.0), isnan(_2794)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2794, float2(0.0), isnan(_2794)), level(0.0)).xyz;
    float _1083 = _1081.x;
    float _1085 = _1081.y;
    float _1087 = _1081.z;
    float _1089 = _962 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1091 = _968 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _1093 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1091);
    float _1095 = exp2(_1089);
    float _1097 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1093);
    float _1099 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1097);
    out.gl_Position.x = _1028;
    out.gl_Position.y = _1042;
    out.gl_Position.z = _1099;
    out.gl_Position.w = _1006;
    float _1101 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1103 = -_1095;
    float _1105 = _1103 + 1.0;
    out.m_61.w = _1101;
    float _1107 = _1105 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1109 = -_1107;
    float _1111 = _1109 + 1.0;
    float _1113 = _1107 * _1062;
    float _1115 = _1077 * _1113;
    float _1117 = _1087 * _1113;
    float _1119 = fma(_1083, _1115, _1071);
    float _1121 = fma(_1085, _1115, _1073);
    float _1123 = _1077 * _1111;
    float _1125 = fma(_1077, _1117, _1075);
    out.m_63.x = _1119;
    out.m_63.y = _1121;
    out.m_63.z = _1125;
    out.m_63.w = _1123;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _618 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_44.w;
    float _79 = trunc(_77);
    int _82 = int(_79);
    bool _86 = _82 >= 1;
    float _88 = 0.0;
    float _90 = as_type<float>(_82);
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _88;
    if (!_86)
    {
        out.m_47.x = 0.0;
    }
    int _94 = 0;
    if (!_86)
    {
        float _96 = _92 * 5.0;
        _94 = as_type<int>(_96);
    }
    int _98 = _94;
    int _100 = _98;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1183 = as_type<float>(_98);
        out.gl_Position.z = _1183;
    }
    if (!_86)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _102 = in.m_49.w;
    bool _104 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = -_102;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_112)
    {
        float _118 = float(_82);
        _90 = _118;
    }
    float _120 = _90;
    bool _122 = _116 >= _120;
    bool _124 = !_112;
    bool _126 = _122 || _124;
    float _128 = _120;
    if (_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    if (_126)
    {
        out.m_47.x = 0.0;
    }
    if (_126)
    {
        float _132 = _130 * 5.0;
        _100 = as_type<int>(_132);
    }
    int _134 = _100;
    if (_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1252 = as_type<float>(_134);
        out.gl_Position.z = _1252;
    }
    if (_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_51.x;
    float _138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _140 = _116 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _142 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    int _154 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _156 = _154 != 0;
    float _158 = _140 * _138;
    float _160 = 0.0;
    float _162 = _142;
    if (!_152)
    {
        float _164 = _142 * _142;
        float _166 = _164 * 0.5;
        _160 = _166;
    }
    float _168 = _160;
    float _170 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[20].x, _158);
    float _172 = _168;
    if (!_152)
    {
        float _174 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _174;
    }
    float _176 = _172;
    float _178 = in.m_49.x;
    float _180 = in.m_49.y;
    float _182 = in.m_49.z;
    float _184 = _170 * 6.283185482025146484375;
    float _186 = floor(_170);
    float _188 = _184 * 0.15915493667125701904296875;
    float _190 = _188 * 6.283185482025146484375;
    float _192 = cos(_190);
    float _194 = -_186;
    float _196 = _170 + _194;
    bool _198 = !_152;
    float _200 = _176;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _142 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _142);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_152;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _142 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _162 = _254;
    }
    float _256 = _162;
    int _258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _260 = _258 != 0;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _264 = _262 != 0;
    float _266 = in.m_53.x;
    float _268 = in.m_53.y;
    float _270 = in.m_53.z;
    float _272 = in.m_53.w;
    bool _274 = !_156;
    int _276 = _274 ? 0 : 1;
    float _278 = in.m_44.x;
    float _280 = in.m_44.y;
    float _282 = in.m_44.z;
    bool _284 = !_260;
    int _286 = _284 ? 0 : 1;
    float _288 = fma(_192, 0.5, 0.5);
    int _290 = abs(_286);
    int _292 = abs(_276);
    float _294 = -_196;
    float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _298 = _196 < 0.5;
    float _300 = float(_298);
    float _302 = in.m_55.x;
    float _304 = in.m_55.y;
    float _306 = in.m_55.z;
    float _308 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _310 = !_264;
    int _312 = _310 ? 0 : 1;
    float _314 = -_300;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _318 = float(_290);
    float _320 = -_288;
    float _322 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _324 = abs(_312);
    float _326 = fma(_256, _178, _308);
    float _328 = float(_292);
    float _330 = abs(_296);
    float _332 = _318 * _330;
    float _334 = float(_324);
    float _336 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _338 = _268 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _340 = fma(_328, _322, _332);
    float _342 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _344 = fma(_256, _180, _336);
    float _346 = _266 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _348 = abs(_316);
    float _350 = fma(_334, _348, _340);
    float _352 = fma(_256, _182, _342);
    float _354 = _270 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _356 = fma(_344, _272, _280);
    float _358 = _350 * _338;
    float _360 = _350 * _346;
    float _362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _304);
    float _364 = _350 * _354;
    float _366 = _358 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _368 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _302);
    float _370 = _360 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _372 = fma(_326, _272, _278);
    float _374 = _366 * _362;
    float _376 = _356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _378 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _306);
    float _380 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _382 = fma(_352, _272, _282);
    float _384 = _370 * _368;
    float _386 = _356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _388 = _374 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _390 = _374 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _392 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[4].x, _376);
    float _394 = _380 * _378;
    float _396 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[6].x, _386);
    float _398 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[24].x, _388);
    float _400 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[26].x, _390);
    float _402 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[4].z, _392);
    float _404 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[6].z, _396);
    float _406 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[24].z, _398);
    float _408 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[26].z, _400);
    float _410 = _402 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _412 = _404 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _414 = _406 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _416 = _408 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _418 = _356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _420 = _374 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _422 = _410 + _414;
    float _424 = _412 + _416;
    float _426 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[5].x, _418);
    float _428 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[25].x, _420);
    float _430 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _432 = _422 + _430;
    float _434 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _436 = _424 + _434;
    float _438 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[5].z, _426);
    float _440 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[25].z, _428);
    float _442 = _432 * _432;
    float _444 = _436 * _436;
    float _446 = _438 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _448 = _440 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _450 = _442 + _444;
    float _452 = _446 + _448;
    float _454 = sqrt(_450);
    bool _456 = _454 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _458 = _440;
    float _460 = _448;
    float _462 = _418;
    float _464 = _424;
    float _466 = _422;
    float _468 = _450;
    if (!_456)
    {
        _458 = _424;
    }
    float _470 = _458;
    float _472 = _470;
    if (!_456)
    {
        _460 = _444;
    }
    float _474 = _460;
    float _476 = _474;
    if (!_456)
    {
        _462 = _442;
    }
    float _478 = _462;
    float _480 = _478;
    if (!_456)
    {
        _464 = _452;
    }
    float _482 = _464;
    bool _484 = !_456;
    float _486 = _482;
    if (!_484)
    {
        float _488 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _490 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _492 = _454 + _490;
        float _494 = rsqrt(_450);
        float _496 = _492 * _488;
        float _498 = _452 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _500 = _496 * 0.15915493667125701904296875;
        float _502 = _500 * 6.283185482025146484375;
        float _504 = sin(_502);
        float _506 = _500 * 6.283185482025146484375;
        float _508 = cos(_506);
        float _510 = fma(_504, _498, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _512 = _494 * _510;
        float _514 = _508 + (-1.0);
        float _516 = fma(_432, _512, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _518 = fma(_436, _512, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _520 = _514 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _522 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _524 = _516 + _522;
        float _526 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _528 = _518 + _526;
        float _530 = fma(_452, _508, _520);
        float _532 = _524 * _524;
        float _534 = _528 * _528;
        _486 = _530;
        _480 = _532;
        _476 = _534;
        _466 = _516;
        _472 = _518;
    }
    float _536 = _486;
    float _538 = _480;
    float _540 = _476;
    float _542 = _466;
    float _544 = _472;
    float _546 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _548 = _536 + _546;
    float _550 = fma(_548, _548, _538);
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _554 = _550 + _540;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _560 = _552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _564 = sqrt(_554);
    float _566 = _558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _568 = _556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _560;
    out.m_57.y = _566;
    out.m_57.z = _568;
    out.m_57.w = _562;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    bool _570 = _564 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _572 = isnan(_564);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _578 = _574 || _576;
    float _580 = _558;
    float _582 = _536;
    if (!_578)
    {
        _580 = 1.0;
    }
    float _584 = _580;
    bool _586 = !_578;
    float _588 = _584;
    if (!_586)
    {
        bool _590 = _564 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _592 = isnan(_564);
        bool _594 = _590 || _592;
        bool _596 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _598 = _594 || _596;
        if (!_598)
        {
            float _600 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _602 = _564 + _600;
            float _604 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _606 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _604;
            float _608 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _610 = _608 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _612 = 1.0 / _606;
            float _614 = _602 * _612;
            float _616 = fma(_614, _610, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _588 = _616;
            _618 = true;
        }
        else
        {
            bool _620 = _564 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _622 = isnan(_564);
            bool _624 = _620 || _622;
            bool _626 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _628 = _624 || _626;
            if (!_628)
            {
                float _630 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _632 = _564 + _630;
                float _634 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _636 = _634 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _638 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _640 = _638 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _642 = 1.0 / _636;
                float _644 = _632 * _642;
                float _646 = fma(_644, _640, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _588 = _646;
                _618 = true;
            }
            else
            {
                _588 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _618 = false;
    float _648 = _588;
    float _650 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _652 = _542 + _650;
    float _654 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _656 = _536 + _654;
    float _658 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _660 = _544 + _658;
    bool _662 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _664 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _666 = _662 || _664;
    bool _668 = isnan(0.5);
    bool _670 = _666 || _668;
    float _672 = fma(_652, _648, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _674 = fma(_656, _648, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _676 = fma(_660, _648, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _678 = _660;
    float _680 = _648;
    float _682 = _672;
    if (_670)
    {
        _678 = _672;
    }
    float _684 = _678;
    float _686 = _684;
    if (_670)
    {
        _582 = _674;
    }
    float _688 = _582;
    float _690 = _688;
    if (_670)
    {
        _680 = _676;
    }
    float _692 = _680;
    float _694 = _692;
    if (!_670)
    {
        float _696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _698 = _446 + _696;
        float _700 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _702 = _410 + _700;
        float _704 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _706 = _698 * _698;
        float _708 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _710 = _412 + _708;
        float _712 = fma(_702, _702, _706);
        float _714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _716 = fma(_710, _710, _712);
        float _718 = sqrt(_716);
        float _720 = _704 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _722 = precise::min(_718, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _724 = _722 * _714;
        float _726 = -_410;
        float _728 = _726 + _672;
        float _730 = _720 * _724;
        float _732 = -_446;
        float _734 = _732 + _674;
        float _736 = -_412;
        float _738 = _736 + _676;
        float _740 = fma(_728, _730, _410);
        float _742 = fma(_734, _730, _446);
        float _744 = fma(_738, _730, _412);
        _690 = _742;
        _686 = _740;
        _694 = _744;
        _682 = _730;
    }
    float _746 = _690;
    float _748 = _686;
    float _750 = _694;
    float _752 = _682;
    float _754 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _756 = _746 + _754;
    float _758 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _760 = _748 + _758;
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _764 = _750 + _762;
    float _766 = _756 * _756;
    float _768 = fma(_760, _760, _766);
    float _770 = fma(_764, _764, _768);
    float _772 = rsqrt(_770);
    float _774 = _772 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _776 = _760 * _774;
    float _778 = _764 * _774;
    float _780 = _776 * _776;
    float _782 = _778 * _778;
    float _784 = _780 + _782;
    float _786 = sqrt(_784);
    bool _788 = _786 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _790 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _792 = _786 + _790;
    float _794 = _764;
    float _796 = _772;
    float _798 = _792;
    float _800 = _752;
    float _802 = _756;
    float _804 = _776;
    if (_788)
    {
        float _806 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _794 = _806;
    }
    float _808 = _794;
    if (_788)
    {
        float _810 = rsqrt(_784);
        _796 = _810;
    }
    float _812 = _796;
    float _814 = _812;
    if (_788)
    {
        float _816 = _792 * _808;
        _798 = _816;
    }
    float _818 = _798;
    if (_788)
    {
        float _820 = _818 * 0.15915493667125701904296875;
        _800 = _820;
    }
    float _822 = _800;
    float _824 = _808;
    if (_788)
    {
        float _826 = _822 * 6.283185482025146484375;
        float _828 = sin(_826);
        _824 = _828;
    }
    float _830 = _824;
    float _832 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _834 = precise::max(0.0, _832);
    float _836 = _766;
    float _838 = _834;
    if (_788)
    {
        float _840 = _822 * 6.283185482025146484375;
        float _842 = cos(_840);
        _836 = _842;
    }
    float _844 = _836;
    float _846 = -_774;
    float _848 = -_834;
    float _850 = fma(_756, _846, _848);
    if (!_788)
    {
        _802 = _780;
    }
    float _852 = _802;
    float _854 = _852;
    if (_788)
    {
        float _856 = _850 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _838 = _856;
    }
    float _858 = _838;
    float _860 = sqrt(_770);
    float _862 = _830;
    float _864 = _858;
    if (_788)
    {
        float _866 = fma(_830, _858, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _862 = _866;
    }
    float _868 = _862;
    float _870 = _868;
    if (_788)
    {
        float _872 = _844 + (-1.0);
        _864 = _872;
    }
    float _874 = _864;
    float _876 = _874;
    if (_788)
    {
        float _878 = _812 * _868;
        _468 = _878;
    }
    float _880 = _468;
    if (!_788)
    {
        _814 = _850;
    }
    float _882 = _814;
    float _884 = _882;
    if (_788)
    {
        float _886 = _874 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _876 = _886;
    }
    float _888 = _876;
    float _890 = _888;
    if (_788)
    {
        float _892 = _776 * _880;
        _804 = _892;
    }
    float _894 = _804;
    if (!_788)
    {
        _870 = _778;
    }
    float _896 = _870;
    float _898 = _896;
    if (_788)
    {
        float _900 = _778 * _880;
        _898 = _900;
    }
    float _902 = _898;
    if (_788)
    {
        float _904 = fma(_850, _844, _888);
        _884 = _904;
    }
    float _906 = _884;
    if (_788)
    {
        float _908 = _894 * _894;
        _854 = _908;
    }
    float _910 = _854;
    if (!_788)
    {
        _890 = _782;
    }
    float _912 = _890;
    float _914 = _912;
    if (_788)
    {
        float _916 = _902 * _902;
        _914 = _916;
    }
    float _918 = _914;
    float _920 = fma(_906, _906, _910);
    float _922 = _920 + _918;
    float _924 = _746 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _926 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _928 = fma(_860, (*spvDescriptorSet0.vp_c15)._m0[23].w, _926);
    float _930 = precise::clamp(_928, 0.0, 1.0);
    float _932 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _934 = rsqrt(_922);
    float _936 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[2].x, _924);
    float _938 = _746 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _940 = -_930;
    float _942 = _940 + 1.0;
    float _944 = _746 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _946 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[2].z, _936);
    float _948 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[1].x, _938);
    float _950 = _746 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _952 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[0].x, _944);
    float _954 = _946 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _956 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[1].z, _948);
    float _958 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[3].x, _950);
    float _960 = abs(_942);
    float _962 = log2(_960);
    float _964 = _954 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _966 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[0].z, _952);
    float _968 = _956 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _970 = _934 * _894;
    float _972 = -_964;
    float _974 = fma(_972, _932, 1.0);
    float _976 = _966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _978 = _968 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _980 = _934 * _906;
    float _982 = _970 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _984 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[3].z, _958);
    float _986 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[7].x, _978);
    float _988 = _934 * _902;
    float _990 = -_982;
    float _992 = fma(_980, (*spvDescriptorSet0.vp_c15)._m0[21].y, _990);
    float _994 = _984 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _996 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[7].z, _986);
    float _998 = _962 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1000 = -_988;
    float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c15)._m0[21].z, _992);
    float _1004 = _968 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1006 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[7].w, _996);
    float _1008 = exp2(_998);
    float _1010 = fma(_1002, -0.5, 0.5);
    float _1012 = _968 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1014 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1004);
    float _1016 = fma(_1002, 0.5, 0.5);
    float _1018 = _980 + 1.0;
    float _1020 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1012);
    float _1022 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1014);
    float _1024 = log2(_974);
    float _1026 = fma(_1016, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1028 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1022);
    float _1030 = fma(_1016, _1026, -0.212114393711090087890625);
    float _1032 = 1.0 / _1006;
    float _1034 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1020);
    float _1036 = -_980;
    float _1038 = fma(_1008, _1018, _1036);
    float _1040 = fma(_1016, _1030, 1.570728778839111328125);
    float _1042 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1034);
    float _1044 = fma(_1038, 0.5, 0.5);
    float _1046 = sqrt(_1010);
    float _1048 = _1024 * 0.693147182464599609375;
    float _1050 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1052 = _1028 * _1032;
    float _1054 = _1042 * _1032;
    float _1056 = fma(_1052, 0.5, 0.5);
    float _1058 = fma(_1054, -0.5, 0.5);
    float _1060 = _1046 * 0.636619746685028076171875;
    float3 _2761 = float3(_1056, _1058, _1050);
    float _1062 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2761, float3(0.0), isnan(_2761)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2761, float3(0.0), isnan(_2761)), level(0.0)).x;
    float _1064 = -_1040;
    float _1066 = fma(_1060, _1064, 1.0);
    float3 _2777 = float3(_1056, _1058, _1050);
    float4 _1069 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2777, float3(0.0), isnan(_2777)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2777, float3(0.0), isnan(_2777)), level(0.0)).xyzw;
    float _1071 = _1069.x;
    float _1073 = _1069.y;
    float _1075 = _1069.z;
    float _1077 = _1069.w;
    float2 _2794 = float2(_1066, _1044);
    float3 _1081 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2794, float2(0.0), isnan(_2794)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2794, float2(0.0), isnan(_2794)), level(0.0)).xyz;
    float _1083 = _1081.x;
    float _1085 = _1081.y;
    float _1087 = _1081.z;
    float _1089 = _962 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1091 = _968 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _1093 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1091);
    float _1095 = exp2(_1089);
    float _1097 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1093);
    float _1099 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1097);
    out.gl_Position.x = _1028;
    out.gl_Position.y = _1042;
    out.gl_Position.z = _1099;
    out.gl_Position.w = _1006;
    float _1101 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1103 = -_1095;
    float _1105 = _1103 + 1.0;
    out.m_61.w = _1101;
    float _1107 = _1105 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1109 = -_1107;
    float _1111 = _1109 + 1.0;
    float _1113 = _1107 * _1062;
    float _1115 = _1077 * _1113;
    float _1117 = _1087 * _1113;
    float _1119 = fma(_1083, _1115, _1071);
    float _1121 = fma(_1085, _1115, _1073);
    float _1123 = _1077 * _1111;
    float _1125 = fma(_1077, _1117, _1075);
    out.m_63.x = _1119;
    out.m_63.y = _1121;
    out.m_63.z = _1125;
    out.m_63.w = _1123;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

