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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
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
    float4 m_75 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_71 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_55 [[attribute(3)]];
    float4 m_42 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_63 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
    float4 m_51 [[attribute(10)]];
    float4 m_65 [[attribute(12)]];
    float4 m_61 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _830 = false;
    bool _668 = false;
    bool _508 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = in.m_44.w;
    float _99 = trunc(_95);
    int _102 = int(_99);
    float _104 = -_97;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _106;
    bool _110 = _102 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_102);
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3781 = as_type<float>(_122);
        out.gl_Position.z = _3781;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _126 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_97);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = float(_102);
    bool _138 = _106 >= _136;
    bool _140 = !_134;
    bool _142 = _138 || _140;
    float _144 = 0.0;
    float _146 = 0.0;
    if (_142)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _114;
    if (_142)
    {
        out.m_49.x = 0.0;
    }
    if (_142)
    {
        float _150 = _148 * 5.0;
        _124 = as_type<int>(_150);
    }
    int _152 = _124;
    float _154 = as_type<float>(_152);
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3838 = as_type<float>(_152);
        out.gl_Position.z = _3838;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _156 = in.m_44.x;
    float _158 = in.m_44.y;
    float _160 = in.m_44.z;
    float _162 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = _162;
    if (!_172)
    {
        float _176 = _162 * _162;
        float _178 = _176 * 0.5;
        _154 = _178;
    }
    float _180 = _154;
    float _182 = 0.0;
    float _184 = _180;
    if (!_172)
    {
        float _186 = _106 * _106;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    if (!_172)
    {
        float _192 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _192;
    }
    float _194 = _184;
    bool _196 = !_172;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _162 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _162);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _144 = _218;
        _198 = _228;
        _146 = _216;
    }
    float _230 = _144;
    float _232 = _198;
    float _234 = _146;
    bool _236 = !_172;
    float _238 = _230;
    float _240 = _234;
    if (!_236)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _162 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _238 = _254;
        _240 = _248;
        _174 = _260;
    }
    float _262 = _238;
    float _264 = _240;
    float _266 = _174;
    float _268 = _264;
    float _270 = _262;
    if (!_172)
    {
        _268 = _106;
    }
    float _272 = _268;
    float _274 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _276 = _272;
    if (!_172)
    {
        float _278 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _270 = _278;
    }
    float _280 = _270;
    bool _282 = !_172;
    float _284 = _280;
    if (!_282)
    {
        float _286 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _288 = log2(_286);
        float _290 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _292 = _290 + 1.0;
        float _294 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _296 = _106 * _288;
        float _298 = 1.0 / _292;
        float _300 = _294 * 0.693147182464599609375;
        float _302 = exp2(_296);
        float _304 = 1.0 / _300;
        float _306 = _302 + (-1.0);
        float _308 = -_306;
        float _310 = fma(_308, _304, _106);
        float _312 = _310 * _298;
        float _314 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _284 = _314;
    }
    float _316 = _284;
    bool _318 = !_172;
    if (!_318)
    {
        float _320 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _322 = log2(_320);
        float _324 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _326 = _324 + 1.0;
        float _328 = 1.0 / _326;
        float _330 = _106 * _322;
        float _332 = exp2(_330);
        float _334 = -_332;
        float _336 = _334 + 1.0;
        float _338 = _336 * _328;
        _276 = _338;
    }
    float _340 = _276;
    float _342 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _344 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _346 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _348 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_266, _158, _342);
    float _352 = fma(_340, _158, _344);
    float _354 = fma(_266, _156, _274);
    float _356 = fma(_340, _156, _346);
    float _358 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _360 = -_352;
    float _362 = _350 + _360;
    float _364 = fma(_266, _160, _348);
    float _366 = -_356;
    float _368 = _354 + _366;
    float _370 = fma(_340, _160, _358);
    float _372 = _362 * _362;
    float _374 = in.m_51.w;
    float _376 = 1.0 / _136;
    float _378 = -_370;
    float _380 = _364 + _378;
    float _382 = fma(_368, _368, _372);
    float _384 = in.m_42.x;
    float _386 = in.m_42.y;
    float _388 = in.m_42.z;
    float _390 = fma(_380, _380, _382);
    float _392 = in.m_53.y;
    float _394 = in.m_55.y;
    float _396 = sqrt(_390);
    float _398 = in.m_53.x;
    float _400 = _106 * _376;
    float _402 = in.m_57.y;
    float _404 = in.m_55.x;
    float _406 = in.m_53.z;
    float _408 = fma(_354, _374, _384);
    float _410 = fma(_350, _374, _386);
    bool _412 = _396 >= 9.9999999747524270787835121154785e-07;
    bool _414 = isnan(_396);
    bool _416 = _412 || _414;
    bool _418 = isnan(9.9999999747524270787835121154785e-07);
    bool _420 = _416 || _418;
    float _422 = in.m_57.x;
    float _424 = fma(_364, _374, _388);
    float _426 = _362 * _392;
    float _428 = in.m_55.z;
    float _430 = _362 * _394;
    float _432 = in.m_57.z;
    float _434 = fma(_368, _398, _426);
    float _436 = _362 * _402;
    float _438 = _402 * _402;
    float _440 = fma(_368, _404, _430);
    float _442 = fma(_392, _392, _438);
    float _444 = fma(_380, _406, _434);
    float _446 = fma(_394, _394, _442);
    float _448 = fma(_368, _422, _436);
    float _450 = fma(_380, _428, _440);
    float _452 = _440;
    float _454 = _450;
    float _456 = _450;
    if (_420)
    {
        _452 = _444;
    }
    float _458 = _452;
    float _460 = fma(_380, _432, _448);
    float _462 = _458;
    float _464 = _460;
    float _466 = _460;
    float _468 = _458;
    if (!_420)
    {
        bool _470 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _472 = !_470;
        if (!_472)
        {
            float _474 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _476 = _392 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _478 = _394 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _480 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[16].x, _474);
            float _482 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[16].x, _476);
            float _484 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[16].x, _478);
            float _486 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[16].z, _480);
            float _488 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[16].z, _482);
            float _490 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[16].z, _484);
            float _492 = _486 * _486;
            float _494 = fma(_488, _488, _492);
            float _496 = fma(_490, _490, _494);
            float _498 = rsqrt(_496);
            float _500 = _498 * 9.9999999747524270787835121154785e-07;
            float _502 = _488 * _500;
            float _504 = _486 * _500;
            float _506 = _490 * _500;
            _466 = _504;
            _468 = _502;
            _456 = _506;
            _508 = true;
        }
        else
        {
            float _510 = _158 * _158;
            float _512 = fma(_156, _156, _510);
            float _514 = fma(_160, _160, _512);
            float _516 = sqrt(_514);
            bool _518 = _516 >= 9.9999999747524270787835121154785e-07;
            bool _520 = isnan(_516);
            bool _522 = _518 || _520;
            bool _524 = isnan(9.9999999747524270787835121154785e-07);
            bool _526 = _522 || _524;
            float _528 = _516;
            if (!_526)
            {
                float _530 = _386 * _386;
                float _532 = fma(_384, _384, _530);
                float _534 = fma(_388, _388, _532);
                float _536 = sqrt(_534);
                bool _538 = _536 >= 9.9999999747524270787835121154785e-07;
                bool _540 = isnan(_536);
                bool _542 = _538 || _540;
                bool _544 = isnan(9.9999999747524270787835121154785e-07);
                bool _546 = _542 || _544;
                float _548 = _446;
                if (!_546)
                {
                    float _550 = rsqrt(_446);
                    _548 = _550;
                }
                float _552 = _548;
                if (!_546)
                {
                    float _554 = _552 * 9.9999999747524270787835121154785e-07;
                    _528 = _554;
                }
                float _556 = _528;
                if (!_546)
                {
                    float _558 = _392 * _556;
                    _462 = _558;
                }
                float _560 = _462;
                _468 = _560;
                if (!_546)
                {
                    float _562 = _402 * _556;
                    _464 = _562;
                }
                float _564 = _464;
                _466 = _564;
                if (!_546)
                {
                    float _566 = _394 * _556;
                    _454 = _566;
                }
                float _568 = _454;
                bool _570 = !_546;
                _456 = _568;
                _508 = _570;
                if (!_508)
                {
                    float _572 = _402 * _386;
                    float _574 = _392 * _386;
                    float _576 = _394 * _386;
                    float _578 = fma(_384, _422, _572);
                    float _580 = fma(_384, _398, _574);
                    float _582 = fma(_384, _404, _576);
                    float _584 = fma(_388, _432, _578);
                    float _586 = fma(_388, _406, _580);
                    float _588 = fma(_388, _428, _582);
                    float _590 = _584 * _584;
                    float _592 = fma(_586, _586, _590);
                    float _594 = fma(_588, _588, _592);
                    float _596 = rsqrt(_594);
                    float _598 = _596 * 9.9999999747524270787835121154785e-07;
                    float _600 = _586 * _598;
                    float _602 = _584 * _598;
                    float _604 = _588 * _598;
                    _466 = _602;
                    _468 = _600;
                    _456 = _604;
                    _508 = true;
                }
            }
            else
            {
                float _606 = _402 * _158;
                float _608 = _392 * _158;
                float _610 = _394 * _158;
                float _612 = fma(_156, _422, _606);
                float _614 = fma(_156, _398, _608);
                float _616 = fma(_156, _404, _610);
                float _618 = fma(_160, _432, _612);
                float _620 = fma(_160, _406, _614);
                float _622 = fma(_160, _428, _616);
                float _624 = _618 * _618;
                float _626 = fma(_620, _620, _624);
                float _628 = fma(_622, _622, _626);
                float _630 = rsqrt(_628);
                float _632 = _630 * 9.9999999747524270787835121154785e-07;
                float _634 = _620 * _632;
                float _636 = _618 * _632;
                float _638 = _622 * _632;
                _466 = _636;
                _468 = _634;
                _456 = _638;
            }
        }
    }
    _508 = false;
    float _640 = _466;
    float _642 = _468;
    float _644 = _456;
    bool _646 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    bool _648 = !_646;
    float _666;
    if (!_648)
    {
        float _650 = in.m_59.x;
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _654 = _650 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _656 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[11].w, _106);
        float _658 = _656 * _652;
        float _660 = floor(_658);
        float _662 = -_660;
        float _664 = _658 + _662;
        _666 = _664;
        _668 = true;
    }
    else
    {
        _666 = _400;
    }
    _668 = false;
    float _670 = _666;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _674 = _670 + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _680 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _682 = isnan(_670);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _700 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _702 = isnan(_670);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = 1.0 / _678;
    float _714 = -_690;
    float _716 = _714 + 1.0;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _718;
    bool _722 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _724 = isnan(_670);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = _710 * _716;
    float _736 = -_710;
    float _738 = _736 + 1.0;
    bool _740 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _742 = 1.0 / _694;
    float _744 = _732 * _738;
    float _746 = -_732;
    float _748 = _746 + 1.0;
    float _750 = 1.0 / _698;
    float _752 = _720 * _712;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _758 = fma(_752, _674, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _760 = _756 * _742;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _764 = _670 + _762;
    bool _766 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _768 = isnan(_670);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _778;
    float _782 = _758 * _744;
    float _784 = fma(_760, _764, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _788 = _670 + _786;
    float _790 = -_776;
    float _792 = _790 + 1.0;
    float _794 = _780 * _750;
    float _796 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[131].x, _782);
    float _798 = _690 * _792;
    float _800 = fma(_794, _788, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _802 = fma(_784, _734, _796);
    float _804 = fma(_800, _798, _802);
    float _806 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[134].x, _804);
    float _808 = _806 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _810 = !_740;
    float _828;
    if (!_810)
    {
        float _812 = in.m_59.x;
        float _814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _816 = _812 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _818 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[14].x, _106);
        float _820 = _818 * _814;
        float _822 = floor(_820);
        float _824 = -_822;
        float _826 = _820 + _824;
        _828 = _826;
        _830 = true;
    }
    else
    {
        _828 = _400;
    }
    _830 = false;
    float _832 = _828;
    float _834 = in.m_51.x;
    float _836 = in.m_51.y;
    float _838 = in.m_51.z;
    float _840 = _410 * _402;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _842;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _850;
    float _854 = _410 * _394;
    float _856 = 1.0 / _844;
    float _858 = fma(_408, _422, _840);
    float _860 = in.m_59.w;
    float _862 = fma(_408, _404, _854);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _874 = _832 + _872;
    float _876 = 1.0 / _848;
    float _878 = _410 * _392;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _880;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _886 = _832 + _884;
    float _888 = fma(_408, _398, _878);
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _892 = _832 + _890;
    float _894 = 1.0 / _852;
    float _896 = in.m_61.x;
    float _898 = _838 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _900 = _836 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _902 = fma(_424, _406, _888);
    float _904 = fma(_424, _432, _858);
    float _906 = _834 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _908 = 1.0 / _882;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _910;
    float _914 = fma(_424, _428, _862);
    bool _916 = _860 > 0.5;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _920 = _832 + _918;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _924 = _832 + _922;
    float _926 = 1.0 / _866;
    float _928 = _886 * _894;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _932 = _832 + _930;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _934;
    float _938 = _924 * _876;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _944 = 1.0 / _912;
    float _946 = _896 * _896;
    float _948 = _920 * _908;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _954 = fma(_946, -0.980000019073486328125, 1.0);
    float _956 = (*spvDescriptorSet0.vp_c10)._m0[9].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _962 = in.m_53.w;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _966 = _832 + _964;
    float _968 = 1.0 / _870;
    float _970 = fma((*spvDescriptorSet0.vp_c10)._m0[8].y, (*spvDescriptorSet0.vp_c10)._m0[8].y, _956);
    float _972 = _892 * _926;
    float _974 = _966 * _856;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _980 = in.m_57.w;
    float _982 = _932 * _944;
    float _984 = 1.0 / _960;
    float _986 = in.m_55.w;
    float _988 = fma(_936, _974, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _990 = fma(_952, _938, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    bool _992 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _994 = _640 * _640;
    float _996 = 1.0 / _942;
    float _998 = _874 * _968;
    float _1000 = fma(_642, _642, _994);
    float _1002 = in.m_63.x;
    float _1004 = in.m_63.y;
    float _1006 = in.m_63.z;
    float _1008 = _902 + _962;
    float _1010 = fma(_644, _644, _1000);
    float _1012 = 1.0 / _978;
    float _1014 = fma(_106, 0.004999999888241291046142578125, -0.0199999995529651641845703125);
    float _1016 = _900 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1018 = _904 + _980;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1022 = _1020 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1024;
    float _1028 = rsqrt(_1010);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1034 = _914 + _986;
    float _1036 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[193].x + _1036;
    float _1040 = _898 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1046 = 1.0 / _1022;
    float _1048 = _1026 * _1012;
    float _1050 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _1054 = _1052 + 1.0;
    float _1056 = 1.0 / _1032;
    float _1058 = _1028 * _642;
    float _1060 = _1028 * _640;
    float _1062 = _1028 * _644;
    float _1064 = precise::max(0.0, _1050);
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1068 = _1058 * _1066;
    float _1070 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1002);
    float _1072 = 1.0 / _1044;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1076 = _1074 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1086 = precise::max(_1064, 400.0);
    float _1088 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1004);
    float _1090 = _1080 * _996;
    float _1092 = _1084 * _984;
    float _1094 = 1.0 / _1076;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1098 = _1096 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1106 = _1104 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1108 = _1098 * _1046;
    float _1110 = _1102 * _1056;
    float _1112 = _1106 * _1072;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1114;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1118;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1122;
    float _1126 = precise::min(_1086, 600.0);
    float _1128 = fma((*spvDescriptorSet0.vp_c10)._m0[10].y, (*spvDescriptorSet0.vp_c10)._m0[10].y, _970);
    float _1130 = fma(_1120, _974, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1132 = fma(_1124, _974, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1134 = _1116 * _1094;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1138 = _1136 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1144;
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1148;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1152;
    float _1156 = fma(_1138, _938, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1158 = fma(_1142, _938, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1160 = fma(_1146, _928, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1162 = fma(_1150, _928, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1164 = fma(_1154, _928, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1168 = _1166 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1170;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1174;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1180 = _1178 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1188 = _1186 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1190 = fma(_1172, _948, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1192 = fma(_1176, _948, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1194 = fma(_1168, _998, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1196 = fma(_1180, _998, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1198 = fma(_1184, _948, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1200 = fma(_1188, _998, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1212 = _1210 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1214 = in.m_59.x;
    float _1216 = fma(_1204, _972, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1218 = fma(_1208, _972, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1220 = fma(_1212, _972, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1226;
    bool _1230 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1232 = isnan(_832);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1238 = _1234 || _1236;
    float _1240 = float(_1238);
    float _1242 = rsqrt(_1128);
    float _1244 = fma(_1224, _982, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _1246 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1248 = isnan(_832);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1006);
    float _1260 = -_1240;
    float _1262 = _1260 + 1.0;
    float _1264 = -_1256;
    float _1266 = _1264 + 1.0;
    float _1268 = _1256 * _1262;
    bool _1270 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1272 = isnan(_832);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1278 = _1274 || _1276;
    float _1280 = float(_1278);
    float _1282 = _1256;
    float _1284 = _1280;
    float _1286 = _1000;
    int _1288 = as_type<int>(_1040);
    float _1290 = _1008;
    if (_992)
    {
        float _1292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        _1282 = _1292;
    }
    float _1294 = _1282;
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1296;
    bool _1300 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1302 = isnan(_832);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1308 = _1304 || _1306;
    float _1310 = float(_1308);
    float _1312 = _1280 * _1266;
    float _1314 = fma(_1298, _982, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1316 = -_1280;
    float _1318 = _1316 + 1.0;
    bool _1320 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1322 = isnan(_832);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1328 = _1324 || _1326;
    float _1330 = float(_1328);
    float _1332 = _1214;
    if (_992)
    {
        float _1334 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        _1284 = _1334;
    }
    float _1336 = _1284;
    float _1338 = fma(_1228, _982, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1340 = -_1310;
    float _1342 = _1340 + 1.0;
    float _1344 = _1310 * _1318;
    float _1346 = _1336;
    if (_992)
    {
        float _1348 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[14].y, _1014);
        _1286 = _1348;
    }
    float _1350 = _1286;
    bool _1352 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1354 = isnan(_832);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1360 = _1356 || _1358;
    float _1362 = float(_1360);
    float _1364 = -_1330;
    float _1366 = _1364 + 1.0;
    float _1368 = _1330 * _1342;
    float _1370 = _106 + (-4.0);
    bool _1372 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1374 = isnan(_832);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1380 = _1376 || _1378;
    float _1382 = float(_1380);
    float _1384 = 0.0;
    float _1386 = _1382;
    if (_992)
    {
        float _1388 = _1350 * _1294;
        _1384 = _1388;
    }
    float _1390 = _1384;
    float _1392 = _1362 * _1366;
    float _1394 = -_1362;
    float _1396 = _1394 + 1.0;
    bool _1398 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1400 = isnan(_832);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1406 = _1402 || _1404;
    float _1408 = float(_1406);
    float _1410 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _1412 = -_1382;
    float _1414 = _1412 + 1.0;
    float _1416 = 0.0;
    if (_992)
    {
        float _1418 = floor(_1390);
        _1416 = _1418;
    }
    float _1420 = _1416;
    float _1422 = _1382 * _1396;
    float _1424 = _1410 * (-0.15915493667125701904296875);
    float _1426 = _1408 * _1414;
    float _1428 = -_1408;
    float _1430 = _1428 + 1.0;
    if (!_992)
    {
        _1386 = _1014;
    }
    float _1432 = _1386;
    float _1434 = _1130 * _1426;
    float _1436 = _1424 * 6.283185482025146484375;
    float _1438 = cos(_1436);
    float _1440 = _988 * _1426;
    float _1442 = _1132 * _1426;
    float _1444 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1446 = _1018 + _1444;
    float _1448 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1434);
    float _1450 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1440);
    float _1452 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1442);
    float _1454 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1456 = _1008 + _1454;
    float _1458 = _1424 * 6.283185482025146484375;
    float _1460 = sin(_1458);
    float _1462 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1464 = _1432;
    if (_992)
    {
        float _1466 = -_1420;
        float _1468 = _1390 + _1466;
        _1464 = _1468;
    }
    float _1470 = _1464;
    float _1472 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1474 = fma(_1126, 0.004999999888241291046142578125, -2.0);
    float _1476 = precise::clamp(_1474, 0.0, 1.0);
    float _1478 = fma(_1456, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1462);
    float _1480 = fma(_1156, _1422, _1448);
    float _1482 = fma(_990, _1422, _1450);
    float _1484 = fma(_1456, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1472);
    float _1486 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1488 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1490 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1492 = -_1438;
    float _1494 = _1492 + 1.0;
    float _1496 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1498 = _1034 + _1496;
    float _1500 = fma(_1158, _1422, _1452);
    float _1502 = fma(_1162, _1392, _1482);
    float _1504 = _1488 * _1460;
    float _1506 = _1486 * _1460;
    float _1508 = _1490 * _1460;
    float _1510 = _1488 * _1494;
    float _1512 = fma(_1498, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1484);
    float _1514 = fma(_1498, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1478);
    float _1516 = _1486 * _1494;
    float _1518 = fma(_1486, _1510, _1508);
    float _1520 = -_1508;
    float _1522 = fma(_1486, _1510, _1520);
    float _1524 = fma(_1160, _1392, _1480);
    bool _1526 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1528 = isnan(_1470);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1534 = _1530 || _1532;
    float _1536 = float(_1534);
    float _1538 = _1490 * _1490;
    float _1540 = fma(_1490, _1516, _1504);
    float _1542 = fma(_1194, _1368, _1524);
    float _1544 = -_1504;
    float _1546 = fma(_1490, _1516, _1544);
    float _1548 = -_1476;
    float _1550 = _1548 + 1.0;
    bool _1552 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1554 = isnan(_1470);
    bool _1556 = _1552 || _1554;
    bool _1558 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1560 = _1556 || _1558;
    float _1562 = float(_1560);
    float _1564 = fma(_1486, _1516, _1438);
    float _1566 = fma(_1538, _1494, _1438);
    float _1568 = fma(_1488, _1510, _1438);
    float _1570 = -_1536;
    float _1572 = _1570 + 1.0;
    float _1574 = -_1506;
    float _1576 = fma(_1490, _1510, _1574);
    float _1578 = fma(_1490, _1510, _1506);
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1582 = _1018 + _1580;
    bool _1584 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1586 = isnan(_1470);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1592 = _1588 || _1590;
    float _1594 = float(_1592);
    float _1596 = fma(_1550, _1054, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _1598 = fma(_1196, _1368, _1502);
    float _1600 = _1562 * _1572;
    float _1602 = -_1562;
    float _1604 = _1602 + 1.0;
    float _1606 = fma(_1164, _1392, _1500);
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1610 = _1062 * _1608;
    float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1614 = _1008 + _1612;
    float _1616 = _1582 * _1582;
    bool _1618 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1620 = isnan(_1470);
    bool _1622 = _1618 || _1620;
    bool _1624 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1626 = _1622 || _1624;
    float _1628 = float(_1626);
    float _1630 = -_1594;
    float _1632 = _1630 + 1.0;
    float _1634 = _1594 * _1604;
    float _1636 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1638 = _1060 * _1636;
    float _1640 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1642 = -_1610;
    float _1644 = fma(_1058, _1640, _1642);
    float _1646 = fma(_1614, _1614, _1616);
    bool _1648 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1650 = isnan(_1470);
    bool _1652 = _1648 || _1650;
    bool _1654 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1656 = _1652 || _1654;
    float _1658 = float(_1656);
    float _1660 = _1628 * _1632;
    float _1662 = -_1628;
    float _1664 = _1662 + 1.0;
    float _1666 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1668 = -_1638;
    float _1670 = fma(_1062, _1666, _1668);
    bool _1672 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1674 = isnan(_1470);
    bool _1676 = _1672 || _1674;
    bool _1678 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1680 = _1676 || _1678;
    float _1682 = float(_1680);
    float _1684 = _1644 * _1644;
    float _1686 = _1658 * _1664;
    float _1688 = -_1658;
    float _1690 = _1688 + 1.0;
    float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1694 = -_1068;
    float _1696 = fma(_1060, _1692, _1694);
    bool _1698 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1700 = isnan(_1470);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1706 = _1702 || _1704;
    float _1708 = float(_1706);
    float _1710 = fma(_1670, _1670, _1684);
    float _1712 = -_1682;
    float _1714 = _1712 + 1.0;
    float _1716 = _1682 * _1690;
    bool _1718 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1720 = isnan(_1470);
    bool _1722 = _1718 || _1720;
    bool _1724 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1726 = _1722 || _1724;
    float _1728 = float(_1726);
    float _1730 = fma(_1696, _1696, _1710);
    float _1732 = _1708 * _1714;
    float _1734 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1736 = _1034 + _1734;
    float _1738 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1740 = _1470 + _1738;
    float _1742 = -_1708;
    float _1744 = _1742 + 1.0;
    float _1746 = fma(_1200, _1368, _1606);
    float _1748 = fma(_1736, _1736, _1646);
    float _1750 = fma(_1090, _1740, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1752 = _1728 * _1744;
    float _1754 = fma(_1190, _1344, _1542);
    float _1756 = fma(_1192, _1344, _1598);
    float _1758 = rsqrt(_1748);
    float _1760 = _1750 * _1752;
    float _1762 = -_1728;
    float _1764 = _1762 + 1.0;
    float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1768 = _1470 + _1766;
    float _1770 = fma(_1198, _1344, _1746);
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1774 = _1470 + _1772;
    float _1776 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1760);
    float _1778 = fma(_1092, _1768, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1780 = fma(_1216, _1312, _1754);
    float _1782 = fma(_1220, _1312, _1770);
    float _1784 = fma(_1048, _1774, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1786 = fma(_1778, _1732, _1776);
    float _1788 = fma(_1218, _1312, _1756);
    float _1790 = abs(_1512);
    float _1792 = abs(_1514);
    float _1794 = precise::max(_1790, _1792);
    float _1796 = in.m_59.y;
    float _1798 = fma(_1784, _1716, _1786);
    float _1800 = _1582 * _1758;
    float _1802 = _1614 * _1758;
    float _1804 = in.m_65.y;
    bool _1806 = _1794 >= 16.0;
    float _1808 = -_1800;
    float _1810 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1582);
    float _1812 = rsqrt(_1730);
    float _1814 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1816 = _1470 + _1814;
    float _1818 = -_1802;
    float _1820 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1614);
    float _1822 = _1810 * _1810;
    float _1824 = fma(_1314, _1268, _1788);
    float _1826 = in.m_59.z;
    float _1828 = _1736 * _1758;
    float _1830 = fma(_1108, _1816, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1832 = fma(_1820, _1820, _1822);
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1836 = _1470 + _1834;
    float _1838 = -_1828;
    float _1840 = fma(_1838, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1736);
    float _1842 = fma(_1244, _1268, _1780);
    float _1844 = fma(_1830, _1686, _1798);
    float _1846 = fma(_1110, _1836, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1848 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1850 = _1470 + _1848;
    float _1852 = fma(_1338, _1268, _1782);
    float _1854 = fma(_1840, _1840, _1832);
    float _1856 = _1512;
    float _1858 = _1514;
    int _1860 = as_type<int>(_1854);
    if (_1806)
    {
        float _1862 = _1512 * 0.0625;
        _1856 = _1862;
    }
    float _1864 = _1856;
    float _1866 = fma(_1846, _1660, _1844);
    float _1868 = fma(_1112, _1850, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1870 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1842);
    float _1872 = -_1804;
    float _1874 = _1872 + 1.0;
    float _1876 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1824);
    float _1878 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1852);
    float _1880 = sqrt(_1854);
    float _1882 = _1644 * _1812;
    bool _1884 = _1796 > 0.5;
    float _1886 = fma(_1868, _1634, _1866);
    float _1888 = abs(_1864);
    bool _1890 = _1888 != 0.0;
    bool _1892 = isnan(_1888);
    bool _1894 = _1890 || _1892;
    bool _1896 = isnan(0.0);
    bool _1898 = _1894 || _1896;
    if (_1806)
    {
        float _1900 = _1514 * 0.0625;
        _1858 = _1900;
    }
    float _1902 = _1858;
    int _1904 = _916 ? as_type<int>(_1874) : as_type<int>(_1804);
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1908 = _1470 + _1906;
    int _1910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1912 = _1910 != 0;
    int _1914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1916 = _1914 != 0;
    int _1918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1920 = _1918 != 0;
    float _1922 = -_896;
    float _1924 = _1922 + 1.0;
    int _1926 = _1884 ? as_type<int>(_1874) : as_type<int>(_1804);
    float _1928 = fma(_1134, _1908, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1930 = abs(_1902);
    bool _1932 = _1930 == 0.0;
    bool _1934 = !_1898;
    bool _1936 = _1932 && _1934;
    float _1938 = _1670 * _1812;
    float _1940 = _1912 ? as_type<float>(_1926) : _1804;
    float _1942 = _1758 * _1880;
    bool _1944 = _1826 > 0.5;
    float _1946 = fma(_1928, _1600, _1886);
    float _1948 = _906 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1950 = _1876 * (*spvDescriptorSet0.vp_c9)._m0[194].y;
    int _1952 = _1944 ? as_type<int>(_1874) : as_type<int>(_1804);
    float _1954 = _1696 * _1812;
    float _1956 = _1916 ? as_type<float>(_1904) : _1804;
    float _1958 = fma(_1950, _1924, _106);
    float _1960 = _1920 ? as_type<float>(_1952) : _1804;
    float _1962 = _1948 * _1942;
    float _1964 = abs(_1902);
    bool _1966 = _1964 == 0.0;
    float _1968 = _1016 * _1942;
    bool _1970 = _1916;
    int _1972 = _1966 ? (-1) : 0;
    float _1974 = _1942;
    if (_1936)
    {
        bool _1976 = as_type<int>(_1902) >= 0;
        _1970 = _1976;
    }
    bool _1978 = _1970;
    float _1980 = _1040 * _1942;
    float _1982 = _1958 * (-0.02300000004470348358154296875);
    if (_1936)
    {
        int _1984 = _1978 ? 0 : 1078530011;
        _1860 = _1984;
    }
    int _1986 = _1860;
    if (_1936)
    {
        int _1988 = int(0x80000000) & as_type<int>(_1864);
        int _1990 = _1986 | _1988;
        _1288 = _1990;
    }
    int _1992 = _1288;
    bool _1994 = !_1898;
    bool _1996 = _1994 && _1966;
    int _1998 = _1992;
    float _2000 = as_type<float>(_1992);
    if (!_1996)
    {
        float _2002 = abs(_1864);
        bool _2004 = _2002 != as_type<float>(0x7f800000u /* inf */);
        bool _2006 = isnan(_2002);
        bool _2008 = _2004 || _2006;
        bool _2010 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _2012 = _2008 || _2010;
        float _2014 = abs(_1902);
        bool _2016 = _2014 == as_type<float>(0x7f800000u /* inf */);
        float _2018 = abs(_1902);
        bool _2020 = _2018 == as_type<float>(0x7f800000u /* inf */);
        bool _2022 = !_2012;
        bool _2024 = _2020 && _2022;
        if (_2024)
        {
            bool _2026 = as_type<int>(_1902) >= 0;
            _1972 = _2026 ? (-1) : 0;
        }
        int _2028 = _1972;
        if (_2024)
        {
            _1998 = 1075235812;
        }
        int _2030 = _1998;
        int _2032 = _2030;
        if (_2024)
        {
            int _2034 = ~_2028;
            int _2036 = (_2034 != 0) ? _2030 : 1061752795;
            _2032 = _2036;
        }
        int _2038 = _2032;
        float _2040 = as_type<float>(_2038);
        if (_2024)
        {
            int _2042 = int(0x80000000) & as_type<int>(_1864);
            int _2044 = _2038 | _2042;
            _2040 = as_type<float>(_2044);
        }
        float _2046 = _2040;
        bool _2048 = !_2012;
        bool _2050 = _2048 && _2016;
        _2000 = _2046;
        if (!_2050)
        {
            float _2052 = abs(_1864);
            float _2054 = abs(_1902);
            float _2056 = precise::max(_2052, _2054);
            float _2058 = abs(_1864);
            float _2060 = abs(_1902);
            float _2062 = precise::min(_2058, _2060);
            float _2064 = 1.0 / _2056;
            float _2066 = abs(_1864);
            float _2068 = abs(_1902);
            bool _2070 = _2066 > _2068;
            bool _2072 = as_type<int>(_1902) >= 0;
            float _2074 = _2062 * _2064;
            float _2076 = abs(_1864);
            float _2078 = abs(_1902);
            float _2080 = _2076 + _2078;
            int _2082 = as_type<int>(_1864) & int(0x80000000);
            float _2084 = _2074 * _2074;
            bool _2086 = _2080 > as_type<float>(0x7f800000u /* inf */);
            bool _2088 = isnan(_2080);
            bool _2090 = _2086 || _2088;
            bool _2092 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2094 = _2090 || _2092;
            float _2096 = _2084 + 11.33538818359375;
            float _2098 = fma(_2084, _2096, 28.84246826171875);
            float _2100 = fma(_2084, _2098, 19.6966705322265625);
            float _2102 = fma(_2084, -0.82336294651031494140625, -5.674867153167724609375);
            float _2104 = fma(_2084, _2102, -6.565555095672607421875);
            float _2106 = 1.0 / _2100;
            float _2108 = _2084 * _2104;
            float _2110 = _2074 * _2108;
            float _2112 = fma(_2110, _2106, _2074);
            float _2114 = _2112;
            _2000 = _2080;
            if (_2070)
            {
                float _2116 = -_2112;
                float _2118 = _2116 + 1.57079637050628662109375;
                _2114 = _2118;
            }
            float _2120 = _2114;
            int _2122 = as_type<int>(_2120);
            if (!_2072)
            {
                float _2124 = -_2120;
                float _2126 = _2124 + 3.1415927410125732421875;
                _2122 = as_type<int>(_2126);
            }
            int _2128 = _2122;
            _1974 = as_type<float>(_2128);
            if (!_2094)
            {
                int _2130 = _2082 | _2128;
                _2000 = as_type<float>(_2130);
            }
        }
    }
    float _2132 = _1974;
    float _2134 = _2000;
    float _2136 = _1958 * 0.004999999888241291046142578125;
    float _2138 = _1982 * 0.15915493667125701904296875;
    float _2140 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1946);
    float _2142 = _1962 * _1070;
    float _2144 = _2132;
    if (_992)
    {
        float _2146 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[14].y, _2136);
        _1346 = _2146;
    }
    float _2148 = _1346;
    float _2150 = _1058 * _1882;
    float _2152 = _1968 * _1088;
    float _2154 = _2138 * 6.283185482025146484375;
    float _2156 = sin(_2154);
    float _2158 = _2152;
    if (_992)
    {
        float _2160 = _2148 * _1294;
        _2144 = _2160;
    }
    float _2162 = _2144;
    float _2164 = _1060 * _1954;
    float _2166 = _1062 * _1938;
    float _2168 = _1980 * _1258;
    float _2170 = -_2150;
    float _2172 = fma(_1060, _1938, _2170);
    float _2174 = -_2164;
    float _2176 = fma(_1062, _1882, _2174);
    float _2178 = _1946;
    if (_992)
    {
        float _2180 = floor(_2162);
        _2178 = _2180;
    }
    float _2182 = _2178;
    float _2184 = _2152 * _1060;
    float _2186 = -_2166;
    float _2188 = fma(_1058, _1954, _2186);
    float _2190 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[194].z, 200.0);
    float _2192 = _2152 * _1058;
    float _2194 = _2152 * _1062;
    float _2196 = -_2134;
    float _2198 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[194].x, _2196);
    float _2200 = -_2134;
    float _2202 = _1410 + _2200;
    if (!_992)
    {
        _2158 = _2136;
    }
    float _2204 = _2158;
    float _2206 = fma(_2142, _1882, _2184);
    float _2208 = fma(_2156, 0.1500000059604644775390625, 1.0);
    float _2210 = _954 * _1596;
    float _2212 = fma(_2142, _1938, _2192);
    float _2214 = fma(_2168, _2188, _2206);
    float _2216 = fma(_2142, _1954, _2194);
    float _2218 = _2204;
    if (_992)
    {
        float _2220 = -_2182;
        float _2222 = _2162 + _2220;
        _2218 = _2222;
    }
    float _2224 = _2218;
    float _2226 = _2210 * _2208;
    float _2228 = fma(_2168, _2176, _2212);
    float _2230 = fma(_2168, _2172, _2216);
    float _2232 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2234 = _2224 + _2232;
    float _2236 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2238 = _2224 + _2236;
    float _2240 = _1878 * _2226;
    float _2242 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2244 = _2224 + _2242;
    float _2246 = fma(_1090, _2234, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2250 = _2224 + _2248;
    float _2252 = fma(_1092, _2238, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2254 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2256 = _2224 + _2254;
    float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2260 = _2224 + _2258;
    float _2262 = fma(_1108, _2250, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    bool _2264 = _2224 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2266 = isnan(_2224);
    bool _2268 = _2264 || _2266;
    bool _2270 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2272 = _2268 || _2270;
    float _2274 = float(_2272);
    float _2276 = fma(_1134, _2256, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    bool _2278 = _2224 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2280 = isnan(_2224);
    bool _2282 = _2278 || _2280;
    bool _2284 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2286 = _2282 || _2284;
    float _2288 = float(_2286);
    float _2290 = fma(_1110, _2244, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    bool _2292 = _2224 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2294 = isnan(_2224);
    bool _2296 = _2292 || _2294;
    bool _2298 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2300 = _2296 || _2298;
    float _2302 = float(_2300);
    float _2304 = fma(_1048, _2260, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2306 = -_2274;
    float _2308 = _2306 + 1.0;
    float _2310 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2312 = _2224 + _2310;
    bool _2314 = _2224 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2316 = isnan(_2224);
    bool _2318 = _2314 || _2316;
    bool _2320 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2322 = _2318 || _2320;
    float _2324 = float(_2322);
    float _2326 = -_2288;
    float _2328 = _2326 + 1.0;
    float _2330 = _2302 * _2308;
    float _2332 = fma(_1112, _2312, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    bool _2334 = _2224 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2336 = isnan(_2224);
    bool _2338 = _2334 || _2336;
    bool _2340 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2342 = _2338 || _2340;
    float _2344 = float(_2342);
    float _2346 = _2274 * _2328;
    float _2348 = -_2324;
    float _2350 = _2348 + 1.0;
    bool _2352 = _2224 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2354 = isnan(_2224);
    bool _2356 = _2352 || _2354;
    bool _2358 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2360 = _2356 || _2358;
    float _2362 = float(_2360);
    float _2364 = _2246 * _2330;
    float _2366 = -_2302;
    float _2368 = _2366 + 1.0;
    float _2370 = _1870 * _1596;
    bool _2372 = _2224 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2374 = isnan(_2224);
    bool _2376 = _2372 || _2374;
    bool _2378 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2380 = _2376 || _2378;
    float _2382 = float(_2380);
    float _2384 = -_2344;
    float _2386 = _2384 + 1.0;
    float _2388 = _2344 * _2350;
    bool _2390 = _2224 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2392 = isnan(_2224);
    bool _2394 = _2390 || _2392;
    bool _2396 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2398 = _2394 || _2396;
    float _2400 = float(_2398);
    float _2402 = _2202 * 0.15915493667125701904296875;
    float _2404 = fma(_2368, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2364);
    float _2406 = -_2362;
    float _2408 = _2406 + 1.0;
    float _2410 = fma(_2214, _2370, _1018);
    float _2412 = _2288 * _2386;
    float _2414 = -_2382;
    float _2416 = _2414 + 1.0;
    float _2418 = -_2400;
    float _2420 = _2418 + 1.0;
    float _2422 = _2382 * _2408;
    float _2424 = fma(_2252, _2346, _2404);
    float _2426 = fma(_2228, _2370, _1008);
    float _2428 = -_1018;
    float _2430 = _2428 + _2410;
    float _2432 = _2362 * _2420;
    float _2434 = fma(_2304, _2412, _2424);
    float _2436 = _2402 * 6.283185482025146484375;
    float _2438 = cos(_2436);
    float _2440 = -_1008;
    float _2442 = _2440 + _2426;
    float _2444 = _1564 * _2430;
    float _2446 = fma(_2230, _2370, _1034);
    float _2448 = _2324 * _2416;
    float _2450 = fma(_2262, _2388, _2434);
    float _2452 = _1522 * _2430;
    float _2454 = fma(_1518, _2442, _2444);
    float _2456 = _2402 * 6.283185482025146484375;
    float _2458 = sin(_2456);
    float _2460 = -_1034;
    float _2462 = _2460 + _2446;
    float _2464 = _1540 * _2430;
    float _2466 = fma(_2290, _2448, _2450);
    float _2468 = fma(_1568, _2442, _2452);
    float _2470 = fma(_1546, _2462, _2454);
    float _2472 = _1596 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _2474 = fma(_1576, _2442, _2464);
    float _2476 = fma(_2332, _2422, _2466);
    float _2478 = fma(_1578, _2462, _2468);
    float _2480 = _2472 * _2140;
    float _2482 = _1018 + _2470;
    float _2484 = fma(_1566, _2462, _2474);
    float _2486 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[194].z, 200.0);
    float _2488 = -_2438;
    float _2490 = _2488 + 1.0;
    float _2492 = _1008 + _2478;
    float _2494 = fma(_2480, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2482);
    float _2496 = _1490 * _2458;
    float _2498 = _1488 * _2490;
    float _2500 = fma(_2480, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2492);
    float _2502 = fma(_2486, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2494);
    float _2504 = fma(_2276, _2432, _2476);
    float _2506 = -_2496;
    float _2508 = fma(_1486, _2498, _2506);
    float _2510 = fma(_2486, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2500);
    float _2512 = -_1018;
    float _2514 = _2512 + _2502;
    float _2516 = _2198 * 0.15915493667125701904296875;
    float _2518 = fma(_1488, _2498, _2438);
    float _2520 = -_1008;
    float _2522 = _2520 + _2510;
    float _2524 = _2508 * _2514;
    float _2526 = fma(_2400, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2504);
    float _2528 = _1034 + _2484;
    float _2530 = _1488 * _2458;
    float _2532 = _1486 * _2490;
    float _2534 = _2516 * 6.283185482025146484375;
    float _2536 = cos(_2534);
    float _2538 = fma(_2518, _2522, _2524);
    float _2540 = _1486 * _2458;
    float _2542 = fma(_2480, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2528);
    float _2544 = fma(_1490, _2532, _2530);
    float _2546 = _2526 * _2472;
    float _2548 = fma(_2228, _2240, _1008);
    float _2550 = fma(_2486, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2542);
    float _2552 = _2516 * 6.283185482025146484375;
    float _2554 = sin(_2552);
    float _2556 = _2544 * _2514;
    float _2558 = -_2540;
    float _2560 = fma(_1490, _2498, _2558);
    float _2562 = fma(_2214, _2240, _1018);
    float _2564 = fma(_1490, _2498, _2540);
    float _2566 = -_1034;
    float _2568 = _2566 + _2550;
    float _2570 = fma(_2560, _2522, _2556);
    float _2572 = fma(_2230, _2240, _1034);
    float _2574 = in.m_61.w;
    float _2576 = -_2536;
    float _2578 = _2576 + 1.0;
    float _2580 = fma(_2546, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2562);
    float _2582 = fma(_2564, _2568, _2538);
    float _2584 = fma(_1538, _2490, _2438);
    float _2586 = fma(_2578, _1538, _2536);
    float _2588 = fma(_2546, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2548);
    float _2590 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2580);
    float _2592 = _1488 * _2554;
    float _2594 = _1486 * _2554;
    float _2596 = _1490 * _2554;
    float _2598 = _1488 * _2578;
    float _2600 = _1486 * _2578;
    float _2602 = fma(_2546, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2572);
    float _2604 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2588);
    float _2606 = -_1018;
    float _2608 = _2606 + _2590;
    float _2610 = fma(_1490, _2600, _2592);
    float _2612 = -_2596;
    float _2614 = fma(_1486, _2598, _2612);
    float _2616 = -_2594;
    float _2618 = fma(_1490, _2598, _2616);
    float _2620 = -_1008;
    float _2622 = _2620 + _2604;
    float _2624 = _2610 * _2608;
    float _2626 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2602);
    float _2628 = fma(_1488, _2598, _2536);
    float _2630 = _2614 * _2608;
    float _2632 = fma(_2584, _2568, _2570);
    float _2634 = fma(_2618, _2622, _2624);
    float _2636 = -_1034;
    float _2638 = _2636 + _2626;
    float _2640 = fma(_2628, _2622, _2630);
    float _2642 = fma(_1490, _2598, _2594);
    float _2644 = -_2574;
    float _2646 = _2644 + 1.0;
    float _2648 = _1034 + _2632;
    float _2650 = fma(_2586, _2638, _2634);
    float _2652 = fma(_2642, _2638, _2640);
    float _2654 = _1008 + _2582;
    float _2656 = _2648 * _2646;
    float _2658 = _1034 + _2650;
    float _2660 = _1008 + _2652;
    float _2662 = _2654 * _2646;
    float _2664 = fma(_1486, _2532, _2438);
    float _2666 = fma(_2658, _2574, _2656);
    float _2668 = fma(_1486, _2498, _2496);
    float _2670 = fma(_2660, _2574, _2662);
    float _2672 = _2664 * _2514;
    float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2676 = _2666 + _2674;
    float _2678 = fma(_1486, _2600, _2536);
    float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2682 = _2670 + _2680;
    float _2684 = -_2530;
    float _2686 = fma(_1490, _2532, _2684);
    float _2688 = _2676 * _2676;
    float _2690 = fma(_2668, _2522, _2672);
    float _2692 = fma(_1486, _2598, _2596);
    float _2694 = _2678 * _2608;
    float _2696 = fma(_2682, _2682, _2688);
    float _2698 = fma(_2686, _2568, _2690);
    float _2700 = -_2592;
    float _2702 = fma(_1490, _2600, _2700);
    float _2704 = fma(_2692, _2622, _2694);
    float _2706 = sqrt(_2696);
    float _2708 = _1018 + _2698;
    float _2710 = fma(_2702, _2638, _2704);
    float _2712 = _2708 * _2646;
    float _2714 = _1018 + _2710;
    float _2716 = fma(_2714, _2574, _2712);
    bool _2718 = _2706 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2720 = _2688;
    float _2722 = _2568;
    float _2724 = _2638;
    float _2726 = _2690;
    float _2728 = _2716;
    float _2730 = _2648;
    float _2732 = _2574;
    int _2734 = as_type<int>(_2572);
    float _2736 = _2468;
    float _2738 = _2694;
    float _2740 = _2596;
    if (!_2718)
    {
        _2720 = _2670;
    }
    float _2742 = _2720;
    float _2744 = _2742;
    if (!_2718)
    {
        _2722 = _2666;
    }
    float _2746 = _2722;
    float _2748 = _2746;
    if (!_2718)
    {
        _2724 = _2716;
    }
    float _2750 = _2724;
    bool _2752 = !_2718;
    float _2754 = _2750;
    if (!_2752)
    {
        float _2756 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2760 = _2706 + _2758;
        float _2762 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2764 = _2760 * _2756;
        float _2766 = rsqrt(_2696);
        float _2768 = _2764 * 0.15915493667125701904296875;
        float _2770 = _2768 * 6.283185482025146484375;
        float _2772 = cos(_2770);
        float _2774 = _2768 * 6.283185482025146484375;
        float _2776 = sin(_2774);
        float _2778 = _2772 + (-1.0);
        float _2780 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2782 = fma(_2776, _2762, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2784 = fma(_2716, _2772, _2780);
        float _2786 = _2766 * _2782;
        float _2788 = fma(_2682, _2786, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2790 = fma(_2676, _2786, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2754 = _2784;
        _2744 = _2788;
        _2748 = _2790;
    }
    float _2792 = _2754;
    float _2794 = _2744;
    float _2796 = _2748;
    float _2798 = -_1800;
    float _2800 = fma(_2798, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2792);
    float _2802 = -_1802;
    float _2804 = fma(_2802, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2794);
    float _2806 = -_1828;
    float _2808 = fma(_2806, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2796);
    float _2810 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2812 = _2800 + _2810;
    float _2814 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2816 = _2804 + _2814;
    float _2818 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2820 = _2808 + _2818;
    float _2822 = _2812 * _2812;
    float _2824 = fma(_2816, _2816, _2822);
    float _2826 = fma(_2820, _2820, _2824);
    float _2828 = rsqrt(_2826);
    float _2830 = _2828 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2832 = _2816 * _2830;
    float _2834 = _2820 * _2830;
    float _2836 = _2832 * _2832;
    float _2838 = _2834 * _2834;
    float _2840 = _2836 + _2838;
    float _2842 = sqrt(_2840);
    bool _2844 = _2842 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2848 = _2842 + _2846;
    float _2850 = _2820;
    float _2852 = _2840;
    float _2854 = _2848;
    float _2856 = _2830;
    bool _2858 = _2844;
    if (_2844)
    {
        float _2860 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2850 = _2860;
    }
    float _2862 = _2850;
    if (_2844)
    {
        float _2864 = rsqrt(_2840);
        _2852 = _2864;
    }
    float _2866 = _2852;
    if (_2844)
    {
        float _2868 = _2848 * _2862;
        _2854 = _2868;
    }
    float _2870 = _2854;
    if (_2844)
    {
        float _2872 = _2870 * 0.15915493667125701904296875;
        _2726 = _2872;
    }
    float _2874 = _2726;
    float _2876 = _2822;
    float _2878 = _2874;
    if (_2844)
    {
        float _2880 = _2874 * 6.283185482025146484375;
        float _2882 = sin(_2880);
        _2876 = _2882;
    }
    float _2884 = _2876;
    float _2886 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2888 = precise::max(0.0, _2886);
    float _2890 = _2828;
    float _2892 = _2888;
    float _2894 = _2886;
    if (_2844)
    {
        float _2896 = _2874 * 6.283185482025146484375;
        float _2898 = cos(_2896);
        _2890 = _2898;
    }
    float _2900 = _2890;
    float _2902 = -_2830;
    float _2904 = -_2888;
    float _2906 = fma(_2812, _2902, _2904);
    float _2908 = _2906;
    if (!_2844)
    {
        _2892 = _2832;
    }
    float _2910 = _2892;
    float _2912 = _2910;
    if (_2844)
    {
        float _2914 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2894 = _2914;
    }
    float _2916 = _2894;
    float _2918 = _2884;
    float _2920 = _2916;
    if (_2844)
    {
        float _2922 = fma(_2884, _2916, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2918 = _2922;
    }
    float _2924 = _2918;
    float _2926 = _2924;
    float _2928 = _2900;
    if (_2844)
    {
        float _2930 = _2900 + (-1.0);
        _2920 = _2930;
    }
    float _2932 = _2920;
    float _2934 = _2932;
    if (_2844)
    {
        float _2936 = _2866 * _2924;
        _2856 = _2936;
    }
    float _2938 = _2856;
    if (!_2844)
    {
        _2926 = _2836;
    }
    float _2940 = _2926;
    float _2942 = sqrt(_2826);
    float _2944 = _2940;
    if (_2844)
    {
        float _2946 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2878 = _2946;
    }
    float _2948 = _2878;
    if (_2844)
    {
        float _2950 = _2832 * _2938;
        _2912 = _2950;
    }
    float _2952 = _2912;
    if (!_2844)
    {
        _2934 = _2834;
    }
    float _2954 = _2934;
    float _2956 = _2954;
    if (_2844)
    {
        float _2958 = _2834 * _2938;
        _2956 = _2958;
    }
    float _2960 = _2956;
    if (_2844)
    {
        float _2962 = fma(_2906, _2900, _2948);
        _2908 = _2962;
    }
    float _2964 = _2908;
    if (_2844)
    {
        float _2966 = _2952 * _2952;
        _2944 = _2966;
    }
    float _2968 = _2944;
    if (!_2844)
    {
        _2928 = _2838;
    }
    float _2970 = _2928;
    float _2972 = _2970;
    if (_2844)
    {
        float _2974 = _2960 * _2960;
        _2972 = _2974;
    }
    float _2976 = _2972;
    float _2978 = fma(_2964, _2964, _2968);
    float _2980 = _2978 + _2976;
    float _2982 = _2800 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2984 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2986 = fma(_2942, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2984);
    float _2988 = precise::clamp(_2986, 0.0, 1.0);
    float _2990 = _2800 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2992 = rsqrt(_2980);
    float _2994 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2982);
    float _2996 = -_2988;
    float _2998 = _2996 + 1.0;
    float _3000 = _2800 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3002 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2990);
    float _3004 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2994);
    float _3006 = _2800 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3008 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3000);
    float _3010 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3002);
    float _3012 = _3004 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3014 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3006);
    float _3016 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3018 = abs(_2998);
    float _3020 = log2(_3018);
    float _3022 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3024 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3008);
    float _3026 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3014);
    float _3028 = _3010 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3030 = _2992 * _2952;
    float _3032 = -_3022;
    float _3034 = fma(_3032, _3016, 1.0);
    float _3036 = _3024 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3038 = _3026 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3040 = _3028 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3042 = _2992 * _2964;
    float _3044 = _3030 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3046 = _2992 * _2960;
    float _3048 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3040);
    float _3050 = log2(_3034);
    float _3052 = -_3044;
    float _3054 = fma(_3042, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3052);
    float _3056 = _3020 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3058 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3048);
    float _3060 = _3028 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3062 = -_3046;
    float _3064 = fma(_3062, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3054);
    float _3066 = _3028 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3068 = fma(_3036, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3058);
    float _3070 = exp2(_3056);
    float _3072 = fma(_3064, -0.5, 0.5);
    float _3074 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3066);
    float _3076 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3060);
    float _3078 = fma(_3064, 0.5, 0.5);
    float _3080 = _3042 + 1.0;
    float _3082 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3074);
    float _3084 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3076);
    float _3086 = 1.0 / _3068;
    float _3088 = fma(_3078, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3090 = fma(_3036, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3082);
    float _3092 = fma(_3036, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3084);
    float _3094 = _3050 * 0.693147182464599609375;
    float _3096 = fma(_3078, _3088, -0.212114393711090087890625);
    float _3098 = sqrt(_3072);
    float _3100 = -_3042;
    float _3102 = fma(_3070, _3080, _3100);
    float _3104 = fma(_3078, _3096, 1.570728778839111328125);
    float _3106 = _3090 * _3086;
    float _3108 = _3092 * _3086;
    float _3110 = _3094 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3112 = fma(_3106, 0.5, 0.5);
    float _3114 = fma(_3108, -0.5, 0.5);
    float _3116 = fma(_3102, 0.5, 0.5);
    float _3118 = _3098 * 0.636619746685028076171875;
    float3 _8527 = float3(_3112, _3114, _3110);
    float _3120 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8527, float3(0.0), isnan(_8527)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8527, float3(0.0), isnan(_8527)), level(0.0)).x;
    float3 _8538 = float3(_3112, _3114, _3110);
    float4 _3123 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8538, float3(0.0), isnan(_8538)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8538, float3(0.0), isnan(_8538)), level(0.0)).xyzw;
    float _3125 = _3123.x;
    float _3127 = _3123.y;
    float _3129 = _3123.z;
    float _3131 = _3123.w;
    float _3133 = -_3104;
    float _3135 = fma(_3118, _3133, 1.0);
    float2 _8560 = float2(_3135, _3116);
    float3 _3139 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8560, float2(0.0), isnan(_8560)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8560, float2(0.0), isnan(_8560)), level(0.0)).xyz;
    float _3141 = _3139.x;
    float _3143 = _3139.y;
    float _3145 = _3139.z;
    float _3147 = in.m_65.x;
    int _3149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _3151 = _3149 != 0;
    float _3153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3157 = _3155 != 0;
    out.m_67.w = _808;
    int _3159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _3161 = _3159 != 0;
    float _3163 = _3028 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_69.w = _2574;
    int _3165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _3167 = _3165 != 0;
    float _3169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3171 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3173 = _3167 ? as_type<float>(_1952) : _1804;
    float _3175 = _1796 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _3177 = as_type<int>(_3118);
    float _3179 = _3104;
    if (_3151)
    {
        bool _3181 = _1214 > 0.5;
        _2858 = _3181;
    }
    bool _3183 = _2858;
    out.m_69.x = _896;
    bool _3185 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3187 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3189 = _3185 || _3187;
    bool _3191 = isnan(0.5);
    bool _3193 = _3189 || _3191;
    float _3195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3197 = _3153 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3199 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3163);
    float _3201 = _3173 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _3203 = _3147;
    if (_3151)
    {
        float _3205 = -_3147;
        float _3207 = _3205 + 1.0;
        _3177 = as_type<int>(_3207);
    }
    int _3209 = _3177;
    if (!_3151)
    {
        _3179 = _3147;
    }
    float _3211 = _3179;
    float _3213 = _3169 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3215 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3217 = _3211;
    if (!_3157)
    {
        _2728 = _3147;
    }
    float _3219 = _2728;
    out.m_71.x = _2804;
    out.m_71.y = _2800;
    out.m_71.z = _2808;
    float _3221 = _3219;
    if (_3151)
    {
        float _3223 = _3183 ? as_type<float>(_3209) : _3147;
        _3217 = _3223;
    }
    float _3225 = _3217;
    int _3227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _3229 = _3227 != 0;
    float _3231 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _3233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _3235 = _3233 != 0;
    float _3237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3239 = -_3171;
    float _3241 = fma(_3231, 2.0, _3239);
    float _3243 = fma(_3197, _3225, -0.5);
    float _3245 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _3247 = _3215 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3249 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3253 = fma(_3175, -2.0, _3245);
    float _3255 = fma(_3213, _1940, -0.5);
    int _3257 = as_type<int>(_3253);
    int _3259 = as_type<int>(_3247);
    float _3261 = _3255;
    if (!_3235)
    {
        _2730 = _1826;
    }
    float _3263 = _2730;
    float _3265 = _3195 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3267 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3249);
    float _3269 = _3263;
    if (!_3235)
    {
        _2732 = _3263;
    }
    float _3271 = _2732;
    float _3273 = fma(_3265, _1956, -0.5);
    float _3275 = _3271;
    if (_3235)
    {
        _3269 = _1826;
    }
    float _3277 = _3269;
    float _3279 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3281 = _3279;
    if (_3229)
    {
        float _3283 = -_3147;
        float _3285 = _3283 + 1.0;
        _2734 = as_type<int>(_3285);
    }
    int _3287 = _2734;
    float _3289 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3279);
    if (!_3235)
    {
        _2736 = _1214;
    }
    float _3291 = _2736;
    float _3293 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3295 = _3291;
    if (!_3235)
    {
        _2738 = _1796;
    }
    float _3297 = _2738;
    float _3299 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3301 = _3297;
    float _3303 = _3299;
    if (!_3235)
    {
        _3281 = _3291;
    }
    float _3305 = _3281;
    float _3307 = fma(_1796, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3293);
    float _3309 = _3305;
    if (_3235)
    {
        _3295 = _1214;
    }
    float _3311 = _3295;
    float _3313 = fma(_1796, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3299);
    if (!_3235)
    {
        _1332 = _3297;
    }
    float _3315 = _1332;
    float _3317 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3307);
    float _3319 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[76].y, _3253);
    float _3321 = _3315;
    if (_3235)
    {
        _3301 = _1796;
    }
    float _3323 = _3301;
    if (_3157)
    {
        float _3325 = -_3147;
        float _3327 = _3325 + 1.0;
        _3257 = as_type<int>(_3327);
    }
    int _3329 = _3257;
    float _3331 = -_3319;
    float _3333 = fma(_3317, _3255, _3331);
    float _3335 = fma(_1960, _3247, -0.5);
    float _3337 = as_type<float>(_3329);
    if (!_3235)
    {
        _2740 = _3315;
    }
    float _3339 = _2740;
    float _3341 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _3343 = _3339;
    if (_3235)
    {
        _3309 = _3277;
    }
    float _3345 = _3309;
    float _3347 = _3345;
    if (_3161)
    {
        float _3349 = -_3147;
        float _3351 = _3349 + 1.0;
        _3259 = as_type<int>(_3351);
    }
    int _3353 = _3259;
    if (_3235)
    {
        _3321 = _3311;
    }
    float _3355 = _3321;
    float _3357 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3359 = _3357;
    if (_3157)
    {
        float _3361 = _1944 ? as_type<float>(_3329) : _3147;
        _3221 = _3361;
    }
    float _3363 = _3221;
    float _3365 = -_106;
    float _3367 = fma(_3365, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3241);
    if (!_3229)
    {
        _3337 = _3147;
    }
    float _3369 = _3337;
    float _3371 = _3369;
    if (_3229)
    {
        float _3373 = _1884 ? as_type<float>(_3287) : _3147;
        _3371 = _3373;
    }
    float _3375 = _3371;
    float _3377 = fma(_3345, (*spvDescriptorSet0.vp_c9)._m0[84].z, _3341);
    if (!_3161)
    {
        _3261 = _3147;
    }
    float _3379 = _3261;
    float _3381 = fma(_3355, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3357);
    float _3383 = _3379;
    if (_3161)
    {
        float _3385 = _1884 ? as_type<float>(_3353) : _3147;
        _3383 = _3385;
    }
    float _3387 = _3383;
    float _3389 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[84].x, _3377);
    if (_3235)
    {
        _3359 = _3311;
    }
    float _3391 = _3359;
    float _3393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _3395 = _3391;
    if (_3235)
    {
        _3203 = _3277;
    }
    float _3397 = _3203;
    float _3399 = _3397;
    if (!_3235)
    {
        _3395 = _3277;
    }
    float _3401 = _3395;
    float _3403 = -_1800;
    float _3405 = fma(_3403, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1018);
    if (_3235)
    {
        _3347 = _3323;
    }
    float _3407 = _3347;
    float _3409 = _3407;
    if (_3235)
    {
        _3343 = _3311;
    }
    float _3411 = _3343;
    float _3413 = _3405 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (!_3235)
    {
        _3409 = _3311;
    }
    float _3415 = _3409;
    float _3417 = -_1828;
    float _3419 = fma(_3417, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1034);
    if (!_3235)
    {
        _3303 = _3271;
    }
    float _3421 = _3303;
    float _3423 = _3411 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3425 = _3421;
    if (_3235)
    {
        _3275 = _3323;
    }
    float _3427 = _3275;
    float _3429 = _3237 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3431 = _3427;
    if (_3235)
    {
        _3425 = _3323;
    }
    float _3433 = _3425;
    float _3435 = _3389 * (-0.15915493667125701904296875);
    if (!_3235)
    {
        _3399 = _3323;
    }
    float _3437 = _3399;
    float _3439 = -_1802;
    float _3441 = fma(_3439, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1008);
    float _3443 = _3433 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3445 = _3435 * 6.283185482025146484375;
    float _3447 = sin(_3445);
    float _3449 = fma(_3441, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3413);
    float _3451 = _3405 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3453 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3455 = fma(_3419, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3449);
    float _3457 = fma(_3429, _3363, -0.5);
    float _3459 = -_3453;
    float _3461 = fma(_3423, 2.0, _3459);
    float _3463 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3465 = _3251 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3467 = _3455 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3469 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _3471 = fma(_3443, -2.0, _3463);
    float _3473 = fma(_3465, _3387, -0.5);
    float _3475 = 1.0 / _3467;
    float _3477 = fma(_3441, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3451);
    float _3479 = fma(_3437, (*spvDescriptorSet0.vp_c9)._m0[89].z, _3469);
    float _3481 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3289);
    float _3483 = fma(_3419, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3477);
    float _3485 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3487 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[89].x, _3479);
    float _3489 = _3435 * 6.283185482025146484375;
    float _3491 = cos(_3489);
    float _3493 = fma(_3481, _3243, _3367);
    float _3495 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3497 = _3401 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _3499 = _3483 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3501 = fma(_3427, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3485);
    float _3503 = _3487 * (-0.15915493667125701904296875);
    float _3505 = -_3495;
    float _3507 = fma(_3497, 2.0, _3505);
    float _3509 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3267);
    float _3511 = _3499 + _3467;
    float _3513 = _3447 * _3273;
    float _3515 = _3467;
    float _3517 = _3457;
    if (!_3193)
    {
        _3515 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3519 = _3515;
    float _3521 = _3503 * 6.283185482025146484375;
    float _3523 = sin(_3521);
    float _3525 = _3511 * _3475;
    float _3527 = _3525 * 0.5;
    float _3529 = _3519;
    if (!_3193)
    {
        _3431 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _3531 = _3431;
    float _3533 = _3491 * _3273;
    float _3535 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3501);
    float _3537 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3471);
    if (!_3193)
    {
        float _3539 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3541 = fma(_3527, _3519, _3539);
        _3529 = _3541;
    }
    float _3543 = _3529;
    float _3545 = fma(_3447, _3457, _3533);
    float _3547 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3549 = _3503 * 6.283185482025146484375;
    float _3551 = cos(_3549);
    if (!_3193)
    {
        float _3553 = -_3531;
        float _3555 = _3553 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1290 = _3555;
    }
    float _3557 = _1290;
    float _3559 = -_3537;
    float _3561 = fma(_3535, _3545, _3559);
    float _3563 = _3415 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3565 = _3020 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3567 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3381);
    float _3569 = -_106;
    float _3571 = fma(_3569, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3461);
    float _3573 = fma(_3563, -2.0, _3547);
    float _3575 = _3381;
    if (!_3193)
    {
        float _3577 = 1.0 / _3543;
        _3575 = _3577;
    }
    float _3579 = _3575;
    float _3581 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3313);
    float _3583 = -_106;
    float _3585 = fma(_3583, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3507);
    float _3587 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3573);
    float _3589 = _3523 * _3335;
    float _3591 = -_3513;
    float _3593 = fma(_3491, _3457, _3591);
    float _3595 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3199);
    float _3597 = _3561 + 0.5;
    float _3599 = _3557;
    if (!_3193)
    {
        float _3601 = 1.0 / _3557;
        _3599 = _3601;
    }
    float _3603 = _3599;
    float _3605 = -_3589;
    float _3607 = fma(_3551, _3473, _3605);
    float _3609 = _3551 * _3335;
    float _3611 = fma(_3567, _3593, _3571);
    float _3613 = _3333 + 0.5;
    float _3615 = fma(_3509, _3607, _3585);
    float _3617 = fma(_3523, _3473, _3609);
    float _3619 = _3375 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _3621 = exp2(_3565);
    float _3623 = _3619;
    if (!_3193)
    {
        float _3625 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3627 = -_3531;
        float _3629 = fma(_3579, _3625, _3627);
        _3517 = _3629;
    }
    float _3631 = _3517;
    float _3633 = fma(_3036, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3595);
    float _3635 = -_3587;
    float _3637 = fma(_3581, _3617, _3635);
    float _3639 = _3619 * _3393;
    float _3641 = _3631;
    if (_3193)
    {
        _3623 = 1.0;
    }
    float _3643 = _3623;
    float _3645 = _3615 + 0.5;
    float _3647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _3649 = _3643;
    if (!_3193)
    {
        float _3651 = _3631 * _3603;
        float _3653 = precise::clamp(_3651, 0.0, 1.0);
        _3641 = _3653;
    }
    float _3655 = _3641;
    float _3657 = _3637 + 0.5;
    float _3659 = _3493 + 0.5;
    out.gl_Position.x = _3090;
    out.gl_Position.y = _3092;
    out.gl_Position.z = _3633;
    out.gl_Position.w = _3068;
    if (!_3193)
    {
        float _3661 = -_3655;
        float _3663 = _3661 + 1.0;
        _3649 = _3663;
    }
    float _3665 = _3649;
    float _3667 = _3633 + _3068;
    float _3669 = -_3621;
    float _3671 = _3669 + 1.0;
    out.m_73.x = _3645;
    out.m_73.y = _3657;
    bool _3673 = _3665 > 0.0;
    bool _3675 = isnan(_3665);
    bool _3677 = _3673 || _3675;
    bool _3679 = isnan(0.0);
    bool _3681 = _3677 || _3679;
    float _3683 = _3665 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3685 = _3671 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3687 = _3667 * 0.5;
    float _3689 = _3683 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3691 = _3201 * _3647;
    float _3693 = _3611 + 0.5;
    float _3695 = -_3685;
    float _3697 = _3695 + 1.0;
    out.m_75.z = _3687;
    out.m_75.w = _3068;
    out.m_77.x = _3639;
    out.m_77.y = _3691;
    out.m_79.x = _3659;
    out.m_79.y = _3613;
    out.m_79.z = _3693;
    out.m_79.w = _3597;
    out.m_49.x = _3689;
    float _3699 = _3685 * _3120;
    float _3701 = _3131 * _3697;
    float _3703 = _3131 * _3699;
    float _3705 = _3145 * _3699;
    float _3707 = fma(_3141, _3703, _3125);
    float _3709 = fma(_3143, _3703, _3127);
    float _3711 = fma(_3131, _3705, _3129);
    out.m_81.x = _3707;
    out.m_81.y = _3709;
    out.m_81.z = _3711;
    out.m_81.w = _3701;
    if (_3681)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3713 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3713;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _830 = false;
    bool _668 = false;
    bool _508 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = in.m_44.w;
    float _99 = trunc(_95);
    int _102 = int(_99);
    float _104 = -_97;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _106;
    bool _110 = _102 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_102);
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3781 = as_type<float>(_122);
        out.gl_Position.z = _3781;
    }
    if (!_110)
    {
        return out;
    }
    bool _126 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_97);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = float(_102);
    bool _138 = _106 >= _136;
    bool _140 = !_134;
    bool _142 = _138 || _140;
    float _144 = 0.0;
    float _146 = 0.0;
    if (_142)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _114;
    if (_142)
    {
        out.m_49.x = 0.0;
    }
    if (_142)
    {
        float _150 = _148 * 5.0;
        _124 = as_type<int>(_150);
    }
    int _152 = _124;
    float _154 = as_type<float>(_152);
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3838 = as_type<float>(_152);
        out.gl_Position.z = _3838;
    }
    if (_142)
    {
        return out;
    }
    float _156 = in.m_44.x;
    float _158 = in.m_44.y;
    float _160 = in.m_44.z;
    float _162 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = _162;
    if (!_172)
    {
        float _176 = _162 * _162;
        float _178 = _176 * 0.5;
        _154 = _178;
    }
    float _180 = _154;
    float _182 = 0.0;
    float _184 = _180;
    if (!_172)
    {
        float _186 = _106 * _106;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    if (!_172)
    {
        float _192 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _192;
    }
    float _194 = _184;
    bool _196 = !_172;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _162 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _162);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _144 = _218;
        _198 = _228;
        _146 = _216;
    }
    float _230 = _144;
    float _232 = _198;
    float _234 = _146;
    bool _236 = !_172;
    float _238 = _230;
    float _240 = _234;
    if (!_236)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _162 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _238 = _254;
        _240 = _248;
        _174 = _260;
    }
    float _262 = _238;
    float _264 = _240;
    float _266 = _174;
    float _268 = _264;
    float _270 = _262;
    if (!_172)
    {
        _268 = _106;
    }
    float _272 = _268;
    float _274 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _276 = _272;
    if (!_172)
    {
        float _278 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _270 = _278;
    }
    float _280 = _270;
    bool _282 = !_172;
    float _284 = _280;
    if (!_282)
    {
        float _286 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _288 = log2(_286);
        float _290 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _292 = _290 + 1.0;
        float _294 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _296 = _106 * _288;
        float _298 = 1.0 / _292;
        float _300 = _294 * 0.693147182464599609375;
        float _302 = exp2(_296);
        float _304 = 1.0 / _300;
        float _306 = _302 + (-1.0);
        float _308 = -_306;
        float _310 = fma(_308, _304, _106);
        float _312 = _310 * _298;
        float _314 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _284 = _314;
    }
    float _316 = _284;
    bool _318 = !_172;
    if (!_318)
    {
        float _320 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _322 = log2(_320);
        float _324 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _326 = _324 + 1.0;
        float _328 = 1.0 / _326;
        float _330 = _106 * _322;
        float _332 = exp2(_330);
        float _334 = -_332;
        float _336 = _334 + 1.0;
        float _338 = _336 * _328;
        _276 = _338;
    }
    float _340 = _276;
    float _342 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _344 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _346 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _348 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_266, _158, _342);
    float _352 = fma(_340, _158, _344);
    float _354 = fma(_266, _156, _274);
    float _356 = fma(_340, _156, _346);
    float _358 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _360 = -_352;
    float _362 = _350 + _360;
    float _364 = fma(_266, _160, _348);
    float _366 = -_356;
    float _368 = _354 + _366;
    float _370 = fma(_340, _160, _358);
    float _372 = _362 * _362;
    float _374 = in.m_51.w;
    float _376 = 1.0 / _136;
    float _378 = -_370;
    float _380 = _364 + _378;
    float _382 = fma(_368, _368, _372);
    float _384 = in.m_42.x;
    float _386 = in.m_42.y;
    float _388 = in.m_42.z;
    float _390 = fma(_380, _380, _382);
    float _392 = in.m_53.y;
    float _394 = in.m_55.y;
    float _396 = sqrt(_390);
    float _398 = in.m_53.x;
    float _400 = _106 * _376;
    float _402 = in.m_57.y;
    float _404 = in.m_55.x;
    float _406 = in.m_53.z;
    float _408 = fma(_354, _374, _384);
    float _410 = fma(_350, _374, _386);
    bool _412 = _396 >= 9.9999999747524270787835121154785e-07;
    bool _414 = isnan(_396);
    bool _416 = _412 || _414;
    bool _418 = isnan(9.9999999747524270787835121154785e-07);
    bool _420 = _416 || _418;
    float _422 = in.m_57.x;
    float _424 = fma(_364, _374, _388);
    float _426 = _362 * _392;
    float _428 = in.m_55.z;
    float _430 = _362 * _394;
    float _432 = in.m_57.z;
    float _434 = fma(_368, _398, _426);
    float _436 = _362 * _402;
    float _438 = _402 * _402;
    float _440 = fma(_368, _404, _430);
    float _442 = fma(_392, _392, _438);
    float _444 = fma(_380, _406, _434);
    float _446 = fma(_394, _394, _442);
    float _448 = fma(_368, _422, _436);
    float _450 = fma(_380, _428, _440);
    float _452 = _440;
    float _454 = _450;
    float _456 = _450;
    if (_420)
    {
        _452 = _444;
    }
    float _458 = _452;
    float _460 = fma(_380, _432, _448);
    float _462 = _458;
    float _464 = _460;
    float _466 = _460;
    float _468 = _458;
    if (!_420)
    {
        bool _470 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _472 = !_470;
        if (!_472)
        {
            float _474 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _476 = _392 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _478 = _394 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _480 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[16].x, _474);
            float _482 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[16].x, _476);
            float _484 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[16].x, _478);
            float _486 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[16].z, _480);
            float _488 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[16].z, _482);
            float _490 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[16].z, _484);
            float _492 = _486 * _486;
            float _494 = fma(_488, _488, _492);
            float _496 = fma(_490, _490, _494);
            float _498 = rsqrt(_496);
            float _500 = _498 * 9.9999999747524270787835121154785e-07;
            float _502 = _488 * _500;
            float _504 = _486 * _500;
            float _506 = _490 * _500;
            _466 = _504;
            _468 = _502;
            _456 = _506;
            _508 = true;
        }
        else
        {
            float _510 = _158 * _158;
            float _512 = fma(_156, _156, _510);
            float _514 = fma(_160, _160, _512);
            float _516 = sqrt(_514);
            bool _518 = _516 >= 9.9999999747524270787835121154785e-07;
            bool _520 = isnan(_516);
            bool _522 = _518 || _520;
            bool _524 = isnan(9.9999999747524270787835121154785e-07);
            bool _526 = _522 || _524;
            float _528 = _516;
            if (!_526)
            {
                float _530 = _386 * _386;
                float _532 = fma(_384, _384, _530);
                float _534 = fma(_388, _388, _532);
                float _536 = sqrt(_534);
                bool _538 = _536 >= 9.9999999747524270787835121154785e-07;
                bool _540 = isnan(_536);
                bool _542 = _538 || _540;
                bool _544 = isnan(9.9999999747524270787835121154785e-07);
                bool _546 = _542 || _544;
                float _548 = _446;
                if (!_546)
                {
                    float _550 = rsqrt(_446);
                    _548 = _550;
                }
                float _552 = _548;
                if (!_546)
                {
                    float _554 = _552 * 9.9999999747524270787835121154785e-07;
                    _528 = _554;
                }
                float _556 = _528;
                if (!_546)
                {
                    float _558 = _392 * _556;
                    _462 = _558;
                }
                float _560 = _462;
                _468 = _560;
                if (!_546)
                {
                    float _562 = _402 * _556;
                    _464 = _562;
                }
                float _564 = _464;
                _466 = _564;
                if (!_546)
                {
                    float _566 = _394 * _556;
                    _454 = _566;
                }
                float _568 = _454;
                bool _570 = !_546;
                _456 = _568;
                _508 = _570;
                if (!_508)
                {
                    float _572 = _402 * _386;
                    float _574 = _392 * _386;
                    float _576 = _394 * _386;
                    float _578 = fma(_384, _422, _572);
                    float _580 = fma(_384, _398, _574);
                    float _582 = fma(_384, _404, _576);
                    float _584 = fma(_388, _432, _578);
                    float _586 = fma(_388, _406, _580);
                    float _588 = fma(_388, _428, _582);
                    float _590 = _584 * _584;
                    float _592 = fma(_586, _586, _590);
                    float _594 = fma(_588, _588, _592);
                    float _596 = rsqrt(_594);
                    float _598 = _596 * 9.9999999747524270787835121154785e-07;
                    float _600 = _586 * _598;
                    float _602 = _584 * _598;
                    float _604 = _588 * _598;
                    _466 = _602;
                    _468 = _600;
                    _456 = _604;
                    _508 = true;
                }
            }
            else
            {
                float _606 = _402 * _158;
                float _608 = _392 * _158;
                float _610 = _394 * _158;
                float _612 = fma(_156, _422, _606);
                float _614 = fma(_156, _398, _608);
                float _616 = fma(_156, _404, _610);
                float _618 = fma(_160, _432, _612);
                float _620 = fma(_160, _406, _614);
                float _622 = fma(_160, _428, _616);
                float _624 = _618 * _618;
                float _626 = fma(_620, _620, _624);
                float _628 = fma(_622, _622, _626);
                float _630 = rsqrt(_628);
                float _632 = _630 * 9.9999999747524270787835121154785e-07;
                float _634 = _620 * _632;
                float _636 = _618 * _632;
                float _638 = _622 * _632;
                _466 = _636;
                _468 = _634;
                _456 = _638;
            }
        }
    }
    _508 = false;
    float _640 = _466;
    float _642 = _468;
    float _644 = _456;
    bool _646 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    bool _648 = !_646;
    float _666;
    if (!_648)
    {
        float _650 = in.m_59.x;
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _654 = _650 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _656 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[11].w, _106);
        float _658 = _656 * _652;
        float _660 = floor(_658);
        float _662 = -_660;
        float _664 = _658 + _662;
        _666 = _664;
        _668 = true;
    }
    else
    {
        _666 = _400;
    }
    _668 = false;
    float _670 = _666;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _674 = _670 + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _680 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _682 = isnan(_670);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _700 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _702 = isnan(_670);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = 1.0 / _678;
    float _714 = -_690;
    float _716 = _714 + 1.0;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _718;
    bool _722 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _724 = isnan(_670);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = _710 * _716;
    float _736 = -_710;
    float _738 = _736 + 1.0;
    bool _740 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _742 = 1.0 / _694;
    float _744 = _732 * _738;
    float _746 = -_732;
    float _748 = _746 + 1.0;
    float _750 = 1.0 / _698;
    float _752 = _720 * _712;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _758 = fma(_752, _674, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _760 = _756 * _742;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _764 = _670 + _762;
    bool _766 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _768 = isnan(_670);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _778;
    float _782 = _758 * _744;
    float _784 = fma(_760, _764, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _788 = _670 + _786;
    float _790 = -_776;
    float _792 = _790 + 1.0;
    float _794 = _780 * _750;
    float _796 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[131].x, _782);
    float _798 = _690 * _792;
    float _800 = fma(_794, _788, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _802 = fma(_784, _734, _796);
    float _804 = fma(_800, _798, _802);
    float _806 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[134].x, _804);
    float _808 = _806 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _810 = !_740;
    float _828;
    if (!_810)
    {
        float _812 = in.m_59.x;
        float _814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _816 = _812 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _818 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[14].x, _106);
        float _820 = _818 * _814;
        float _822 = floor(_820);
        float _824 = -_822;
        float _826 = _820 + _824;
        _828 = _826;
        _830 = true;
    }
    else
    {
        _828 = _400;
    }
    _830 = false;
    float _832 = _828;
    float _834 = in.m_51.x;
    float _836 = in.m_51.y;
    float _838 = in.m_51.z;
    float _840 = _410 * _402;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _842;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _850;
    float _854 = _410 * _394;
    float _856 = 1.0 / _844;
    float _858 = fma(_408, _422, _840);
    float _860 = in.m_59.w;
    float _862 = fma(_408, _404, _854);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _874 = _832 + _872;
    float _876 = 1.0 / _848;
    float _878 = _410 * _392;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _880;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _886 = _832 + _884;
    float _888 = fma(_408, _398, _878);
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _892 = _832 + _890;
    float _894 = 1.0 / _852;
    float _896 = in.m_61.x;
    float _898 = _838 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _900 = _836 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _902 = fma(_424, _406, _888);
    float _904 = fma(_424, _432, _858);
    float _906 = _834 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _908 = 1.0 / _882;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _910;
    float _914 = fma(_424, _428, _862);
    bool _916 = _860 > 0.5;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _920 = _832 + _918;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _924 = _832 + _922;
    float _926 = 1.0 / _866;
    float _928 = _886 * _894;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _932 = _832 + _930;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _934;
    float _938 = _924 * _876;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _944 = 1.0 / _912;
    float _946 = _896 * _896;
    float _948 = _920 * _908;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _954 = fma(_946, -0.980000019073486328125, 1.0);
    float _956 = (*spvDescriptorSet0.vp_c10)._m0[9].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _962 = in.m_53.w;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _966 = _832 + _964;
    float _968 = 1.0 / _870;
    float _970 = fma((*spvDescriptorSet0.vp_c10)._m0[8].y, (*spvDescriptorSet0.vp_c10)._m0[8].y, _956);
    float _972 = _892 * _926;
    float _974 = _966 * _856;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _980 = in.m_57.w;
    float _982 = _932 * _944;
    float _984 = 1.0 / _960;
    float _986 = in.m_55.w;
    float _988 = fma(_936, _974, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _990 = fma(_952, _938, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    bool _992 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _994 = _640 * _640;
    float _996 = 1.0 / _942;
    float _998 = _874 * _968;
    float _1000 = fma(_642, _642, _994);
    float _1002 = in.m_63.x;
    float _1004 = in.m_63.y;
    float _1006 = in.m_63.z;
    float _1008 = _902 + _962;
    float _1010 = fma(_644, _644, _1000);
    float _1012 = 1.0 / _978;
    float _1014 = fma(_106, 0.004999999888241291046142578125, -0.0199999995529651641845703125);
    float _1016 = _900 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1018 = _904 + _980;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1022 = _1020 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1024;
    float _1028 = rsqrt(_1010);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1034 = _914 + _986;
    float _1036 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[193].x + _1036;
    float _1040 = _898 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1046 = 1.0 / _1022;
    float _1048 = _1026 * _1012;
    float _1050 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _1054 = _1052 + 1.0;
    float _1056 = 1.0 / _1032;
    float _1058 = _1028 * _642;
    float _1060 = _1028 * _640;
    float _1062 = _1028 * _644;
    float _1064 = precise::max(0.0, _1050);
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1068 = _1058 * _1066;
    float _1070 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1002);
    float _1072 = 1.0 / _1044;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1076 = _1074 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1086 = precise::max(_1064, 400.0);
    float _1088 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1004);
    float _1090 = _1080 * _996;
    float _1092 = _1084 * _984;
    float _1094 = 1.0 / _1076;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1098 = _1096 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1106 = _1104 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1108 = _1098 * _1046;
    float _1110 = _1102 * _1056;
    float _1112 = _1106 * _1072;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1114;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1118;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1122;
    float _1126 = precise::min(_1086, 600.0);
    float _1128 = fma((*spvDescriptorSet0.vp_c10)._m0[10].y, (*spvDescriptorSet0.vp_c10)._m0[10].y, _970);
    float _1130 = fma(_1120, _974, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1132 = fma(_1124, _974, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1134 = _1116 * _1094;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1138 = _1136 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1144;
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1148;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1152;
    float _1156 = fma(_1138, _938, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1158 = fma(_1142, _938, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1160 = fma(_1146, _928, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1162 = fma(_1150, _928, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1164 = fma(_1154, _928, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1168 = _1166 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1170;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1174;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1180 = _1178 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1188 = _1186 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1190 = fma(_1172, _948, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1192 = fma(_1176, _948, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1194 = fma(_1168, _998, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1196 = fma(_1180, _998, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1198 = fma(_1184, _948, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1200 = fma(_1188, _998, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1212 = _1210 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1214 = in.m_59.x;
    float _1216 = fma(_1204, _972, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1218 = fma(_1208, _972, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1220 = fma(_1212, _972, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1226;
    bool _1230 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1232 = isnan(_832);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1238 = _1234 || _1236;
    float _1240 = float(_1238);
    float _1242 = rsqrt(_1128);
    float _1244 = fma(_1224, _982, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _1246 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1248 = isnan(_832);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1006);
    float _1260 = -_1240;
    float _1262 = _1260 + 1.0;
    float _1264 = -_1256;
    float _1266 = _1264 + 1.0;
    float _1268 = _1256 * _1262;
    bool _1270 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1272 = isnan(_832);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1278 = _1274 || _1276;
    float _1280 = float(_1278);
    float _1282 = _1256;
    float _1284 = _1280;
    float _1286 = _1000;
    int _1288 = as_type<int>(_1040);
    float _1290 = _1008;
    if (_992)
    {
        float _1292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        _1282 = _1292;
    }
    float _1294 = _1282;
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1296;
    bool _1300 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1302 = isnan(_832);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1308 = _1304 || _1306;
    float _1310 = float(_1308);
    float _1312 = _1280 * _1266;
    float _1314 = fma(_1298, _982, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1316 = -_1280;
    float _1318 = _1316 + 1.0;
    bool _1320 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1322 = isnan(_832);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1328 = _1324 || _1326;
    float _1330 = float(_1328);
    float _1332 = _1214;
    if (_992)
    {
        float _1334 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        _1284 = _1334;
    }
    float _1336 = _1284;
    float _1338 = fma(_1228, _982, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1340 = -_1310;
    float _1342 = _1340 + 1.0;
    float _1344 = _1310 * _1318;
    float _1346 = _1336;
    if (_992)
    {
        float _1348 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[14].y, _1014);
        _1286 = _1348;
    }
    float _1350 = _1286;
    bool _1352 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1354 = isnan(_832);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1360 = _1356 || _1358;
    float _1362 = float(_1360);
    float _1364 = -_1330;
    float _1366 = _1364 + 1.0;
    float _1368 = _1330 * _1342;
    float _1370 = _106 + (-4.0);
    bool _1372 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1374 = isnan(_832);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1380 = _1376 || _1378;
    float _1382 = float(_1380);
    float _1384 = 0.0;
    float _1386 = _1382;
    if (_992)
    {
        float _1388 = _1350 * _1294;
        _1384 = _1388;
    }
    float _1390 = _1384;
    float _1392 = _1362 * _1366;
    float _1394 = -_1362;
    float _1396 = _1394 + 1.0;
    bool _1398 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1400 = isnan(_832);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1406 = _1402 || _1404;
    float _1408 = float(_1406);
    float _1410 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _1412 = -_1382;
    float _1414 = _1412 + 1.0;
    float _1416 = 0.0;
    if (_992)
    {
        float _1418 = floor(_1390);
        _1416 = _1418;
    }
    float _1420 = _1416;
    float _1422 = _1382 * _1396;
    float _1424 = _1410 * (-0.15915493667125701904296875);
    float _1426 = _1408 * _1414;
    float _1428 = -_1408;
    float _1430 = _1428 + 1.0;
    if (!_992)
    {
        _1386 = _1014;
    }
    float _1432 = _1386;
    float _1434 = _1130 * _1426;
    float _1436 = _1424 * 6.283185482025146484375;
    float _1438 = cos(_1436);
    float _1440 = _988 * _1426;
    float _1442 = _1132 * _1426;
    float _1444 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1446 = _1018 + _1444;
    float _1448 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1434);
    float _1450 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1440);
    float _1452 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1442);
    float _1454 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1456 = _1008 + _1454;
    float _1458 = _1424 * 6.283185482025146484375;
    float _1460 = sin(_1458);
    float _1462 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1464 = _1432;
    if (_992)
    {
        float _1466 = -_1420;
        float _1468 = _1390 + _1466;
        _1464 = _1468;
    }
    float _1470 = _1464;
    float _1472 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1474 = fma(_1126, 0.004999999888241291046142578125, -2.0);
    float _1476 = precise::clamp(_1474, 0.0, 1.0);
    float _1478 = fma(_1456, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1462);
    float _1480 = fma(_1156, _1422, _1448);
    float _1482 = fma(_990, _1422, _1450);
    float _1484 = fma(_1456, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1472);
    float _1486 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1488 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1490 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1492 = -_1438;
    float _1494 = _1492 + 1.0;
    float _1496 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1498 = _1034 + _1496;
    float _1500 = fma(_1158, _1422, _1452);
    float _1502 = fma(_1162, _1392, _1482);
    float _1504 = _1488 * _1460;
    float _1506 = _1486 * _1460;
    float _1508 = _1490 * _1460;
    float _1510 = _1488 * _1494;
    float _1512 = fma(_1498, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1484);
    float _1514 = fma(_1498, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1478);
    float _1516 = _1486 * _1494;
    float _1518 = fma(_1486, _1510, _1508);
    float _1520 = -_1508;
    float _1522 = fma(_1486, _1510, _1520);
    float _1524 = fma(_1160, _1392, _1480);
    bool _1526 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1528 = isnan(_1470);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1534 = _1530 || _1532;
    float _1536 = float(_1534);
    float _1538 = _1490 * _1490;
    float _1540 = fma(_1490, _1516, _1504);
    float _1542 = fma(_1194, _1368, _1524);
    float _1544 = -_1504;
    float _1546 = fma(_1490, _1516, _1544);
    float _1548 = -_1476;
    float _1550 = _1548 + 1.0;
    bool _1552 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1554 = isnan(_1470);
    bool _1556 = _1552 || _1554;
    bool _1558 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1560 = _1556 || _1558;
    float _1562 = float(_1560);
    float _1564 = fma(_1486, _1516, _1438);
    float _1566 = fma(_1538, _1494, _1438);
    float _1568 = fma(_1488, _1510, _1438);
    float _1570 = -_1536;
    float _1572 = _1570 + 1.0;
    float _1574 = -_1506;
    float _1576 = fma(_1490, _1510, _1574);
    float _1578 = fma(_1490, _1510, _1506);
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1582 = _1018 + _1580;
    bool _1584 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1586 = isnan(_1470);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1592 = _1588 || _1590;
    float _1594 = float(_1592);
    float _1596 = fma(_1550, _1054, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _1598 = fma(_1196, _1368, _1502);
    float _1600 = _1562 * _1572;
    float _1602 = -_1562;
    float _1604 = _1602 + 1.0;
    float _1606 = fma(_1164, _1392, _1500);
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1610 = _1062 * _1608;
    float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1614 = _1008 + _1612;
    float _1616 = _1582 * _1582;
    bool _1618 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1620 = isnan(_1470);
    bool _1622 = _1618 || _1620;
    bool _1624 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1626 = _1622 || _1624;
    float _1628 = float(_1626);
    float _1630 = -_1594;
    float _1632 = _1630 + 1.0;
    float _1634 = _1594 * _1604;
    float _1636 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1638 = _1060 * _1636;
    float _1640 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1642 = -_1610;
    float _1644 = fma(_1058, _1640, _1642);
    float _1646 = fma(_1614, _1614, _1616);
    bool _1648 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1650 = isnan(_1470);
    bool _1652 = _1648 || _1650;
    bool _1654 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1656 = _1652 || _1654;
    float _1658 = float(_1656);
    float _1660 = _1628 * _1632;
    float _1662 = -_1628;
    float _1664 = _1662 + 1.0;
    float _1666 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1668 = -_1638;
    float _1670 = fma(_1062, _1666, _1668);
    bool _1672 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1674 = isnan(_1470);
    bool _1676 = _1672 || _1674;
    bool _1678 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1680 = _1676 || _1678;
    float _1682 = float(_1680);
    float _1684 = _1644 * _1644;
    float _1686 = _1658 * _1664;
    float _1688 = -_1658;
    float _1690 = _1688 + 1.0;
    float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1694 = -_1068;
    float _1696 = fma(_1060, _1692, _1694);
    bool _1698 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1700 = isnan(_1470);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1706 = _1702 || _1704;
    float _1708 = float(_1706);
    float _1710 = fma(_1670, _1670, _1684);
    float _1712 = -_1682;
    float _1714 = _1712 + 1.0;
    float _1716 = _1682 * _1690;
    bool _1718 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1720 = isnan(_1470);
    bool _1722 = _1718 || _1720;
    bool _1724 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1726 = _1722 || _1724;
    float _1728 = float(_1726);
    float _1730 = fma(_1696, _1696, _1710);
    float _1732 = _1708 * _1714;
    float _1734 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1736 = _1034 + _1734;
    float _1738 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1740 = _1470 + _1738;
    float _1742 = -_1708;
    float _1744 = _1742 + 1.0;
    float _1746 = fma(_1200, _1368, _1606);
    float _1748 = fma(_1736, _1736, _1646);
    float _1750 = fma(_1090, _1740, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1752 = _1728 * _1744;
    float _1754 = fma(_1190, _1344, _1542);
    float _1756 = fma(_1192, _1344, _1598);
    float _1758 = rsqrt(_1748);
    float _1760 = _1750 * _1752;
    float _1762 = -_1728;
    float _1764 = _1762 + 1.0;
    float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1768 = _1470 + _1766;
    float _1770 = fma(_1198, _1344, _1746);
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1774 = _1470 + _1772;
    float _1776 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1760);
    float _1778 = fma(_1092, _1768, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1780 = fma(_1216, _1312, _1754);
    float _1782 = fma(_1220, _1312, _1770);
    float _1784 = fma(_1048, _1774, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1786 = fma(_1778, _1732, _1776);
    float _1788 = fma(_1218, _1312, _1756);
    float _1790 = abs(_1512);
    float _1792 = abs(_1514);
    float _1794 = precise::max(_1790, _1792);
    float _1796 = in.m_59.y;
    float _1798 = fma(_1784, _1716, _1786);
    float _1800 = _1582 * _1758;
    float _1802 = _1614 * _1758;
    float _1804 = in.m_65.y;
    bool _1806 = _1794 >= 16.0;
    float _1808 = -_1800;
    float _1810 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1582);
    float _1812 = rsqrt(_1730);
    float _1814 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1816 = _1470 + _1814;
    float _1818 = -_1802;
    float _1820 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1614);
    float _1822 = _1810 * _1810;
    float _1824 = fma(_1314, _1268, _1788);
    float _1826 = in.m_59.z;
    float _1828 = _1736 * _1758;
    float _1830 = fma(_1108, _1816, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1832 = fma(_1820, _1820, _1822);
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1836 = _1470 + _1834;
    float _1838 = -_1828;
    float _1840 = fma(_1838, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1736);
    float _1842 = fma(_1244, _1268, _1780);
    float _1844 = fma(_1830, _1686, _1798);
    float _1846 = fma(_1110, _1836, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1848 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1850 = _1470 + _1848;
    float _1852 = fma(_1338, _1268, _1782);
    float _1854 = fma(_1840, _1840, _1832);
    float _1856 = _1512;
    float _1858 = _1514;
    int _1860 = as_type<int>(_1854);
    if (_1806)
    {
        float _1862 = _1512 * 0.0625;
        _1856 = _1862;
    }
    float _1864 = _1856;
    float _1866 = fma(_1846, _1660, _1844);
    float _1868 = fma(_1112, _1850, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1870 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1842);
    float _1872 = -_1804;
    float _1874 = _1872 + 1.0;
    float _1876 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1824);
    float _1878 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1852);
    float _1880 = sqrt(_1854);
    float _1882 = _1644 * _1812;
    bool _1884 = _1796 > 0.5;
    float _1886 = fma(_1868, _1634, _1866);
    float _1888 = abs(_1864);
    bool _1890 = _1888 != 0.0;
    bool _1892 = isnan(_1888);
    bool _1894 = _1890 || _1892;
    bool _1896 = isnan(0.0);
    bool _1898 = _1894 || _1896;
    if (_1806)
    {
        float _1900 = _1514 * 0.0625;
        _1858 = _1900;
    }
    float _1902 = _1858;
    int _1904 = _916 ? as_type<int>(_1874) : as_type<int>(_1804);
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1908 = _1470 + _1906;
    int _1910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1912 = _1910 != 0;
    int _1914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1916 = _1914 != 0;
    int _1918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1920 = _1918 != 0;
    float _1922 = -_896;
    float _1924 = _1922 + 1.0;
    int _1926 = _1884 ? as_type<int>(_1874) : as_type<int>(_1804);
    float _1928 = fma(_1134, _1908, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1930 = abs(_1902);
    bool _1932 = _1930 == 0.0;
    bool _1934 = !_1898;
    bool _1936 = _1932 && _1934;
    float _1938 = _1670 * _1812;
    float _1940 = _1912 ? as_type<float>(_1926) : _1804;
    float _1942 = _1758 * _1880;
    bool _1944 = _1826 > 0.5;
    float _1946 = fma(_1928, _1600, _1886);
    float _1948 = _906 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1950 = _1876 * (*spvDescriptorSet0.vp_c9)._m0[194].y;
    int _1952 = _1944 ? as_type<int>(_1874) : as_type<int>(_1804);
    float _1954 = _1696 * _1812;
    float _1956 = _1916 ? as_type<float>(_1904) : _1804;
    float _1958 = fma(_1950, _1924, _106);
    float _1960 = _1920 ? as_type<float>(_1952) : _1804;
    float _1962 = _1948 * _1942;
    float _1964 = abs(_1902);
    bool _1966 = _1964 == 0.0;
    float _1968 = _1016 * _1942;
    bool _1970 = _1916;
    int _1972 = _1966 ? (-1) : 0;
    float _1974 = _1942;
    if (_1936)
    {
        bool _1976 = as_type<int>(_1902) >= 0;
        _1970 = _1976;
    }
    bool _1978 = _1970;
    float _1980 = _1040 * _1942;
    float _1982 = _1958 * (-0.02300000004470348358154296875);
    if (_1936)
    {
        int _1984 = _1978 ? 0 : 1078530011;
        _1860 = _1984;
    }
    int _1986 = _1860;
    if (_1936)
    {
        int _1988 = int(0x80000000) & as_type<int>(_1864);
        int _1990 = _1986 | _1988;
        _1288 = _1990;
    }
    int _1992 = _1288;
    bool _1994 = !_1898;
    bool _1996 = _1994 && _1966;
    int _1998 = _1992;
    float _2000 = as_type<float>(_1992);
    if (!_1996)
    {
        float _2002 = abs(_1864);
        bool _2004 = _2002 != as_type<float>(0x7f800000u /* inf */);
        bool _2006 = isnan(_2002);
        bool _2008 = _2004 || _2006;
        bool _2010 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _2012 = _2008 || _2010;
        float _2014 = abs(_1902);
        bool _2016 = _2014 == as_type<float>(0x7f800000u /* inf */);
        float _2018 = abs(_1902);
        bool _2020 = _2018 == as_type<float>(0x7f800000u /* inf */);
        bool _2022 = !_2012;
        bool _2024 = _2020 && _2022;
        if (_2024)
        {
            bool _2026 = as_type<int>(_1902) >= 0;
            _1972 = _2026 ? (-1) : 0;
        }
        int _2028 = _1972;
        if (_2024)
        {
            _1998 = 1075235812;
        }
        int _2030 = _1998;
        int _2032 = _2030;
        if (_2024)
        {
            int _2034 = ~_2028;
            int _2036 = (_2034 != 0) ? _2030 : 1061752795;
            _2032 = _2036;
        }
        int _2038 = _2032;
        float _2040 = as_type<float>(_2038);
        if (_2024)
        {
            int _2042 = int(0x80000000) & as_type<int>(_1864);
            int _2044 = _2038 | _2042;
            _2040 = as_type<float>(_2044);
        }
        float _2046 = _2040;
        bool _2048 = !_2012;
        bool _2050 = _2048 && _2016;
        _2000 = _2046;
        if (!_2050)
        {
            float _2052 = abs(_1864);
            float _2054 = abs(_1902);
            float _2056 = precise::max(_2052, _2054);
            float _2058 = abs(_1864);
            float _2060 = abs(_1902);
            float _2062 = precise::min(_2058, _2060);
            float _2064 = 1.0 / _2056;
            float _2066 = abs(_1864);
            float _2068 = abs(_1902);
            bool _2070 = _2066 > _2068;
            bool _2072 = as_type<int>(_1902) >= 0;
            float _2074 = _2062 * _2064;
            float _2076 = abs(_1864);
            float _2078 = abs(_1902);
            float _2080 = _2076 + _2078;
            int _2082 = as_type<int>(_1864) & int(0x80000000);
            float _2084 = _2074 * _2074;
            bool _2086 = _2080 > as_type<float>(0x7f800000u /* inf */);
            bool _2088 = isnan(_2080);
            bool _2090 = _2086 || _2088;
            bool _2092 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2094 = _2090 || _2092;
            float _2096 = _2084 + 11.33538818359375;
            float _2098 = fma(_2084, _2096, 28.84246826171875);
            float _2100 = fma(_2084, _2098, 19.6966705322265625);
            float _2102 = fma(_2084, -0.82336294651031494140625, -5.674867153167724609375);
            float _2104 = fma(_2084, _2102, -6.565555095672607421875);
            float _2106 = 1.0 / _2100;
            float _2108 = _2084 * _2104;
            float _2110 = _2074 * _2108;
            float _2112 = fma(_2110, _2106, _2074);
            float _2114 = _2112;
            _2000 = _2080;
            if (_2070)
            {
                float _2116 = -_2112;
                float _2118 = _2116 + 1.57079637050628662109375;
                _2114 = _2118;
            }
            float _2120 = _2114;
            int _2122 = as_type<int>(_2120);
            if (!_2072)
            {
                float _2124 = -_2120;
                float _2126 = _2124 + 3.1415927410125732421875;
                _2122 = as_type<int>(_2126);
            }
            int _2128 = _2122;
            _1974 = as_type<float>(_2128);
            if (!_2094)
            {
                int _2130 = _2082 | _2128;
                _2000 = as_type<float>(_2130);
            }
        }
    }
    float _2132 = _1974;
    float _2134 = _2000;
    float _2136 = _1958 * 0.004999999888241291046142578125;
    float _2138 = _1982 * 0.15915493667125701904296875;
    float _2140 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1946);
    float _2142 = _1962 * _1070;
    float _2144 = _2132;
    if (_992)
    {
        float _2146 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[14].y, _2136);
        _1346 = _2146;
    }
    float _2148 = _1346;
    float _2150 = _1058 * _1882;
    float _2152 = _1968 * _1088;
    float _2154 = _2138 * 6.283185482025146484375;
    float _2156 = sin(_2154);
    float _2158 = _2152;
    if (_992)
    {
        float _2160 = _2148 * _1294;
        _2144 = _2160;
    }
    float _2162 = _2144;
    float _2164 = _1060 * _1954;
    float _2166 = _1062 * _1938;
    float _2168 = _1980 * _1258;
    float _2170 = -_2150;
    float _2172 = fma(_1060, _1938, _2170);
    float _2174 = -_2164;
    float _2176 = fma(_1062, _1882, _2174);
    float _2178 = _1946;
    if (_992)
    {
        float _2180 = floor(_2162);
        _2178 = _2180;
    }
    float _2182 = _2178;
    float _2184 = _2152 * _1060;
    float _2186 = -_2166;
    float _2188 = fma(_1058, _1954, _2186);
    float _2190 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[194].z, 200.0);
    float _2192 = _2152 * _1058;
    float _2194 = _2152 * _1062;
    float _2196 = -_2134;
    float _2198 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[194].x, _2196);
    float _2200 = -_2134;
    float _2202 = _1410 + _2200;
    if (!_992)
    {
        _2158 = _2136;
    }
    float _2204 = _2158;
    float _2206 = fma(_2142, _1882, _2184);
    float _2208 = fma(_2156, 0.1500000059604644775390625, 1.0);
    float _2210 = _954 * _1596;
    float _2212 = fma(_2142, _1938, _2192);
    float _2214 = fma(_2168, _2188, _2206);
    float _2216 = fma(_2142, _1954, _2194);
    float _2218 = _2204;
    if (_992)
    {
        float _2220 = -_2182;
        float _2222 = _2162 + _2220;
        _2218 = _2222;
    }
    float _2224 = _2218;
    float _2226 = _2210 * _2208;
    float _2228 = fma(_2168, _2176, _2212);
    float _2230 = fma(_2168, _2172, _2216);
    float _2232 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2234 = _2224 + _2232;
    float _2236 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2238 = _2224 + _2236;
    float _2240 = _1878 * _2226;
    float _2242 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2244 = _2224 + _2242;
    float _2246 = fma(_1090, _2234, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2250 = _2224 + _2248;
    float _2252 = fma(_1092, _2238, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2254 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2256 = _2224 + _2254;
    float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2260 = _2224 + _2258;
    float _2262 = fma(_1108, _2250, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    bool _2264 = _2224 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2266 = isnan(_2224);
    bool _2268 = _2264 || _2266;
    bool _2270 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2272 = _2268 || _2270;
    float _2274 = float(_2272);
    float _2276 = fma(_1134, _2256, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    bool _2278 = _2224 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2280 = isnan(_2224);
    bool _2282 = _2278 || _2280;
    bool _2284 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2286 = _2282 || _2284;
    float _2288 = float(_2286);
    float _2290 = fma(_1110, _2244, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    bool _2292 = _2224 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2294 = isnan(_2224);
    bool _2296 = _2292 || _2294;
    bool _2298 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2300 = _2296 || _2298;
    float _2302 = float(_2300);
    float _2304 = fma(_1048, _2260, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2306 = -_2274;
    float _2308 = _2306 + 1.0;
    float _2310 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2312 = _2224 + _2310;
    bool _2314 = _2224 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2316 = isnan(_2224);
    bool _2318 = _2314 || _2316;
    bool _2320 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2322 = _2318 || _2320;
    float _2324 = float(_2322);
    float _2326 = -_2288;
    float _2328 = _2326 + 1.0;
    float _2330 = _2302 * _2308;
    float _2332 = fma(_1112, _2312, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    bool _2334 = _2224 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2336 = isnan(_2224);
    bool _2338 = _2334 || _2336;
    bool _2340 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2342 = _2338 || _2340;
    float _2344 = float(_2342);
    float _2346 = _2274 * _2328;
    float _2348 = -_2324;
    float _2350 = _2348 + 1.0;
    bool _2352 = _2224 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2354 = isnan(_2224);
    bool _2356 = _2352 || _2354;
    bool _2358 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2360 = _2356 || _2358;
    float _2362 = float(_2360);
    float _2364 = _2246 * _2330;
    float _2366 = -_2302;
    float _2368 = _2366 + 1.0;
    float _2370 = _1870 * _1596;
    bool _2372 = _2224 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2374 = isnan(_2224);
    bool _2376 = _2372 || _2374;
    bool _2378 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2380 = _2376 || _2378;
    float _2382 = float(_2380);
    float _2384 = -_2344;
    float _2386 = _2384 + 1.0;
    float _2388 = _2344 * _2350;
    bool _2390 = _2224 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2392 = isnan(_2224);
    bool _2394 = _2390 || _2392;
    bool _2396 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2398 = _2394 || _2396;
    float _2400 = float(_2398);
    float _2402 = _2202 * 0.15915493667125701904296875;
    float _2404 = fma(_2368, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2364);
    float _2406 = -_2362;
    float _2408 = _2406 + 1.0;
    float _2410 = fma(_2214, _2370, _1018);
    float _2412 = _2288 * _2386;
    float _2414 = -_2382;
    float _2416 = _2414 + 1.0;
    float _2418 = -_2400;
    float _2420 = _2418 + 1.0;
    float _2422 = _2382 * _2408;
    float _2424 = fma(_2252, _2346, _2404);
    float _2426 = fma(_2228, _2370, _1008);
    float _2428 = -_1018;
    float _2430 = _2428 + _2410;
    float _2432 = _2362 * _2420;
    float _2434 = fma(_2304, _2412, _2424);
    float _2436 = _2402 * 6.283185482025146484375;
    float _2438 = cos(_2436);
    float _2440 = -_1008;
    float _2442 = _2440 + _2426;
    float _2444 = _1564 * _2430;
    float _2446 = fma(_2230, _2370, _1034);
    float _2448 = _2324 * _2416;
    float _2450 = fma(_2262, _2388, _2434);
    float _2452 = _1522 * _2430;
    float _2454 = fma(_1518, _2442, _2444);
    float _2456 = _2402 * 6.283185482025146484375;
    float _2458 = sin(_2456);
    float _2460 = -_1034;
    float _2462 = _2460 + _2446;
    float _2464 = _1540 * _2430;
    float _2466 = fma(_2290, _2448, _2450);
    float _2468 = fma(_1568, _2442, _2452);
    float _2470 = fma(_1546, _2462, _2454);
    float _2472 = _1596 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _2474 = fma(_1576, _2442, _2464);
    float _2476 = fma(_2332, _2422, _2466);
    float _2478 = fma(_1578, _2462, _2468);
    float _2480 = _2472 * _2140;
    float _2482 = _1018 + _2470;
    float _2484 = fma(_1566, _2462, _2474);
    float _2486 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[194].z, 200.0);
    float _2488 = -_2438;
    float _2490 = _2488 + 1.0;
    float _2492 = _1008 + _2478;
    float _2494 = fma(_2480, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2482);
    float _2496 = _1490 * _2458;
    float _2498 = _1488 * _2490;
    float _2500 = fma(_2480, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2492);
    float _2502 = fma(_2486, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2494);
    float _2504 = fma(_2276, _2432, _2476);
    float _2506 = -_2496;
    float _2508 = fma(_1486, _2498, _2506);
    float _2510 = fma(_2486, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2500);
    float _2512 = -_1018;
    float _2514 = _2512 + _2502;
    float _2516 = _2198 * 0.15915493667125701904296875;
    float _2518 = fma(_1488, _2498, _2438);
    float _2520 = -_1008;
    float _2522 = _2520 + _2510;
    float _2524 = _2508 * _2514;
    float _2526 = fma(_2400, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2504);
    float _2528 = _1034 + _2484;
    float _2530 = _1488 * _2458;
    float _2532 = _1486 * _2490;
    float _2534 = _2516 * 6.283185482025146484375;
    float _2536 = cos(_2534);
    float _2538 = fma(_2518, _2522, _2524);
    float _2540 = _1486 * _2458;
    float _2542 = fma(_2480, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2528);
    float _2544 = fma(_1490, _2532, _2530);
    float _2546 = _2526 * _2472;
    float _2548 = fma(_2228, _2240, _1008);
    float _2550 = fma(_2486, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2542);
    float _2552 = _2516 * 6.283185482025146484375;
    float _2554 = sin(_2552);
    float _2556 = _2544 * _2514;
    float _2558 = -_2540;
    float _2560 = fma(_1490, _2498, _2558);
    float _2562 = fma(_2214, _2240, _1018);
    float _2564 = fma(_1490, _2498, _2540);
    float _2566 = -_1034;
    float _2568 = _2566 + _2550;
    float _2570 = fma(_2560, _2522, _2556);
    float _2572 = fma(_2230, _2240, _1034);
    float _2574 = in.m_61.w;
    float _2576 = -_2536;
    float _2578 = _2576 + 1.0;
    float _2580 = fma(_2546, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2562);
    float _2582 = fma(_2564, _2568, _2538);
    float _2584 = fma(_1538, _2490, _2438);
    float _2586 = fma(_2578, _1538, _2536);
    float _2588 = fma(_2546, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2548);
    float _2590 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2580);
    float _2592 = _1488 * _2554;
    float _2594 = _1486 * _2554;
    float _2596 = _1490 * _2554;
    float _2598 = _1488 * _2578;
    float _2600 = _1486 * _2578;
    float _2602 = fma(_2546, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2572);
    float _2604 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2588);
    float _2606 = -_1018;
    float _2608 = _2606 + _2590;
    float _2610 = fma(_1490, _2600, _2592);
    float _2612 = -_2596;
    float _2614 = fma(_1486, _2598, _2612);
    float _2616 = -_2594;
    float _2618 = fma(_1490, _2598, _2616);
    float _2620 = -_1008;
    float _2622 = _2620 + _2604;
    float _2624 = _2610 * _2608;
    float _2626 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2602);
    float _2628 = fma(_1488, _2598, _2536);
    float _2630 = _2614 * _2608;
    float _2632 = fma(_2584, _2568, _2570);
    float _2634 = fma(_2618, _2622, _2624);
    float _2636 = -_1034;
    float _2638 = _2636 + _2626;
    float _2640 = fma(_2628, _2622, _2630);
    float _2642 = fma(_1490, _2598, _2594);
    float _2644 = -_2574;
    float _2646 = _2644 + 1.0;
    float _2648 = _1034 + _2632;
    float _2650 = fma(_2586, _2638, _2634);
    float _2652 = fma(_2642, _2638, _2640);
    float _2654 = _1008 + _2582;
    float _2656 = _2648 * _2646;
    float _2658 = _1034 + _2650;
    float _2660 = _1008 + _2652;
    float _2662 = _2654 * _2646;
    float _2664 = fma(_1486, _2532, _2438);
    float _2666 = fma(_2658, _2574, _2656);
    float _2668 = fma(_1486, _2498, _2496);
    float _2670 = fma(_2660, _2574, _2662);
    float _2672 = _2664 * _2514;
    float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2676 = _2666 + _2674;
    float _2678 = fma(_1486, _2600, _2536);
    float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2682 = _2670 + _2680;
    float _2684 = -_2530;
    float _2686 = fma(_1490, _2532, _2684);
    float _2688 = _2676 * _2676;
    float _2690 = fma(_2668, _2522, _2672);
    float _2692 = fma(_1486, _2598, _2596);
    float _2694 = _2678 * _2608;
    float _2696 = fma(_2682, _2682, _2688);
    float _2698 = fma(_2686, _2568, _2690);
    float _2700 = -_2592;
    float _2702 = fma(_1490, _2600, _2700);
    float _2704 = fma(_2692, _2622, _2694);
    float _2706 = sqrt(_2696);
    float _2708 = _1018 + _2698;
    float _2710 = fma(_2702, _2638, _2704);
    float _2712 = _2708 * _2646;
    float _2714 = _1018 + _2710;
    float _2716 = fma(_2714, _2574, _2712);
    bool _2718 = _2706 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2720 = _2688;
    float _2722 = _2568;
    float _2724 = _2638;
    float _2726 = _2690;
    float _2728 = _2716;
    float _2730 = _2648;
    float _2732 = _2574;
    int _2734 = as_type<int>(_2572);
    float _2736 = _2468;
    float _2738 = _2694;
    float _2740 = _2596;
    if (!_2718)
    {
        _2720 = _2670;
    }
    float _2742 = _2720;
    float _2744 = _2742;
    if (!_2718)
    {
        _2722 = _2666;
    }
    float _2746 = _2722;
    float _2748 = _2746;
    if (!_2718)
    {
        _2724 = _2716;
    }
    float _2750 = _2724;
    bool _2752 = !_2718;
    float _2754 = _2750;
    if (!_2752)
    {
        float _2756 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2760 = _2706 + _2758;
        float _2762 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2764 = _2760 * _2756;
        float _2766 = rsqrt(_2696);
        float _2768 = _2764 * 0.15915493667125701904296875;
        float _2770 = _2768 * 6.283185482025146484375;
        float _2772 = cos(_2770);
        float _2774 = _2768 * 6.283185482025146484375;
        float _2776 = sin(_2774);
        float _2778 = _2772 + (-1.0);
        float _2780 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2782 = fma(_2776, _2762, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2784 = fma(_2716, _2772, _2780);
        float _2786 = _2766 * _2782;
        float _2788 = fma(_2682, _2786, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2790 = fma(_2676, _2786, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2754 = _2784;
        _2744 = _2788;
        _2748 = _2790;
    }
    float _2792 = _2754;
    float _2794 = _2744;
    float _2796 = _2748;
    float _2798 = -_1800;
    float _2800 = fma(_2798, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2792);
    float _2802 = -_1802;
    float _2804 = fma(_2802, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2794);
    float _2806 = -_1828;
    float _2808 = fma(_2806, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2796);
    float _2810 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2812 = _2800 + _2810;
    float _2814 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2816 = _2804 + _2814;
    float _2818 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2820 = _2808 + _2818;
    float _2822 = _2812 * _2812;
    float _2824 = fma(_2816, _2816, _2822);
    float _2826 = fma(_2820, _2820, _2824);
    float _2828 = rsqrt(_2826);
    float _2830 = _2828 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2832 = _2816 * _2830;
    float _2834 = _2820 * _2830;
    float _2836 = _2832 * _2832;
    float _2838 = _2834 * _2834;
    float _2840 = _2836 + _2838;
    float _2842 = sqrt(_2840);
    bool _2844 = _2842 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2848 = _2842 + _2846;
    float _2850 = _2820;
    float _2852 = _2840;
    float _2854 = _2848;
    float _2856 = _2830;
    bool _2858 = _2844;
    if (_2844)
    {
        float _2860 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2850 = _2860;
    }
    float _2862 = _2850;
    if (_2844)
    {
        float _2864 = rsqrt(_2840);
        _2852 = _2864;
    }
    float _2866 = _2852;
    if (_2844)
    {
        float _2868 = _2848 * _2862;
        _2854 = _2868;
    }
    float _2870 = _2854;
    if (_2844)
    {
        float _2872 = _2870 * 0.15915493667125701904296875;
        _2726 = _2872;
    }
    float _2874 = _2726;
    float _2876 = _2822;
    float _2878 = _2874;
    if (_2844)
    {
        float _2880 = _2874 * 6.283185482025146484375;
        float _2882 = sin(_2880);
        _2876 = _2882;
    }
    float _2884 = _2876;
    float _2886 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2888 = precise::max(0.0, _2886);
    float _2890 = _2828;
    float _2892 = _2888;
    float _2894 = _2886;
    if (_2844)
    {
        float _2896 = _2874 * 6.283185482025146484375;
        float _2898 = cos(_2896);
        _2890 = _2898;
    }
    float _2900 = _2890;
    float _2902 = -_2830;
    float _2904 = -_2888;
    float _2906 = fma(_2812, _2902, _2904);
    float _2908 = _2906;
    if (!_2844)
    {
        _2892 = _2832;
    }
    float _2910 = _2892;
    float _2912 = _2910;
    if (_2844)
    {
        float _2914 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2894 = _2914;
    }
    float _2916 = _2894;
    float _2918 = _2884;
    float _2920 = _2916;
    if (_2844)
    {
        float _2922 = fma(_2884, _2916, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2918 = _2922;
    }
    float _2924 = _2918;
    float _2926 = _2924;
    float _2928 = _2900;
    if (_2844)
    {
        float _2930 = _2900 + (-1.0);
        _2920 = _2930;
    }
    float _2932 = _2920;
    float _2934 = _2932;
    if (_2844)
    {
        float _2936 = _2866 * _2924;
        _2856 = _2936;
    }
    float _2938 = _2856;
    if (!_2844)
    {
        _2926 = _2836;
    }
    float _2940 = _2926;
    float _2942 = sqrt(_2826);
    float _2944 = _2940;
    if (_2844)
    {
        float _2946 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2878 = _2946;
    }
    float _2948 = _2878;
    if (_2844)
    {
        float _2950 = _2832 * _2938;
        _2912 = _2950;
    }
    float _2952 = _2912;
    if (!_2844)
    {
        _2934 = _2834;
    }
    float _2954 = _2934;
    float _2956 = _2954;
    if (_2844)
    {
        float _2958 = _2834 * _2938;
        _2956 = _2958;
    }
    float _2960 = _2956;
    if (_2844)
    {
        float _2962 = fma(_2906, _2900, _2948);
        _2908 = _2962;
    }
    float _2964 = _2908;
    if (_2844)
    {
        float _2966 = _2952 * _2952;
        _2944 = _2966;
    }
    float _2968 = _2944;
    if (!_2844)
    {
        _2928 = _2838;
    }
    float _2970 = _2928;
    float _2972 = _2970;
    if (_2844)
    {
        float _2974 = _2960 * _2960;
        _2972 = _2974;
    }
    float _2976 = _2972;
    float _2978 = fma(_2964, _2964, _2968);
    float _2980 = _2978 + _2976;
    float _2982 = _2800 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2984 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2986 = fma(_2942, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2984);
    float _2988 = precise::clamp(_2986, 0.0, 1.0);
    float _2990 = _2800 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2992 = rsqrt(_2980);
    float _2994 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2982);
    float _2996 = -_2988;
    float _2998 = _2996 + 1.0;
    float _3000 = _2800 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3002 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2990);
    float _3004 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2994);
    float _3006 = _2800 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3008 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3000);
    float _3010 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3002);
    float _3012 = _3004 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3014 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3006);
    float _3016 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3018 = abs(_2998);
    float _3020 = log2(_3018);
    float _3022 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3024 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3008);
    float _3026 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3014);
    float _3028 = _3010 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3030 = _2992 * _2952;
    float _3032 = -_3022;
    float _3034 = fma(_3032, _3016, 1.0);
    float _3036 = _3024 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3038 = _3026 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3040 = _3028 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3042 = _2992 * _2964;
    float _3044 = _3030 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3046 = _2992 * _2960;
    float _3048 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3040);
    float _3050 = log2(_3034);
    float _3052 = -_3044;
    float _3054 = fma(_3042, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3052);
    float _3056 = _3020 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3058 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3048);
    float _3060 = _3028 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3062 = -_3046;
    float _3064 = fma(_3062, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3054);
    float _3066 = _3028 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3068 = fma(_3036, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3058);
    float _3070 = exp2(_3056);
    float _3072 = fma(_3064, -0.5, 0.5);
    float _3074 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3066);
    float _3076 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3060);
    float _3078 = fma(_3064, 0.5, 0.5);
    float _3080 = _3042 + 1.0;
    float _3082 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3074);
    float _3084 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3076);
    float _3086 = 1.0 / _3068;
    float _3088 = fma(_3078, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3090 = fma(_3036, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3082);
    float _3092 = fma(_3036, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3084);
    float _3094 = _3050 * 0.693147182464599609375;
    float _3096 = fma(_3078, _3088, -0.212114393711090087890625);
    float _3098 = sqrt(_3072);
    float _3100 = -_3042;
    float _3102 = fma(_3070, _3080, _3100);
    float _3104 = fma(_3078, _3096, 1.570728778839111328125);
    float _3106 = _3090 * _3086;
    float _3108 = _3092 * _3086;
    float _3110 = _3094 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3112 = fma(_3106, 0.5, 0.5);
    float _3114 = fma(_3108, -0.5, 0.5);
    float _3116 = fma(_3102, 0.5, 0.5);
    float _3118 = _3098 * 0.636619746685028076171875;
    float3 _8527 = float3(_3112, _3114, _3110);
    float _3120 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8527, float3(0.0), isnan(_8527)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8527, float3(0.0), isnan(_8527)), level(0.0)).x;
    float3 _8538 = float3(_3112, _3114, _3110);
    float4 _3123 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8538, float3(0.0), isnan(_8538)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8538, float3(0.0), isnan(_8538)), level(0.0)).xyzw;
    float _3125 = _3123.x;
    float _3127 = _3123.y;
    float _3129 = _3123.z;
    float _3131 = _3123.w;
    float _3133 = -_3104;
    float _3135 = fma(_3118, _3133, 1.0);
    float2 _8560 = float2(_3135, _3116);
    float3 _3139 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8560, float2(0.0), isnan(_8560)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8560, float2(0.0), isnan(_8560)), level(0.0)).xyz;
    float _3141 = _3139.x;
    float _3143 = _3139.y;
    float _3145 = _3139.z;
    float _3147 = in.m_65.x;
    int _3149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _3151 = _3149 != 0;
    float _3153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3157 = _3155 != 0;
    out.m_67.w = _808;
    int _3159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _3161 = _3159 != 0;
    float _3163 = _3028 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_69.w = _2574;
    int _3165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _3167 = _3165 != 0;
    float _3169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3171 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3173 = _3167 ? as_type<float>(_1952) : _1804;
    float _3175 = _1796 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _3177 = as_type<int>(_3118);
    float _3179 = _3104;
    if (_3151)
    {
        bool _3181 = _1214 > 0.5;
        _2858 = _3181;
    }
    bool _3183 = _2858;
    out.m_69.x = _896;
    bool _3185 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3187 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3189 = _3185 || _3187;
    bool _3191 = isnan(0.5);
    bool _3193 = _3189 || _3191;
    float _3195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3197 = _3153 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3199 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3163);
    float _3201 = _3173 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _3203 = _3147;
    if (_3151)
    {
        float _3205 = -_3147;
        float _3207 = _3205 + 1.0;
        _3177 = as_type<int>(_3207);
    }
    int _3209 = _3177;
    if (!_3151)
    {
        _3179 = _3147;
    }
    float _3211 = _3179;
    float _3213 = _3169 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3215 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3217 = _3211;
    if (!_3157)
    {
        _2728 = _3147;
    }
    float _3219 = _2728;
    out.m_71.x = _2804;
    out.m_71.y = _2800;
    out.m_71.z = _2808;
    float _3221 = _3219;
    if (_3151)
    {
        float _3223 = _3183 ? as_type<float>(_3209) : _3147;
        _3217 = _3223;
    }
    float _3225 = _3217;
    int _3227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _3229 = _3227 != 0;
    float _3231 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _3233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _3235 = _3233 != 0;
    float _3237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3239 = -_3171;
    float _3241 = fma(_3231, 2.0, _3239);
    float _3243 = fma(_3197, _3225, -0.5);
    float _3245 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _3247 = _3215 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3249 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3253 = fma(_3175, -2.0, _3245);
    float _3255 = fma(_3213, _1940, -0.5);
    int _3257 = as_type<int>(_3253);
    int _3259 = as_type<int>(_3247);
    float _3261 = _3255;
    if (!_3235)
    {
        _2730 = _1826;
    }
    float _3263 = _2730;
    float _3265 = _3195 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3267 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3249);
    float _3269 = _3263;
    if (!_3235)
    {
        _2732 = _3263;
    }
    float _3271 = _2732;
    float _3273 = fma(_3265, _1956, -0.5);
    float _3275 = _3271;
    if (_3235)
    {
        _3269 = _1826;
    }
    float _3277 = _3269;
    float _3279 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3281 = _3279;
    if (_3229)
    {
        float _3283 = -_3147;
        float _3285 = _3283 + 1.0;
        _2734 = as_type<int>(_3285);
    }
    int _3287 = _2734;
    float _3289 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3279);
    if (!_3235)
    {
        _2736 = _1214;
    }
    float _3291 = _2736;
    float _3293 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3295 = _3291;
    if (!_3235)
    {
        _2738 = _1796;
    }
    float _3297 = _2738;
    float _3299 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3301 = _3297;
    float _3303 = _3299;
    if (!_3235)
    {
        _3281 = _3291;
    }
    float _3305 = _3281;
    float _3307 = fma(_1796, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3293);
    float _3309 = _3305;
    if (_3235)
    {
        _3295 = _1214;
    }
    float _3311 = _3295;
    float _3313 = fma(_1796, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3299);
    if (!_3235)
    {
        _1332 = _3297;
    }
    float _3315 = _1332;
    float _3317 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3307);
    float _3319 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[76].y, _3253);
    float _3321 = _3315;
    if (_3235)
    {
        _3301 = _1796;
    }
    float _3323 = _3301;
    if (_3157)
    {
        float _3325 = -_3147;
        float _3327 = _3325 + 1.0;
        _3257 = as_type<int>(_3327);
    }
    int _3329 = _3257;
    float _3331 = -_3319;
    float _3333 = fma(_3317, _3255, _3331);
    float _3335 = fma(_1960, _3247, -0.5);
    float _3337 = as_type<float>(_3329);
    if (!_3235)
    {
        _2740 = _3315;
    }
    float _3339 = _2740;
    float _3341 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _3343 = _3339;
    if (_3235)
    {
        _3309 = _3277;
    }
    float _3345 = _3309;
    float _3347 = _3345;
    if (_3161)
    {
        float _3349 = -_3147;
        float _3351 = _3349 + 1.0;
        _3259 = as_type<int>(_3351);
    }
    int _3353 = _3259;
    if (_3235)
    {
        _3321 = _3311;
    }
    float _3355 = _3321;
    float _3357 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3359 = _3357;
    if (_3157)
    {
        float _3361 = _1944 ? as_type<float>(_3329) : _3147;
        _3221 = _3361;
    }
    float _3363 = _3221;
    float _3365 = -_106;
    float _3367 = fma(_3365, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3241);
    if (!_3229)
    {
        _3337 = _3147;
    }
    float _3369 = _3337;
    float _3371 = _3369;
    if (_3229)
    {
        float _3373 = _1884 ? as_type<float>(_3287) : _3147;
        _3371 = _3373;
    }
    float _3375 = _3371;
    float _3377 = fma(_3345, (*spvDescriptorSet0.vp_c9)._m0[84].z, _3341);
    if (!_3161)
    {
        _3261 = _3147;
    }
    float _3379 = _3261;
    float _3381 = fma(_3355, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3357);
    float _3383 = _3379;
    if (_3161)
    {
        float _3385 = _1884 ? as_type<float>(_3353) : _3147;
        _3383 = _3385;
    }
    float _3387 = _3383;
    float _3389 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[84].x, _3377);
    if (_3235)
    {
        _3359 = _3311;
    }
    float _3391 = _3359;
    float _3393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _3395 = _3391;
    if (_3235)
    {
        _3203 = _3277;
    }
    float _3397 = _3203;
    float _3399 = _3397;
    if (!_3235)
    {
        _3395 = _3277;
    }
    float _3401 = _3395;
    float _3403 = -_1800;
    float _3405 = fma(_3403, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1018);
    if (_3235)
    {
        _3347 = _3323;
    }
    float _3407 = _3347;
    float _3409 = _3407;
    if (_3235)
    {
        _3343 = _3311;
    }
    float _3411 = _3343;
    float _3413 = _3405 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (!_3235)
    {
        _3409 = _3311;
    }
    float _3415 = _3409;
    float _3417 = -_1828;
    float _3419 = fma(_3417, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1034);
    if (!_3235)
    {
        _3303 = _3271;
    }
    float _3421 = _3303;
    float _3423 = _3411 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3425 = _3421;
    if (_3235)
    {
        _3275 = _3323;
    }
    float _3427 = _3275;
    float _3429 = _3237 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3431 = _3427;
    if (_3235)
    {
        _3425 = _3323;
    }
    float _3433 = _3425;
    float _3435 = _3389 * (-0.15915493667125701904296875);
    if (!_3235)
    {
        _3399 = _3323;
    }
    float _3437 = _3399;
    float _3439 = -_1802;
    float _3441 = fma(_3439, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1008);
    float _3443 = _3433 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3445 = _3435 * 6.283185482025146484375;
    float _3447 = sin(_3445);
    float _3449 = fma(_3441, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3413);
    float _3451 = _3405 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3453 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3455 = fma(_3419, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3449);
    float _3457 = fma(_3429, _3363, -0.5);
    float _3459 = -_3453;
    float _3461 = fma(_3423, 2.0, _3459);
    float _3463 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3465 = _3251 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3467 = _3455 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3469 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _3471 = fma(_3443, -2.0, _3463);
    float _3473 = fma(_3465, _3387, -0.5);
    float _3475 = 1.0 / _3467;
    float _3477 = fma(_3441, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3451);
    float _3479 = fma(_3437, (*spvDescriptorSet0.vp_c9)._m0[89].z, _3469);
    float _3481 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3289);
    float _3483 = fma(_3419, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3477);
    float _3485 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3487 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[89].x, _3479);
    float _3489 = _3435 * 6.283185482025146484375;
    float _3491 = cos(_3489);
    float _3493 = fma(_3481, _3243, _3367);
    float _3495 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3497 = _3401 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _3499 = _3483 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3501 = fma(_3427, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3485);
    float _3503 = _3487 * (-0.15915493667125701904296875);
    float _3505 = -_3495;
    float _3507 = fma(_3497, 2.0, _3505);
    float _3509 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3267);
    float _3511 = _3499 + _3467;
    float _3513 = _3447 * _3273;
    float _3515 = _3467;
    float _3517 = _3457;
    if (!_3193)
    {
        _3515 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3519 = _3515;
    float _3521 = _3503 * 6.283185482025146484375;
    float _3523 = sin(_3521);
    float _3525 = _3511 * _3475;
    float _3527 = _3525 * 0.5;
    float _3529 = _3519;
    if (!_3193)
    {
        _3431 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _3531 = _3431;
    float _3533 = _3491 * _3273;
    float _3535 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3501);
    float _3537 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3471);
    if (!_3193)
    {
        float _3539 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3541 = fma(_3527, _3519, _3539);
        _3529 = _3541;
    }
    float _3543 = _3529;
    float _3545 = fma(_3447, _3457, _3533);
    float _3547 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3549 = _3503 * 6.283185482025146484375;
    float _3551 = cos(_3549);
    if (!_3193)
    {
        float _3553 = -_3531;
        float _3555 = _3553 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1290 = _3555;
    }
    float _3557 = _1290;
    float _3559 = -_3537;
    float _3561 = fma(_3535, _3545, _3559);
    float _3563 = _3415 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3565 = _3020 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3567 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3381);
    float _3569 = -_106;
    float _3571 = fma(_3569, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3461);
    float _3573 = fma(_3563, -2.0, _3547);
    float _3575 = _3381;
    if (!_3193)
    {
        float _3577 = 1.0 / _3543;
        _3575 = _3577;
    }
    float _3579 = _3575;
    float _3581 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3313);
    float _3583 = -_106;
    float _3585 = fma(_3583, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3507);
    float _3587 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3573);
    float _3589 = _3523 * _3335;
    float _3591 = -_3513;
    float _3593 = fma(_3491, _3457, _3591);
    float _3595 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3199);
    float _3597 = _3561 + 0.5;
    float _3599 = _3557;
    if (!_3193)
    {
        float _3601 = 1.0 / _3557;
        _3599 = _3601;
    }
    float _3603 = _3599;
    float _3605 = -_3589;
    float _3607 = fma(_3551, _3473, _3605);
    float _3609 = _3551 * _3335;
    float _3611 = fma(_3567, _3593, _3571);
    float _3613 = _3333 + 0.5;
    float _3615 = fma(_3509, _3607, _3585);
    float _3617 = fma(_3523, _3473, _3609);
    float _3619 = _3375 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _3621 = exp2(_3565);
    float _3623 = _3619;
    if (!_3193)
    {
        float _3625 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3627 = -_3531;
        float _3629 = fma(_3579, _3625, _3627);
        _3517 = _3629;
    }
    float _3631 = _3517;
    float _3633 = fma(_3036, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3595);
    float _3635 = -_3587;
    float _3637 = fma(_3581, _3617, _3635);
    float _3639 = _3619 * _3393;
    float _3641 = _3631;
    if (_3193)
    {
        _3623 = 1.0;
    }
    float _3643 = _3623;
    float _3645 = _3615 + 0.5;
    float _3647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _3649 = _3643;
    if (!_3193)
    {
        float _3651 = _3631 * _3603;
        float _3653 = precise::clamp(_3651, 0.0, 1.0);
        _3641 = _3653;
    }
    float _3655 = _3641;
    float _3657 = _3637 + 0.5;
    float _3659 = _3493 + 0.5;
    out.gl_Position.x = _3090;
    out.gl_Position.y = _3092;
    out.gl_Position.z = _3633;
    out.gl_Position.w = _3068;
    if (!_3193)
    {
        float _3661 = -_3655;
        float _3663 = _3661 + 1.0;
        _3649 = _3663;
    }
    float _3665 = _3649;
    float _3667 = _3633 + _3068;
    float _3669 = -_3621;
    float _3671 = _3669 + 1.0;
    out.m_73.x = _3645;
    out.m_73.y = _3657;
    bool _3673 = _3665 > 0.0;
    bool _3675 = isnan(_3665);
    bool _3677 = _3673 || _3675;
    bool _3679 = isnan(0.0);
    bool _3681 = _3677 || _3679;
    float _3683 = _3665 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3685 = _3671 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3687 = _3667 * 0.5;
    float _3689 = _3683 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3691 = _3201 * _3647;
    float _3693 = _3611 + 0.5;
    float _3695 = -_3685;
    float _3697 = _3695 + 1.0;
    out.m_75.z = _3687;
    out.m_75.w = _3068;
    out.m_77.x = _3639;
    out.m_77.y = _3691;
    out.m_79.x = _3659;
    out.m_79.y = _3613;
    out.m_79.z = _3693;
    out.m_79.w = _3597;
    out.m_49.x = _3689;
    float _3699 = _3685 * _3120;
    float _3701 = _3131 * _3697;
    float _3703 = _3131 * _3699;
    float _3705 = _3145 * _3699;
    float _3707 = fma(_3141, _3703, _3125);
    float _3709 = fma(_3143, _3703, _3127);
    float _3711 = fma(_3131, _3705, _3129);
    out.m_81.x = _3707;
    out.m_81.y = _3709;
    out.m_81.z = _3711;
    out.m_81.w = _3701;
    if (_3681)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3713 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3713;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _830 = false;
    bool _668 = false;
    bool _508 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = in.m_44.w;
    float _99 = trunc(_95);
    int _102 = int(_99);
    float _104 = -_97;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _106;
    bool _110 = _102 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_102);
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3781 = as_type<float>(_122);
        out.gl_Position.z = _3781;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _126 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_97);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = float(_102);
    bool _138 = _106 >= _136;
    bool _140 = !_134;
    bool _142 = _138 || _140;
    float _144 = 0.0;
    float _146 = 0.0;
    if (_142)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _114;
    if (_142)
    {
        out.m_49.x = 0.0;
    }
    if (_142)
    {
        float _150 = _148 * 5.0;
        _124 = as_type<int>(_150);
    }
    int _152 = _124;
    float _154 = as_type<float>(_152);
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3838 = as_type<float>(_152);
        out.gl_Position.z = _3838;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _156 = in.m_44.x;
    float _158 = in.m_44.y;
    float _160 = in.m_44.z;
    float _162 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = _162;
    if (!_172)
    {
        float _176 = _162 * _162;
        float _178 = _176 * 0.5;
        _154 = _178;
    }
    float _180 = _154;
    float _182 = 0.0;
    float _184 = _180;
    if (!_172)
    {
        float _186 = _106 * _106;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    if (!_172)
    {
        float _192 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _192;
    }
    float _194 = _184;
    bool _196 = !_172;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _162 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _162);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _144 = _218;
        _198 = _228;
        _146 = _216;
    }
    float _230 = _144;
    float _232 = _198;
    float _234 = _146;
    bool _236 = !_172;
    float _238 = _230;
    float _240 = _234;
    if (!_236)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _162 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _238 = _254;
        _240 = _248;
        _174 = _260;
    }
    float _262 = _238;
    float _264 = _240;
    float _266 = _174;
    float _268 = _264;
    float _270 = _262;
    if (!_172)
    {
        _268 = _106;
    }
    float _272 = _268;
    float _274 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _276 = _272;
    if (!_172)
    {
        float _278 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _270 = _278;
    }
    float _280 = _270;
    bool _282 = !_172;
    float _284 = _280;
    if (!_282)
    {
        float _286 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _288 = log2(_286);
        float _290 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _292 = _290 + 1.0;
        float _294 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _296 = _106 * _288;
        float _298 = 1.0 / _292;
        float _300 = _294 * 0.693147182464599609375;
        float _302 = exp2(_296);
        float _304 = 1.0 / _300;
        float _306 = _302 + (-1.0);
        float _308 = -_306;
        float _310 = fma(_308, _304, _106);
        float _312 = _310 * _298;
        float _314 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _284 = _314;
    }
    float _316 = _284;
    bool _318 = !_172;
    if (!_318)
    {
        float _320 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _322 = log2(_320);
        float _324 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _326 = _324 + 1.0;
        float _328 = 1.0 / _326;
        float _330 = _106 * _322;
        float _332 = exp2(_330);
        float _334 = -_332;
        float _336 = _334 + 1.0;
        float _338 = _336 * _328;
        _276 = _338;
    }
    float _340 = _276;
    float _342 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _344 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _346 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _348 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_266, _158, _342);
    float _352 = fma(_340, _158, _344);
    float _354 = fma(_266, _156, _274);
    float _356 = fma(_340, _156, _346);
    float _358 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _360 = -_352;
    float _362 = _350 + _360;
    float _364 = fma(_266, _160, _348);
    float _366 = -_356;
    float _368 = _354 + _366;
    float _370 = fma(_340, _160, _358);
    float _372 = _362 * _362;
    float _374 = in.m_51.w;
    float _376 = 1.0 / _136;
    float _378 = -_370;
    float _380 = _364 + _378;
    float _382 = fma(_368, _368, _372);
    float _384 = in.m_42.x;
    float _386 = in.m_42.y;
    float _388 = in.m_42.z;
    float _390 = fma(_380, _380, _382);
    float _392 = in.m_53.y;
    float _394 = in.m_55.y;
    float _396 = sqrt(_390);
    float _398 = in.m_53.x;
    float _400 = _106 * _376;
    float _402 = in.m_57.y;
    float _404 = in.m_55.x;
    float _406 = in.m_53.z;
    float _408 = fma(_354, _374, _384);
    float _410 = fma(_350, _374, _386);
    bool _412 = _396 >= 9.9999999747524270787835121154785e-07;
    bool _414 = isnan(_396);
    bool _416 = _412 || _414;
    bool _418 = isnan(9.9999999747524270787835121154785e-07);
    bool _420 = _416 || _418;
    float _422 = in.m_57.x;
    float _424 = fma(_364, _374, _388);
    float _426 = _362 * _392;
    float _428 = in.m_55.z;
    float _430 = _362 * _394;
    float _432 = in.m_57.z;
    float _434 = fma(_368, _398, _426);
    float _436 = _362 * _402;
    float _438 = _402 * _402;
    float _440 = fma(_368, _404, _430);
    float _442 = fma(_392, _392, _438);
    float _444 = fma(_380, _406, _434);
    float _446 = fma(_394, _394, _442);
    float _448 = fma(_368, _422, _436);
    float _450 = fma(_380, _428, _440);
    float _452 = _440;
    float _454 = _450;
    float _456 = _450;
    if (_420)
    {
        _452 = _444;
    }
    float _458 = _452;
    float _460 = fma(_380, _432, _448);
    float _462 = _458;
    float _464 = _460;
    float _466 = _460;
    float _468 = _458;
    if (!_420)
    {
        bool _470 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _472 = !_470;
        if (!_472)
        {
            float _474 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _476 = _392 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _478 = _394 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _480 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[16].x, _474);
            float _482 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[16].x, _476);
            float _484 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[16].x, _478);
            float _486 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[16].z, _480);
            float _488 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[16].z, _482);
            float _490 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[16].z, _484);
            float _492 = _486 * _486;
            float _494 = fma(_488, _488, _492);
            float _496 = fma(_490, _490, _494);
            float _498 = rsqrt(_496);
            float _500 = _498 * 9.9999999747524270787835121154785e-07;
            float _502 = _488 * _500;
            float _504 = _486 * _500;
            float _506 = _490 * _500;
            _466 = _504;
            _468 = _502;
            _456 = _506;
            _508 = true;
        }
        else
        {
            float _510 = _158 * _158;
            float _512 = fma(_156, _156, _510);
            float _514 = fma(_160, _160, _512);
            float _516 = sqrt(_514);
            bool _518 = _516 >= 9.9999999747524270787835121154785e-07;
            bool _520 = isnan(_516);
            bool _522 = _518 || _520;
            bool _524 = isnan(9.9999999747524270787835121154785e-07);
            bool _526 = _522 || _524;
            float _528 = _516;
            if (!_526)
            {
                float _530 = _386 * _386;
                float _532 = fma(_384, _384, _530);
                float _534 = fma(_388, _388, _532);
                float _536 = sqrt(_534);
                bool _538 = _536 >= 9.9999999747524270787835121154785e-07;
                bool _540 = isnan(_536);
                bool _542 = _538 || _540;
                bool _544 = isnan(9.9999999747524270787835121154785e-07);
                bool _546 = _542 || _544;
                float _548 = _446;
                if (!_546)
                {
                    float _550 = rsqrt(_446);
                    _548 = _550;
                }
                float _552 = _548;
                if (!_546)
                {
                    float _554 = _552 * 9.9999999747524270787835121154785e-07;
                    _528 = _554;
                }
                float _556 = _528;
                if (!_546)
                {
                    float _558 = _392 * _556;
                    _462 = _558;
                }
                float _560 = _462;
                _468 = _560;
                if (!_546)
                {
                    float _562 = _402 * _556;
                    _464 = _562;
                }
                float _564 = _464;
                _466 = _564;
                if (!_546)
                {
                    float _566 = _394 * _556;
                    _454 = _566;
                }
                float _568 = _454;
                bool _570 = !_546;
                _456 = _568;
                _508 = _570;
                if (!_508)
                {
                    float _572 = _402 * _386;
                    float _574 = _392 * _386;
                    float _576 = _394 * _386;
                    float _578 = fma(_384, _422, _572);
                    float _580 = fma(_384, _398, _574);
                    float _582 = fma(_384, _404, _576);
                    float _584 = fma(_388, _432, _578);
                    float _586 = fma(_388, _406, _580);
                    float _588 = fma(_388, _428, _582);
                    float _590 = _584 * _584;
                    float _592 = fma(_586, _586, _590);
                    float _594 = fma(_588, _588, _592);
                    float _596 = rsqrt(_594);
                    float _598 = _596 * 9.9999999747524270787835121154785e-07;
                    float _600 = _586 * _598;
                    float _602 = _584 * _598;
                    float _604 = _588 * _598;
                    _466 = _602;
                    _468 = _600;
                    _456 = _604;
                    _508 = true;
                }
            }
            else
            {
                float _606 = _402 * _158;
                float _608 = _392 * _158;
                float _610 = _394 * _158;
                float _612 = fma(_156, _422, _606);
                float _614 = fma(_156, _398, _608);
                float _616 = fma(_156, _404, _610);
                float _618 = fma(_160, _432, _612);
                float _620 = fma(_160, _406, _614);
                float _622 = fma(_160, _428, _616);
                float _624 = _618 * _618;
                float _626 = fma(_620, _620, _624);
                float _628 = fma(_622, _622, _626);
                float _630 = rsqrt(_628);
                float _632 = _630 * 9.9999999747524270787835121154785e-07;
                float _634 = _620 * _632;
                float _636 = _618 * _632;
                float _638 = _622 * _632;
                _466 = _636;
                _468 = _634;
                _456 = _638;
            }
        }
    }
    _508 = false;
    float _640 = _466;
    float _642 = _468;
    float _644 = _456;
    bool _646 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    bool _648 = !_646;
    float _666;
    if (!_648)
    {
        float _650 = in.m_59.x;
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _654 = _650 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _656 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[11].w, _106);
        float _658 = _656 * _652;
        float _660 = floor(_658);
        float _662 = -_660;
        float _664 = _658 + _662;
        _666 = _664;
        _668 = true;
    }
    else
    {
        _666 = _400;
    }
    _668 = false;
    float _670 = _666;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _674 = _670 + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _680 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _682 = isnan(_670);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _700 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _702 = isnan(_670);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = 1.0 / _678;
    float _714 = -_690;
    float _716 = _714 + 1.0;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _718;
    bool _722 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _724 = isnan(_670);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = _710 * _716;
    float _736 = -_710;
    float _738 = _736 + 1.0;
    bool _740 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _742 = 1.0 / _694;
    float _744 = _732 * _738;
    float _746 = -_732;
    float _748 = _746 + 1.0;
    float _750 = 1.0 / _698;
    float _752 = _720 * _712;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _758 = fma(_752, _674, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _760 = _756 * _742;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _764 = _670 + _762;
    bool _766 = _670 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _768 = isnan(_670);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _778;
    float _782 = _758 * _744;
    float _784 = fma(_760, _764, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _788 = _670 + _786;
    float _790 = -_776;
    float _792 = _790 + 1.0;
    float _794 = _780 * _750;
    float _796 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[131].x, _782);
    float _798 = _690 * _792;
    float _800 = fma(_794, _788, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _802 = fma(_784, _734, _796);
    float _804 = fma(_800, _798, _802);
    float _806 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[134].x, _804);
    float _808 = _806 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _810 = !_740;
    float _828;
    if (!_810)
    {
        float _812 = in.m_59.x;
        float _814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _816 = _812 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _818 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[14].x, _106);
        float _820 = _818 * _814;
        float _822 = floor(_820);
        float _824 = -_822;
        float _826 = _820 + _824;
        _828 = _826;
        _830 = true;
    }
    else
    {
        _828 = _400;
    }
    _830 = false;
    float _832 = _828;
    float _834 = in.m_51.x;
    float _836 = in.m_51.y;
    float _838 = in.m_51.z;
    float _840 = _410 * _402;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _842;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _850;
    float _854 = _410 * _394;
    float _856 = 1.0 / _844;
    float _858 = fma(_408, _422, _840);
    float _860 = in.m_59.w;
    float _862 = fma(_408, _404, _854);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _874 = _832 + _872;
    float _876 = 1.0 / _848;
    float _878 = _410 * _392;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _880;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _886 = _832 + _884;
    float _888 = fma(_408, _398, _878);
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _892 = _832 + _890;
    float _894 = 1.0 / _852;
    float _896 = in.m_61.x;
    float _898 = _838 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _900 = _836 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _902 = fma(_424, _406, _888);
    float _904 = fma(_424, _432, _858);
    float _906 = _834 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _908 = 1.0 / _882;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _910;
    float _914 = fma(_424, _428, _862);
    bool _916 = _860 > 0.5;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _920 = _832 + _918;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _924 = _832 + _922;
    float _926 = 1.0 / _866;
    float _928 = _886 * _894;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _932 = _832 + _930;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _934;
    float _938 = _924 * _876;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _944 = 1.0 / _912;
    float _946 = _896 * _896;
    float _948 = _920 * _908;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _954 = fma(_946, -0.980000019073486328125, 1.0);
    float _956 = (*spvDescriptorSet0.vp_c10)._m0[9].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _962 = in.m_53.w;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _966 = _832 + _964;
    float _968 = 1.0 / _870;
    float _970 = fma((*spvDescriptorSet0.vp_c10)._m0[8].y, (*spvDescriptorSet0.vp_c10)._m0[8].y, _956);
    float _972 = _892 * _926;
    float _974 = _966 * _856;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _980 = in.m_57.w;
    float _982 = _932 * _944;
    float _984 = 1.0 / _960;
    float _986 = in.m_55.w;
    float _988 = fma(_936, _974, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _990 = fma(_952, _938, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    bool _992 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _994 = _640 * _640;
    float _996 = 1.0 / _942;
    float _998 = _874 * _968;
    float _1000 = fma(_642, _642, _994);
    float _1002 = in.m_63.x;
    float _1004 = in.m_63.y;
    float _1006 = in.m_63.z;
    float _1008 = _902 + _962;
    float _1010 = fma(_644, _644, _1000);
    float _1012 = 1.0 / _978;
    float _1014 = fma(_106, 0.004999999888241291046142578125, -0.0199999995529651641845703125);
    float _1016 = _900 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1018 = _904 + _980;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1022 = _1020 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1024;
    float _1028 = rsqrt(_1010);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1034 = _914 + _986;
    float _1036 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[193].x + _1036;
    float _1040 = _898 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1046 = 1.0 / _1022;
    float _1048 = _1026 * _1012;
    float _1050 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _1054 = _1052 + 1.0;
    float _1056 = 1.0 / _1032;
    float _1058 = _1028 * _642;
    float _1060 = _1028 * _640;
    float _1062 = _1028 * _644;
    float _1064 = precise::max(0.0, _1050);
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1068 = _1058 * _1066;
    float _1070 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1002);
    float _1072 = 1.0 / _1044;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1076 = _1074 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1086 = precise::max(_1064, 400.0);
    float _1088 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1004);
    float _1090 = _1080 * _996;
    float _1092 = _1084 * _984;
    float _1094 = 1.0 / _1076;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1098 = _1096 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1106 = _1104 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1108 = _1098 * _1046;
    float _1110 = _1102 * _1056;
    float _1112 = _1106 * _1072;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1114;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1118;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1122;
    float _1126 = precise::min(_1086, 600.0);
    float _1128 = fma((*spvDescriptorSet0.vp_c10)._m0[10].y, (*spvDescriptorSet0.vp_c10)._m0[10].y, _970);
    float _1130 = fma(_1120, _974, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1132 = fma(_1124, _974, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1134 = _1116 * _1094;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1138 = _1136 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1144;
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1148;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1152;
    float _1156 = fma(_1138, _938, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1158 = fma(_1142, _938, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1160 = fma(_1146, _928, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1162 = fma(_1150, _928, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1164 = fma(_1154, _928, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1168 = _1166 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1170;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1174;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1180 = _1178 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1188 = _1186 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1190 = fma(_1172, _948, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1192 = fma(_1176, _948, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1194 = fma(_1168, _998, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1196 = fma(_1180, _998, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1198 = fma(_1184, _948, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1200 = fma(_1188, _998, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1212 = _1210 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1214 = in.m_59.x;
    float _1216 = fma(_1204, _972, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1218 = fma(_1208, _972, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1220 = fma(_1212, _972, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1226;
    bool _1230 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1232 = isnan(_832);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1238 = _1234 || _1236;
    float _1240 = float(_1238);
    float _1242 = rsqrt(_1128);
    float _1244 = fma(_1224, _982, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _1246 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1248 = isnan(_832);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1006);
    float _1260 = -_1240;
    float _1262 = _1260 + 1.0;
    float _1264 = -_1256;
    float _1266 = _1264 + 1.0;
    float _1268 = _1256 * _1262;
    bool _1270 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1272 = isnan(_832);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1278 = _1274 || _1276;
    float _1280 = float(_1278);
    float _1282 = _1256;
    float _1284 = _1280;
    float _1286 = _1000;
    int _1288 = as_type<int>(_1040);
    float _1290 = _1008;
    if (_992)
    {
        float _1292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        _1282 = _1292;
    }
    float _1294 = _1282;
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1296;
    bool _1300 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1302 = isnan(_832);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1308 = _1304 || _1306;
    float _1310 = float(_1308);
    float _1312 = _1280 * _1266;
    float _1314 = fma(_1298, _982, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1316 = -_1280;
    float _1318 = _1316 + 1.0;
    bool _1320 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1322 = isnan(_832);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1328 = _1324 || _1326;
    float _1330 = float(_1328);
    float _1332 = _1214;
    if (_992)
    {
        float _1334 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        _1284 = _1334;
    }
    float _1336 = _1284;
    float _1338 = fma(_1228, _982, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1340 = -_1310;
    float _1342 = _1340 + 1.0;
    float _1344 = _1310 * _1318;
    float _1346 = _1336;
    if (_992)
    {
        float _1348 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[14].y, _1014);
        _1286 = _1348;
    }
    float _1350 = _1286;
    bool _1352 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1354 = isnan(_832);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1360 = _1356 || _1358;
    float _1362 = float(_1360);
    float _1364 = -_1330;
    float _1366 = _1364 + 1.0;
    float _1368 = _1330 * _1342;
    float _1370 = _106 + (-4.0);
    bool _1372 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1374 = isnan(_832);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1380 = _1376 || _1378;
    float _1382 = float(_1380);
    float _1384 = 0.0;
    float _1386 = _1382;
    if (_992)
    {
        float _1388 = _1350 * _1294;
        _1384 = _1388;
    }
    float _1390 = _1384;
    float _1392 = _1362 * _1366;
    float _1394 = -_1362;
    float _1396 = _1394 + 1.0;
    bool _1398 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1400 = isnan(_832);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1406 = _1402 || _1404;
    float _1408 = float(_1406);
    float _1410 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _1412 = -_1382;
    float _1414 = _1412 + 1.0;
    float _1416 = 0.0;
    if (_992)
    {
        float _1418 = floor(_1390);
        _1416 = _1418;
    }
    float _1420 = _1416;
    float _1422 = _1382 * _1396;
    float _1424 = _1410 * (-0.15915493667125701904296875);
    float _1426 = _1408 * _1414;
    float _1428 = -_1408;
    float _1430 = _1428 + 1.0;
    if (!_992)
    {
        _1386 = _1014;
    }
    float _1432 = _1386;
    float _1434 = _1130 * _1426;
    float _1436 = _1424 * 6.283185482025146484375;
    float _1438 = cos(_1436);
    float _1440 = _988 * _1426;
    float _1442 = _1132 * _1426;
    float _1444 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1446 = _1018 + _1444;
    float _1448 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1434);
    float _1450 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1440);
    float _1452 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1442);
    float _1454 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1456 = _1008 + _1454;
    float _1458 = _1424 * 6.283185482025146484375;
    float _1460 = sin(_1458);
    float _1462 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1464 = _1432;
    if (_992)
    {
        float _1466 = -_1420;
        float _1468 = _1390 + _1466;
        _1464 = _1468;
    }
    float _1470 = _1464;
    float _1472 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1474 = fma(_1126, 0.004999999888241291046142578125, -2.0);
    float _1476 = precise::clamp(_1474, 0.0, 1.0);
    float _1478 = fma(_1456, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1462);
    float _1480 = fma(_1156, _1422, _1448);
    float _1482 = fma(_990, _1422, _1450);
    float _1484 = fma(_1456, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1472);
    float _1486 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1488 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1490 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1492 = -_1438;
    float _1494 = _1492 + 1.0;
    float _1496 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1498 = _1034 + _1496;
    float _1500 = fma(_1158, _1422, _1452);
    float _1502 = fma(_1162, _1392, _1482);
    float _1504 = _1488 * _1460;
    float _1506 = _1486 * _1460;
    float _1508 = _1490 * _1460;
    float _1510 = _1488 * _1494;
    float _1512 = fma(_1498, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1484);
    float _1514 = fma(_1498, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1478);
    float _1516 = _1486 * _1494;
    float _1518 = fma(_1486, _1510, _1508);
    float _1520 = -_1508;
    float _1522 = fma(_1486, _1510, _1520);
    float _1524 = fma(_1160, _1392, _1480);
    bool _1526 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1528 = isnan(_1470);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1534 = _1530 || _1532;
    float _1536 = float(_1534);
    float _1538 = _1490 * _1490;
    float _1540 = fma(_1490, _1516, _1504);
    float _1542 = fma(_1194, _1368, _1524);
    float _1544 = -_1504;
    float _1546 = fma(_1490, _1516, _1544);
    float _1548 = -_1476;
    float _1550 = _1548 + 1.0;
    bool _1552 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1554 = isnan(_1470);
    bool _1556 = _1552 || _1554;
    bool _1558 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1560 = _1556 || _1558;
    float _1562 = float(_1560);
    float _1564 = fma(_1486, _1516, _1438);
    float _1566 = fma(_1538, _1494, _1438);
    float _1568 = fma(_1488, _1510, _1438);
    float _1570 = -_1536;
    float _1572 = _1570 + 1.0;
    float _1574 = -_1506;
    float _1576 = fma(_1490, _1510, _1574);
    float _1578 = fma(_1490, _1510, _1506);
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1582 = _1018 + _1580;
    bool _1584 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1586 = isnan(_1470);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1592 = _1588 || _1590;
    float _1594 = float(_1592);
    float _1596 = fma(_1550, _1054, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _1598 = fma(_1196, _1368, _1502);
    float _1600 = _1562 * _1572;
    float _1602 = -_1562;
    float _1604 = _1602 + 1.0;
    float _1606 = fma(_1164, _1392, _1500);
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1610 = _1062 * _1608;
    float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1614 = _1008 + _1612;
    float _1616 = _1582 * _1582;
    bool _1618 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1620 = isnan(_1470);
    bool _1622 = _1618 || _1620;
    bool _1624 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1626 = _1622 || _1624;
    float _1628 = float(_1626);
    float _1630 = -_1594;
    float _1632 = _1630 + 1.0;
    float _1634 = _1594 * _1604;
    float _1636 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1638 = _1060 * _1636;
    float _1640 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1642 = -_1610;
    float _1644 = fma(_1058, _1640, _1642);
    float _1646 = fma(_1614, _1614, _1616);
    bool _1648 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1650 = isnan(_1470);
    bool _1652 = _1648 || _1650;
    bool _1654 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1656 = _1652 || _1654;
    float _1658 = float(_1656);
    float _1660 = _1628 * _1632;
    float _1662 = -_1628;
    float _1664 = _1662 + 1.0;
    float _1666 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1668 = -_1638;
    float _1670 = fma(_1062, _1666, _1668);
    bool _1672 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1674 = isnan(_1470);
    bool _1676 = _1672 || _1674;
    bool _1678 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1680 = _1676 || _1678;
    float _1682 = float(_1680);
    float _1684 = _1644 * _1644;
    float _1686 = _1658 * _1664;
    float _1688 = -_1658;
    float _1690 = _1688 + 1.0;
    float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1694 = -_1068;
    float _1696 = fma(_1060, _1692, _1694);
    bool _1698 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1700 = isnan(_1470);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1706 = _1702 || _1704;
    float _1708 = float(_1706);
    float _1710 = fma(_1670, _1670, _1684);
    float _1712 = -_1682;
    float _1714 = _1712 + 1.0;
    float _1716 = _1682 * _1690;
    bool _1718 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1720 = isnan(_1470);
    bool _1722 = _1718 || _1720;
    bool _1724 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1726 = _1722 || _1724;
    float _1728 = float(_1726);
    float _1730 = fma(_1696, _1696, _1710);
    float _1732 = _1708 * _1714;
    float _1734 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1736 = _1034 + _1734;
    float _1738 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1740 = _1470 + _1738;
    float _1742 = -_1708;
    float _1744 = _1742 + 1.0;
    float _1746 = fma(_1200, _1368, _1606);
    float _1748 = fma(_1736, _1736, _1646);
    float _1750 = fma(_1090, _1740, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1752 = _1728 * _1744;
    float _1754 = fma(_1190, _1344, _1542);
    float _1756 = fma(_1192, _1344, _1598);
    float _1758 = rsqrt(_1748);
    float _1760 = _1750 * _1752;
    float _1762 = -_1728;
    float _1764 = _1762 + 1.0;
    float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1768 = _1470 + _1766;
    float _1770 = fma(_1198, _1344, _1746);
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1774 = _1470 + _1772;
    float _1776 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1760);
    float _1778 = fma(_1092, _1768, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1780 = fma(_1216, _1312, _1754);
    float _1782 = fma(_1220, _1312, _1770);
    float _1784 = fma(_1048, _1774, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1786 = fma(_1778, _1732, _1776);
    float _1788 = fma(_1218, _1312, _1756);
    float _1790 = abs(_1512);
    float _1792 = abs(_1514);
    float _1794 = precise::max(_1790, _1792);
    float _1796 = in.m_59.y;
    float _1798 = fma(_1784, _1716, _1786);
    float _1800 = _1582 * _1758;
    float _1802 = _1614 * _1758;
    float _1804 = in.m_65.y;
    bool _1806 = _1794 >= 16.0;
    float _1808 = -_1800;
    float _1810 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1582);
    float _1812 = rsqrt(_1730);
    float _1814 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1816 = _1470 + _1814;
    float _1818 = -_1802;
    float _1820 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1614);
    float _1822 = _1810 * _1810;
    float _1824 = fma(_1314, _1268, _1788);
    float _1826 = in.m_59.z;
    float _1828 = _1736 * _1758;
    float _1830 = fma(_1108, _1816, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1832 = fma(_1820, _1820, _1822);
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1836 = _1470 + _1834;
    float _1838 = -_1828;
    float _1840 = fma(_1838, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1736);
    float _1842 = fma(_1244, _1268, _1780);
    float _1844 = fma(_1830, _1686, _1798);
    float _1846 = fma(_1110, _1836, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1848 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1850 = _1470 + _1848;
    float _1852 = fma(_1338, _1268, _1782);
    float _1854 = fma(_1840, _1840, _1832);
    float _1856 = _1512;
    float _1858 = _1514;
    int _1860 = as_type<int>(_1854);
    if (_1806)
    {
        float _1862 = _1512 * 0.0625;
        _1856 = _1862;
    }
    float _1864 = _1856;
    float _1866 = fma(_1846, _1660, _1844);
    float _1868 = fma(_1112, _1850, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1870 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1842);
    float _1872 = -_1804;
    float _1874 = _1872 + 1.0;
    float _1876 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1824);
    float _1878 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1852);
    float _1880 = sqrt(_1854);
    float _1882 = _1644 * _1812;
    bool _1884 = _1796 > 0.5;
    float _1886 = fma(_1868, _1634, _1866);
    float _1888 = abs(_1864);
    bool _1890 = _1888 != 0.0;
    bool _1892 = isnan(_1888);
    bool _1894 = _1890 || _1892;
    bool _1896 = isnan(0.0);
    bool _1898 = _1894 || _1896;
    if (_1806)
    {
        float _1900 = _1514 * 0.0625;
        _1858 = _1900;
    }
    float _1902 = _1858;
    int _1904 = _916 ? as_type<int>(_1874) : as_type<int>(_1804);
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1908 = _1470 + _1906;
    int _1910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1912 = _1910 != 0;
    int _1914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1916 = _1914 != 0;
    int _1918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1920 = _1918 != 0;
    float _1922 = -_896;
    float _1924 = _1922 + 1.0;
    int _1926 = _1884 ? as_type<int>(_1874) : as_type<int>(_1804);
    float _1928 = fma(_1134, _1908, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1930 = abs(_1902);
    bool _1932 = _1930 == 0.0;
    bool _1934 = !_1898;
    bool _1936 = _1932 && _1934;
    float _1938 = _1670 * _1812;
    float _1940 = _1912 ? as_type<float>(_1926) : _1804;
    float _1942 = _1758 * _1880;
    bool _1944 = _1826 > 0.5;
    float _1946 = fma(_1928, _1600, _1886);
    float _1948 = _906 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1950 = _1876 * (*spvDescriptorSet0.vp_c9)._m0[194].y;
    int _1952 = _1944 ? as_type<int>(_1874) : as_type<int>(_1804);
    float _1954 = _1696 * _1812;
    float _1956 = _1916 ? as_type<float>(_1904) : _1804;
    float _1958 = fma(_1950, _1924, _106);
    float _1960 = _1920 ? as_type<float>(_1952) : _1804;
    float _1962 = _1948 * _1942;
    float _1964 = abs(_1902);
    bool _1966 = _1964 == 0.0;
    float _1968 = _1016 * _1942;
    bool _1970 = _1916;
    int _1972 = _1966 ? (-1) : 0;
    float _1974 = _1942;
    if (_1936)
    {
        bool _1976 = as_type<int>(_1902) >= 0;
        _1970 = _1976;
    }
    bool _1978 = _1970;
    float _1980 = _1040 * _1942;
    float _1982 = _1958 * (-0.02300000004470348358154296875);
    if (_1936)
    {
        int _1984 = _1978 ? 0 : 1078530011;
        _1860 = _1984;
    }
    int _1986 = _1860;
    if (_1936)
    {
        int _1988 = int(0x80000000) & as_type<int>(_1864);
        int _1990 = _1986 | _1988;
        _1288 = _1990;
    }
    int _1992 = _1288;
    bool _1994 = !_1898;
    bool _1996 = _1994 && _1966;
    int _1998 = _1992;
    float _2000 = as_type<float>(_1992);
    if (!_1996)
    {
        float _2002 = abs(_1864);
        bool _2004 = _2002 != as_type<float>(0x7f800000u /* inf */);
        bool _2006 = isnan(_2002);
        bool _2008 = _2004 || _2006;
        bool _2010 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _2012 = _2008 || _2010;
        float _2014 = abs(_1902);
        bool _2016 = _2014 == as_type<float>(0x7f800000u /* inf */);
        float _2018 = abs(_1902);
        bool _2020 = _2018 == as_type<float>(0x7f800000u /* inf */);
        bool _2022 = !_2012;
        bool _2024 = _2020 && _2022;
        if (_2024)
        {
            bool _2026 = as_type<int>(_1902) >= 0;
            _1972 = _2026 ? (-1) : 0;
        }
        int _2028 = _1972;
        if (_2024)
        {
            _1998 = 1075235812;
        }
        int _2030 = _1998;
        int _2032 = _2030;
        if (_2024)
        {
            int _2034 = ~_2028;
            int _2036 = (_2034 != 0) ? _2030 : 1061752795;
            _2032 = _2036;
        }
        int _2038 = _2032;
        float _2040 = as_type<float>(_2038);
        if (_2024)
        {
            int _2042 = int(0x80000000) & as_type<int>(_1864);
            int _2044 = _2038 | _2042;
            _2040 = as_type<float>(_2044);
        }
        float _2046 = _2040;
        bool _2048 = !_2012;
        bool _2050 = _2048 && _2016;
        _2000 = _2046;
        if (!_2050)
        {
            float _2052 = abs(_1864);
            float _2054 = abs(_1902);
            float _2056 = precise::max(_2052, _2054);
            float _2058 = abs(_1864);
            float _2060 = abs(_1902);
            float _2062 = precise::min(_2058, _2060);
            float _2064 = 1.0 / _2056;
            float _2066 = abs(_1864);
            float _2068 = abs(_1902);
            bool _2070 = _2066 > _2068;
            bool _2072 = as_type<int>(_1902) >= 0;
            float _2074 = _2062 * _2064;
            float _2076 = abs(_1864);
            float _2078 = abs(_1902);
            float _2080 = _2076 + _2078;
            int _2082 = as_type<int>(_1864) & int(0x80000000);
            float _2084 = _2074 * _2074;
            bool _2086 = _2080 > as_type<float>(0x7f800000u /* inf */);
            bool _2088 = isnan(_2080);
            bool _2090 = _2086 || _2088;
            bool _2092 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2094 = _2090 || _2092;
            float _2096 = _2084 + 11.33538818359375;
            float _2098 = fma(_2084, _2096, 28.84246826171875);
            float _2100 = fma(_2084, _2098, 19.6966705322265625);
            float _2102 = fma(_2084, -0.82336294651031494140625, -5.674867153167724609375);
            float _2104 = fma(_2084, _2102, -6.565555095672607421875);
            float _2106 = 1.0 / _2100;
            float _2108 = _2084 * _2104;
            float _2110 = _2074 * _2108;
            float _2112 = fma(_2110, _2106, _2074);
            float _2114 = _2112;
            _2000 = _2080;
            if (_2070)
            {
                float _2116 = -_2112;
                float _2118 = _2116 + 1.57079637050628662109375;
                _2114 = _2118;
            }
            float _2120 = _2114;
            int _2122 = as_type<int>(_2120);
            if (!_2072)
            {
                float _2124 = -_2120;
                float _2126 = _2124 + 3.1415927410125732421875;
                _2122 = as_type<int>(_2126);
            }
            int _2128 = _2122;
            _1974 = as_type<float>(_2128);
            if (!_2094)
            {
                int _2130 = _2082 | _2128;
                _2000 = as_type<float>(_2130);
            }
        }
    }
    float _2132 = _1974;
    float _2134 = _2000;
    float _2136 = _1958 * 0.004999999888241291046142578125;
    float _2138 = _1982 * 0.15915493667125701904296875;
    float _2140 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1946);
    float _2142 = _1962 * _1070;
    float _2144 = _2132;
    if (_992)
    {
        float _2146 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[14].y, _2136);
        _1346 = _2146;
    }
    float _2148 = _1346;
    float _2150 = _1058 * _1882;
    float _2152 = _1968 * _1088;
    float _2154 = _2138 * 6.283185482025146484375;
    float _2156 = sin(_2154);
    float _2158 = _2152;
    if (_992)
    {
        float _2160 = _2148 * _1294;
        _2144 = _2160;
    }
    float _2162 = _2144;
    float _2164 = _1060 * _1954;
    float _2166 = _1062 * _1938;
    float _2168 = _1980 * _1258;
    float _2170 = -_2150;
    float _2172 = fma(_1060, _1938, _2170);
    float _2174 = -_2164;
    float _2176 = fma(_1062, _1882, _2174);
    float _2178 = _1946;
    if (_992)
    {
        float _2180 = floor(_2162);
        _2178 = _2180;
    }
    float _2182 = _2178;
    float _2184 = _2152 * _1060;
    float _2186 = -_2166;
    float _2188 = fma(_1058, _1954, _2186);
    float _2190 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[194].z, 200.0);
    float _2192 = _2152 * _1058;
    float _2194 = _2152 * _1062;
    float _2196 = -_2134;
    float _2198 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[194].x, _2196);
    float _2200 = -_2134;
    float _2202 = _1410 + _2200;
    if (!_992)
    {
        _2158 = _2136;
    }
    float _2204 = _2158;
    float _2206 = fma(_2142, _1882, _2184);
    float _2208 = fma(_2156, 0.1500000059604644775390625, 1.0);
    float _2210 = _954 * _1596;
    float _2212 = fma(_2142, _1938, _2192);
    float _2214 = fma(_2168, _2188, _2206);
    float _2216 = fma(_2142, _1954, _2194);
    float _2218 = _2204;
    if (_992)
    {
        float _2220 = -_2182;
        float _2222 = _2162 + _2220;
        _2218 = _2222;
    }
    float _2224 = _2218;
    float _2226 = _2210 * _2208;
    float _2228 = fma(_2168, _2176, _2212);
    float _2230 = fma(_2168, _2172, _2216);
    float _2232 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2234 = _2224 + _2232;
    float _2236 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2238 = _2224 + _2236;
    float _2240 = _1878 * _2226;
    float _2242 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2244 = _2224 + _2242;
    float _2246 = fma(_1090, _2234, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2250 = _2224 + _2248;
    float _2252 = fma(_1092, _2238, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2254 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2256 = _2224 + _2254;
    float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2260 = _2224 + _2258;
    float _2262 = fma(_1108, _2250, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    bool _2264 = _2224 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2266 = isnan(_2224);
    bool _2268 = _2264 || _2266;
    bool _2270 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2272 = _2268 || _2270;
    float _2274 = float(_2272);
    float _2276 = fma(_1134, _2256, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    bool _2278 = _2224 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2280 = isnan(_2224);
    bool _2282 = _2278 || _2280;
    bool _2284 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2286 = _2282 || _2284;
    float _2288 = float(_2286);
    float _2290 = fma(_1110, _2244, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    bool _2292 = _2224 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2294 = isnan(_2224);
    bool _2296 = _2292 || _2294;
    bool _2298 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2300 = _2296 || _2298;
    float _2302 = float(_2300);
    float _2304 = fma(_1048, _2260, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2306 = -_2274;
    float _2308 = _2306 + 1.0;
    float _2310 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2312 = _2224 + _2310;
    bool _2314 = _2224 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2316 = isnan(_2224);
    bool _2318 = _2314 || _2316;
    bool _2320 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2322 = _2318 || _2320;
    float _2324 = float(_2322);
    float _2326 = -_2288;
    float _2328 = _2326 + 1.0;
    float _2330 = _2302 * _2308;
    float _2332 = fma(_1112, _2312, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    bool _2334 = _2224 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2336 = isnan(_2224);
    bool _2338 = _2334 || _2336;
    bool _2340 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2342 = _2338 || _2340;
    float _2344 = float(_2342);
    float _2346 = _2274 * _2328;
    float _2348 = -_2324;
    float _2350 = _2348 + 1.0;
    bool _2352 = _2224 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2354 = isnan(_2224);
    bool _2356 = _2352 || _2354;
    bool _2358 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2360 = _2356 || _2358;
    float _2362 = float(_2360);
    float _2364 = _2246 * _2330;
    float _2366 = -_2302;
    float _2368 = _2366 + 1.0;
    float _2370 = _1870 * _1596;
    bool _2372 = _2224 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2374 = isnan(_2224);
    bool _2376 = _2372 || _2374;
    bool _2378 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2380 = _2376 || _2378;
    float _2382 = float(_2380);
    float _2384 = -_2344;
    float _2386 = _2384 + 1.0;
    float _2388 = _2344 * _2350;
    bool _2390 = _2224 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2392 = isnan(_2224);
    bool _2394 = _2390 || _2392;
    bool _2396 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2398 = _2394 || _2396;
    float _2400 = float(_2398);
    float _2402 = _2202 * 0.15915493667125701904296875;
    float _2404 = fma(_2368, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2364);
    float _2406 = -_2362;
    float _2408 = _2406 + 1.0;
    float _2410 = fma(_2214, _2370, _1018);
    float _2412 = _2288 * _2386;
    float _2414 = -_2382;
    float _2416 = _2414 + 1.0;
    float _2418 = -_2400;
    float _2420 = _2418 + 1.0;
    float _2422 = _2382 * _2408;
    float _2424 = fma(_2252, _2346, _2404);
    float _2426 = fma(_2228, _2370, _1008);
    float _2428 = -_1018;
    float _2430 = _2428 + _2410;
    float _2432 = _2362 * _2420;
    float _2434 = fma(_2304, _2412, _2424);
    float _2436 = _2402 * 6.283185482025146484375;
    float _2438 = cos(_2436);
    float _2440 = -_1008;
    float _2442 = _2440 + _2426;
    float _2444 = _1564 * _2430;
    float _2446 = fma(_2230, _2370, _1034);
    float _2448 = _2324 * _2416;
    float _2450 = fma(_2262, _2388, _2434);
    float _2452 = _1522 * _2430;
    float _2454 = fma(_1518, _2442, _2444);
    float _2456 = _2402 * 6.283185482025146484375;
    float _2458 = sin(_2456);
    float _2460 = -_1034;
    float _2462 = _2460 + _2446;
    float _2464 = _1540 * _2430;
    float _2466 = fma(_2290, _2448, _2450);
    float _2468 = fma(_1568, _2442, _2452);
    float _2470 = fma(_1546, _2462, _2454);
    float _2472 = _1596 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _2474 = fma(_1576, _2442, _2464);
    float _2476 = fma(_2332, _2422, _2466);
    float _2478 = fma(_1578, _2462, _2468);
    float _2480 = _2472 * _2140;
    float _2482 = _1018 + _2470;
    float _2484 = fma(_1566, _2462, _2474);
    float _2486 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[194].z, 200.0);
    float _2488 = -_2438;
    float _2490 = _2488 + 1.0;
    float _2492 = _1008 + _2478;
    float _2494 = fma(_2480, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2482);
    float _2496 = _1490 * _2458;
    float _2498 = _1488 * _2490;
    float _2500 = fma(_2480, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2492);
    float _2502 = fma(_2486, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2494);
    float _2504 = fma(_2276, _2432, _2476);
    float _2506 = -_2496;
    float _2508 = fma(_1486, _2498, _2506);
    float _2510 = fma(_2486, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2500);
    float _2512 = -_1018;
    float _2514 = _2512 + _2502;
    float _2516 = _2198 * 0.15915493667125701904296875;
    float _2518 = fma(_1488, _2498, _2438);
    float _2520 = -_1008;
    float _2522 = _2520 + _2510;
    float _2524 = _2508 * _2514;
    float _2526 = fma(_2400, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2504);
    float _2528 = _1034 + _2484;
    float _2530 = _1488 * _2458;
    float _2532 = _1486 * _2490;
    float _2534 = _2516 * 6.283185482025146484375;
    float _2536 = cos(_2534);
    float _2538 = fma(_2518, _2522, _2524);
    float _2540 = _1486 * _2458;
    float _2542 = fma(_2480, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2528);
    float _2544 = fma(_1490, _2532, _2530);
    float _2546 = _2526 * _2472;
    float _2548 = fma(_2228, _2240, _1008);
    float _2550 = fma(_2486, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2542);
    float _2552 = _2516 * 6.283185482025146484375;
    float _2554 = sin(_2552);
    float _2556 = _2544 * _2514;
    float _2558 = -_2540;
    float _2560 = fma(_1490, _2498, _2558);
    float _2562 = fma(_2214, _2240, _1018);
    float _2564 = fma(_1490, _2498, _2540);
    float _2566 = -_1034;
    float _2568 = _2566 + _2550;
    float _2570 = fma(_2560, _2522, _2556);
    float _2572 = fma(_2230, _2240, _1034);
    float _2574 = in.m_61.w;
    float _2576 = -_2536;
    float _2578 = _2576 + 1.0;
    float _2580 = fma(_2546, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2562);
    float _2582 = fma(_2564, _2568, _2538);
    float _2584 = fma(_1538, _2490, _2438);
    float _2586 = fma(_2578, _1538, _2536);
    float _2588 = fma(_2546, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2548);
    float _2590 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2580);
    float _2592 = _1488 * _2554;
    float _2594 = _1486 * _2554;
    float _2596 = _1490 * _2554;
    float _2598 = _1488 * _2578;
    float _2600 = _1486 * _2578;
    float _2602 = fma(_2546, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2572);
    float _2604 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2588);
    float _2606 = -_1018;
    float _2608 = _2606 + _2590;
    float _2610 = fma(_1490, _2600, _2592);
    float _2612 = -_2596;
    float _2614 = fma(_1486, _2598, _2612);
    float _2616 = -_2594;
    float _2618 = fma(_1490, _2598, _2616);
    float _2620 = -_1008;
    float _2622 = _2620 + _2604;
    float _2624 = _2610 * _2608;
    float _2626 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2602);
    float _2628 = fma(_1488, _2598, _2536);
    float _2630 = _2614 * _2608;
    float _2632 = fma(_2584, _2568, _2570);
    float _2634 = fma(_2618, _2622, _2624);
    float _2636 = -_1034;
    float _2638 = _2636 + _2626;
    float _2640 = fma(_2628, _2622, _2630);
    float _2642 = fma(_1490, _2598, _2594);
    float _2644 = -_2574;
    float _2646 = _2644 + 1.0;
    float _2648 = _1034 + _2632;
    float _2650 = fma(_2586, _2638, _2634);
    float _2652 = fma(_2642, _2638, _2640);
    float _2654 = _1008 + _2582;
    float _2656 = _2648 * _2646;
    float _2658 = _1034 + _2650;
    float _2660 = _1008 + _2652;
    float _2662 = _2654 * _2646;
    float _2664 = fma(_1486, _2532, _2438);
    float _2666 = fma(_2658, _2574, _2656);
    float _2668 = fma(_1486, _2498, _2496);
    float _2670 = fma(_2660, _2574, _2662);
    float _2672 = _2664 * _2514;
    float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2676 = _2666 + _2674;
    float _2678 = fma(_1486, _2600, _2536);
    float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2682 = _2670 + _2680;
    float _2684 = -_2530;
    float _2686 = fma(_1490, _2532, _2684);
    float _2688 = _2676 * _2676;
    float _2690 = fma(_2668, _2522, _2672);
    float _2692 = fma(_1486, _2598, _2596);
    float _2694 = _2678 * _2608;
    float _2696 = fma(_2682, _2682, _2688);
    float _2698 = fma(_2686, _2568, _2690);
    float _2700 = -_2592;
    float _2702 = fma(_1490, _2600, _2700);
    float _2704 = fma(_2692, _2622, _2694);
    float _2706 = sqrt(_2696);
    float _2708 = _1018 + _2698;
    float _2710 = fma(_2702, _2638, _2704);
    float _2712 = _2708 * _2646;
    float _2714 = _1018 + _2710;
    float _2716 = fma(_2714, _2574, _2712);
    bool _2718 = _2706 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2720 = _2688;
    float _2722 = _2568;
    float _2724 = _2638;
    float _2726 = _2690;
    float _2728 = _2716;
    float _2730 = _2648;
    float _2732 = _2574;
    int _2734 = as_type<int>(_2572);
    float _2736 = _2468;
    float _2738 = _2694;
    float _2740 = _2596;
    if (!_2718)
    {
        _2720 = _2670;
    }
    float _2742 = _2720;
    float _2744 = _2742;
    if (!_2718)
    {
        _2722 = _2666;
    }
    float _2746 = _2722;
    float _2748 = _2746;
    if (!_2718)
    {
        _2724 = _2716;
    }
    float _2750 = _2724;
    bool _2752 = !_2718;
    float _2754 = _2750;
    if (!_2752)
    {
        float _2756 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2760 = _2706 + _2758;
        float _2762 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2764 = _2760 * _2756;
        float _2766 = rsqrt(_2696);
        float _2768 = _2764 * 0.15915493667125701904296875;
        float _2770 = _2768 * 6.283185482025146484375;
        float _2772 = cos(_2770);
        float _2774 = _2768 * 6.283185482025146484375;
        float _2776 = sin(_2774);
        float _2778 = _2772 + (-1.0);
        float _2780 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2782 = fma(_2776, _2762, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2784 = fma(_2716, _2772, _2780);
        float _2786 = _2766 * _2782;
        float _2788 = fma(_2682, _2786, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2790 = fma(_2676, _2786, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2754 = _2784;
        _2744 = _2788;
        _2748 = _2790;
    }
    float _2792 = _2754;
    float _2794 = _2744;
    float _2796 = _2748;
    float _2798 = -_1800;
    float _2800 = fma(_2798, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2792);
    float _2802 = -_1802;
    float _2804 = fma(_2802, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2794);
    float _2806 = -_1828;
    float _2808 = fma(_2806, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2796);
    float _2810 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2812 = _2800 + _2810;
    float _2814 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2816 = _2804 + _2814;
    float _2818 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2820 = _2808 + _2818;
    float _2822 = _2812 * _2812;
    float _2824 = fma(_2816, _2816, _2822);
    float _2826 = fma(_2820, _2820, _2824);
    float _2828 = rsqrt(_2826);
    float _2830 = _2828 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2832 = _2816 * _2830;
    float _2834 = _2820 * _2830;
    float _2836 = _2832 * _2832;
    float _2838 = _2834 * _2834;
    float _2840 = _2836 + _2838;
    float _2842 = sqrt(_2840);
    bool _2844 = _2842 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2848 = _2842 + _2846;
    float _2850 = _2820;
    float _2852 = _2840;
    float _2854 = _2848;
    float _2856 = _2830;
    bool _2858 = _2844;
    if (_2844)
    {
        float _2860 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2850 = _2860;
    }
    float _2862 = _2850;
    if (_2844)
    {
        float _2864 = rsqrt(_2840);
        _2852 = _2864;
    }
    float _2866 = _2852;
    if (_2844)
    {
        float _2868 = _2848 * _2862;
        _2854 = _2868;
    }
    float _2870 = _2854;
    if (_2844)
    {
        float _2872 = _2870 * 0.15915493667125701904296875;
        _2726 = _2872;
    }
    float _2874 = _2726;
    float _2876 = _2822;
    float _2878 = _2874;
    if (_2844)
    {
        float _2880 = _2874 * 6.283185482025146484375;
        float _2882 = sin(_2880);
        _2876 = _2882;
    }
    float _2884 = _2876;
    float _2886 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2888 = precise::max(0.0, _2886);
    float _2890 = _2828;
    float _2892 = _2888;
    float _2894 = _2886;
    if (_2844)
    {
        float _2896 = _2874 * 6.283185482025146484375;
        float _2898 = cos(_2896);
        _2890 = _2898;
    }
    float _2900 = _2890;
    float _2902 = -_2830;
    float _2904 = -_2888;
    float _2906 = fma(_2812, _2902, _2904);
    float _2908 = _2906;
    if (!_2844)
    {
        _2892 = _2832;
    }
    float _2910 = _2892;
    float _2912 = _2910;
    if (_2844)
    {
        float _2914 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2894 = _2914;
    }
    float _2916 = _2894;
    float _2918 = _2884;
    float _2920 = _2916;
    if (_2844)
    {
        float _2922 = fma(_2884, _2916, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2918 = _2922;
    }
    float _2924 = _2918;
    float _2926 = _2924;
    float _2928 = _2900;
    if (_2844)
    {
        float _2930 = _2900 + (-1.0);
        _2920 = _2930;
    }
    float _2932 = _2920;
    float _2934 = _2932;
    if (_2844)
    {
        float _2936 = _2866 * _2924;
        _2856 = _2936;
    }
    float _2938 = _2856;
    if (!_2844)
    {
        _2926 = _2836;
    }
    float _2940 = _2926;
    float _2942 = sqrt(_2826);
    float _2944 = _2940;
    if (_2844)
    {
        float _2946 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2878 = _2946;
    }
    float _2948 = _2878;
    if (_2844)
    {
        float _2950 = _2832 * _2938;
        _2912 = _2950;
    }
    float _2952 = _2912;
    if (!_2844)
    {
        _2934 = _2834;
    }
    float _2954 = _2934;
    float _2956 = _2954;
    if (_2844)
    {
        float _2958 = _2834 * _2938;
        _2956 = _2958;
    }
    float _2960 = _2956;
    if (_2844)
    {
        float _2962 = fma(_2906, _2900, _2948);
        _2908 = _2962;
    }
    float _2964 = _2908;
    if (_2844)
    {
        float _2966 = _2952 * _2952;
        _2944 = _2966;
    }
    float _2968 = _2944;
    if (!_2844)
    {
        _2928 = _2838;
    }
    float _2970 = _2928;
    float _2972 = _2970;
    if (_2844)
    {
        float _2974 = _2960 * _2960;
        _2972 = _2974;
    }
    float _2976 = _2972;
    float _2978 = fma(_2964, _2964, _2968);
    float _2980 = _2978 + _2976;
    float _2982 = _2800 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2984 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2986 = fma(_2942, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2984);
    float _2988 = precise::clamp(_2986, 0.0, 1.0);
    float _2990 = _2800 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2992 = rsqrt(_2980);
    float _2994 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2982);
    float _2996 = -_2988;
    float _2998 = _2996 + 1.0;
    float _3000 = _2800 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3002 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2990);
    float _3004 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2994);
    float _3006 = _2800 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3008 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3000);
    float _3010 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3002);
    float _3012 = _3004 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3014 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3006);
    float _3016 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3018 = abs(_2998);
    float _3020 = log2(_3018);
    float _3022 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3024 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3008);
    float _3026 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3014);
    float _3028 = _3010 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3030 = _2992 * _2952;
    float _3032 = -_3022;
    float _3034 = fma(_3032, _3016, 1.0);
    float _3036 = _3024 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3038 = _3026 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3040 = _3028 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3042 = _2992 * _2964;
    float _3044 = _3030 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3046 = _2992 * _2960;
    float _3048 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3040);
    float _3050 = log2(_3034);
    float _3052 = -_3044;
    float _3054 = fma(_3042, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3052);
    float _3056 = _3020 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3058 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3048);
    float _3060 = _3028 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3062 = -_3046;
    float _3064 = fma(_3062, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3054);
    float _3066 = _3028 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3068 = fma(_3036, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3058);
    float _3070 = exp2(_3056);
    float _3072 = fma(_3064, -0.5, 0.5);
    float _3074 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3066);
    float _3076 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3060);
    float _3078 = fma(_3064, 0.5, 0.5);
    float _3080 = _3042 + 1.0;
    float _3082 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3074);
    float _3084 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3076);
    float _3086 = 1.0 / _3068;
    float _3088 = fma(_3078, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3090 = fma(_3036, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3082);
    float _3092 = fma(_3036, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3084);
    float _3094 = _3050 * 0.693147182464599609375;
    float _3096 = fma(_3078, _3088, -0.212114393711090087890625);
    float _3098 = sqrt(_3072);
    float _3100 = -_3042;
    float _3102 = fma(_3070, _3080, _3100);
    float _3104 = fma(_3078, _3096, 1.570728778839111328125);
    float _3106 = _3090 * _3086;
    float _3108 = _3092 * _3086;
    float _3110 = _3094 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3112 = fma(_3106, 0.5, 0.5);
    float _3114 = fma(_3108, -0.5, 0.5);
    float _3116 = fma(_3102, 0.5, 0.5);
    float _3118 = _3098 * 0.636619746685028076171875;
    float3 _8527 = float3(_3112, _3114, _3110);
    float _3120 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8527, float3(0.0), isnan(_8527)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8527, float3(0.0), isnan(_8527)), level(0.0)).x;
    float3 _8538 = float3(_3112, _3114, _3110);
    float4 _3123 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8538, float3(0.0), isnan(_8538)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8538, float3(0.0), isnan(_8538)), level(0.0)).xyzw;
    float _3125 = _3123.x;
    float _3127 = _3123.y;
    float _3129 = _3123.z;
    float _3131 = _3123.w;
    float _3133 = -_3104;
    float _3135 = fma(_3118, _3133, 1.0);
    float2 _8560 = float2(_3135, _3116);
    float3 _3139 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8560, float2(0.0), isnan(_8560)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8560, float2(0.0), isnan(_8560)), level(0.0)).xyz;
    float _3141 = _3139.x;
    float _3143 = _3139.y;
    float _3145 = _3139.z;
    float _3147 = in.m_65.x;
    int _3149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _3151 = _3149 != 0;
    float _3153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3157 = _3155 != 0;
    out.m_67.w = _808;
    int _3159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _3161 = _3159 != 0;
    float _3163 = _3028 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_69.w = _2574;
    int _3165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _3167 = _3165 != 0;
    float _3169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3171 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3173 = _3167 ? as_type<float>(_1952) : _1804;
    float _3175 = _1796 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _3177 = as_type<int>(_3118);
    float _3179 = _3104;
    if (_3151)
    {
        bool _3181 = _1214 > 0.5;
        _2858 = _3181;
    }
    bool _3183 = _2858;
    out.m_69.x = _896;
    bool _3185 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3187 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3189 = _3185 || _3187;
    bool _3191 = isnan(0.5);
    bool _3193 = _3189 || _3191;
    float _3195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3197 = _3153 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3199 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3163);
    float _3201 = _3173 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _3203 = _3147;
    if (_3151)
    {
        float _3205 = -_3147;
        float _3207 = _3205 + 1.0;
        _3177 = as_type<int>(_3207);
    }
    int _3209 = _3177;
    if (!_3151)
    {
        _3179 = _3147;
    }
    float _3211 = _3179;
    float _3213 = _3169 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3215 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3217 = _3211;
    if (!_3157)
    {
        _2728 = _3147;
    }
    float _3219 = _2728;
    out.m_71.x = _2804;
    out.m_71.y = _2800;
    out.m_71.z = _2808;
    float _3221 = _3219;
    if (_3151)
    {
        float _3223 = _3183 ? as_type<float>(_3209) : _3147;
        _3217 = _3223;
    }
    float _3225 = _3217;
    int _3227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _3229 = _3227 != 0;
    float _3231 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _3233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _3235 = _3233 != 0;
    float _3237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3239 = -_3171;
    float _3241 = fma(_3231, 2.0, _3239);
    float _3243 = fma(_3197, _3225, -0.5);
    float _3245 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _3247 = _3215 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3249 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3253 = fma(_3175, -2.0, _3245);
    float _3255 = fma(_3213, _1940, -0.5);
    int _3257 = as_type<int>(_3253);
    int _3259 = as_type<int>(_3247);
    float _3261 = _3255;
    if (!_3235)
    {
        _2730 = _1826;
    }
    float _3263 = _2730;
    float _3265 = _3195 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3267 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3249);
    float _3269 = _3263;
    if (!_3235)
    {
        _2732 = _3263;
    }
    float _3271 = _2732;
    float _3273 = fma(_3265, _1956, -0.5);
    float _3275 = _3271;
    if (_3235)
    {
        _3269 = _1826;
    }
    float _3277 = _3269;
    float _3279 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3281 = _3279;
    if (_3229)
    {
        float _3283 = -_3147;
        float _3285 = _3283 + 1.0;
        _2734 = as_type<int>(_3285);
    }
    int _3287 = _2734;
    float _3289 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3279);
    if (!_3235)
    {
        _2736 = _1214;
    }
    float _3291 = _2736;
    float _3293 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3295 = _3291;
    if (!_3235)
    {
        _2738 = _1796;
    }
    float _3297 = _2738;
    float _3299 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3301 = _3297;
    float _3303 = _3299;
    if (!_3235)
    {
        _3281 = _3291;
    }
    float _3305 = _3281;
    float _3307 = fma(_1796, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3293);
    float _3309 = _3305;
    if (_3235)
    {
        _3295 = _1214;
    }
    float _3311 = _3295;
    float _3313 = fma(_1796, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3299);
    if (!_3235)
    {
        _1332 = _3297;
    }
    float _3315 = _1332;
    float _3317 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3307);
    float _3319 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[76].y, _3253);
    float _3321 = _3315;
    if (_3235)
    {
        _3301 = _1796;
    }
    float _3323 = _3301;
    if (_3157)
    {
        float _3325 = -_3147;
        float _3327 = _3325 + 1.0;
        _3257 = as_type<int>(_3327);
    }
    int _3329 = _3257;
    float _3331 = -_3319;
    float _3333 = fma(_3317, _3255, _3331);
    float _3335 = fma(_1960, _3247, -0.5);
    float _3337 = as_type<float>(_3329);
    if (!_3235)
    {
        _2740 = _3315;
    }
    float _3339 = _2740;
    float _3341 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _3343 = _3339;
    if (_3235)
    {
        _3309 = _3277;
    }
    float _3345 = _3309;
    float _3347 = _3345;
    if (_3161)
    {
        float _3349 = -_3147;
        float _3351 = _3349 + 1.0;
        _3259 = as_type<int>(_3351);
    }
    int _3353 = _3259;
    if (_3235)
    {
        _3321 = _3311;
    }
    float _3355 = _3321;
    float _3357 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3359 = _3357;
    if (_3157)
    {
        float _3361 = _1944 ? as_type<float>(_3329) : _3147;
        _3221 = _3361;
    }
    float _3363 = _3221;
    float _3365 = -_106;
    float _3367 = fma(_3365, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3241);
    if (!_3229)
    {
        _3337 = _3147;
    }
    float _3369 = _3337;
    float _3371 = _3369;
    if (_3229)
    {
        float _3373 = _1884 ? as_type<float>(_3287) : _3147;
        _3371 = _3373;
    }
    float _3375 = _3371;
    float _3377 = fma(_3345, (*spvDescriptorSet0.vp_c9)._m0[84].z, _3341);
    if (!_3161)
    {
        _3261 = _3147;
    }
    float _3379 = _3261;
    float _3381 = fma(_3355, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3357);
    float _3383 = _3379;
    if (_3161)
    {
        float _3385 = _1884 ? as_type<float>(_3353) : _3147;
        _3383 = _3385;
    }
    float _3387 = _3383;
    float _3389 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[84].x, _3377);
    if (_3235)
    {
        _3359 = _3311;
    }
    float _3391 = _3359;
    float _3393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _3395 = _3391;
    if (_3235)
    {
        _3203 = _3277;
    }
    float _3397 = _3203;
    float _3399 = _3397;
    if (!_3235)
    {
        _3395 = _3277;
    }
    float _3401 = _3395;
    float _3403 = -_1800;
    float _3405 = fma(_3403, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1018);
    if (_3235)
    {
        _3347 = _3323;
    }
    float _3407 = _3347;
    float _3409 = _3407;
    if (_3235)
    {
        _3343 = _3311;
    }
    float _3411 = _3343;
    float _3413 = _3405 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (!_3235)
    {
        _3409 = _3311;
    }
    float _3415 = _3409;
    float _3417 = -_1828;
    float _3419 = fma(_3417, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1034);
    if (!_3235)
    {
        _3303 = _3271;
    }
    float _3421 = _3303;
    float _3423 = _3411 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3425 = _3421;
    if (_3235)
    {
        _3275 = _3323;
    }
    float _3427 = _3275;
    float _3429 = _3237 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3431 = _3427;
    if (_3235)
    {
        _3425 = _3323;
    }
    float _3433 = _3425;
    float _3435 = _3389 * (-0.15915493667125701904296875);
    if (!_3235)
    {
        _3399 = _3323;
    }
    float _3437 = _3399;
    float _3439 = -_1802;
    float _3441 = fma(_3439, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1008);
    float _3443 = _3433 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3445 = _3435 * 6.283185482025146484375;
    float _3447 = sin(_3445);
    float _3449 = fma(_3441, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3413);
    float _3451 = _3405 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3453 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3455 = fma(_3419, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3449);
    float _3457 = fma(_3429, _3363, -0.5);
    float _3459 = -_3453;
    float _3461 = fma(_3423, 2.0, _3459);
    float _3463 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3465 = _3251 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3467 = _3455 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3469 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _3471 = fma(_3443, -2.0, _3463);
    float _3473 = fma(_3465, _3387, -0.5);
    float _3475 = 1.0 / _3467;
    float _3477 = fma(_3441, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3451);
    float _3479 = fma(_3437, (*spvDescriptorSet0.vp_c9)._m0[89].z, _3469);
    float _3481 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3289);
    float _3483 = fma(_3419, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3477);
    float _3485 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3487 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[89].x, _3479);
    float _3489 = _3435 * 6.283185482025146484375;
    float _3491 = cos(_3489);
    float _3493 = fma(_3481, _3243, _3367);
    float _3495 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3497 = _3401 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _3499 = _3483 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3501 = fma(_3427, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3485);
    float _3503 = _3487 * (-0.15915493667125701904296875);
    float _3505 = -_3495;
    float _3507 = fma(_3497, 2.0, _3505);
    float _3509 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3267);
    float _3511 = _3499 + _3467;
    float _3513 = _3447 * _3273;
    float _3515 = _3467;
    float _3517 = _3457;
    if (!_3193)
    {
        _3515 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3519 = _3515;
    float _3521 = _3503 * 6.283185482025146484375;
    float _3523 = sin(_3521);
    float _3525 = _3511 * _3475;
    float _3527 = _3525 * 0.5;
    float _3529 = _3519;
    if (!_3193)
    {
        _3431 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _3531 = _3431;
    float _3533 = _3491 * _3273;
    float _3535 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3501);
    float _3537 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3471);
    if (!_3193)
    {
        float _3539 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3541 = fma(_3527, _3519, _3539);
        _3529 = _3541;
    }
    float _3543 = _3529;
    float _3545 = fma(_3447, _3457, _3533);
    float _3547 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3549 = _3503 * 6.283185482025146484375;
    float _3551 = cos(_3549);
    if (!_3193)
    {
        float _3553 = -_3531;
        float _3555 = _3553 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1290 = _3555;
    }
    float _3557 = _1290;
    float _3559 = -_3537;
    float _3561 = fma(_3535, _3545, _3559);
    float _3563 = _3415 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3565 = _3020 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3567 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3381);
    float _3569 = -_106;
    float _3571 = fma(_3569, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3461);
    float _3573 = fma(_3563, -2.0, _3547);
    float _3575 = _3381;
    if (!_3193)
    {
        float _3577 = 1.0 / _3543;
        _3575 = _3577;
    }
    float _3579 = _3575;
    float _3581 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3313);
    float _3583 = -_106;
    float _3585 = fma(_3583, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3507);
    float _3587 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3573);
    float _3589 = _3523 * _3335;
    float _3591 = -_3513;
    float _3593 = fma(_3491, _3457, _3591);
    float _3595 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3199);
    float _3597 = _3561 + 0.5;
    float _3599 = _3557;
    if (!_3193)
    {
        float _3601 = 1.0 / _3557;
        _3599 = _3601;
    }
    float _3603 = _3599;
    float _3605 = -_3589;
    float _3607 = fma(_3551, _3473, _3605);
    float _3609 = _3551 * _3335;
    float _3611 = fma(_3567, _3593, _3571);
    float _3613 = _3333 + 0.5;
    float _3615 = fma(_3509, _3607, _3585);
    float _3617 = fma(_3523, _3473, _3609);
    float _3619 = _3375 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _3621 = exp2(_3565);
    float _3623 = _3619;
    if (!_3193)
    {
        float _3625 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3627 = -_3531;
        float _3629 = fma(_3579, _3625, _3627);
        _3517 = _3629;
    }
    float _3631 = _3517;
    float _3633 = fma(_3036, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3595);
    float _3635 = -_3587;
    float _3637 = fma(_3581, _3617, _3635);
    float _3639 = _3619 * _3393;
    float _3641 = _3631;
    if (_3193)
    {
        _3623 = 1.0;
    }
    float _3643 = _3623;
    float _3645 = _3615 + 0.5;
    float _3647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _3649 = _3643;
    if (!_3193)
    {
        float _3651 = _3631 * _3603;
        float _3653 = precise::clamp(_3651, 0.0, 1.0);
        _3641 = _3653;
    }
    float _3655 = _3641;
    float _3657 = _3637 + 0.5;
    float _3659 = _3493 + 0.5;
    out.gl_Position.x = _3090;
    out.gl_Position.y = _3092;
    out.gl_Position.z = _3633;
    out.gl_Position.w = _3068;
    if (!_3193)
    {
        float _3661 = -_3655;
        float _3663 = _3661 + 1.0;
        _3649 = _3663;
    }
    float _3665 = _3649;
    float _3667 = _3633 + _3068;
    float _3669 = -_3621;
    float _3671 = _3669 + 1.0;
    out.m_73.x = _3645;
    out.m_73.y = _3657;
    bool _3673 = _3665 > 0.0;
    bool _3675 = isnan(_3665);
    bool _3677 = _3673 || _3675;
    bool _3679 = isnan(0.0);
    bool _3681 = _3677 || _3679;
    float _3683 = _3665 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3685 = _3671 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3687 = _3667 * 0.5;
    float _3689 = _3683 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3691 = _3201 * _3647;
    float _3693 = _3611 + 0.5;
    float _3695 = -_3685;
    float _3697 = _3695 + 1.0;
    out.m_75.z = _3687;
    out.m_75.w = _3068;
    out.m_77.x = _3639;
    out.m_77.y = _3691;
    out.m_79.x = _3659;
    out.m_79.y = _3613;
    out.m_79.z = _3693;
    out.m_79.w = _3597;
    out.m_49.x = _3689;
    float _3699 = _3685 * _3120;
    float _3701 = _3131 * _3697;
    float _3703 = _3131 * _3699;
    float _3705 = _3145 * _3699;
    float _3707 = fma(_3141, _3703, _3125);
    float _3709 = fma(_3143, _3703, _3127);
    float _3711 = fma(_3131, _3705, _3129);
    out.m_81.x = _3707;
    out.m_81.y = _3709;
    out.m_81.z = _3711;
    out.m_81.w = _3701;
    if (_3681)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3713 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3713;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

