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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_63 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_79 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_51 [[attribute(2)]];
    float4 m_55 [[attribute(3)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_71 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
    float4 m_49 [[attribute(11)]];
    float4 m_67 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1090 = false;
    bool _946 = false;
    bool _658 = false;
    bool _498 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    float _112 = _110;
    if (!_106)
    {
        out.m_45.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2374 = as_type<float>(_118);
        out.gl_Position.z = _2374;
    }
    if (!_106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_47.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = 0.0;
    if (_132)
    {
        float _140 = float(_102);
        _138 = _140;
    }
    float _142 = _138;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    if (_148)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _112;
    float _152 = _150;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _154 = _150 * 5.0;
        _120 = as_type<int>(_154);
    }
    int _156 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2443 = as_type<float>(_156);
        out.gl_Position.z = _2443;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _158 = in.m_47.x;
    float _160 = in.m_47.y;
    float _162 = in.m_47.z;
    float _164 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = _164;
    if (!_174)
    {
        float _178 = _164 * _164;
        float _180 = _178 * 0.5;
        _152 = _180;
    }
    float _182 = _152;
    float _184 = _182;
    if (!_174)
    {
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    bool _190 = !_174;
    float _192 = _188;
    if (!_190)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _164 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _164);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _222;
    }
    float _224 = _192;
    bool _226 = !_174;
    float _228 = _224;
    if (!_226)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _164 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _176 = _248;
    }
    float _250 = _176;
    float _252 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _254 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _258 = _250;
    if (!_174)
    {
        float _260 = _136 * _136;
        float _262 = _260 * 0.5;
        _228 = _262;
    }
    float _264 = _228;
    float _266 = fma(_250, _158, _252);
    float _268 = fma(_250, _160, _254);
    float _270 = fma(_250, _162, _256);
    float _272 = _264;
    if (!_174)
    {
        float _274 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _272 = _274;
    }
    float _276 = _272;
    bool _278 = !_174;
    float _280 = _276;
    if (!_278)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _136 * _284;
        float _294 = 1.0 / _288;
        float _296 = _290 * 0.693147182464599609375;
        float _298 = exp2(_292);
        float _300 = 1.0 / _296;
        float _302 = _298 + (-1.0);
        float _304 = -_302;
        float _306 = fma(_304, _300, _136);
        float _308 = _306 * _294;
        float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _310;
        _258 = _298;
    }
    float _312 = _280;
    float _314 = _258;
    float _316 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _318 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _320 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _322 = _314;
    if (!_174)
    {
        _322 = _136;
    }
    float _324 = _322;
    bool _326 = !_174;
    float _328 = _324;
    if (!_326)
    {
        float _330 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _332 = log2(_330);
        float _334 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _336 = _334 + 1.0;
        float _338 = 1.0 / _336;
        float _340 = _136 * _332;
        float _342 = exp2(_340);
        float _344 = -_342;
        float _346 = _344 + 1.0;
        float _348 = _346 * _338;
        _328 = _348;
    }
    float _350 = _328;
    float _352 = fma(_350, _160, _318);
    float _354 = fma(_350, _158, _316);
    float _356 = fma(_350, _162, _320);
    float _358 = in.m_49.y;
    float _360 = -_352;
    float _362 = _268 + _360;
    float _364 = -_354;
    float _366 = _266 + _364;
    float _368 = -_356;
    float _370 = _270 + _368;
    float _372 = in.m_51.y;
    float _374 = _362 * _362;
    float _376 = in.m_53.y;
    float _378 = fma(_366, _366, _374);
    float _380 = in.m_55.y;
    float _382 = fma(_370, _370, _378);
    float _384 = in.m_51.x;
    float _386 = sqrt(_382);
    float _388 = in.m_53.x;
    float _390 = in.m_55.x;
    float _392 = in.m_51.z;
    float _394 = _362 * _372;
    float _396 = in.m_53.z;
    float _398 = _362 * _376;
    bool _400 = _386 >= 9.9999999747524270787835121154785e-07;
    bool _402 = isnan(_386);
    bool _404 = _400 || _402;
    bool _406 = isnan(9.9999999747524270787835121154785e-07);
    bool _408 = _404 || _406;
    float _410 = in.m_55.z;
    float _412 = _362 * _380;
    float _414 = _372 * _372;
    float _416 = in.m_57.w;
    float _418 = fma(_366, _384, _394);
    float _420 = fma(_376, _376, _414);
    float _422 = in.m_42.x;
    float _424 = in.m_42.y;
    float _426 = in.m_42.z;
    float _428 = fma(_366, _388, _398);
    float _430 = fma(_380, _380, _420);
    out.m_59.y = _358;
    float _432 = fma(_366, _390, _412);
    float _434 = fma(_370, _392, _418);
    float _436 = fma(_370, _396, _428);
    float _438 = fma(_370, _410, _432);
    float _440 = fma(_266, _416, _422);
    float _442 = fma(_268, _416, _424);
    float _444 = fma(_270, _416, _426);
    float _446 = _436;
    float _448 = _434;
    float _450 = _438;
    float _452 = _434;
    float _454 = _436;
    float _456 = _438;
    float _458 = _358;
    if (!_408)
    {
        bool _460 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _462 = !_460;
        if (!_462)
        {
            float _464 = _372 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _466 = _376 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _468 = _380 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _470 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[16].x, _464);
            float _472 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[16].x, _466);
            float _474 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[16].x, _468);
            float _476 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[16].z, _470);
            float _478 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[16].z, _472);
            float _480 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[16].z, _474);
            float _482 = _476 * _476;
            float _484 = fma(_478, _478, _482);
            float _486 = fma(_480, _480, _484);
            float _488 = rsqrt(_486);
            float _490 = _488 * 9.9999999747524270787835121154785e-07;
            float _492 = _478 * _490;
            float _494 = _476 * _490;
            float _496 = _480 * _490;
            _452 = _494;
            _454 = _492;
            _456 = _496;
            _498 = true;
        }
        else
        {
            float _500 = _160 * _160;
            float _502 = fma(_158, _158, _500);
            float _504 = fma(_162, _162, _502);
            float _506 = sqrt(_504);
            bool _508 = _506 >= 9.9999999747524270787835121154785e-07;
            bool _510 = isnan(_506);
            bool _512 = _508 || _510;
            bool _514 = isnan(9.9999999747524270787835121154785e-07);
            bool _516 = _512 || _514;
            float _518 = _506;
            if (!_516)
            {
                float _520 = _424 * _424;
                float _522 = fma(_422, _422, _520);
                float _524 = fma(_426, _426, _522);
                float _526 = sqrt(_524);
                bool _528 = _526 >= 9.9999999747524270787835121154785e-07;
                bool _530 = isnan(_526);
                bool _532 = _528 || _530;
                bool _534 = isnan(9.9999999747524270787835121154785e-07);
                bool _536 = _532 || _534;
                float _538 = _430;
                if (!_536)
                {
                    float _540 = rsqrt(_430);
                    _538 = _540;
                }
                float _542 = _538;
                if (!_536)
                {
                    float _544 = _542 * 9.9999999747524270787835121154785e-07;
                    _518 = _544;
                }
                float _546 = _518;
                if (!_536)
                {
                    float _548 = _376 * _546;
                    _446 = _548;
                }
                float _550 = _446;
                _454 = _550;
                if (!_536)
                {
                    float _552 = _372 * _546;
                    _448 = _552;
                }
                float _554 = _448;
                _452 = _554;
                if (!_536)
                {
                    float _556 = _380 * _546;
                    _450 = _556;
                }
                float _558 = _450;
                bool _560 = !_536;
                _456 = _558;
                _498 = _560;
                if (!_498)
                {
                    float _562 = _372 * _424;
                    float _564 = _376 * _424;
                    float _566 = _380 * _424;
                    float _568 = fma(_422, _384, _562);
                    float _570 = fma(_422, _388, _564);
                    float _572 = fma(_422, _390, _566);
                    float _574 = fma(_426, _392, _568);
                    float _576 = fma(_426, _396, _570);
                    float _578 = fma(_426, _410, _572);
                    float _580 = _574 * _574;
                    float _582 = fma(_576, _576, _580);
                    float _584 = fma(_578, _578, _582);
                    float _586 = rsqrt(_584);
                    float _588 = _586 * 9.9999999747524270787835121154785e-07;
                    float _590 = _576 * _588;
                    float _592 = _574 * _588;
                    float _594 = _578 * _588;
                    _452 = _592;
                    _454 = _590;
                    _456 = _594;
                    _498 = true;
                }
            }
            else
            {
                float _596 = _372 * _160;
                float _598 = _376 * _160;
                float _600 = _380 * _160;
                float _602 = fma(_158, _384, _596);
                float _604 = fma(_158, _388, _598);
                float _606 = fma(_158, _390, _600);
                float _608 = fma(_162, _392, _602);
                float _610 = fma(_162, _396, _604);
                float _612 = fma(_162, _410, _606);
                float _614 = _608 * _608;
                float _616 = fma(_610, _610, _614);
                float _618 = fma(_612, _612, _616);
                float _620 = rsqrt(_618);
                float _622 = _620 * 9.9999999747524270787835121154785e-07;
                float _624 = _610 * _622;
                float _626 = _608 * _622;
                float _628 = _612 * _622;
                _452 = _626;
                _454 = _624;
                _456 = _628;
            }
        }
    }
    _498 = false;
    float _630 = _452;
    float _632 = _454;
    float _634 = _456;
    bool _636 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _638 = !_636;
    float _656;
    if (!_638)
    {
        float _640 = in.m_61.x;
        float _642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _644 = _640 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _646 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _648 = _646 * _642;
        float _650 = floor(_648);
        float _652 = -_650;
        float _654 = _648 + _652;
        _656 = _654;
        _658 = true;
    }
    else
    {
        float _660 = float(_102);
        float _662 = 1.0 / _660;
        float _664 = _136 * _662;
        _656 = _664;
    }
    _658 = false;
    float _666 = _656;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _670 = _666 + _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _674 = _666 + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _678 = _666 + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _680;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _686 = _684 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _696 = 1.0 / _682;
    bool _698 = _666 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _700 = isnan(_666);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = 1.0 / _686;
    bool _712 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _714 = 1.0 / _690;
    float _716 = _670 * _696;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _720 = _666 + _718;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _722;
    float _726 = fma(_724, _716, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _728 = 1.0 / _694;
    float _730 = _674 * _710;
    bool _732 = _666 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _734 = isnan(_666);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = -_742;
    float _746 = _744 + 1.0;
    float _748 = _678 * _714;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _750;
    float _754 = fma(_752, _716, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _756 = _720 * _728;
    bool _758 = _666 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _760 = isnan(_666);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    bool _770 = _666 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _772 = isnan(_666);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = _768 * _746;
    float _784 = -_768;
    float _786 = _784 + 1.0;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _788;
    float _792 = -_780;
    float _794 = _792 + 1.0;
    float _796 = _708 * _786;
    float _798 = -_708;
    float _800 = _798 + 1.0;
    float _802 = fma(_790, _716, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _804 = _666 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _806 = isnan(_666);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _820 = _780 * _800;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _830 = _814 * _794;
    float _832 = fma(_818, _730, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _834 = fma(_824, _730, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _836 = fma(_828, _730, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _838 = _802 * _830;
    float _840 = _726 * _830;
    float _842 = _754 * _830;
    float _844 = -_814;
    float _846 = _844 + 1.0;
    float _848 = in.m_57.x;
    float _850 = in.m_57.y;
    float _852 = in.m_57.z;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _854;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _858;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _862;
    float _866 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[143].x, _838);
    float _868 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[143].y, _840);
    float _870 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[143].z, _842);
    float _872 = fma(_856, _748, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _874 = fma(_860, _748, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _876 = fma(_864, _748, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _878 = fma(_832, _820, _866);
    float _880 = fma(_834, _820, _868);
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _892 = _890 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _894 = fma(_836, _820, _870);
    float _896 = fma(_884, _756, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _898 = fma(_888, _756, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _900 = fma(_872, _796, _878);
    float _902 = fma(_874, _796, _880);
    float _904 = fma(_892, _756, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _906 = fma(_876, _796, _894);
    float _908 = fma(_896, _782, _900);
    float _910 = fma(_898, _782, _902);
    float _912 = fma(_904, _782, _906);
    float _914 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[147].x, _908);
    float _916 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[147].y, _910);
    float _918 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[147].z, _912);
    float _920 = _914 * _848;
    float _922 = _916 * _850;
    float _924 = _918 * _852;
    bool _926 = !_712;
    float _944;
    if (!_926)
    {
        float _928 = in.m_61.x;
        float _930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _932 = _928 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[11].y, _136);
        float _936 = _934 * _930;
        float _938 = floor(_936);
        float _940 = -_938;
        float _942 = _936 + _940;
        _944 = _942;
        _946 = true;
    }
    else
    {
        float _948 = float(_102);
        float _950 = 1.0 / _948;
        float _952 = _136 * _950;
        _944 = _952;
    }
    _946 = false;
    float _954 = _944;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _958 = _954 + _956;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _964 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _966 = isnan(_954);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _980 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _982 = isnan(_954);
    bool _984 = _980 || _982;
    bool _986 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _988 = _984 || _986;
    float _990 = float(_988);
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _992;
    bool _996 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _998 = isnan(_954);
    bool _1000 = _996 || _998;
    bool _1002 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1004 = _1000 || _1002;
    float _1006 = float(_1004);
    float _1008 = 1.0 / _962;
    float _1010 = -_974;
    float _1012 = _1010 + 1.0;
    bool _1014 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1016 = _990 * _1012;
    float _1018 = -_990;
    float _1020 = _1018 + 1.0;
    float _1022 = 1.0 / _978;
    float _1024 = _994 * _1008;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1030 = fma(_1024, _958, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1032 = -_1006;
    float _1034 = _1032 + 1.0;
    float _1036 = _1030 * _1016;
    float _1038 = _1028 * _1022;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1042 = _954 + _1040;
    float _1044 = _974 * _1034;
    float _1046 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1036);
    float _1048 = fma(_1038, _1042, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1050 = fma(_1048, _1044, _1046);
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1058 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1050);
    float _1060 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1062 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1064 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1066 = _1058 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _1062;
    out.m_63.y = _1060;
    out.m_63.z = _1064;
    out.m_63.w = _1066;
    bool _1068 = !_1014;
    float _1070 = _1044;
    float _1088;
    if (!_1068)
    {
        float _1072 = in.m_61.x;
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1076 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[11].w, _136);
        float _1080 = _1078 * _1074;
        float _1082 = floor(_1080);
        float _1084 = -_1082;
        float _1086 = _1080 + _1084;
        _1088 = _1086;
        _1090 = true;
    }
    else
    {
        float _1092 = float(_102);
        float _1094 = 1.0 / _1092;
        float _1096 = _136 * _1094;
        _1088 = _1096;
    }
    _1090 = false;
    float _1098 = _1088;
    float _1100 = in.m_51.w;
    float _1102 = _442 * _372;
    float _1104 = _442 * _376;
    float _1106 = _442 * _380;
    float _1108 = in.m_53.w;
    float _1110 = fma(_440, _384, _1102);
    float _1112 = fma(_440, _388, _1104);
    float _1114 = fma(_440, _390, _1106);
    float _1116 = in.m_55.w;
    float _1118 = fma(_444, _392, _1110);
    float _1120 = _630 * _630;
    float _1122 = fma(_444, _396, _1112);
    float _1124 = fma(_444, _410, _1114);
    float _1126 = _920 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1128 = fma(_632, _632, _1120);
    float _1130 = _922 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1132 = _924 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1134 = fma(_634, _634, _1128);
    float _1136 = _1118 + _1100;
    float _1138 = rsqrt(_1134);
    float _1140 = _1122 + _1108;
    float _1142 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1144 = _1136 + _1142;
    float _1146 = _1124 + _1116;
    float _1148 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1150 = _1140 + _1148;
    float _1152 = _1144 * _1144;
    float _1154 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1156 = _1146 + _1154;
    float _1158 = fma(_1150, _1150, _1152);
    float _1160 = _1138 * _634;
    float _1162 = fma(_1156, _1156, _1158);
    float _1164 = _1138 * _632;
    float _1166 = _1138 * _630;
    float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1170 = _1160 * _1168;
    float _1172 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1176 = _1164 * _1174;
    float _1178 = rsqrt(_1162);
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1182 = _1166 * _1180;
    float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1186 = -_1170;
    float _1188 = fma(_1164, _1184, _1186);
    float _1190 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1192 = -_1176;
    float _1194 = fma(_1166, _1190, _1192);
    float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1198 = -_1182;
    float _1200 = fma(_1160, _1196, _1198);
    float _1202 = _1188 * _1188;
    float _1204 = fma(_1200, _1200, _1202);
    float _1206 = fma(_1194, _1194, _1204);
    float _1208 = _1172 * _1178;
    float _1210 = _1144 * _1208;
    float _1212 = _1150 * _1208;
    float _1214 = _1156 * _1208;
    float _1216 = rsqrt(_1206);
    float _1218 = -_1210;
    float _1220 = _1144 + _1218;
    float _1222 = -_1212;
    float _1224 = _1150 + _1222;
    float _1226 = -_1214;
    float _1228 = _1156 + _1226;
    float _1230 = _1220 * _1220;
    float _1232 = fma(_1224, _1224, _1230);
    float _1234 = in.m_65.x;
    float _1236 = in.m_65.y;
    float _1238 = in.m_65.z;
    float _1240 = fma(_1228, _1228, _1232);
    float _1242 = _1188 * _1216;
    float _1244 = _1200 * _1216;
    float _1246 = _1194 * _1216;
    float _1248 = sqrt(_1240);
    float _1250 = _1164 * _1242;
    float _1252 = _1166 * _1246;
    float _1254 = -_1250;
    float _1256 = fma(_1166, _1244, _1254);
    float _1258 = -_1252;
    float _1260 = fma(_1160, _1242, _1258);
    float _1262 = _1178 * _1248;
    float _1264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1236);
    float _1266 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1234);
    float _1268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1238);
    float _1270 = _1130 * _1262;
    float _1272 = _1126 * _1262;
    float _1274 = _1132 * _1262;
    float _1276 = _1270 * _1264;
    float _1278 = _1272 * _1266;
    float _1280 = _1274 * _1268;
    float _1282 = _1276 * _1160;
    float _1284 = _1276 * _1164;
    float _1286 = _1276 * _1166;
    float _1288 = fma(_1278, _1246, _1282);
    float _1290 = fma(_1278, _1244, _1284);
    float _1292 = fma(_1278, _1242, _1286);
    float _1294 = fma(_1280, _1256, _1288);
    float _1296 = fma(_1280, _1260, _1290);
    float _1298 = _1146 + _1294;
    float _1300 = _1140 + _1296;
    float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1304 = _1298 + _1302;
    float _1306 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1308 = _1300 + _1306;
    float _1310 = _1304 * _1304;
    float _1312 = fma(_1308, _1308, _1310);
    float _1314 = _1160 * _1244;
    float _1316 = sqrt(_1312);
    float _1318 = -_1314;
    float _1320 = fma(_1164, _1246, _1318);
    float _1322 = fma(_1280, _1320, _1292);
    float _1324 = _1136 + _1322;
    bool _1326 = _1316 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1328 = _1292;
    float _1330 = _1322;
    float _1332 = _1314;
    float _1334 = _1298;
    float _1336 = _1304;
    float _1338 = _1116;
    if (!_1326)
    {
        _1328 = _1300;
    }
    float _1340 = _1328;
    float _1342 = _1340;
    if (!_1326)
    {
        _1330 = _1298;
    }
    float _1344 = _1330;
    float _1346 = _1344;
    if (!_1326)
    {
        _1332 = _1324;
    }
    float _1348 = _1332;
    bool _1350 = !_1326;
    float _1352 = _1348;
    if (!_1350)
    {
        float _1354 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1356 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1358 = _1316 + _1356;
        float _1360 = rsqrt(_1312);
        float _1362 = _1358 * _1354;
        float _1364 = _1324 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1366 = _1362 * 0.15915493667125701904296875;
        float _1368 = _1366 * 6.283185482025146484375;
        float _1370 = cos(_1368);
        float _1372 = _1366 * 6.283185482025146484375;
        float _1374 = sin(_1372);
        float _1376 = _1370 + (-1.0);
        float _1378 = fma(_1374, _1364, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1380 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1382 = _1360 * _1378;
        float _1384 = fma(_1324, _1370, _1380);
        float _1386 = fma(_1308, _1382, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1388 = fma(_1304, _1382, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1352 = _1384;
        _1342 = _1386;
        _1346 = _1388;
        _1334 = _1366;
    }
    float _1390 = _1352;
    float _1392 = _1342;
    float _1394 = _1346;
    float _1396 = _1334;
    float _1398 = -_1210;
    float _1400 = _1398 + _1390;
    float _1402 = -_1212;
    float _1404 = _1402 + _1392;
    float _1406 = -_1214;
    float _1408 = _1406 + _1394;
    float _1410 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1412 = _1400 + _1410;
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1416 = _1404 + _1414;
    float _1418 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1420 = _1408 + _1418;
    float _1422 = _1412 * _1412;
    float _1424 = fma(_1416, _1416, _1422);
    float _1426 = fma(_1420, _1420, _1424);
    float _1428 = rsqrt(_1426);
    float _1430 = sqrt(_1426);
    float _1432 = _1428 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1434 = _1416 * _1432;
    float _1436 = _1420 * _1432;
    float _1438 = _1434 * _1434;
    float _1440 = _1436 * _1436;
    float _1442 = _1438 + _1440;
    float _1444 = sqrt(_1442);
    bool _1446 = _1444 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1450 = _1444 + _1448;
    float _1452 = _1396;
    float _1454 = _1450;
    if (_1446)
    {
        float _1456 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1452 = _1456;
    }
    float _1458 = _1452;
    if (_1446)
    {
        float _1460 = rsqrt(_1442);
        _1336 = _1460;
    }
    float _1462 = _1336;
    float _1464 = _1462;
    if (_1446)
    {
        float _1466 = _1450 * _1458;
        _1454 = _1466;
    }
    float _1468 = _1454;
    float _1470 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1446)
    {
        float _1472 = _1468 * 0.15915493667125701904296875;
        _1338 = _1472;
    }
    float _1474 = _1338;
    float _1476 = _1324;
    if (_1446)
    {
        float _1478 = _1474 * 6.283185482025146484375;
        float _1480 = sin(_1478);
        _1476 = _1480;
    }
    float _1482 = _1476;
    float _1484 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1486 = precise::max(0.0, _1484);
    float _1488 = _1308;
    float _1490 = _1484;
    float _1492 = _1486;
    if (_1446)
    {
        float _1494 = _1474 * 6.283185482025146484375;
        float _1496 = cos(_1494);
        _1488 = _1496;
    }
    float _1498 = _1488;
    if (!_1446)
    {
        _1490 = _1434;
    }
    float _1500 = _1490;
    float _1502 = -_1432;
    float _1504 = -_1486;
    float _1506 = fma(_1412, _1502, _1504);
    float _1508 = _1500;
    if (_1446)
    {
        float _1510 = _1506 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1492 = _1510;
    }
    float _1512 = _1492;
    float _1514 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1516 = _1482;
    float _1518 = _1512;
    if (_1446)
    {
        float _1520 = fma(_1482, _1512, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1070 = _1520;
    }
    float _1522 = _1070;
    float _1524 = _1522;
    if (!_1446)
    {
        _1516 = _1506;
    }
    float _1526 = _1516;
    float _1528 = _1526;
    float _1530 = _1498;
    if (_1446)
    {
        float _1532 = _1498 + (-1.0);
        _1518 = _1532;
    }
    float _1534 = _1518;
    float _1536 = _1534;
    if (_1446)
    {
        float _1538 = _1462 * _1522;
        _1524 = _1538;
    }
    float _1540 = _1524;
    if (_1446)
    {
        float _1542 = _1534 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1464 = _1542;
    }
    float _1544 = _1464;
    float _1546 = _1544;
    if (_1446)
    {
        float _1548 = _1434 * _1540;
        _1508 = _1548;
    }
    float _1550 = _1508;
    if (!_1446)
    {
        _1536 = _1436;
    }
    float _1552 = _1536;
    float _1554 = _1552;
    if (_1446)
    {
        float _1556 = _1436 * _1540;
        _1554 = _1556;
    }
    float _1558 = _1554;
    if (_1446)
    {
        float _1560 = fma(_1506, _1498, _1544);
        _1528 = _1560;
    }
    float _1562 = _1528;
    if (!_1446)
    {
        _1530 = _1438;
    }
    float _1564 = _1530;
    float _1566 = _1564;
    if (_1446)
    {
        float _1568 = _1550 * _1550;
        _1566 = _1568;
    }
    float _1570 = _1566;
    float _1572 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1446)
    {
        _1546 = _1440;
    }
    float _1574 = _1546;
    float _1576 = _1574;
    if (_1446)
    {
        float _1578 = _1558 * _1558;
        _1576 = _1578;
    }
    float _1580 = _1576;
    float _1582 = fma(_1562, _1562, _1570);
    float _1584 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1586 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1514);
    float _1588 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1572);
    float _1590 = _1582 + _1580;
    float _1592 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1584);
    float _1594 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1596 = fma(_1430, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1594);
    float _1598 = precise::clamp(_1596, 0.0, 1.0);
    float _1600 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1588);
    float _1602 = rsqrt(_1590);
    float _1604 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1592);
    float _1606 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1586);
    float _1608 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1610 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1470);
    float _1612 = _1604 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1614 = _1606 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1616 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1618 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1610);
    float _1620 = -_1598;
    float _1622 = _1620 + 1.0;
    float _1624 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1616);
    float _1626 = _1612 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1628 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1630 = _1618 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1632 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1624);
    float _1634 = _1602 * _1550;
    float _1636 = abs(_1622);
    float _1638 = log2(_1636);
    float _1640 = _1602 * _1562;
    float _1642 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1632);
    float _1644 = _1634 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1646 = _1602 * _1558;
    float _1648 = -_1626;
    float _1650 = fma(_1648, _1628, 1.0);
    float _1652 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1654 = -_1644;
    float _1656 = fma(_1640, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1654);
    float _1658 = 1.0 / _1642;
    float _1660 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1652);
    float _1662 = -_1646;
    float _1664 = fma(_1662, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1656);
    float _1666 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1668 = fma(_1664, -0.5, 0.5);
    float _1670 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1672 = log2(_1650);
    float _1674 = fma(_1664, 0.5, 0.5);
    float _1676 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1666);
    float _1678 = _1640 + 1.0;
    float _1680 = fma(_1674, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1682 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1676);
    float _1684 = sqrt(_1668);
    float _1686 = fma(_1674, _1680, -0.212114393711090087890625);
    float _1688 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1682);
    float _1690 = fma(_1674, _1686, 1.570728778839111328125);
    float _1692 = _1688 * _1658;
    float _1694 = exp2(_1670);
    float _1696 = _1672 * 0.693147182464599609375;
    float _1698 = fma(_1692, 0.5, 0.5);
    float _1700 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1702 = _1684 * 0.636619746685028076171875;
    float _1704 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1660);
    float _1706 = -_1690;
    float _1708 = fma(_1702, _1706, 1.0);
    float _1710 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1704);
    float _1712 = -_1640;
    float _1714 = fma(_1694, _1678, _1712);
    float _1716 = _1710 * _1658;
    float _1718 = fma(_1714, 0.5, 0.5);
    float _1720 = fma(_1716, -0.5, 0.5);
    float3 _4945 = float3(_1698, _1720, _1700);
    float _1722 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4945, float3(0.0), isnan(_4945)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4945, float3(0.0), isnan(_4945)), level(0.0)).x;
    float3 _4956 = float3(_1698, _1720, _1700);
    float4 _1725 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4956, float3(0.0), isnan(_4956)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4956, float3(0.0), isnan(_4956)), level(0.0)).xyzw;
    float _1727 = _1725.x;
    float _1729 = _1725.y;
    float _1731 = _1725.z;
    float _1733 = _1725.w;
    float2 _4973 = float2(_1708, _1718);
    float3 _1737 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4973, float2(0.0), isnan(_4973)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4973, float2(0.0), isnan(_4973)), level(0.0)).xyz;
    float _1739 = _1737.x;
    float _1741 = _1737.y;
    float _1743 = _1737.z;
    float _1745 = in.m_61.w;
    float _1747 = -_1210;
    float _1749 = _1136 + _1747;
    float _1751 = in.m_61.x;
    int _1753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1755 = _1753 != 0;
    float _1757 = -_1212;
    float _1759 = _1140 + _1757;
    float _1761 = in.m_61.y;
    int _1763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1765 = _1763 != 0;
    float _1767 = -_1214;
    float _1769 = _1146 + _1767;
    float _1771 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1775 = _1773 != 0;
    float _1777 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1779 = _1777 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1783 = _1781 != 0;
    float _1785 = in.m_67.w;
    float _1787 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1789 = 1.0 / _1779;
    float _1791 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1793 = _1791 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1795 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1797 = _1745 > 0.5;
    float _1799 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1801 = 1.0 / _1793;
    float _1803 = _1751 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1805 = fma(_1751, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1799);
    float _1807 = -_358;
    float _1809 = _1807 + 1.0;
    float _1811 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1813 = -_1771;
    float _1815 = fma(_1803, 2.0, _1813);
    float _1817 = _1761 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1819 = _1803;
    bool _1821 = _1797;
    if (_1755)
    {
        float _1823 = in.m_61.z;
        _1819 = _1823;
    }
    float _1825 = _1819;
    float _1827 = fma(_1761, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1811);
    float _1829 = fma(_1817, -2.0, _1795);
    float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1833 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1831;
    float _1835 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1837 = _1835 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    out.m_69.w = _1785;
    float _1839 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1829);
    float _1841 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1843 = _1841 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1845 = _1837 * _1801;
    int _1847 = _1797 ? as_type<int>(_1809) : as_type<int>(_358);
    float _1849 = _1833 * _1789;
    float _1851 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1805);
    float _1853 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1827);
    float _1855 = 1.0 / _1843;
    float _1857 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1859 = _1857 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1861 = in.m_49.x;
    bool _1863 = _1761 > 0.5;
    float _1865 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1867 = _1098 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1869 = isnan(_1098);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1875 = _1871 || _1873;
    float _1877 = float(_1875);
    float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1881 = _1879 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1883 = 1.0 / _1859;
    if (_1755)
    {
        bool _1885 = _1825 > 0.5;
        _1821 = _1885;
    }
    bool _1887 = _1821;
    float _1889 = -_136;
    float _1891 = fma(_1889, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1815);
    bool _1893 = _1098 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1895 = isnan(_1098);
    bool _1897 = _1893 || _1895;
    bool _1899 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1901 = _1897 || _1899;
    float _1903 = float(_1901);
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1907 = _1098 + _1905;
    bool _1909 = false;
    if (_1765)
    {
        bool _1911 = _1751 > 0.5;
        _1909 = _1911;
    }
    bool _1913 = _1909;
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1915;
    bool _1919 = _1098 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1921 = isnan(_1098);
    bool _1923 = _1919 || _1921;
    bool _1925 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1927 = _1923 || _1925;
    float _1929 = float(_1927);
    float _1931 = -_1903;
    float _1933 = _1931 + 1.0;
    float _1935 = _1881 * _1855;
    float _1937 = fma(_1849, _1907, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1939 = _1775 ? as_type<float>(_1847) : _358;
    float _1941 = _1877 * _1933;
    float _1943 = -_1877;
    float _1945 = _1943 + 1.0;
    bool _1947 = _1236 != 0.0;
    bool _1949 = isnan(_1236);
    bool _1951 = _1947 || _1949;
    bool _1953 = isnan(0.0);
    bool _1955 = _1951 || _1953;
    float _1957 = in.m_71.x;
    float _1959 = in.m_71.y;
    float _1961 = in.m_71.z;
    float _1963 = _1917 * _1883;
    bool _1965 = _1098 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1967 = isnan(_1098);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1973 = _1969 || _1971;
    float _1975 = float(_1973);
    float _1977 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1979 = _1234 == 0.0;
    bool _1981 = !_1955;
    bool _1983 = _1979 && _1981;
    float _1985 = _1929 * _1945;
    bool _1987 = _1098 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1989 = isnan(_1098);
    bool _1991 = _1987 || _1989;
    bool _1993 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1995 = _1991 || _1993;
    float _1997 = float(_1995);
    float _1999 = -_1975;
    float _2001 = _1999 + 1.0;
    bool _2003 = _1238 == 0.0;
    bool _2005 = _2003 && _1983;
    float _2007 = -_1929;
    float _2009 = _2007 + 1.0;
    float _2011 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2013 = _1098 + _2011;
    float _2015 = _1997 * _2001;
    float _2017 = -_1997;
    float _2019 = _2017 + 1.0;
    float _2021 = _1975 * _2009;
    float _2023 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2025 = _1098 + _2023;
    float _2027 = _1937 * _2015;
    float _2029 = fma(_1845, _2013, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2031 = _1963;
    if (_1783)
    {
        float _2033 = _1863 ? _1809 : _358;
        _458 = _2033;
    }
    float _2035 = _458;
    float _2037 = fma(_1963, _2025, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2039 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2027);
    float _2041 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2043 = _1861;
    if (!_1765)
    {
        _2031 = _1861;
    }
    float _2045 = _2031;
    float _2047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2049 = fma(_2029, _2021, _2039);
    float _2051 = _1957;
    float _2053 = _1959;
    float _2055 = _1961;
    float _2057 = _2045;
    if (!_2005)
    {
        float _2059 = fma(_1234, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1957);
        _2051 = _2059;
    }
    float _2061 = _2051;
    float _2063 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2065 = _1098 + _2063;
    int _2067 = as_type<int>(_2065);
    if (!_2005)
    {
        float _2069 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1959);
        _2053 = _2069;
    }
    float _2071 = _2053;
    float _2073 = fma(_2041, _2035, -0.5);
    float _2075 = fma(_2037, _1985, _2049);
    float _2077 = fma(_1935, _2065, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    if (_1765)
    {
        float _2079 = -_1861;
        float _2081 = _2079 + 1.0;
        _2067 = as_type<int>(_2081);
    }
    int _2083 = _2067;
    float _2085 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2087 = _2083;
    if (!_2005)
    {
        float _2089 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1961);
        _2055 = _2089;
    }
    float _2091 = _2055;
    float _2093 = fma(_2077, _1941, _2075);
    float _2095 = _1160 * _2071;
    if (_1765)
    {
        float _2097 = _1913 ? as_type<float>(_2083) : _1861;
        _2057 = _2097;
    }
    float _2099 = _2057;
    if (_1755)
    {
        float _2101 = -_1861;
        float _2103 = _2101 + 1.0;
        _2087 = as_type<int>(_2103);
    }
    int _2105 = _2087;
    float _2107 = fma(_1903, (*spvDescriptorSet0.vp_c9)._m0[135].x, _2093);
    float _2109 = fma(_1246, _2061, _2095);
    float _2111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2113 = _1164 * _2071;
    if (_1755)
    {
        float _2115 = _1887 ? as_type<float>(_2105) : _1861;
        _2043 = _2115;
    }
    float _2117 = _2043;
    float _2119 = _1166 * _2071;
    float _2121 = _1939 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2123 = fma(_1244, _2061, _2113);
    float _2125 = _2117 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2127 = fma(_1242, _2061, _2119);
    float _2129 = _2125 * _2085;
    float _2131 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2133 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2135 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2137 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2139 = _2121 * _2111;
    float _2141 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2131);
    float _2143 = fma(_1260, _2091, _2123);
    float _2145 = fma(_1320, _2091, _2127);
    float _2147 = _2133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2149 = _2135 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2151 = _2137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2153 = _2107 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2155 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2141);
    float _2157 = fma(_1256, _2091, _2109);
    float _2159 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2161 = _2047 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2163 = _2155 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_73.x = _2147;
    out.m_73.y = _2149;
    out.m_73.z = _2151;
    out.m_73.w = _2153;
    float _2165 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2159);
    float _2167 = fma(_2161, _2099, -0.5);
    float _2169 = 1.0 / _2163;
    out.m_75.x = _2143;
    out.m_75.y = _2145;
    out.m_75.z = _2157;
    bool _2171 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2173 = isnan(0.5);
    bool _2175 = _2171 || _2173;
    bool _2177 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2179 = _2175 || _2177;
    float _2181 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2165);
    float _2183 = -_1839;
    float _2185 = fma(_1853, _2073, _2183);
    float _2187 = fma(_1851, _2167, _1891);
    float _2189 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1865);
    float _2191 = _2181 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2193 = exp2(_1787);
    float _2195 = _2185 + 0.5;
    float _2197 = _2187 + 0.5;
    float _2199 = _2191 + _2163;
    float _2201 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2189);
    out.m_77.x = _2197;
    out.m_77.y = _2195;
    out.m_77.z = _2129;
    out.m_77.w = _2139;
    float _2203 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2201);
    float _2205 = _2199 * _2169;
    float _2207 = _2205 * 0.5;
    float _2209 = _2169;
    if (_2179)
    {
        _2209 = 1.0;
    }
    float _2211 = _2209;
    float _2213 = _2211;
    if (!_2179)
    {
        float _2215 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2217 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2219 = _2215 * 0.15915493667125701904296875;
        float _2221 = _2217 * 0.15915493667125701904296875;
        float _2223 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2225 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2223);
        float _2227 = _2219 * 6.283185482025146484375;
        float _2229 = cos(_2227);
        float _2231 = _2219 * 6.283185482025146484375;
        float _2233 = sin(_2231);
        float _2235 = 1.0 / _2229;
        float _2237 = _2221 * 6.283185482025146484375;
        float _2239 = cos(_2237);
        float _2241 = _2233 * _2235;
        float _2243 = _2221 * 6.283185482025146484375;
        float _2245 = sin(_2243);
        float _2247 = _2239 * _2241;
        float _2249 = 1.0 / _2225;
        float _2251 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2253 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2251;
        float _2255 = 1.0 / _2247;
        float _2257 = 1.0 / _2253;
        float _2259 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2261 = _2249 * _2259;
        float _2263 = _2245 * _2255;
        float _2265 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2267 = fma(_2263, _2261, _2265);
        float _2269 = _2267 * _2257;
        float _2271 = precise::clamp(_2269, 0.0, 1.0);
        _2213 = _2271;
    }
    float _2273 = _2213;
    float _2275 = -_2193;
    float _2277 = _2275 + 1.0;
    bool _2279 = _2273 > 0.0;
    bool _2281 = isnan(_2273);
    bool _2283 = _2279 || _2281;
    bool _2285 = isnan(0.0);
    bool _2287 = _2283 || _2285;
    float _2289 = _2273 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2291 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2293 = _2203 + _1642;
    out.m_79.x = _1416;
    out.m_79.y = _1412;
    out.m_79.z = _1420;
    float _2295 = _2291 * _1722;
    float _2297 = -_2291;
    float _2299 = _2297 + 1.0;
    out.gl_Position.x = _1688;
    out.gl_Position.y = _1710;
    out.gl_Position.z = _2203;
    out.gl_Position.w = _1642;
    float _2301 = _2293 * 0.5;
    float _2303 = _1733 * _2295;
    float _2305 = _1743 * _2295;
    float _2307 = _2289 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2309 = _1733 * _2299;
    out.m_81.z = _2301;
    out.m_81.w = _1642;
    float _2311 = fma(_1739, _2303, _1727);
    float _2313 = fma(_1741, _2303, _1729);
    float _2315 = fma(_1733, _2305, _1731);
    out.m_45.x = _2307;
    out.m_83.x = _2311;
    out.m_83.y = _2313;
    out.m_83.z = _2315;
    out.m_83.w = _2309;
    if (_2287)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2317 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2317;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1090 = false;
    bool _946 = false;
    bool _658 = false;
    bool _498 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    float _112 = _110;
    if (!_106)
    {
        out.m_45.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2374 = as_type<float>(_118);
        out.gl_Position.z = _2374;
    }
    if (!_106)
    {
        return out;
    }
    float _122 = in.m_47.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = 0.0;
    if (_132)
    {
        float _140 = float(_102);
        _138 = _140;
    }
    float _142 = _138;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    if (_148)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _112;
    float _152 = _150;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _154 = _150 * 5.0;
        _120 = as_type<int>(_154);
    }
    int _156 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2443 = as_type<float>(_156);
        out.gl_Position.z = _2443;
    }
    if (_148)
    {
        return out;
    }
    float _158 = in.m_47.x;
    float _160 = in.m_47.y;
    float _162 = in.m_47.z;
    float _164 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = _164;
    if (!_174)
    {
        float _178 = _164 * _164;
        float _180 = _178 * 0.5;
        _152 = _180;
    }
    float _182 = _152;
    float _184 = _182;
    if (!_174)
    {
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    bool _190 = !_174;
    float _192 = _188;
    if (!_190)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _164 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _164);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _222;
    }
    float _224 = _192;
    bool _226 = !_174;
    float _228 = _224;
    if (!_226)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _164 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _176 = _248;
    }
    float _250 = _176;
    float _252 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _254 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _258 = _250;
    if (!_174)
    {
        float _260 = _136 * _136;
        float _262 = _260 * 0.5;
        _228 = _262;
    }
    float _264 = _228;
    float _266 = fma(_250, _158, _252);
    float _268 = fma(_250, _160, _254);
    float _270 = fma(_250, _162, _256);
    float _272 = _264;
    if (!_174)
    {
        float _274 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _272 = _274;
    }
    float _276 = _272;
    bool _278 = !_174;
    float _280 = _276;
    if (!_278)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _136 * _284;
        float _294 = 1.0 / _288;
        float _296 = _290 * 0.693147182464599609375;
        float _298 = exp2(_292);
        float _300 = 1.0 / _296;
        float _302 = _298 + (-1.0);
        float _304 = -_302;
        float _306 = fma(_304, _300, _136);
        float _308 = _306 * _294;
        float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _310;
        _258 = _298;
    }
    float _312 = _280;
    float _314 = _258;
    float _316 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _318 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _320 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _322 = _314;
    if (!_174)
    {
        _322 = _136;
    }
    float _324 = _322;
    bool _326 = !_174;
    float _328 = _324;
    if (!_326)
    {
        float _330 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _332 = log2(_330);
        float _334 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _336 = _334 + 1.0;
        float _338 = 1.0 / _336;
        float _340 = _136 * _332;
        float _342 = exp2(_340);
        float _344 = -_342;
        float _346 = _344 + 1.0;
        float _348 = _346 * _338;
        _328 = _348;
    }
    float _350 = _328;
    float _352 = fma(_350, _160, _318);
    float _354 = fma(_350, _158, _316);
    float _356 = fma(_350, _162, _320);
    float _358 = in.m_49.y;
    float _360 = -_352;
    float _362 = _268 + _360;
    float _364 = -_354;
    float _366 = _266 + _364;
    float _368 = -_356;
    float _370 = _270 + _368;
    float _372 = in.m_51.y;
    float _374 = _362 * _362;
    float _376 = in.m_53.y;
    float _378 = fma(_366, _366, _374);
    float _380 = in.m_55.y;
    float _382 = fma(_370, _370, _378);
    float _384 = in.m_51.x;
    float _386 = sqrt(_382);
    float _388 = in.m_53.x;
    float _390 = in.m_55.x;
    float _392 = in.m_51.z;
    float _394 = _362 * _372;
    float _396 = in.m_53.z;
    float _398 = _362 * _376;
    bool _400 = _386 >= 9.9999999747524270787835121154785e-07;
    bool _402 = isnan(_386);
    bool _404 = _400 || _402;
    bool _406 = isnan(9.9999999747524270787835121154785e-07);
    bool _408 = _404 || _406;
    float _410 = in.m_55.z;
    float _412 = _362 * _380;
    float _414 = _372 * _372;
    float _416 = in.m_57.w;
    float _418 = fma(_366, _384, _394);
    float _420 = fma(_376, _376, _414);
    float _422 = in.m_42.x;
    float _424 = in.m_42.y;
    float _426 = in.m_42.z;
    float _428 = fma(_366, _388, _398);
    float _430 = fma(_380, _380, _420);
    out.m_59.y = _358;
    float _432 = fma(_366, _390, _412);
    float _434 = fma(_370, _392, _418);
    float _436 = fma(_370, _396, _428);
    float _438 = fma(_370, _410, _432);
    float _440 = fma(_266, _416, _422);
    float _442 = fma(_268, _416, _424);
    float _444 = fma(_270, _416, _426);
    float _446 = _436;
    float _448 = _434;
    float _450 = _438;
    float _452 = _434;
    float _454 = _436;
    float _456 = _438;
    float _458 = _358;
    if (!_408)
    {
        bool _460 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _462 = !_460;
        if (!_462)
        {
            float _464 = _372 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _466 = _376 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _468 = _380 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _470 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[16].x, _464);
            float _472 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[16].x, _466);
            float _474 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[16].x, _468);
            float _476 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[16].z, _470);
            float _478 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[16].z, _472);
            float _480 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[16].z, _474);
            float _482 = _476 * _476;
            float _484 = fma(_478, _478, _482);
            float _486 = fma(_480, _480, _484);
            float _488 = rsqrt(_486);
            float _490 = _488 * 9.9999999747524270787835121154785e-07;
            float _492 = _478 * _490;
            float _494 = _476 * _490;
            float _496 = _480 * _490;
            _452 = _494;
            _454 = _492;
            _456 = _496;
            _498 = true;
        }
        else
        {
            float _500 = _160 * _160;
            float _502 = fma(_158, _158, _500);
            float _504 = fma(_162, _162, _502);
            float _506 = sqrt(_504);
            bool _508 = _506 >= 9.9999999747524270787835121154785e-07;
            bool _510 = isnan(_506);
            bool _512 = _508 || _510;
            bool _514 = isnan(9.9999999747524270787835121154785e-07);
            bool _516 = _512 || _514;
            float _518 = _506;
            if (!_516)
            {
                float _520 = _424 * _424;
                float _522 = fma(_422, _422, _520);
                float _524 = fma(_426, _426, _522);
                float _526 = sqrt(_524);
                bool _528 = _526 >= 9.9999999747524270787835121154785e-07;
                bool _530 = isnan(_526);
                bool _532 = _528 || _530;
                bool _534 = isnan(9.9999999747524270787835121154785e-07);
                bool _536 = _532 || _534;
                float _538 = _430;
                if (!_536)
                {
                    float _540 = rsqrt(_430);
                    _538 = _540;
                }
                float _542 = _538;
                if (!_536)
                {
                    float _544 = _542 * 9.9999999747524270787835121154785e-07;
                    _518 = _544;
                }
                float _546 = _518;
                if (!_536)
                {
                    float _548 = _376 * _546;
                    _446 = _548;
                }
                float _550 = _446;
                _454 = _550;
                if (!_536)
                {
                    float _552 = _372 * _546;
                    _448 = _552;
                }
                float _554 = _448;
                _452 = _554;
                if (!_536)
                {
                    float _556 = _380 * _546;
                    _450 = _556;
                }
                float _558 = _450;
                bool _560 = !_536;
                _456 = _558;
                _498 = _560;
                if (!_498)
                {
                    float _562 = _372 * _424;
                    float _564 = _376 * _424;
                    float _566 = _380 * _424;
                    float _568 = fma(_422, _384, _562);
                    float _570 = fma(_422, _388, _564);
                    float _572 = fma(_422, _390, _566);
                    float _574 = fma(_426, _392, _568);
                    float _576 = fma(_426, _396, _570);
                    float _578 = fma(_426, _410, _572);
                    float _580 = _574 * _574;
                    float _582 = fma(_576, _576, _580);
                    float _584 = fma(_578, _578, _582);
                    float _586 = rsqrt(_584);
                    float _588 = _586 * 9.9999999747524270787835121154785e-07;
                    float _590 = _576 * _588;
                    float _592 = _574 * _588;
                    float _594 = _578 * _588;
                    _452 = _592;
                    _454 = _590;
                    _456 = _594;
                    _498 = true;
                }
            }
            else
            {
                float _596 = _372 * _160;
                float _598 = _376 * _160;
                float _600 = _380 * _160;
                float _602 = fma(_158, _384, _596);
                float _604 = fma(_158, _388, _598);
                float _606 = fma(_158, _390, _600);
                float _608 = fma(_162, _392, _602);
                float _610 = fma(_162, _396, _604);
                float _612 = fma(_162, _410, _606);
                float _614 = _608 * _608;
                float _616 = fma(_610, _610, _614);
                float _618 = fma(_612, _612, _616);
                float _620 = rsqrt(_618);
                float _622 = _620 * 9.9999999747524270787835121154785e-07;
                float _624 = _610 * _622;
                float _626 = _608 * _622;
                float _628 = _612 * _622;
                _452 = _626;
                _454 = _624;
                _456 = _628;
            }
        }
    }
    _498 = false;
    float _630 = _452;
    float _632 = _454;
    float _634 = _456;
    bool _636 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _638 = !_636;
    float _656;
    if (!_638)
    {
        float _640 = in.m_61.x;
        float _642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _644 = _640 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _646 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _648 = _646 * _642;
        float _650 = floor(_648);
        float _652 = -_650;
        float _654 = _648 + _652;
        _656 = _654;
        _658 = true;
    }
    else
    {
        float _660 = float(_102);
        float _662 = 1.0 / _660;
        float _664 = _136 * _662;
        _656 = _664;
    }
    _658 = false;
    float _666 = _656;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _670 = _666 + _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _674 = _666 + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _678 = _666 + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _680;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _686 = _684 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _696 = 1.0 / _682;
    bool _698 = _666 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _700 = isnan(_666);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = 1.0 / _686;
    bool _712 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _714 = 1.0 / _690;
    float _716 = _670 * _696;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _720 = _666 + _718;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _722;
    float _726 = fma(_724, _716, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _728 = 1.0 / _694;
    float _730 = _674 * _710;
    bool _732 = _666 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _734 = isnan(_666);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = -_742;
    float _746 = _744 + 1.0;
    float _748 = _678 * _714;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _750;
    float _754 = fma(_752, _716, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _756 = _720 * _728;
    bool _758 = _666 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _760 = isnan(_666);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    bool _770 = _666 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _772 = isnan(_666);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = _768 * _746;
    float _784 = -_768;
    float _786 = _784 + 1.0;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _788;
    float _792 = -_780;
    float _794 = _792 + 1.0;
    float _796 = _708 * _786;
    float _798 = -_708;
    float _800 = _798 + 1.0;
    float _802 = fma(_790, _716, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _804 = _666 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _806 = isnan(_666);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _820 = _780 * _800;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _830 = _814 * _794;
    float _832 = fma(_818, _730, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _834 = fma(_824, _730, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _836 = fma(_828, _730, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _838 = _802 * _830;
    float _840 = _726 * _830;
    float _842 = _754 * _830;
    float _844 = -_814;
    float _846 = _844 + 1.0;
    float _848 = in.m_57.x;
    float _850 = in.m_57.y;
    float _852 = in.m_57.z;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _854;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _858;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _862;
    float _866 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[143].x, _838);
    float _868 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[143].y, _840);
    float _870 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[143].z, _842);
    float _872 = fma(_856, _748, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _874 = fma(_860, _748, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _876 = fma(_864, _748, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _878 = fma(_832, _820, _866);
    float _880 = fma(_834, _820, _868);
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _892 = _890 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _894 = fma(_836, _820, _870);
    float _896 = fma(_884, _756, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _898 = fma(_888, _756, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _900 = fma(_872, _796, _878);
    float _902 = fma(_874, _796, _880);
    float _904 = fma(_892, _756, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _906 = fma(_876, _796, _894);
    float _908 = fma(_896, _782, _900);
    float _910 = fma(_898, _782, _902);
    float _912 = fma(_904, _782, _906);
    float _914 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[147].x, _908);
    float _916 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[147].y, _910);
    float _918 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[147].z, _912);
    float _920 = _914 * _848;
    float _922 = _916 * _850;
    float _924 = _918 * _852;
    bool _926 = !_712;
    float _944;
    if (!_926)
    {
        float _928 = in.m_61.x;
        float _930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _932 = _928 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[11].y, _136);
        float _936 = _934 * _930;
        float _938 = floor(_936);
        float _940 = -_938;
        float _942 = _936 + _940;
        _944 = _942;
        _946 = true;
    }
    else
    {
        float _948 = float(_102);
        float _950 = 1.0 / _948;
        float _952 = _136 * _950;
        _944 = _952;
    }
    _946 = false;
    float _954 = _944;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _958 = _954 + _956;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _964 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _966 = isnan(_954);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _980 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _982 = isnan(_954);
    bool _984 = _980 || _982;
    bool _986 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _988 = _984 || _986;
    float _990 = float(_988);
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _992;
    bool _996 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _998 = isnan(_954);
    bool _1000 = _996 || _998;
    bool _1002 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1004 = _1000 || _1002;
    float _1006 = float(_1004);
    float _1008 = 1.0 / _962;
    float _1010 = -_974;
    float _1012 = _1010 + 1.0;
    bool _1014 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1016 = _990 * _1012;
    float _1018 = -_990;
    float _1020 = _1018 + 1.0;
    float _1022 = 1.0 / _978;
    float _1024 = _994 * _1008;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1030 = fma(_1024, _958, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1032 = -_1006;
    float _1034 = _1032 + 1.0;
    float _1036 = _1030 * _1016;
    float _1038 = _1028 * _1022;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1042 = _954 + _1040;
    float _1044 = _974 * _1034;
    float _1046 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1036);
    float _1048 = fma(_1038, _1042, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1050 = fma(_1048, _1044, _1046);
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1058 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1050);
    float _1060 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1062 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1064 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1066 = _1058 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _1062;
    out.m_63.y = _1060;
    out.m_63.z = _1064;
    out.m_63.w = _1066;
    bool _1068 = !_1014;
    float _1070 = _1044;
    float _1088;
    if (!_1068)
    {
        float _1072 = in.m_61.x;
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1076 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[11].w, _136);
        float _1080 = _1078 * _1074;
        float _1082 = floor(_1080);
        float _1084 = -_1082;
        float _1086 = _1080 + _1084;
        _1088 = _1086;
        _1090 = true;
    }
    else
    {
        float _1092 = float(_102);
        float _1094 = 1.0 / _1092;
        float _1096 = _136 * _1094;
        _1088 = _1096;
    }
    _1090 = false;
    float _1098 = _1088;
    float _1100 = in.m_51.w;
    float _1102 = _442 * _372;
    float _1104 = _442 * _376;
    float _1106 = _442 * _380;
    float _1108 = in.m_53.w;
    float _1110 = fma(_440, _384, _1102);
    float _1112 = fma(_440, _388, _1104);
    float _1114 = fma(_440, _390, _1106);
    float _1116 = in.m_55.w;
    float _1118 = fma(_444, _392, _1110);
    float _1120 = _630 * _630;
    float _1122 = fma(_444, _396, _1112);
    float _1124 = fma(_444, _410, _1114);
    float _1126 = _920 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1128 = fma(_632, _632, _1120);
    float _1130 = _922 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1132 = _924 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1134 = fma(_634, _634, _1128);
    float _1136 = _1118 + _1100;
    float _1138 = rsqrt(_1134);
    float _1140 = _1122 + _1108;
    float _1142 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1144 = _1136 + _1142;
    float _1146 = _1124 + _1116;
    float _1148 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1150 = _1140 + _1148;
    float _1152 = _1144 * _1144;
    float _1154 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1156 = _1146 + _1154;
    float _1158 = fma(_1150, _1150, _1152);
    float _1160 = _1138 * _634;
    float _1162 = fma(_1156, _1156, _1158);
    float _1164 = _1138 * _632;
    float _1166 = _1138 * _630;
    float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1170 = _1160 * _1168;
    float _1172 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1176 = _1164 * _1174;
    float _1178 = rsqrt(_1162);
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1182 = _1166 * _1180;
    float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1186 = -_1170;
    float _1188 = fma(_1164, _1184, _1186);
    float _1190 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1192 = -_1176;
    float _1194 = fma(_1166, _1190, _1192);
    float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1198 = -_1182;
    float _1200 = fma(_1160, _1196, _1198);
    float _1202 = _1188 * _1188;
    float _1204 = fma(_1200, _1200, _1202);
    float _1206 = fma(_1194, _1194, _1204);
    float _1208 = _1172 * _1178;
    float _1210 = _1144 * _1208;
    float _1212 = _1150 * _1208;
    float _1214 = _1156 * _1208;
    float _1216 = rsqrt(_1206);
    float _1218 = -_1210;
    float _1220 = _1144 + _1218;
    float _1222 = -_1212;
    float _1224 = _1150 + _1222;
    float _1226 = -_1214;
    float _1228 = _1156 + _1226;
    float _1230 = _1220 * _1220;
    float _1232 = fma(_1224, _1224, _1230);
    float _1234 = in.m_65.x;
    float _1236 = in.m_65.y;
    float _1238 = in.m_65.z;
    float _1240 = fma(_1228, _1228, _1232);
    float _1242 = _1188 * _1216;
    float _1244 = _1200 * _1216;
    float _1246 = _1194 * _1216;
    float _1248 = sqrt(_1240);
    float _1250 = _1164 * _1242;
    float _1252 = _1166 * _1246;
    float _1254 = -_1250;
    float _1256 = fma(_1166, _1244, _1254);
    float _1258 = -_1252;
    float _1260 = fma(_1160, _1242, _1258);
    float _1262 = _1178 * _1248;
    float _1264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1236);
    float _1266 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1234);
    float _1268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1238);
    float _1270 = _1130 * _1262;
    float _1272 = _1126 * _1262;
    float _1274 = _1132 * _1262;
    float _1276 = _1270 * _1264;
    float _1278 = _1272 * _1266;
    float _1280 = _1274 * _1268;
    float _1282 = _1276 * _1160;
    float _1284 = _1276 * _1164;
    float _1286 = _1276 * _1166;
    float _1288 = fma(_1278, _1246, _1282);
    float _1290 = fma(_1278, _1244, _1284);
    float _1292 = fma(_1278, _1242, _1286);
    float _1294 = fma(_1280, _1256, _1288);
    float _1296 = fma(_1280, _1260, _1290);
    float _1298 = _1146 + _1294;
    float _1300 = _1140 + _1296;
    float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1304 = _1298 + _1302;
    float _1306 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1308 = _1300 + _1306;
    float _1310 = _1304 * _1304;
    float _1312 = fma(_1308, _1308, _1310);
    float _1314 = _1160 * _1244;
    float _1316 = sqrt(_1312);
    float _1318 = -_1314;
    float _1320 = fma(_1164, _1246, _1318);
    float _1322 = fma(_1280, _1320, _1292);
    float _1324 = _1136 + _1322;
    bool _1326 = _1316 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1328 = _1292;
    float _1330 = _1322;
    float _1332 = _1314;
    float _1334 = _1298;
    float _1336 = _1304;
    float _1338 = _1116;
    if (!_1326)
    {
        _1328 = _1300;
    }
    float _1340 = _1328;
    float _1342 = _1340;
    if (!_1326)
    {
        _1330 = _1298;
    }
    float _1344 = _1330;
    float _1346 = _1344;
    if (!_1326)
    {
        _1332 = _1324;
    }
    float _1348 = _1332;
    bool _1350 = !_1326;
    float _1352 = _1348;
    if (!_1350)
    {
        float _1354 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1356 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1358 = _1316 + _1356;
        float _1360 = rsqrt(_1312);
        float _1362 = _1358 * _1354;
        float _1364 = _1324 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1366 = _1362 * 0.15915493667125701904296875;
        float _1368 = _1366 * 6.283185482025146484375;
        float _1370 = cos(_1368);
        float _1372 = _1366 * 6.283185482025146484375;
        float _1374 = sin(_1372);
        float _1376 = _1370 + (-1.0);
        float _1378 = fma(_1374, _1364, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1380 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1382 = _1360 * _1378;
        float _1384 = fma(_1324, _1370, _1380);
        float _1386 = fma(_1308, _1382, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1388 = fma(_1304, _1382, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1352 = _1384;
        _1342 = _1386;
        _1346 = _1388;
        _1334 = _1366;
    }
    float _1390 = _1352;
    float _1392 = _1342;
    float _1394 = _1346;
    float _1396 = _1334;
    float _1398 = -_1210;
    float _1400 = _1398 + _1390;
    float _1402 = -_1212;
    float _1404 = _1402 + _1392;
    float _1406 = -_1214;
    float _1408 = _1406 + _1394;
    float _1410 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1412 = _1400 + _1410;
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1416 = _1404 + _1414;
    float _1418 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1420 = _1408 + _1418;
    float _1422 = _1412 * _1412;
    float _1424 = fma(_1416, _1416, _1422);
    float _1426 = fma(_1420, _1420, _1424);
    float _1428 = rsqrt(_1426);
    float _1430 = sqrt(_1426);
    float _1432 = _1428 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1434 = _1416 * _1432;
    float _1436 = _1420 * _1432;
    float _1438 = _1434 * _1434;
    float _1440 = _1436 * _1436;
    float _1442 = _1438 + _1440;
    float _1444 = sqrt(_1442);
    bool _1446 = _1444 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1450 = _1444 + _1448;
    float _1452 = _1396;
    float _1454 = _1450;
    if (_1446)
    {
        float _1456 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1452 = _1456;
    }
    float _1458 = _1452;
    if (_1446)
    {
        float _1460 = rsqrt(_1442);
        _1336 = _1460;
    }
    float _1462 = _1336;
    float _1464 = _1462;
    if (_1446)
    {
        float _1466 = _1450 * _1458;
        _1454 = _1466;
    }
    float _1468 = _1454;
    float _1470 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1446)
    {
        float _1472 = _1468 * 0.15915493667125701904296875;
        _1338 = _1472;
    }
    float _1474 = _1338;
    float _1476 = _1324;
    if (_1446)
    {
        float _1478 = _1474 * 6.283185482025146484375;
        float _1480 = sin(_1478);
        _1476 = _1480;
    }
    float _1482 = _1476;
    float _1484 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1486 = precise::max(0.0, _1484);
    float _1488 = _1308;
    float _1490 = _1484;
    float _1492 = _1486;
    if (_1446)
    {
        float _1494 = _1474 * 6.283185482025146484375;
        float _1496 = cos(_1494);
        _1488 = _1496;
    }
    float _1498 = _1488;
    if (!_1446)
    {
        _1490 = _1434;
    }
    float _1500 = _1490;
    float _1502 = -_1432;
    float _1504 = -_1486;
    float _1506 = fma(_1412, _1502, _1504);
    float _1508 = _1500;
    if (_1446)
    {
        float _1510 = _1506 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1492 = _1510;
    }
    float _1512 = _1492;
    float _1514 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1516 = _1482;
    float _1518 = _1512;
    if (_1446)
    {
        float _1520 = fma(_1482, _1512, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1070 = _1520;
    }
    float _1522 = _1070;
    float _1524 = _1522;
    if (!_1446)
    {
        _1516 = _1506;
    }
    float _1526 = _1516;
    float _1528 = _1526;
    float _1530 = _1498;
    if (_1446)
    {
        float _1532 = _1498 + (-1.0);
        _1518 = _1532;
    }
    float _1534 = _1518;
    float _1536 = _1534;
    if (_1446)
    {
        float _1538 = _1462 * _1522;
        _1524 = _1538;
    }
    float _1540 = _1524;
    if (_1446)
    {
        float _1542 = _1534 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1464 = _1542;
    }
    float _1544 = _1464;
    float _1546 = _1544;
    if (_1446)
    {
        float _1548 = _1434 * _1540;
        _1508 = _1548;
    }
    float _1550 = _1508;
    if (!_1446)
    {
        _1536 = _1436;
    }
    float _1552 = _1536;
    float _1554 = _1552;
    if (_1446)
    {
        float _1556 = _1436 * _1540;
        _1554 = _1556;
    }
    float _1558 = _1554;
    if (_1446)
    {
        float _1560 = fma(_1506, _1498, _1544);
        _1528 = _1560;
    }
    float _1562 = _1528;
    if (!_1446)
    {
        _1530 = _1438;
    }
    float _1564 = _1530;
    float _1566 = _1564;
    if (_1446)
    {
        float _1568 = _1550 * _1550;
        _1566 = _1568;
    }
    float _1570 = _1566;
    float _1572 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1446)
    {
        _1546 = _1440;
    }
    float _1574 = _1546;
    float _1576 = _1574;
    if (_1446)
    {
        float _1578 = _1558 * _1558;
        _1576 = _1578;
    }
    float _1580 = _1576;
    float _1582 = fma(_1562, _1562, _1570);
    float _1584 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1586 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1514);
    float _1588 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1572);
    float _1590 = _1582 + _1580;
    float _1592 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1584);
    float _1594 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1596 = fma(_1430, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1594);
    float _1598 = precise::clamp(_1596, 0.0, 1.0);
    float _1600 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1588);
    float _1602 = rsqrt(_1590);
    float _1604 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1592);
    float _1606 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1586);
    float _1608 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1610 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1470);
    float _1612 = _1604 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1614 = _1606 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1616 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1618 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1610);
    float _1620 = -_1598;
    float _1622 = _1620 + 1.0;
    float _1624 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1616);
    float _1626 = _1612 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1628 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1630 = _1618 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1632 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1624);
    float _1634 = _1602 * _1550;
    float _1636 = abs(_1622);
    float _1638 = log2(_1636);
    float _1640 = _1602 * _1562;
    float _1642 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1632);
    float _1644 = _1634 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1646 = _1602 * _1558;
    float _1648 = -_1626;
    float _1650 = fma(_1648, _1628, 1.0);
    float _1652 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1654 = -_1644;
    float _1656 = fma(_1640, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1654);
    float _1658 = 1.0 / _1642;
    float _1660 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1652);
    float _1662 = -_1646;
    float _1664 = fma(_1662, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1656);
    float _1666 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1668 = fma(_1664, -0.5, 0.5);
    float _1670 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1672 = log2(_1650);
    float _1674 = fma(_1664, 0.5, 0.5);
    float _1676 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1666);
    float _1678 = _1640 + 1.0;
    float _1680 = fma(_1674, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1682 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1676);
    float _1684 = sqrt(_1668);
    float _1686 = fma(_1674, _1680, -0.212114393711090087890625);
    float _1688 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1682);
    float _1690 = fma(_1674, _1686, 1.570728778839111328125);
    float _1692 = _1688 * _1658;
    float _1694 = exp2(_1670);
    float _1696 = _1672 * 0.693147182464599609375;
    float _1698 = fma(_1692, 0.5, 0.5);
    float _1700 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1702 = _1684 * 0.636619746685028076171875;
    float _1704 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1660);
    float _1706 = -_1690;
    float _1708 = fma(_1702, _1706, 1.0);
    float _1710 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1704);
    float _1712 = -_1640;
    float _1714 = fma(_1694, _1678, _1712);
    float _1716 = _1710 * _1658;
    float _1718 = fma(_1714, 0.5, 0.5);
    float _1720 = fma(_1716, -0.5, 0.5);
    float3 _4945 = float3(_1698, _1720, _1700);
    float _1722 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4945, float3(0.0), isnan(_4945)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4945, float3(0.0), isnan(_4945)), level(0.0)).x;
    float3 _4956 = float3(_1698, _1720, _1700);
    float4 _1725 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4956, float3(0.0), isnan(_4956)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4956, float3(0.0), isnan(_4956)), level(0.0)).xyzw;
    float _1727 = _1725.x;
    float _1729 = _1725.y;
    float _1731 = _1725.z;
    float _1733 = _1725.w;
    float2 _4973 = float2(_1708, _1718);
    float3 _1737 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4973, float2(0.0), isnan(_4973)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4973, float2(0.0), isnan(_4973)), level(0.0)).xyz;
    float _1739 = _1737.x;
    float _1741 = _1737.y;
    float _1743 = _1737.z;
    float _1745 = in.m_61.w;
    float _1747 = -_1210;
    float _1749 = _1136 + _1747;
    float _1751 = in.m_61.x;
    int _1753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1755 = _1753 != 0;
    float _1757 = -_1212;
    float _1759 = _1140 + _1757;
    float _1761 = in.m_61.y;
    int _1763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1765 = _1763 != 0;
    float _1767 = -_1214;
    float _1769 = _1146 + _1767;
    float _1771 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1775 = _1773 != 0;
    float _1777 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1779 = _1777 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1783 = _1781 != 0;
    float _1785 = in.m_67.w;
    float _1787 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1789 = 1.0 / _1779;
    float _1791 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1793 = _1791 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1795 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1797 = _1745 > 0.5;
    float _1799 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1801 = 1.0 / _1793;
    float _1803 = _1751 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1805 = fma(_1751, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1799);
    float _1807 = -_358;
    float _1809 = _1807 + 1.0;
    float _1811 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1813 = -_1771;
    float _1815 = fma(_1803, 2.0, _1813);
    float _1817 = _1761 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1819 = _1803;
    bool _1821 = _1797;
    if (_1755)
    {
        float _1823 = in.m_61.z;
        _1819 = _1823;
    }
    float _1825 = _1819;
    float _1827 = fma(_1761, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1811);
    float _1829 = fma(_1817, -2.0, _1795);
    float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1833 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1831;
    float _1835 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1837 = _1835 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    out.m_69.w = _1785;
    float _1839 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1829);
    float _1841 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1843 = _1841 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1845 = _1837 * _1801;
    int _1847 = _1797 ? as_type<int>(_1809) : as_type<int>(_358);
    float _1849 = _1833 * _1789;
    float _1851 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1805);
    float _1853 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1827);
    float _1855 = 1.0 / _1843;
    float _1857 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1859 = _1857 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1861 = in.m_49.x;
    bool _1863 = _1761 > 0.5;
    float _1865 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1867 = _1098 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1869 = isnan(_1098);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1875 = _1871 || _1873;
    float _1877 = float(_1875);
    float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1881 = _1879 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1883 = 1.0 / _1859;
    if (_1755)
    {
        bool _1885 = _1825 > 0.5;
        _1821 = _1885;
    }
    bool _1887 = _1821;
    float _1889 = -_136;
    float _1891 = fma(_1889, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1815);
    bool _1893 = _1098 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1895 = isnan(_1098);
    bool _1897 = _1893 || _1895;
    bool _1899 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1901 = _1897 || _1899;
    float _1903 = float(_1901);
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1907 = _1098 + _1905;
    bool _1909 = false;
    if (_1765)
    {
        bool _1911 = _1751 > 0.5;
        _1909 = _1911;
    }
    bool _1913 = _1909;
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1915;
    bool _1919 = _1098 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1921 = isnan(_1098);
    bool _1923 = _1919 || _1921;
    bool _1925 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1927 = _1923 || _1925;
    float _1929 = float(_1927);
    float _1931 = -_1903;
    float _1933 = _1931 + 1.0;
    float _1935 = _1881 * _1855;
    float _1937 = fma(_1849, _1907, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1939 = _1775 ? as_type<float>(_1847) : _358;
    float _1941 = _1877 * _1933;
    float _1943 = -_1877;
    float _1945 = _1943 + 1.0;
    bool _1947 = _1236 != 0.0;
    bool _1949 = isnan(_1236);
    bool _1951 = _1947 || _1949;
    bool _1953 = isnan(0.0);
    bool _1955 = _1951 || _1953;
    float _1957 = in.m_71.x;
    float _1959 = in.m_71.y;
    float _1961 = in.m_71.z;
    float _1963 = _1917 * _1883;
    bool _1965 = _1098 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1967 = isnan(_1098);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1973 = _1969 || _1971;
    float _1975 = float(_1973);
    float _1977 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1979 = _1234 == 0.0;
    bool _1981 = !_1955;
    bool _1983 = _1979 && _1981;
    float _1985 = _1929 * _1945;
    bool _1987 = _1098 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1989 = isnan(_1098);
    bool _1991 = _1987 || _1989;
    bool _1993 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1995 = _1991 || _1993;
    float _1997 = float(_1995);
    float _1999 = -_1975;
    float _2001 = _1999 + 1.0;
    bool _2003 = _1238 == 0.0;
    bool _2005 = _2003 && _1983;
    float _2007 = -_1929;
    float _2009 = _2007 + 1.0;
    float _2011 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2013 = _1098 + _2011;
    float _2015 = _1997 * _2001;
    float _2017 = -_1997;
    float _2019 = _2017 + 1.0;
    float _2021 = _1975 * _2009;
    float _2023 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2025 = _1098 + _2023;
    float _2027 = _1937 * _2015;
    float _2029 = fma(_1845, _2013, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2031 = _1963;
    if (_1783)
    {
        float _2033 = _1863 ? _1809 : _358;
        _458 = _2033;
    }
    float _2035 = _458;
    float _2037 = fma(_1963, _2025, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2039 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2027);
    float _2041 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2043 = _1861;
    if (!_1765)
    {
        _2031 = _1861;
    }
    float _2045 = _2031;
    float _2047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2049 = fma(_2029, _2021, _2039);
    float _2051 = _1957;
    float _2053 = _1959;
    float _2055 = _1961;
    float _2057 = _2045;
    if (!_2005)
    {
        float _2059 = fma(_1234, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1957);
        _2051 = _2059;
    }
    float _2061 = _2051;
    float _2063 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2065 = _1098 + _2063;
    int _2067 = as_type<int>(_2065);
    if (!_2005)
    {
        float _2069 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1959);
        _2053 = _2069;
    }
    float _2071 = _2053;
    float _2073 = fma(_2041, _2035, -0.5);
    float _2075 = fma(_2037, _1985, _2049);
    float _2077 = fma(_1935, _2065, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    if (_1765)
    {
        float _2079 = -_1861;
        float _2081 = _2079 + 1.0;
        _2067 = as_type<int>(_2081);
    }
    int _2083 = _2067;
    float _2085 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2087 = _2083;
    if (!_2005)
    {
        float _2089 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1961);
        _2055 = _2089;
    }
    float _2091 = _2055;
    float _2093 = fma(_2077, _1941, _2075);
    float _2095 = _1160 * _2071;
    if (_1765)
    {
        float _2097 = _1913 ? as_type<float>(_2083) : _1861;
        _2057 = _2097;
    }
    float _2099 = _2057;
    if (_1755)
    {
        float _2101 = -_1861;
        float _2103 = _2101 + 1.0;
        _2087 = as_type<int>(_2103);
    }
    int _2105 = _2087;
    float _2107 = fma(_1903, (*spvDescriptorSet0.vp_c9)._m0[135].x, _2093);
    float _2109 = fma(_1246, _2061, _2095);
    float _2111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2113 = _1164 * _2071;
    if (_1755)
    {
        float _2115 = _1887 ? as_type<float>(_2105) : _1861;
        _2043 = _2115;
    }
    float _2117 = _2043;
    float _2119 = _1166 * _2071;
    float _2121 = _1939 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2123 = fma(_1244, _2061, _2113);
    float _2125 = _2117 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2127 = fma(_1242, _2061, _2119);
    float _2129 = _2125 * _2085;
    float _2131 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2133 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2135 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2137 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2139 = _2121 * _2111;
    float _2141 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2131);
    float _2143 = fma(_1260, _2091, _2123);
    float _2145 = fma(_1320, _2091, _2127);
    float _2147 = _2133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2149 = _2135 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2151 = _2137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2153 = _2107 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2155 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2141);
    float _2157 = fma(_1256, _2091, _2109);
    float _2159 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2161 = _2047 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2163 = _2155 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_73.x = _2147;
    out.m_73.y = _2149;
    out.m_73.z = _2151;
    out.m_73.w = _2153;
    float _2165 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2159);
    float _2167 = fma(_2161, _2099, -0.5);
    float _2169 = 1.0 / _2163;
    out.m_75.x = _2143;
    out.m_75.y = _2145;
    out.m_75.z = _2157;
    bool _2171 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2173 = isnan(0.5);
    bool _2175 = _2171 || _2173;
    bool _2177 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2179 = _2175 || _2177;
    float _2181 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2165);
    float _2183 = -_1839;
    float _2185 = fma(_1853, _2073, _2183);
    float _2187 = fma(_1851, _2167, _1891);
    float _2189 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1865);
    float _2191 = _2181 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2193 = exp2(_1787);
    float _2195 = _2185 + 0.5;
    float _2197 = _2187 + 0.5;
    float _2199 = _2191 + _2163;
    float _2201 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2189);
    out.m_77.x = _2197;
    out.m_77.y = _2195;
    out.m_77.z = _2129;
    out.m_77.w = _2139;
    float _2203 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2201);
    float _2205 = _2199 * _2169;
    float _2207 = _2205 * 0.5;
    float _2209 = _2169;
    if (_2179)
    {
        _2209 = 1.0;
    }
    float _2211 = _2209;
    float _2213 = _2211;
    if (!_2179)
    {
        float _2215 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2217 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2219 = _2215 * 0.15915493667125701904296875;
        float _2221 = _2217 * 0.15915493667125701904296875;
        float _2223 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2225 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2223);
        float _2227 = _2219 * 6.283185482025146484375;
        float _2229 = cos(_2227);
        float _2231 = _2219 * 6.283185482025146484375;
        float _2233 = sin(_2231);
        float _2235 = 1.0 / _2229;
        float _2237 = _2221 * 6.283185482025146484375;
        float _2239 = cos(_2237);
        float _2241 = _2233 * _2235;
        float _2243 = _2221 * 6.283185482025146484375;
        float _2245 = sin(_2243);
        float _2247 = _2239 * _2241;
        float _2249 = 1.0 / _2225;
        float _2251 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2253 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2251;
        float _2255 = 1.0 / _2247;
        float _2257 = 1.0 / _2253;
        float _2259 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2261 = _2249 * _2259;
        float _2263 = _2245 * _2255;
        float _2265 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2267 = fma(_2263, _2261, _2265);
        float _2269 = _2267 * _2257;
        float _2271 = precise::clamp(_2269, 0.0, 1.0);
        _2213 = _2271;
    }
    float _2273 = _2213;
    float _2275 = -_2193;
    float _2277 = _2275 + 1.0;
    bool _2279 = _2273 > 0.0;
    bool _2281 = isnan(_2273);
    bool _2283 = _2279 || _2281;
    bool _2285 = isnan(0.0);
    bool _2287 = _2283 || _2285;
    float _2289 = _2273 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2291 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2293 = _2203 + _1642;
    out.m_79.x = _1416;
    out.m_79.y = _1412;
    out.m_79.z = _1420;
    float _2295 = _2291 * _1722;
    float _2297 = -_2291;
    float _2299 = _2297 + 1.0;
    out.gl_Position.x = _1688;
    out.gl_Position.y = _1710;
    out.gl_Position.z = _2203;
    out.gl_Position.w = _1642;
    float _2301 = _2293 * 0.5;
    float _2303 = _1733 * _2295;
    float _2305 = _1743 * _2295;
    float _2307 = _2289 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2309 = _1733 * _2299;
    out.m_81.z = _2301;
    out.m_81.w = _1642;
    float _2311 = fma(_1739, _2303, _1727);
    float _2313 = fma(_1741, _2303, _1729);
    float _2315 = fma(_1733, _2305, _1731);
    out.m_45.x = _2307;
    out.m_83.x = _2311;
    out.m_83.y = _2313;
    out.m_83.z = _2315;
    out.m_83.w = _2309;
    if (_2287)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2317 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2317;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1090 = false;
    bool _946 = false;
    bool _658 = false;
    bool _498 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    float _112 = _110;
    if (!_106)
    {
        out.m_45.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2374 = as_type<float>(_118);
        out.gl_Position.z = _2374;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_47.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = 0.0;
    if (_132)
    {
        float _140 = float(_102);
        _138 = _140;
    }
    float _142 = _138;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    if (_148)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _112;
    float _152 = _150;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _154 = _150 * 5.0;
        _120 = as_type<int>(_154);
    }
    int _156 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2443 = as_type<float>(_156);
        out.gl_Position.z = _2443;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _158 = in.m_47.x;
    float _160 = in.m_47.y;
    float _162 = in.m_47.z;
    float _164 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = _164;
    if (!_174)
    {
        float _178 = _164 * _164;
        float _180 = _178 * 0.5;
        _152 = _180;
    }
    float _182 = _152;
    float _184 = _182;
    if (!_174)
    {
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    bool _190 = !_174;
    float _192 = _188;
    if (!_190)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _164 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _164);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _222;
    }
    float _224 = _192;
    bool _226 = !_174;
    float _228 = _224;
    if (!_226)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _164 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _176 = _248;
    }
    float _250 = _176;
    float _252 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _254 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _258 = _250;
    if (!_174)
    {
        float _260 = _136 * _136;
        float _262 = _260 * 0.5;
        _228 = _262;
    }
    float _264 = _228;
    float _266 = fma(_250, _158, _252);
    float _268 = fma(_250, _160, _254);
    float _270 = fma(_250, _162, _256);
    float _272 = _264;
    if (!_174)
    {
        float _274 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _272 = _274;
    }
    float _276 = _272;
    bool _278 = !_174;
    float _280 = _276;
    if (!_278)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _136 * _284;
        float _294 = 1.0 / _288;
        float _296 = _290 * 0.693147182464599609375;
        float _298 = exp2(_292);
        float _300 = 1.0 / _296;
        float _302 = _298 + (-1.0);
        float _304 = -_302;
        float _306 = fma(_304, _300, _136);
        float _308 = _306 * _294;
        float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _310;
        _258 = _298;
    }
    float _312 = _280;
    float _314 = _258;
    float _316 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _318 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _320 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _322 = _314;
    if (!_174)
    {
        _322 = _136;
    }
    float _324 = _322;
    bool _326 = !_174;
    float _328 = _324;
    if (!_326)
    {
        float _330 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _332 = log2(_330);
        float _334 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _336 = _334 + 1.0;
        float _338 = 1.0 / _336;
        float _340 = _136 * _332;
        float _342 = exp2(_340);
        float _344 = -_342;
        float _346 = _344 + 1.0;
        float _348 = _346 * _338;
        _328 = _348;
    }
    float _350 = _328;
    float _352 = fma(_350, _160, _318);
    float _354 = fma(_350, _158, _316);
    float _356 = fma(_350, _162, _320);
    float _358 = in.m_49.y;
    float _360 = -_352;
    float _362 = _268 + _360;
    float _364 = -_354;
    float _366 = _266 + _364;
    float _368 = -_356;
    float _370 = _270 + _368;
    float _372 = in.m_51.y;
    float _374 = _362 * _362;
    float _376 = in.m_53.y;
    float _378 = fma(_366, _366, _374);
    float _380 = in.m_55.y;
    float _382 = fma(_370, _370, _378);
    float _384 = in.m_51.x;
    float _386 = sqrt(_382);
    float _388 = in.m_53.x;
    float _390 = in.m_55.x;
    float _392 = in.m_51.z;
    float _394 = _362 * _372;
    float _396 = in.m_53.z;
    float _398 = _362 * _376;
    bool _400 = _386 >= 9.9999999747524270787835121154785e-07;
    bool _402 = isnan(_386);
    bool _404 = _400 || _402;
    bool _406 = isnan(9.9999999747524270787835121154785e-07);
    bool _408 = _404 || _406;
    float _410 = in.m_55.z;
    float _412 = _362 * _380;
    float _414 = _372 * _372;
    float _416 = in.m_57.w;
    float _418 = fma(_366, _384, _394);
    float _420 = fma(_376, _376, _414);
    float _422 = in.m_42.x;
    float _424 = in.m_42.y;
    float _426 = in.m_42.z;
    float _428 = fma(_366, _388, _398);
    float _430 = fma(_380, _380, _420);
    out.m_59.y = _358;
    float _432 = fma(_366, _390, _412);
    float _434 = fma(_370, _392, _418);
    float _436 = fma(_370, _396, _428);
    float _438 = fma(_370, _410, _432);
    float _440 = fma(_266, _416, _422);
    float _442 = fma(_268, _416, _424);
    float _444 = fma(_270, _416, _426);
    float _446 = _436;
    float _448 = _434;
    float _450 = _438;
    float _452 = _434;
    float _454 = _436;
    float _456 = _438;
    float _458 = _358;
    if (!_408)
    {
        bool _460 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _462 = !_460;
        if (!_462)
        {
            float _464 = _372 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _466 = _376 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _468 = _380 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _470 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[16].x, _464);
            float _472 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[16].x, _466);
            float _474 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[16].x, _468);
            float _476 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[16].z, _470);
            float _478 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[16].z, _472);
            float _480 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[16].z, _474);
            float _482 = _476 * _476;
            float _484 = fma(_478, _478, _482);
            float _486 = fma(_480, _480, _484);
            float _488 = rsqrt(_486);
            float _490 = _488 * 9.9999999747524270787835121154785e-07;
            float _492 = _478 * _490;
            float _494 = _476 * _490;
            float _496 = _480 * _490;
            _452 = _494;
            _454 = _492;
            _456 = _496;
            _498 = true;
        }
        else
        {
            float _500 = _160 * _160;
            float _502 = fma(_158, _158, _500);
            float _504 = fma(_162, _162, _502);
            float _506 = sqrt(_504);
            bool _508 = _506 >= 9.9999999747524270787835121154785e-07;
            bool _510 = isnan(_506);
            bool _512 = _508 || _510;
            bool _514 = isnan(9.9999999747524270787835121154785e-07);
            bool _516 = _512 || _514;
            float _518 = _506;
            if (!_516)
            {
                float _520 = _424 * _424;
                float _522 = fma(_422, _422, _520);
                float _524 = fma(_426, _426, _522);
                float _526 = sqrt(_524);
                bool _528 = _526 >= 9.9999999747524270787835121154785e-07;
                bool _530 = isnan(_526);
                bool _532 = _528 || _530;
                bool _534 = isnan(9.9999999747524270787835121154785e-07);
                bool _536 = _532 || _534;
                float _538 = _430;
                if (!_536)
                {
                    float _540 = rsqrt(_430);
                    _538 = _540;
                }
                float _542 = _538;
                if (!_536)
                {
                    float _544 = _542 * 9.9999999747524270787835121154785e-07;
                    _518 = _544;
                }
                float _546 = _518;
                if (!_536)
                {
                    float _548 = _376 * _546;
                    _446 = _548;
                }
                float _550 = _446;
                _454 = _550;
                if (!_536)
                {
                    float _552 = _372 * _546;
                    _448 = _552;
                }
                float _554 = _448;
                _452 = _554;
                if (!_536)
                {
                    float _556 = _380 * _546;
                    _450 = _556;
                }
                float _558 = _450;
                bool _560 = !_536;
                _456 = _558;
                _498 = _560;
                if (!_498)
                {
                    float _562 = _372 * _424;
                    float _564 = _376 * _424;
                    float _566 = _380 * _424;
                    float _568 = fma(_422, _384, _562);
                    float _570 = fma(_422, _388, _564);
                    float _572 = fma(_422, _390, _566);
                    float _574 = fma(_426, _392, _568);
                    float _576 = fma(_426, _396, _570);
                    float _578 = fma(_426, _410, _572);
                    float _580 = _574 * _574;
                    float _582 = fma(_576, _576, _580);
                    float _584 = fma(_578, _578, _582);
                    float _586 = rsqrt(_584);
                    float _588 = _586 * 9.9999999747524270787835121154785e-07;
                    float _590 = _576 * _588;
                    float _592 = _574 * _588;
                    float _594 = _578 * _588;
                    _452 = _592;
                    _454 = _590;
                    _456 = _594;
                    _498 = true;
                }
            }
            else
            {
                float _596 = _372 * _160;
                float _598 = _376 * _160;
                float _600 = _380 * _160;
                float _602 = fma(_158, _384, _596);
                float _604 = fma(_158, _388, _598);
                float _606 = fma(_158, _390, _600);
                float _608 = fma(_162, _392, _602);
                float _610 = fma(_162, _396, _604);
                float _612 = fma(_162, _410, _606);
                float _614 = _608 * _608;
                float _616 = fma(_610, _610, _614);
                float _618 = fma(_612, _612, _616);
                float _620 = rsqrt(_618);
                float _622 = _620 * 9.9999999747524270787835121154785e-07;
                float _624 = _610 * _622;
                float _626 = _608 * _622;
                float _628 = _612 * _622;
                _452 = _626;
                _454 = _624;
                _456 = _628;
            }
        }
    }
    _498 = false;
    float _630 = _452;
    float _632 = _454;
    float _634 = _456;
    bool _636 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _638 = !_636;
    float _656;
    if (!_638)
    {
        float _640 = in.m_61.x;
        float _642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _644 = _640 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _646 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _648 = _646 * _642;
        float _650 = floor(_648);
        float _652 = -_650;
        float _654 = _648 + _652;
        _656 = _654;
        _658 = true;
    }
    else
    {
        float _660 = float(_102);
        float _662 = 1.0 / _660;
        float _664 = _136 * _662;
        _656 = _664;
    }
    _658 = false;
    float _666 = _656;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _670 = _666 + _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _674 = _666 + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _678 = _666 + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _680;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _686 = _684 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _696 = 1.0 / _682;
    bool _698 = _666 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _700 = isnan(_666);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = 1.0 / _686;
    bool _712 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _714 = 1.0 / _690;
    float _716 = _670 * _696;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _720 = _666 + _718;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _722;
    float _726 = fma(_724, _716, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _728 = 1.0 / _694;
    float _730 = _674 * _710;
    bool _732 = _666 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _734 = isnan(_666);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = -_742;
    float _746 = _744 + 1.0;
    float _748 = _678 * _714;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _750;
    float _754 = fma(_752, _716, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _756 = _720 * _728;
    bool _758 = _666 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _760 = isnan(_666);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    bool _770 = _666 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _772 = isnan(_666);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = _768 * _746;
    float _784 = -_768;
    float _786 = _784 + 1.0;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _788;
    float _792 = -_780;
    float _794 = _792 + 1.0;
    float _796 = _708 * _786;
    float _798 = -_708;
    float _800 = _798 + 1.0;
    float _802 = fma(_790, _716, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _804 = _666 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _806 = isnan(_666);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _820 = _780 * _800;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _830 = _814 * _794;
    float _832 = fma(_818, _730, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _834 = fma(_824, _730, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _836 = fma(_828, _730, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _838 = _802 * _830;
    float _840 = _726 * _830;
    float _842 = _754 * _830;
    float _844 = -_814;
    float _846 = _844 + 1.0;
    float _848 = in.m_57.x;
    float _850 = in.m_57.y;
    float _852 = in.m_57.z;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _854;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _858;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _862;
    float _866 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[143].x, _838);
    float _868 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[143].y, _840);
    float _870 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[143].z, _842);
    float _872 = fma(_856, _748, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _874 = fma(_860, _748, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _876 = fma(_864, _748, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _878 = fma(_832, _820, _866);
    float _880 = fma(_834, _820, _868);
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _892 = _890 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _894 = fma(_836, _820, _870);
    float _896 = fma(_884, _756, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _898 = fma(_888, _756, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _900 = fma(_872, _796, _878);
    float _902 = fma(_874, _796, _880);
    float _904 = fma(_892, _756, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _906 = fma(_876, _796, _894);
    float _908 = fma(_896, _782, _900);
    float _910 = fma(_898, _782, _902);
    float _912 = fma(_904, _782, _906);
    float _914 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[147].x, _908);
    float _916 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[147].y, _910);
    float _918 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[147].z, _912);
    float _920 = _914 * _848;
    float _922 = _916 * _850;
    float _924 = _918 * _852;
    bool _926 = !_712;
    float _944;
    if (!_926)
    {
        float _928 = in.m_61.x;
        float _930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _932 = _928 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[11].y, _136);
        float _936 = _934 * _930;
        float _938 = floor(_936);
        float _940 = -_938;
        float _942 = _936 + _940;
        _944 = _942;
        _946 = true;
    }
    else
    {
        float _948 = float(_102);
        float _950 = 1.0 / _948;
        float _952 = _136 * _950;
        _944 = _952;
    }
    _946 = false;
    float _954 = _944;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _958 = _954 + _956;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _964 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _966 = isnan(_954);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _980 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _982 = isnan(_954);
    bool _984 = _980 || _982;
    bool _986 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _988 = _984 || _986;
    float _990 = float(_988);
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _992;
    bool _996 = _954 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _998 = isnan(_954);
    bool _1000 = _996 || _998;
    bool _1002 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1004 = _1000 || _1002;
    float _1006 = float(_1004);
    float _1008 = 1.0 / _962;
    float _1010 = -_974;
    float _1012 = _1010 + 1.0;
    bool _1014 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1016 = _990 * _1012;
    float _1018 = -_990;
    float _1020 = _1018 + 1.0;
    float _1022 = 1.0 / _978;
    float _1024 = _994 * _1008;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1030 = fma(_1024, _958, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1032 = -_1006;
    float _1034 = _1032 + 1.0;
    float _1036 = _1030 * _1016;
    float _1038 = _1028 * _1022;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1042 = _954 + _1040;
    float _1044 = _974 * _1034;
    float _1046 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1036);
    float _1048 = fma(_1038, _1042, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1050 = fma(_1048, _1044, _1046);
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1058 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1050);
    float _1060 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1062 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1064 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1066 = _1058 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _1062;
    out.m_63.y = _1060;
    out.m_63.z = _1064;
    out.m_63.w = _1066;
    bool _1068 = !_1014;
    float _1070 = _1044;
    float _1088;
    if (!_1068)
    {
        float _1072 = in.m_61.x;
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1076 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[11].w, _136);
        float _1080 = _1078 * _1074;
        float _1082 = floor(_1080);
        float _1084 = -_1082;
        float _1086 = _1080 + _1084;
        _1088 = _1086;
        _1090 = true;
    }
    else
    {
        float _1092 = float(_102);
        float _1094 = 1.0 / _1092;
        float _1096 = _136 * _1094;
        _1088 = _1096;
    }
    _1090 = false;
    float _1098 = _1088;
    float _1100 = in.m_51.w;
    float _1102 = _442 * _372;
    float _1104 = _442 * _376;
    float _1106 = _442 * _380;
    float _1108 = in.m_53.w;
    float _1110 = fma(_440, _384, _1102);
    float _1112 = fma(_440, _388, _1104);
    float _1114 = fma(_440, _390, _1106);
    float _1116 = in.m_55.w;
    float _1118 = fma(_444, _392, _1110);
    float _1120 = _630 * _630;
    float _1122 = fma(_444, _396, _1112);
    float _1124 = fma(_444, _410, _1114);
    float _1126 = _920 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1128 = fma(_632, _632, _1120);
    float _1130 = _922 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1132 = _924 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1134 = fma(_634, _634, _1128);
    float _1136 = _1118 + _1100;
    float _1138 = rsqrt(_1134);
    float _1140 = _1122 + _1108;
    float _1142 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1144 = _1136 + _1142;
    float _1146 = _1124 + _1116;
    float _1148 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1150 = _1140 + _1148;
    float _1152 = _1144 * _1144;
    float _1154 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1156 = _1146 + _1154;
    float _1158 = fma(_1150, _1150, _1152);
    float _1160 = _1138 * _634;
    float _1162 = fma(_1156, _1156, _1158);
    float _1164 = _1138 * _632;
    float _1166 = _1138 * _630;
    float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1170 = _1160 * _1168;
    float _1172 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1176 = _1164 * _1174;
    float _1178 = rsqrt(_1162);
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1182 = _1166 * _1180;
    float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1186 = -_1170;
    float _1188 = fma(_1164, _1184, _1186);
    float _1190 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1192 = -_1176;
    float _1194 = fma(_1166, _1190, _1192);
    float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1198 = -_1182;
    float _1200 = fma(_1160, _1196, _1198);
    float _1202 = _1188 * _1188;
    float _1204 = fma(_1200, _1200, _1202);
    float _1206 = fma(_1194, _1194, _1204);
    float _1208 = _1172 * _1178;
    float _1210 = _1144 * _1208;
    float _1212 = _1150 * _1208;
    float _1214 = _1156 * _1208;
    float _1216 = rsqrt(_1206);
    float _1218 = -_1210;
    float _1220 = _1144 + _1218;
    float _1222 = -_1212;
    float _1224 = _1150 + _1222;
    float _1226 = -_1214;
    float _1228 = _1156 + _1226;
    float _1230 = _1220 * _1220;
    float _1232 = fma(_1224, _1224, _1230);
    float _1234 = in.m_65.x;
    float _1236 = in.m_65.y;
    float _1238 = in.m_65.z;
    float _1240 = fma(_1228, _1228, _1232);
    float _1242 = _1188 * _1216;
    float _1244 = _1200 * _1216;
    float _1246 = _1194 * _1216;
    float _1248 = sqrt(_1240);
    float _1250 = _1164 * _1242;
    float _1252 = _1166 * _1246;
    float _1254 = -_1250;
    float _1256 = fma(_1166, _1244, _1254);
    float _1258 = -_1252;
    float _1260 = fma(_1160, _1242, _1258);
    float _1262 = _1178 * _1248;
    float _1264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1236);
    float _1266 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1234);
    float _1268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1238);
    float _1270 = _1130 * _1262;
    float _1272 = _1126 * _1262;
    float _1274 = _1132 * _1262;
    float _1276 = _1270 * _1264;
    float _1278 = _1272 * _1266;
    float _1280 = _1274 * _1268;
    float _1282 = _1276 * _1160;
    float _1284 = _1276 * _1164;
    float _1286 = _1276 * _1166;
    float _1288 = fma(_1278, _1246, _1282);
    float _1290 = fma(_1278, _1244, _1284);
    float _1292 = fma(_1278, _1242, _1286);
    float _1294 = fma(_1280, _1256, _1288);
    float _1296 = fma(_1280, _1260, _1290);
    float _1298 = _1146 + _1294;
    float _1300 = _1140 + _1296;
    float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1304 = _1298 + _1302;
    float _1306 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1308 = _1300 + _1306;
    float _1310 = _1304 * _1304;
    float _1312 = fma(_1308, _1308, _1310);
    float _1314 = _1160 * _1244;
    float _1316 = sqrt(_1312);
    float _1318 = -_1314;
    float _1320 = fma(_1164, _1246, _1318);
    float _1322 = fma(_1280, _1320, _1292);
    float _1324 = _1136 + _1322;
    bool _1326 = _1316 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1328 = _1292;
    float _1330 = _1322;
    float _1332 = _1314;
    float _1334 = _1298;
    float _1336 = _1304;
    float _1338 = _1116;
    if (!_1326)
    {
        _1328 = _1300;
    }
    float _1340 = _1328;
    float _1342 = _1340;
    if (!_1326)
    {
        _1330 = _1298;
    }
    float _1344 = _1330;
    float _1346 = _1344;
    if (!_1326)
    {
        _1332 = _1324;
    }
    float _1348 = _1332;
    bool _1350 = !_1326;
    float _1352 = _1348;
    if (!_1350)
    {
        float _1354 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1356 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1358 = _1316 + _1356;
        float _1360 = rsqrt(_1312);
        float _1362 = _1358 * _1354;
        float _1364 = _1324 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1366 = _1362 * 0.15915493667125701904296875;
        float _1368 = _1366 * 6.283185482025146484375;
        float _1370 = cos(_1368);
        float _1372 = _1366 * 6.283185482025146484375;
        float _1374 = sin(_1372);
        float _1376 = _1370 + (-1.0);
        float _1378 = fma(_1374, _1364, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1380 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1382 = _1360 * _1378;
        float _1384 = fma(_1324, _1370, _1380);
        float _1386 = fma(_1308, _1382, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1388 = fma(_1304, _1382, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1352 = _1384;
        _1342 = _1386;
        _1346 = _1388;
        _1334 = _1366;
    }
    float _1390 = _1352;
    float _1392 = _1342;
    float _1394 = _1346;
    float _1396 = _1334;
    float _1398 = -_1210;
    float _1400 = _1398 + _1390;
    float _1402 = -_1212;
    float _1404 = _1402 + _1392;
    float _1406 = -_1214;
    float _1408 = _1406 + _1394;
    float _1410 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1412 = _1400 + _1410;
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1416 = _1404 + _1414;
    float _1418 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1420 = _1408 + _1418;
    float _1422 = _1412 * _1412;
    float _1424 = fma(_1416, _1416, _1422);
    float _1426 = fma(_1420, _1420, _1424);
    float _1428 = rsqrt(_1426);
    float _1430 = sqrt(_1426);
    float _1432 = _1428 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1434 = _1416 * _1432;
    float _1436 = _1420 * _1432;
    float _1438 = _1434 * _1434;
    float _1440 = _1436 * _1436;
    float _1442 = _1438 + _1440;
    float _1444 = sqrt(_1442);
    bool _1446 = _1444 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1450 = _1444 + _1448;
    float _1452 = _1396;
    float _1454 = _1450;
    if (_1446)
    {
        float _1456 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1452 = _1456;
    }
    float _1458 = _1452;
    if (_1446)
    {
        float _1460 = rsqrt(_1442);
        _1336 = _1460;
    }
    float _1462 = _1336;
    float _1464 = _1462;
    if (_1446)
    {
        float _1466 = _1450 * _1458;
        _1454 = _1466;
    }
    float _1468 = _1454;
    float _1470 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1446)
    {
        float _1472 = _1468 * 0.15915493667125701904296875;
        _1338 = _1472;
    }
    float _1474 = _1338;
    float _1476 = _1324;
    if (_1446)
    {
        float _1478 = _1474 * 6.283185482025146484375;
        float _1480 = sin(_1478);
        _1476 = _1480;
    }
    float _1482 = _1476;
    float _1484 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1486 = precise::max(0.0, _1484);
    float _1488 = _1308;
    float _1490 = _1484;
    float _1492 = _1486;
    if (_1446)
    {
        float _1494 = _1474 * 6.283185482025146484375;
        float _1496 = cos(_1494);
        _1488 = _1496;
    }
    float _1498 = _1488;
    if (!_1446)
    {
        _1490 = _1434;
    }
    float _1500 = _1490;
    float _1502 = -_1432;
    float _1504 = -_1486;
    float _1506 = fma(_1412, _1502, _1504);
    float _1508 = _1500;
    if (_1446)
    {
        float _1510 = _1506 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1492 = _1510;
    }
    float _1512 = _1492;
    float _1514 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1516 = _1482;
    float _1518 = _1512;
    if (_1446)
    {
        float _1520 = fma(_1482, _1512, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1070 = _1520;
    }
    float _1522 = _1070;
    float _1524 = _1522;
    if (!_1446)
    {
        _1516 = _1506;
    }
    float _1526 = _1516;
    float _1528 = _1526;
    float _1530 = _1498;
    if (_1446)
    {
        float _1532 = _1498 + (-1.0);
        _1518 = _1532;
    }
    float _1534 = _1518;
    float _1536 = _1534;
    if (_1446)
    {
        float _1538 = _1462 * _1522;
        _1524 = _1538;
    }
    float _1540 = _1524;
    if (_1446)
    {
        float _1542 = _1534 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1464 = _1542;
    }
    float _1544 = _1464;
    float _1546 = _1544;
    if (_1446)
    {
        float _1548 = _1434 * _1540;
        _1508 = _1548;
    }
    float _1550 = _1508;
    if (!_1446)
    {
        _1536 = _1436;
    }
    float _1552 = _1536;
    float _1554 = _1552;
    if (_1446)
    {
        float _1556 = _1436 * _1540;
        _1554 = _1556;
    }
    float _1558 = _1554;
    if (_1446)
    {
        float _1560 = fma(_1506, _1498, _1544);
        _1528 = _1560;
    }
    float _1562 = _1528;
    if (!_1446)
    {
        _1530 = _1438;
    }
    float _1564 = _1530;
    float _1566 = _1564;
    if (_1446)
    {
        float _1568 = _1550 * _1550;
        _1566 = _1568;
    }
    float _1570 = _1566;
    float _1572 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1446)
    {
        _1546 = _1440;
    }
    float _1574 = _1546;
    float _1576 = _1574;
    if (_1446)
    {
        float _1578 = _1558 * _1558;
        _1576 = _1578;
    }
    float _1580 = _1576;
    float _1582 = fma(_1562, _1562, _1570);
    float _1584 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1586 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1514);
    float _1588 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1572);
    float _1590 = _1582 + _1580;
    float _1592 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1584);
    float _1594 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1596 = fma(_1430, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1594);
    float _1598 = precise::clamp(_1596, 0.0, 1.0);
    float _1600 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1588);
    float _1602 = rsqrt(_1590);
    float _1604 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1592);
    float _1606 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1586);
    float _1608 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1610 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1470);
    float _1612 = _1604 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1614 = _1606 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1616 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1618 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1610);
    float _1620 = -_1598;
    float _1622 = _1620 + 1.0;
    float _1624 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1616);
    float _1626 = _1612 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1628 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1630 = _1618 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1632 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1624);
    float _1634 = _1602 * _1550;
    float _1636 = abs(_1622);
    float _1638 = log2(_1636);
    float _1640 = _1602 * _1562;
    float _1642 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1632);
    float _1644 = _1634 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1646 = _1602 * _1558;
    float _1648 = -_1626;
    float _1650 = fma(_1648, _1628, 1.0);
    float _1652 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1654 = -_1644;
    float _1656 = fma(_1640, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1654);
    float _1658 = 1.0 / _1642;
    float _1660 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1652);
    float _1662 = -_1646;
    float _1664 = fma(_1662, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1656);
    float _1666 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1668 = fma(_1664, -0.5, 0.5);
    float _1670 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1672 = log2(_1650);
    float _1674 = fma(_1664, 0.5, 0.5);
    float _1676 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1666);
    float _1678 = _1640 + 1.0;
    float _1680 = fma(_1674, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1682 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1676);
    float _1684 = sqrt(_1668);
    float _1686 = fma(_1674, _1680, -0.212114393711090087890625);
    float _1688 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1682);
    float _1690 = fma(_1674, _1686, 1.570728778839111328125);
    float _1692 = _1688 * _1658;
    float _1694 = exp2(_1670);
    float _1696 = _1672 * 0.693147182464599609375;
    float _1698 = fma(_1692, 0.5, 0.5);
    float _1700 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1702 = _1684 * 0.636619746685028076171875;
    float _1704 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1660);
    float _1706 = -_1690;
    float _1708 = fma(_1702, _1706, 1.0);
    float _1710 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1704);
    float _1712 = -_1640;
    float _1714 = fma(_1694, _1678, _1712);
    float _1716 = _1710 * _1658;
    float _1718 = fma(_1714, 0.5, 0.5);
    float _1720 = fma(_1716, -0.5, 0.5);
    float3 _4945 = float3(_1698, _1720, _1700);
    float _1722 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4945, float3(0.0), isnan(_4945)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4945, float3(0.0), isnan(_4945)), level(0.0)).x;
    float3 _4956 = float3(_1698, _1720, _1700);
    float4 _1725 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4956, float3(0.0), isnan(_4956)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4956, float3(0.0), isnan(_4956)), level(0.0)).xyzw;
    float _1727 = _1725.x;
    float _1729 = _1725.y;
    float _1731 = _1725.z;
    float _1733 = _1725.w;
    float2 _4973 = float2(_1708, _1718);
    float3 _1737 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4973, float2(0.0), isnan(_4973)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4973, float2(0.0), isnan(_4973)), level(0.0)).xyz;
    float _1739 = _1737.x;
    float _1741 = _1737.y;
    float _1743 = _1737.z;
    float _1745 = in.m_61.w;
    float _1747 = -_1210;
    float _1749 = _1136 + _1747;
    float _1751 = in.m_61.x;
    int _1753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1755 = _1753 != 0;
    float _1757 = -_1212;
    float _1759 = _1140 + _1757;
    float _1761 = in.m_61.y;
    int _1763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1765 = _1763 != 0;
    float _1767 = -_1214;
    float _1769 = _1146 + _1767;
    float _1771 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1775 = _1773 != 0;
    float _1777 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1779 = _1777 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1783 = _1781 != 0;
    float _1785 = in.m_67.w;
    float _1787 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1789 = 1.0 / _1779;
    float _1791 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1793 = _1791 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1795 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1797 = _1745 > 0.5;
    float _1799 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1801 = 1.0 / _1793;
    float _1803 = _1751 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1805 = fma(_1751, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1799);
    float _1807 = -_358;
    float _1809 = _1807 + 1.0;
    float _1811 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1813 = -_1771;
    float _1815 = fma(_1803, 2.0, _1813);
    float _1817 = _1761 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1819 = _1803;
    bool _1821 = _1797;
    if (_1755)
    {
        float _1823 = in.m_61.z;
        _1819 = _1823;
    }
    float _1825 = _1819;
    float _1827 = fma(_1761, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1811);
    float _1829 = fma(_1817, -2.0, _1795);
    float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1833 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1831;
    float _1835 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1837 = _1835 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    out.m_69.w = _1785;
    float _1839 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1829);
    float _1841 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1843 = _1841 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1845 = _1837 * _1801;
    int _1847 = _1797 ? as_type<int>(_1809) : as_type<int>(_358);
    float _1849 = _1833 * _1789;
    float _1851 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1805);
    float _1853 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1827);
    float _1855 = 1.0 / _1843;
    float _1857 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1859 = _1857 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1861 = in.m_49.x;
    bool _1863 = _1761 > 0.5;
    float _1865 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1867 = _1098 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1869 = isnan(_1098);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1875 = _1871 || _1873;
    float _1877 = float(_1875);
    float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1881 = _1879 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1883 = 1.0 / _1859;
    if (_1755)
    {
        bool _1885 = _1825 > 0.5;
        _1821 = _1885;
    }
    bool _1887 = _1821;
    float _1889 = -_136;
    float _1891 = fma(_1889, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1815);
    bool _1893 = _1098 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1895 = isnan(_1098);
    bool _1897 = _1893 || _1895;
    bool _1899 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1901 = _1897 || _1899;
    float _1903 = float(_1901);
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1907 = _1098 + _1905;
    bool _1909 = false;
    if (_1765)
    {
        bool _1911 = _1751 > 0.5;
        _1909 = _1911;
    }
    bool _1913 = _1909;
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1915;
    bool _1919 = _1098 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1921 = isnan(_1098);
    bool _1923 = _1919 || _1921;
    bool _1925 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1927 = _1923 || _1925;
    float _1929 = float(_1927);
    float _1931 = -_1903;
    float _1933 = _1931 + 1.0;
    float _1935 = _1881 * _1855;
    float _1937 = fma(_1849, _1907, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1939 = _1775 ? as_type<float>(_1847) : _358;
    float _1941 = _1877 * _1933;
    float _1943 = -_1877;
    float _1945 = _1943 + 1.0;
    bool _1947 = _1236 != 0.0;
    bool _1949 = isnan(_1236);
    bool _1951 = _1947 || _1949;
    bool _1953 = isnan(0.0);
    bool _1955 = _1951 || _1953;
    float _1957 = in.m_71.x;
    float _1959 = in.m_71.y;
    float _1961 = in.m_71.z;
    float _1963 = _1917 * _1883;
    bool _1965 = _1098 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1967 = isnan(_1098);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1973 = _1969 || _1971;
    float _1975 = float(_1973);
    float _1977 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1979 = _1234 == 0.0;
    bool _1981 = !_1955;
    bool _1983 = _1979 && _1981;
    float _1985 = _1929 * _1945;
    bool _1987 = _1098 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1989 = isnan(_1098);
    bool _1991 = _1987 || _1989;
    bool _1993 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1995 = _1991 || _1993;
    float _1997 = float(_1995);
    float _1999 = -_1975;
    float _2001 = _1999 + 1.0;
    bool _2003 = _1238 == 0.0;
    bool _2005 = _2003 && _1983;
    float _2007 = -_1929;
    float _2009 = _2007 + 1.0;
    float _2011 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2013 = _1098 + _2011;
    float _2015 = _1997 * _2001;
    float _2017 = -_1997;
    float _2019 = _2017 + 1.0;
    float _2021 = _1975 * _2009;
    float _2023 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2025 = _1098 + _2023;
    float _2027 = _1937 * _2015;
    float _2029 = fma(_1845, _2013, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2031 = _1963;
    if (_1783)
    {
        float _2033 = _1863 ? _1809 : _358;
        _458 = _2033;
    }
    float _2035 = _458;
    float _2037 = fma(_1963, _2025, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2039 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2027);
    float _2041 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2043 = _1861;
    if (!_1765)
    {
        _2031 = _1861;
    }
    float _2045 = _2031;
    float _2047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2049 = fma(_2029, _2021, _2039);
    float _2051 = _1957;
    float _2053 = _1959;
    float _2055 = _1961;
    float _2057 = _2045;
    if (!_2005)
    {
        float _2059 = fma(_1234, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1957);
        _2051 = _2059;
    }
    float _2061 = _2051;
    float _2063 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2065 = _1098 + _2063;
    int _2067 = as_type<int>(_2065);
    if (!_2005)
    {
        float _2069 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1959);
        _2053 = _2069;
    }
    float _2071 = _2053;
    float _2073 = fma(_2041, _2035, -0.5);
    float _2075 = fma(_2037, _1985, _2049);
    float _2077 = fma(_1935, _2065, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    if (_1765)
    {
        float _2079 = -_1861;
        float _2081 = _2079 + 1.0;
        _2067 = as_type<int>(_2081);
    }
    int _2083 = _2067;
    float _2085 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2087 = _2083;
    if (!_2005)
    {
        float _2089 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1961);
        _2055 = _2089;
    }
    float _2091 = _2055;
    float _2093 = fma(_2077, _1941, _2075);
    float _2095 = _1160 * _2071;
    if (_1765)
    {
        float _2097 = _1913 ? as_type<float>(_2083) : _1861;
        _2057 = _2097;
    }
    float _2099 = _2057;
    if (_1755)
    {
        float _2101 = -_1861;
        float _2103 = _2101 + 1.0;
        _2087 = as_type<int>(_2103);
    }
    int _2105 = _2087;
    float _2107 = fma(_1903, (*spvDescriptorSet0.vp_c9)._m0[135].x, _2093);
    float _2109 = fma(_1246, _2061, _2095);
    float _2111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2113 = _1164 * _2071;
    if (_1755)
    {
        float _2115 = _1887 ? as_type<float>(_2105) : _1861;
        _2043 = _2115;
    }
    float _2117 = _2043;
    float _2119 = _1166 * _2071;
    float _2121 = _1939 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2123 = fma(_1244, _2061, _2113);
    float _2125 = _2117 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2127 = fma(_1242, _2061, _2119);
    float _2129 = _2125 * _2085;
    float _2131 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2133 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2135 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2137 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2139 = _2121 * _2111;
    float _2141 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2131);
    float _2143 = fma(_1260, _2091, _2123);
    float _2145 = fma(_1320, _2091, _2127);
    float _2147 = _2133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2149 = _2135 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2151 = _2137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2153 = _2107 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2155 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2141);
    float _2157 = fma(_1256, _2091, _2109);
    float _2159 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2161 = _2047 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2163 = _2155 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_73.x = _2147;
    out.m_73.y = _2149;
    out.m_73.z = _2151;
    out.m_73.w = _2153;
    float _2165 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2159);
    float _2167 = fma(_2161, _2099, -0.5);
    float _2169 = 1.0 / _2163;
    out.m_75.x = _2143;
    out.m_75.y = _2145;
    out.m_75.z = _2157;
    bool _2171 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2173 = isnan(0.5);
    bool _2175 = _2171 || _2173;
    bool _2177 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2179 = _2175 || _2177;
    float _2181 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2165);
    float _2183 = -_1839;
    float _2185 = fma(_1853, _2073, _2183);
    float _2187 = fma(_1851, _2167, _1891);
    float _2189 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1865);
    float _2191 = _2181 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2193 = exp2(_1787);
    float _2195 = _2185 + 0.5;
    float _2197 = _2187 + 0.5;
    float _2199 = _2191 + _2163;
    float _2201 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2189);
    out.m_77.x = _2197;
    out.m_77.y = _2195;
    out.m_77.z = _2129;
    out.m_77.w = _2139;
    float _2203 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2201);
    float _2205 = _2199 * _2169;
    float _2207 = _2205 * 0.5;
    float _2209 = _2169;
    if (_2179)
    {
        _2209 = 1.0;
    }
    float _2211 = _2209;
    float _2213 = _2211;
    if (!_2179)
    {
        float _2215 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2217 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2219 = _2215 * 0.15915493667125701904296875;
        float _2221 = _2217 * 0.15915493667125701904296875;
        float _2223 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2225 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2223);
        float _2227 = _2219 * 6.283185482025146484375;
        float _2229 = cos(_2227);
        float _2231 = _2219 * 6.283185482025146484375;
        float _2233 = sin(_2231);
        float _2235 = 1.0 / _2229;
        float _2237 = _2221 * 6.283185482025146484375;
        float _2239 = cos(_2237);
        float _2241 = _2233 * _2235;
        float _2243 = _2221 * 6.283185482025146484375;
        float _2245 = sin(_2243);
        float _2247 = _2239 * _2241;
        float _2249 = 1.0 / _2225;
        float _2251 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2253 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2251;
        float _2255 = 1.0 / _2247;
        float _2257 = 1.0 / _2253;
        float _2259 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2261 = _2249 * _2259;
        float _2263 = _2245 * _2255;
        float _2265 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2267 = fma(_2263, _2261, _2265);
        float _2269 = _2267 * _2257;
        float _2271 = precise::clamp(_2269, 0.0, 1.0);
        _2213 = _2271;
    }
    float _2273 = _2213;
    float _2275 = -_2193;
    float _2277 = _2275 + 1.0;
    bool _2279 = _2273 > 0.0;
    bool _2281 = isnan(_2273);
    bool _2283 = _2279 || _2281;
    bool _2285 = isnan(0.0);
    bool _2287 = _2283 || _2285;
    float _2289 = _2273 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2291 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2293 = _2203 + _1642;
    out.m_79.x = _1416;
    out.m_79.y = _1412;
    out.m_79.z = _1420;
    float _2295 = _2291 * _1722;
    float _2297 = -_2291;
    float _2299 = _2297 + 1.0;
    out.gl_Position.x = _1688;
    out.gl_Position.y = _1710;
    out.gl_Position.z = _2203;
    out.gl_Position.w = _1642;
    float _2301 = _2293 * 0.5;
    float _2303 = _1733 * _2295;
    float _2305 = _1743 * _2295;
    float _2307 = _2289 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2309 = _1733 * _2299;
    out.m_81.z = _2301;
    out.m_81.w = _1642;
    float _2311 = fma(_1739, _2303, _1727);
    float _2313 = fma(_1741, _2303, _1729);
    float _2315 = fma(_1733, _2305, _1731);
    out.m_45.x = _2307;
    out.m_83.x = _2311;
    out.m_83.y = _2313;
    out.m_83.z = _2315;
    out.m_83.w = _2309;
    if (_2287)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2317 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2317;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

