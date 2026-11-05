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
    float4 m_79 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_71 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_57 [[attribute(3)]];
    float4 m_42 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_61 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
    float4 m_51 [[attribute(10)]];
    float4 m_63 [[attribute(12)]];
    float4 m_65 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _670 = false;
    bool _510 = false;
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
    float _114 = _97;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    float _118 = _116;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _120 = 0;
    if (!_110)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3321 = as_type<float>(_124);
        out.gl_Position.z = _3321;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _128 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_97);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = float(_102);
    bool _140 = _106 >= _138;
    bool _142 = !_136;
    bool _144 = _140 || _142;
    if (_144)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _114;
    float _148 = _146;
    if (_144)
    {
        out.m_49.x = 0.0;
    }
    if (_144)
    {
        float _150 = _146 * 5.0;
        _126 = as_type<int>(_150);
    }
    int _152 = _126;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3377 = as_type<float>(_152);
        out.gl_Position.z = _3377;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_44.x;
    float _156 = in.m_44.y;
    float _158 = in.m_44.z;
    float _160 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = 0.0;
    float _174 = _160;
    if (!_170)
    {
        float _176 = _160 * _160;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = 0.0;
    float _184 = _180;
    if (!_170)
    {
        float _186 = _106 * _106;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    if (!_170)
    {
        float _192 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _192;
    }
    float _194 = _184;
    bool _196 = !_170;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _160 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _160);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _148 = _218;
        _198 = _228;
        _118 = _216;
    }
    float _230 = _148;
    float _232 = _198;
    float _234 = _118;
    bool _236 = !_170;
    float _238 = _230;
    float _240 = _234;
    if (!_236)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _160 * _244;
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
    if (!_170)
    {
        _268 = _106;
    }
    float _272 = _268;
    float _274 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _276 = _272;
    if (!_170)
    {
        float _278 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _270 = _278;
    }
    float _280 = _270;
    bool _282 = !_170;
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
    bool _318 = !_170;
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
    float _348 = fma(_266, _154, _274);
    float _350 = fma(_266, _156, _342);
    float _352 = fma(_340, _156, _344);
    float _354 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _356 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _358 = fma(_340, _154, _346);
    float _360 = -_352;
    float _362 = _350 + _360;
    float _364 = fma(_266, _158, _354);
    float _366 = fma(_340, _158, _356);
    float _368 = -_358;
    float _370 = _348 + _368;
    float _372 = _362 * _362;
    float _374 = in.m_51.w;
    float _376 = -_366;
    float _378 = _364 + _376;
    float _380 = 1.0 / _138;
    float _382 = fma(_370, _370, _372);
    float _384 = in.m_42.x;
    float _386 = in.m_42.y;
    float _388 = in.m_42.z;
    float _390 = fma(_378, _378, _382);
    float _392 = in.m_53.y;
    float _394 = in.m_55.y;
    float _396 = sqrt(_390);
    float _398 = in.m_57.y;
    float _400 = in.m_53.x;
    float _402 = in.m_57.x;
    float _404 = in.m_53.z;
    float _406 = fma(_348, _374, _384);
    bool _408 = _396 >= 9.9999999747524270787835121154785e-07;
    bool _410 = isnan(_396);
    bool _412 = _408 || _410;
    bool _414 = isnan(9.9999999747524270787835121154785e-07);
    bool _416 = _412 || _414;
    float _418 = fma(_350, _374, _386);
    float _420 = in.m_55.x;
    float _422 = _362 * _392;
    float _424 = fma(_364, _374, _388);
    float _426 = in.m_57.z;
    float _428 = _362 * _394;
    float _430 = in.m_55.z;
    float _432 = _362 * _398;
    float _434 = _392 * _392;
    float _436 = fma(_370, _400, _422);
    float _438 = fma(_394, _394, _434);
    float _440 = fma(_370, _402, _432);
    float _442 = fma(_398, _398, _438);
    float _444 = fma(_378, _404, _436);
    float _446 = fma(_370, _420, _428);
    float _448 = _106 * _380;
    float _450 = fma(_378, _426, _440);
    float _452 = _440;
    float _454 = _450;
    float _456 = _450;
    float _458 = _448;
    if (_416)
    {
        _452 = _444;
    }
    float _460 = _452;
    float _462 = fma(_378, _430, _446);
    float _464 = _462;
    float _466 = _460;
    float _468 = _460;
    float _470 = _462;
    if (!_416)
    {
        bool _472 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _474 = !_472;
        if (!_474)
        {
            float _476 = _392 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _478 = _394 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _480 = _398 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _482 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[16].x, _476);
            float _484 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[16].x, _478);
            float _486 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[16].x, _480);
            float _488 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[16].z, _482);
            float _490 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[16].z, _484);
            float _492 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[16].z, _486);
            float _494 = _488 * _488;
            float _496 = fma(_490, _490, _494);
            float _498 = fma(_492, _492, _496);
            float _500 = rsqrt(_498);
            float _502 = _500 * 9.9999999747524270787835121154785e-07;
            float _504 = _490 * _502;
            float _506 = _488 * _502;
            float _508 = _492 * _502;
            _468 = _506;
            _470 = _504;
            _456 = _508;
            _510 = true;
        }
        else
        {
            float _512 = _156 * _156;
            float _514 = fma(_154, _154, _512);
            float _516 = fma(_158, _158, _514);
            float _518 = sqrt(_516);
            bool _520 = _518 >= 9.9999999747524270787835121154785e-07;
            bool _522 = isnan(_518);
            bool _524 = _520 || _522;
            bool _526 = isnan(9.9999999747524270787835121154785e-07);
            bool _528 = _524 || _526;
            if (!_528)
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
                float _548 = _442;
                if (!_546)
                {
                    float _550 = rsqrt(_442);
                    _548 = _550;
                }
                float _552 = _548;
                if (!_546)
                {
                    float _554 = _552 * 9.9999999747524270787835121154785e-07;
                    _454 = _554;
                }
                float _556 = _454;
                float _558 = _556;
                if (!_546)
                {
                    float _560 = _394 * _556;
                    _464 = _560;
                }
                float _562 = _464;
                _470 = _562;
                if (!_546)
                {
                    float _564 = _392 * _556;
                    _466 = _564;
                }
                float _566 = _466;
                _468 = _566;
                if (!_546)
                {
                    float _568 = _398 * _556;
                    _558 = _568;
                }
                float _570 = _558;
                bool _572 = !_546;
                _456 = _570;
                _510 = _572;
                if (!_510)
                {
                    float _574 = _392 * _386;
                    float _576 = _394 * _386;
                    float _578 = _398 * _386;
                    float _580 = fma(_384, _400, _574);
                    float _582 = fma(_384, _420, _576);
                    float _584 = fma(_384, _402, _578);
                    float _586 = fma(_388, _404, _580);
                    float _588 = fma(_388, _430, _582);
                    float _590 = fma(_388, _426, _584);
                    float _592 = _586 * _586;
                    float _594 = fma(_588, _588, _592);
                    float _596 = fma(_590, _590, _594);
                    float _598 = rsqrt(_596);
                    float _600 = _598 * 9.9999999747524270787835121154785e-07;
                    float _602 = _588 * _600;
                    float _604 = _586 * _600;
                    float _606 = _590 * _600;
                    _468 = _604;
                    _470 = _602;
                    _456 = _606;
                    _510 = true;
                }
            }
            else
            {
                float _608 = _392 * _156;
                float _610 = _394 * _156;
                float _612 = _398 * _156;
                float _614 = fma(_154, _400, _608);
                float _616 = fma(_154, _420, _610);
                float _618 = fma(_154, _402, _612);
                float _620 = fma(_158, _404, _614);
                float _622 = fma(_158, _430, _616);
                float _624 = fma(_158, _426, _618);
                float _626 = _620 * _620;
                float _628 = fma(_622, _622, _626);
                float _630 = fma(_624, _624, _628);
                float _632 = rsqrt(_630);
                float _634 = _632 * 9.9999999747524270787835121154785e-07;
                float _636 = _622 * _634;
                float _638 = _620 * _634;
                float _640 = _624 * _634;
                _468 = _638;
                _470 = _636;
                _456 = _640;
            }
        }
    }
    _510 = false;
    float _642 = _468;
    float _644 = _470;
    float _646 = _456;
    bool _648 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    bool _650 = !_648;
    float _668;
    if (!_650)
    {
        float _652 = in.m_59.x;
        float _654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _656 = _652 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[11].w, _106);
        float _660 = _658 * _654;
        float _662 = floor(_660);
        float _664 = -_662;
        float _666 = _660 + _664;
        _668 = _666;
        _670 = true;
    }
    else
    {
        _668 = _448;
    }
    _670 = false;
    float _672 = _668;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _676 = _672 + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _682 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _684 = isnan(_672);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _702 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _704 = isnan(_672);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _710 = _706 || _708;
    float _712 = float(_710);
    float _714 = 1.0 / _680;
    float _716 = -_692;
    float _718 = _716 + 1.0;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _720;
    bool _724 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _726 = isnan(_672);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = _712 * _718;
    float _738 = -_712;
    float _740 = _738 + 1.0;
    bool _742 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _744 = 1.0 / _696;
    float _746 = _734 * _740;
    float _748 = -_734;
    float _750 = _748 + 1.0;
    float _752 = 1.0 / _700;
    float _754 = _722 * _714;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _760 = fma(_754, _676, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _762 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _764 = isnan(_672);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    float _774 = _758 * _744;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _776;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _782 = _672 + _780;
    float _784 = _760 * _746;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _788 = _672 + _786;
    float _790 = fma(_774, _782, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _792 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[131].x, _784);
    float _794 = _778 * _752;
    float _796 = -_772;
    float _798 = _796 + 1.0;
    float _800 = fma(_790, _736, _792);
    float _802 = fma(_794, _788, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _804 = _692 * _798;
    float _806 = fma(_802, _804, _800);
    float _808 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[134].x, _806);
    float _810 = _808 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _812 = !_742;
    if (!_812)
    {
        float _814 = in.m_59.x;
        float _816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _818 = _814 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _820 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[14].x, _106);
        float _822 = _820 * _816;
        float _824 = floor(_822);
        float _826 = -_824;
        float _828 = _822 + _826;
        _458 = _828;
    }
    float _830 = _458;
    float _832 = in.m_59.w;
    float _834 = _418 * _394;
    float _836 = in.m_51.x;
    float _838 = in.m_51.y;
    float _840 = in.m_51.z;
    float _842 = _418 * _392;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _844;
    float _848 = _418 * _398;
    float _850 = fma(_406, _420, _834);
    float _852 = fma(_406, _400, _842);
    float _854 = 1.0 / _846;
    float _856 = fma(_406, _402, _848);
    float _858 = fma(_424, _430, _850);
    float _860 = fma(_424, _404, _852);
    float _862 = fma(_424, _426, _856);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _868 = in.m_53.w;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _870;
    float _874 = 1.0 / _866;
    float _876 = in.m_55.w;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _880 = _830 + _878;
    float _882 = 30.0 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    bool _884 = _832 > 0.5;
    float _886 = in.m_61.x;
    float _888 = in.m_61.y;
    float _890 = in.m_61.z;
    float _892 = _840 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _894 = _836 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _898 = _896 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _900 = _838 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _902 = 1.0 / _872;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _904;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _912 = 30.0 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _914;
    float _918 = 1.0 / _898;
    float _920 = fma(300.0, (*spvDescriptorSet0.vp_c10)._m0[10].y, _912);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _924 = _830 + _922;
    bool _926 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _928 = isnan(_830);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = _920 + (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _940 = (*spvDescriptorSet0.vp_c10)._m0[9].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _942 = 1.0 / _906;
    float _944 = 30.0 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _948 = _830 + _946;
    float _950 = fma((*spvDescriptorSet0.vp_c10)._m0[8].y, (*spvDescriptorSet0.vp_c10)._m0[8].y, _940);
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _952;
    float _956 = fma(300.0, (*spvDescriptorSet0.vp_c10)._m0[8].y, _944);
    float _958 = _948 * _902;
    float _960 = _860 + _868;
    float _962 = 1.0 / _910;
    float _964 = fma(300.0, (*spvDescriptorSet0.vp_c10)._m0[9].y, _882);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _968 = _830 + _966;
    float _970 = in.m_57.w;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _974 = _972 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _976;
    float _980 = _968 * _854;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _984 = _830 + _982;
    float _986 = 1.0 / _916;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _990 = _830 + _988;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _996 = _984 * _918;
    float _998 = _990 * _874;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1002 = _830 + _1000;
    float _1004 = _880 * _962;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1006;
    float _1010 = _1002 * _942;
    bool _1012 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1014 = isnan(_830);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1020 = _1016 || _1018;
    float _1022 = float(_1020);
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1024;
    float _1028 = _858 + _876;
    float _1030 = fma((*spvDescriptorSet0.vp_c10)._m0[10].y, (*spvDescriptorSet0.vp_c10)._m0[10].y, _950);
    float _1032 = fma(_1008, _980, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1034 = fma(_1026, _980, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1036 = _862 + _970;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1038;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1046;
    bool _1050 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1052 = isnan(_830);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1058 = _1054 || _1056;
    float _1060 = float(_1058);
    float _1062 = fma(_1040, _980, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1064;
    float _1068 = -_936;
    float _1070 = _1068 + 1.0;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1074 = _1072 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1080 = -_1022;
    float _1082 = _1080 + 1.0;
    float _1084 = _1022 * _1070;
    float _1086 = fma(_1074, _996, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1088 = fma(_974, _996, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1090 = fma(_1078, _996, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1092 = _1060 * _1082;
    float _1094 = -_1060;
    float _1096 = _1094 + 1.0;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1098;
    float _1102 = in.m_59.x;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1106 = _1104 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1114 = _1112 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1116 = _924 * _986;
    float _1118 = fma(_1106, _1004, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1120 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1122 = isnan(_830);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1128 = _1124 || _1126;
    float _1130 = float(_1128);
    float _1132 = fma(_994, _1004, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1134 = _642 * _642;
    float _1136 = fma(_1114, _1004, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    bool _1138 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1140 = isnan(_830);
    bool _1142 = _1138 || _1140;
    bool _1144 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1146 = _1142 || _1144;
    float _1148 = float(_1146);
    float _1150 = _1130 * _1096;
    float _1152 = -_1130;
    float _1154 = _1152 + 1.0;
    bool _1156 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1158 = isnan(_830);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1164 = _1160 || _1162;
    float _1166 = float(_1164);
    float _1168 = fma(_644, _644, _1134);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1176 = _1174 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1178 = fma(_1066, _958, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1180 = fma(_954, _958, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1182 = fma(_1048, _958, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    bool _1184 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1186 = isnan(_830);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1192 = _1188 || _1190;
    float _1194 = float(_1192);
    float _1196 = _1148 * _1154;
    float _1198 = -_1148;
    float _1200 = _1198 + 1.0;
    bool _1202 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1204 = isnan(_830);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1210 = _1206 || _1208;
    float _1212 = float(_1210);
    float _1214 = fma(_646, _646, _1168);
    float _1216 = fma(_1172, _998, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1218 = fma(_1044, _998, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1220 = fma(_1176, _998, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1222 = -_1166;
    float _1224 = _1222 + 1.0;
    float _1226 = fma(_1100, _1010, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1228 = fma(_978, _1010, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1230 = fma(_1110, _1010, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1232 = _1212 * _1224;
    float _1234 = -_1212;
    float _1236 = _1234 + 1.0;
    float _1238 = _1166 * _1200;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1240;
    float _1244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _886);
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1246;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1252 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1250;
    float _1254 = fma(_106, 0.02999999932944774627685546875, -0.119999997317790985107421875);
    float _1256 = _1102 * 6.283185482025146484375;
    float _1258 = fma(_1248, _1116, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1260 = _1194 * _1236;
    float _1262 = rsqrt(_1214);
    float _1264 = _1256 + _1254;
    float _1266 = -_1194;
    float _1268 = _1266 + 1.0;
    float _1270 = _964 + (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1272 = fma(_1242, _1116, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1274 = _1032 * _1260;
    float _1276 = _1062 * _1260;
    float _1278 = _956 + (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1280 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1282 = _960 + _1280;
    float _1284 = _1264 * (-0.15915493667125701904296875);
    float _1286 = _1034 * _1260;
    float _1288 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1290 = _960 + _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1294 = _1028 + _1292;
    float _1296 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1298 = _1028 + _1296;
    float _1300 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1286);
    float _1302 = _1290 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1304 = _1290 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1306 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1274);
    float _1308 = fma(_1216, _1232, _1300);
    float _1310 = _1270 * _1270;
    float _1312 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1276);
    float _1314 = fma(_1218, _1232, _1306);
    float _1316 = _1282 * _1282;
    float _1318 = fma(_1278, _1278, _1310);
    float _1320 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1322 = _1036 + _1320;
    float _1324 = _1262 * _644;
    float _1326 = fma(_1294, _1294, _1316);
    float _1328 = fma(_938, _938, _1318);
    float _1330 = _1262 * _642;
    float _1332 = _1262 * _646;
    float _1334 = fma(_1298, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1302);
    float _1336 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1338 = _1036 + _1336;
    float _1340 = fma(_1298, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1304);
    float _1342 = rsqrt(_1328);
    float _1344 = fma(_1322, _1322, _1326);
    float _1346 = fma(_1338, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1334);
    float _1348 = fma(_1338, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1340);
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1352 = _1332 * _1350;
    float _1354 = fma(_1220, _1232, _1312);
    float _1356 = fma(_1180, _1238, _1314);
    float _1358 = fma(_1178, _1238, _1308);
    float _1360 = rsqrt(_1344);
    float _1362 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1364 = -_1352;
    float _1366 = fma(_1324, _1362, _1364);
    float _1368 = fma(_1182, _1238, _1354);
    float _1370 = fma(_1088, _1196, _1356);
    float _1372 = fma(_1252, _1116, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1374 = _892 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1376 = fma(_1090, _1196, _1368);
    float _1378 = _900 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1380 = _1270 * _1342;
    float _1382 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1384 = _1330 * _1382;
    float _1386 = _1278 * _1342;
    float _1388 = _938 * _1342;
    float _1390 = fma(_1086, _1196, _1358);
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1394 = -_1384;
    float _1396 = fma(_1332, _1392, _1394);
    float _1398 = _1366 * _1366;
    float _1400 = abs(_1346);
    float _1402 = abs(_1348);
    float _1404 = precise::max(_1400, _1402);
    float _1406 = _1282 * _1360;
    float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1410 = _1324 * _1408;
    float _1412 = fma(_1396, _1396, _1398);
    float _1414 = _1294 * _1360;
    float _1416 = -_1406;
    float _1418 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1282);
    bool _1420 = _1404 >= 16.0;
    float _1422 = fma(_1226, _1150, _1390);
    float _1424 = -_1414;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1294);
    float _1428 = _1418 * _1418;
    float _1430 = in.m_63.y;
    float _1432 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1434 = -_1410;
    float _1436 = fma(_1330, _1432, _1434);
    float _1438 = fma(_1230, _1150, _1376);
    float _1440 = fma(_1426, _1426, _1428);
    float _1442 = fma(_1228, _1150, _1370);
    float _1444 = fma(_1436, _1436, _1412);
    float _1446 = in.m_59.z;
    float _1448 = _1322 * _1360;
    float _1450 = fma(_1132, _1092, _1442);
    float _1452 = _1346;
    float _1454 = _1348;
    float _1456 = _1414;
    float _1458 = _1448;
    if (_1420)
    {
        float _1460 = _1346 * 0.0625;
        _1452 = _1460;
    }
    float _1462 = _1452;
    float _1464 = in.m_59.y;
    float _1466 = -_1448;
    float _1468 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1322);
    float _1470 = rsqrt(_1444);
    float _1472 = fma(_1136, _1092, _1438);
    float _1474 = in.m_65.x;
    float _1476 = fma(_1468, _1468, _1440);
    float _1478 = fma(_1118, _1092, _1422);
    float _1480 = fma(_1272, _1084, _1450);
    if (_1420)
    {
        float _1482 = _1348 * 0.0625;
        _1454 = _1482;
    }
    float _1484 = _1454;
    float _1486 = abs(_1462);
    bool _1488 = _1486 != 0.0;
    bool _1490 = isnan(_1486);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan(0.0);
    bool _1496 = _1492 || _1494;
    float _1498 = fma(_1258, _1084, _1478);
    float _1500 = rsqrt(_1030);
    float _1502 = fma(_1372, _1084, _1472);
    float _1504 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1480);
    float _1506 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1498);
    float _1508 = -_1430;
    float _1510 = _1508 + 1.0;
    float _1512 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1502);
    float _1514 = abs(_1484);
    bool _1516 = _1514 == 0.0;
    bool _1518 = !_1496;
    bool _1520 = _1516 && _1518;
    float _1522 = _1284 * 6.283185482025146484375;
    float _1524 = cos(_1522);
    bool _1526 = _1446 > 0.5;
    float _1528 = _1504 * (-100.0);
    int _1530 = _884 ? as_type<int>(_1510) : as_type<int>(_1430);
    float _1532 = _1366 * _1470;
    bool _1534 = _1464 > 0.5;
    float _1536 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _888);
    float _1538 = sqrt(_1476);
    float _1540 = -_1474;
    float _1542 = _1540 + 1.0;
    int _1544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1546 = _1544 != 0;
    int _1548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1550 = _1548 != 0;
    int _1552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1554 = _1552 != 0;
    float _1556 = _1500 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1558 = _1500 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1560 = fma(_1528, _1542, _106);
    float _1562 = _1500 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1564 = _1550 ? as_type<float>(_1530) : _1430;
    float _1566 = _1284 * 6.283185482025146484375;
    float _1568 = sin(_1566);
    float _1570 = abs(_1484);
    bool _1572 = _1570 == 0.0;
    float _1574 = -_1524;
    float _1576 = _1574 + 1.0;
    float _1578 = _1558 * _1558;
    float _1580 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _890);
    float _1582 = _1396 * _1470;
    float _1584 = _1562 * _1576;
    float _1586 = _1436 * _1470;
    float _1588 = _1360 * _1538;
    int _1590 = _1534 ? as_type<int>(_1510) : as_type<int>(_1430);
    float _1592 = _1556 * _1576;
    float _1594 = _894 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1596 = _1526 ? _1510 : _1430;
    float _1598 = _1374 * _1588;
    float _1600 = _1546 ? as_type<float>(_1590) : _1430;
    float _1602 = fma(_1556, _1592, _1524);
    float _1604 = _1558 * _1568;
    float _1606 = _1562 * _1568;
    bool _1608 = _1546;
    int _1610 = as_type<int>(_1504);
    int _1612 = _1496 ? (-1) : 0;
    bool _1614 = _1572;
    float _1616 = _1558;
    float _1618 = _1596;
    if (_1520)
    {
        bool _1620 = as_type<int>(_1484) >= 0;
        _1608 = _1620;
    }
    bool _1622 = _1608;
    float _1624 = _1556 * _1568;
    float _1626 = fma(_1562, _1592, _1604);
    float _1628 = -_1604;
    float _1630 = fma(_1562, _1592, _1628);
    float _1632 = -_1606;
    float _1634 = fma(_1558, _1592, _1632);
    float _1636 = fma(_1558, _1592, _1606);
    if (_1520)
    {
        int _1638 = _1622 ? 0 : 1078530011;
        _1610 = _1638;
    }
    int _1640 = _1610;
    float _1642 = fma(_1558, _1584, _1624);
    float _1644 = -_1624;
    float _1646 = fma(_1558, _1584, _1644);
    float _1648 = fma(_1562, _1584, _1524);
    float _1650 = fma(_1576, _1578, _1524);
    float _1652 = _1594 * _1588;
    float _1654 = _1378 * _1588;
    float _1656 = _1554 ? _1596 : _1430;
    int _1658 = _1640;
    if (_1520)
    {
        int _1660 = int(0x80000000) & as_type<int>(_1462);
        int _1662 = _1640 | _1660;
        _1658 = _1662;
    }
    int _1664 = _1658;
    bool _1666 = !_1496;
    bool _1668 = _1666 && _1572;
    int _1670 = _1664;
    float _1672 = as_type<float>(_1664);
    if (!_1668)
    {
        float _1674 = abs(_1462);
        bool _1676 = _1674 != as_type<float>(0x7f800000u /* inf */);
        bool _1678 = isnan(_1674);
        bool _1680 = _1676 || _1678;
        bool _1682 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1684 = _1680 || _1682;
        float _1686 = abs(_1484);
        bool _1688 = _1686 == as_type<float>(0x7f800000u /* inf */);
        float _1690 = abs(_1484);
        bool _1692 = _1690 == as_type<float>(0x7f800000u /* inf */);
        bool _1694 = !_1684;
        bool _1696 = _1692 && _1694;
        _1614 = _1684;
        if (_1696)
        {
            bool _1698 = as_type<int>(_1484) >= 0;
            _1612 = _1698 ? (-1) : 0;
        }
        int _1700 = _1612;
        if (_1696)
        {
            _1670 = 1075235812;
        }
        int _1702 = _1670;
        int _1704 = _1702;
        if (_1696)
        {
            int _1706 = ~_1700;
            int _1708 = (_1706 != 0) ? _1702 : 1061752795;
            _1704 = _1708;
        }
        int _1710 = _1704;
        float _1712 = as_type<float>(_1710);
        if (_1696)
        {
            int _1714 = int(0x80000000) & as_type<int>(_1462);
            int _1716 = _1710 | _1714;
            _1712 = as_type<float>(_1716);
        }
        float _1718 = _1712;
        bool _1720 = !_1684;
        bool _1722 = _1720 && _1688;
        _1672 = _1718;
        if (!_1722)
        {
            float _1724 = abs(_1462);
            float _1726 = abs(_1484);
            float _1728 = precise::max(_1724, _1726);
            float _1730 = abs(_1462);
            float _1732 = abs(_1484);
            float _1734 = precise::min(_1730, _1732);
            float _1736 = 1.0 / _1728;
            float _1738 = abs(_1462);
            float _1740 = abs(_1484);
            bool _1742 = _1738 > _1740;
            bool _1744 = as_type<int>(_1484) >= 0;
            float _1746 = abs(_1462);
            float _1748 = abs(_1484);
            float _1750 = _1746 + _1748;
            int _1752 = as_type<int>(_1462) & int(0x80000000);
            bool _1754 = _1750 > as_type<float>(0x7f800000u /* inf */);
            bool _1756 = isnan(_1750);
            bool _1758 = _1754 || _1756;
            bool _1760 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1762 = _1758 || _1760;
            float _1764 = _1734 * _1736;
            float _1766 = _1764 * _1764;
            float _1768 = _1766 + 11.33538818359375;
            float _1770 = fma(_1766, _1768, 28.84246826171875);
            float _1772 = fma(_1766, _1770, 19.6966705322265625);
            float _1774 = fma(_1766, -0.82336294651031494140625, -5.674867153167724609375);
            float _1776 = fma(_1766, _1774, -6.565555095672607421875);
            float _1778 = 1.0 / _1772;
            float _1780 = _1766 * _1776;
            float _1782 = _1764 * _1780;
            float _1784 = fma(_1782, _1778, _1764);
            float _1786 = _1784;
            _1672 = _1750;
            _1614 = _1762;
            if (_1742)
            {
                float _1788 = -_1784;
                float _1790 = _1788 + 1.57079637050628662109375;
                _1786 = _1790;
            }
            float _1792 = _1786;
            int _1794 = as_type<int>(_1792);
            if (!_1744)
            {
                float _1796 = -_1792;
                float _1798 = _1796 + 3.1415927410125732421875;
                _1794 = as_type<int>(_1798);
            }
            int _1800 = _1794;
            if (!_1762)
            {
                int _1802 = _1752 | _1800;
                _1672 = as_type<float>(_1802);
            }
        }
    }
    float _1804 = _1672;
    bool _1806 = _1614;
    float _1808 = _1652 * _1244;
    float _1810 = _106 + (-4.0);
    float _1812 = _1654 * _1536;
    float _1814 = _1598 * _1580;
    float _1816 = fma(_1810, 0.01333333365619182586669921875, -1.0);
    float _1818 = _1560 * (-0.02300000004470348358154296875);
    float _1820 = _1330 * _1586;
    float _1822 = fma(_1560, 0.01333333365619182586669921875, -1.0);
    float _1824 = _1816 * _1816;
    float _1826 = _1818 * 0.15915493667125701904296875;
    float _1828 = fma(_1560, 0.02999999932944774627685546875, _1256);
    float _1830 = _1332 * _1582;
    float _1832 = _1822 * _1822;
    float _1834 = _1828 * 0.15915493667125701904296875;
    float _1836 = _1826 * 6.283185482025146484375;
    float _1838 = sin(_1836);
    float _1840 = -_1820;
    float _1842 = fma(_1332, _1532, _1840);
    float _1844 = -_1830;
    float _1846 = fma(_1324, _1586, _1844);
    float _1848 = _1812 * _1330;
    float _1850 = _1812 * _1324;
    float _1852 = _1812 * _1332;
    float _1854 = fma(_1824, 0.300000011920928955078125, 0.699999988079071044921875);
    float _1856 = precise::clamp(_1854, 0.0, 1.0);
    float _1858 = fma(_1832, 0.300000011920928955078125, 0.699999988079071044921875);
    float _1860 = precise::clamp(_1858, 0.0, 1.0);
    float _1862 = _1834 * 6.283185482025146484375;
    float _1864 = cos(_1862);
    float _1866 = _1324 * _1532;
    float _1868 = -_1804;
    float _1870 = _1254 + _1868;
    float _1872 = _1474 * _1474;
    float _1874 = -_1804;
    float _1876 = fma(_1560, 0.02999999932944774627685546875, _1874);
    float _1878 = fma(_1560, 1.5, -50.0);
    float _1880 = -_1866;
    float _1882 = fma(_1330, _1582, _1880);
    float _1884 = _1834 * 6.283185482025146484375;
    float _1886 = sin(_1884);
    float _1888 = fma(_1838, 0.1500000059604644775390625, 1.0);
    float _1890 = fma(_1810, 1.5, -50.0);
    float _1892 = _1870 * 0.15915493667125701904296875;
    float _1894 = fma(_1808, _1532, _1848);
    float _1896 = fma(_1872, -0.980000019073486328125, 1.0);
    float _1898 = fma(_1808, _1582, _1850);
    float _1900 = fma(_1808, _1586, _1852);
    float _1902 = -_1864;
    float _1904 = _1902 + 1.0;
    float _1906 = _960 + _964;
    float _1908 = _1860 * 50.0;
    float _1910 = _1892 * 6.283185482025146484375;
    float _1912 = cos(_1910);
    float _1914 = _1388 * _1388;
    float _1916 = _1386 * _1904;
    float _1918 = _1380 * _1904;
    float _1920 = fma(_1908, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1906);
    float _1922 = _1388 * _1886;
    float _1924 = fma(_1814, _1842, _1898);
    float _1926 = fma(_1904, _1914, _1864);
    float _1928 = _1892 * 6.283185482025146484375;
    float _1930 = sin(_1928);
    float _1932 = _1386 * _1886;
    float _1934 = _1380 * _1886;
    float _1936 = fma(_1380, _1916, _1922);
    float _1938 = -_1922;
    float _1940 = fma(_1380, _1916, _1938);
    float _1942 = fma(_1380, _1918, _1864);
    float _1944 = fma(_1878, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1920);
    float _1946 = fma(_1386, _1916, _1864);
    float _1948 = fma(_1388, _1918, _1932);
    float _1950 = -_1932;
    float _1952 = fma(_1388, _1918, _1950);
    float _1954 = _1028 + _956;
    float _1956 = -_960;
    float _1958 = _1956 + _1944;
    float _1960 = -_1934;
    float _1962 = fma(_1388, _1916, _1960);
    float _1964 = fma(_1388, _1916, _1934);
    float _1966 = fma(_1908, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1954);
    float _1968 = _1940 * _1958;
    float _1970 = _1942 * _1958;
    float _1972 = _1948 * _1958;
    float _1974 = -_1912;
    float _1976 = _1974 + 1.0;
    float _1978 = fma(_1878, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1966);
    float _1980 = _1558 * _1930;
    float _1982 = _1556 * _1930;
    float _1984 = _1556 * _1976;
    float _1986 = _1562 * _1930;
    float _1988 = _1562 * _1976;
    float _1990 = -_1028;
    float _1992 = _1990 + _1978;
    float _1994 = fma(_1562, _1984, _1980);
    float _1996 = -_1980;
    float _1998 = fma(_1562, _1984, _1996);
    float _2000 = -_1986;
    float _2002 = fma(_1558, _1984, _2000);
    float _2004 = fma(_1558, _1984, _1986);
    float _2006 = _1856 * 50.0;
    float _2008 = fma(_1578, _1976, _1912);
    float _2010 = fma(_1556, _1984, _1912);
    float _2012 = fma(_1562, _1988, _1912);
    float _2014 = fma(_1558, _1988, _1982);
    float _2016 = -_1982;
    float _2018 = fma(_1558, _1988, _2016);
    float _2020 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1906);
    float _2022 = in.m_65.w;
    float _2024 = fma(_1936, _1992, _1970);
    float _2026 = _1036 + _920;
    float _2028 = fma(_1962, _1992, _1972);
    float _2030 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1954);
    float _2032 = fma(_1890, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2020);
    float _2034 = fma(_1908, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2026);
    float _2036 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2026);
    float _2038 = fma(_1890, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2030);
    float _2040 = -_1906;
    float _2042 = _2040 + _2032;
    float _2044 = fma(_1946, _1992, _1968);
    float _2046 = fma(_1878, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2034);
    float _2048 = -_1954;
    float _2050 = _2048 + _2038;
    float _2052 = fma(_1890, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2036);
    float _2054 = _2012 * _2042;
    float _2056 = -_1036;
    float _2058 = _2056 + _2046;
    float _2060 = _1998 * _2042;
    float _2062 = -_2026;
    float _2064 = _2062 + _2052;
    float _2066 = fma(_1994, _2050, _2054);
    float _2068 = fma(_1964, _2058, _2044);
    float _2070 = fma(_1952, _2058, _2024);
    float _2072 = fma(_2010, _2050, _2060);
    float _2074 = fma(_2018, _2064, _2066);
    float _2076 = _2014 * _2042;
    float _2078 = -_2022;
    float _2080 = _2078 + 1.0;
    float _2082 = fma(_2004, _2064, _2072);
    float _2084 = _1906 + _2074;
    float _2086 = fma(_2002, _2050, _2076);
    float _2088 = _960 + _2070;
    float _2090 = _1954 + _2082;
    float _2092 = _2084 * _2080;
    float _2094 = fma(_2008, _2064, _2086);
    float _2096 = _1028 + _2068;
    float _2098 = _2090 * _2080;
    float _2100 = fma(_2088, _2022, _2092);
    float _2102 = fma(_1926, _2058, _2028);
    float _2104 = _2026 + _2094;
    float _2106 = fma(_2096, _2022, _2098);
    float _2108 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2110 = _2100 + _2108;
    float _2112 = _1036 + _2102;
    float _2114 = _2104 * _2080;
    float _2116 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2118 = _2106 + _2116;
    float _2120 = _2110 * _2110;
    float _2122 = fma(_1814, _1846, _1894);
    float _2124 = fma(_2112, _2022, _2114);
    float _2126 = fma(_1814, _1882, _1900);
    float _2128 = fma(_2118, _2118, _2120);
    float _2130 = fma(_1506, _2122, _960);
    float _2132 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2134 = _2124 + _2132;
    float _2136 = fma(_1506, _1924, _1028);
    float _2138 = _1896 * _1888;
    float _2140 = -_960;
    float _2142 = _2140 + _2130;
    float _2144 = fma(_2134, _2134, _2128);
    float _2146 = -_1028;
    float _2148 = _2146 + _2136;
    float _2150 = fma(_1506, _2126, _1036);
    float _2152 = _1630 * _2142;
    float _2154 = _1648 * _2142;
    float _2156 = _1642 * _2142;
    float _2158 = sqrt(_2144);
    float _2160 = fma(_1602, _2148, _2152);
    float _2162 = -_1036;
    float _2164 = _2162 + _2150;
    float _2166 = fma(_1626, _2148, _2154);
    float _2168 = fma(_1634, _2148, _2156);
    float _2170 = _1876 * 0.15915493667125701904296875;
    float _2172 = fma(_1636, _2164, _2160);
    float _2174 = fma(_1646, _2164, _2166);
    float _2176 = fma(_1650, _2164, _2168);
    float _2178 = _1954 + _2172;
    float _2180 = _1906 + _2174;
    float _2182 = _2026 + _2176;
    float _2184 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2178);
    float _2186 = fma(_2158, 0.006666666828095912933349609375, -0.666666686534881591796875);
    float _2188 = precise::clamp(_2186, 0.0, 1.0);
    float _2190 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2180);
    float _2192 = _1512 * _2138;
    float _2194 = fma(_1890, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2184);
    float _2196 = fma(_2188, -2.0, 3.0);
    float _2198 = _2188 * _2188;
    float _2200 = fma(_1890, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2190);
    float _2202 = _2170 * 6.283185482025146484375;
    float _2204 = cos(_2202);
    float _2206 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2182);
    float _2208 = _2196 * _2198;
    float _2210 = -_1906;
    float _2212 = _2210 + _2200;
    float _2214 = fma(_2208, 0.800000011920928955078125, 0.20000000298023223876953125);
    float _2216 = -_1954;
    float _2218 = _2216 + _2194;
    float _2220 = _2014 * _2212;
    float _2222 = _2170 * 6.283185482025146484375;
    float _2224 = sin(_2222);
    float _2226 = _2192 * _2214;
    float _2228 = fma(_1890, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2206);
    float _2230 = _1998 * _2212;
    float _2232 = fma(_2002, _2218, _2220);
    float _2234 = fma(_1924, _2226, _1028);
    float _2236 = fma(_2122, _2226, _960);
    float _2238 = fma(_2126, _2226, _1036);
    float _2240 = -_2204;
    float _2242 = _2240 + 1.0;
    float _2244 = _956 + _2234;
    float _2246 = _964 + _2236;
    float _2248 = _920 + _2238;
    float _2250 = fma(_1578, _2242, _2204);
    float _2252 = fma(_1908, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2244);
    float _2254 = fma(_1908, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2246);
    float _2256 = fma(_1908, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2248);
    float _2258 = _1556 * _2224;
    float _2260 = fma(_1878, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2252);
    float _2262 = fma(_1878, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2254);
    float _2264 = _1562 * _2242;
    float _2266 = fma(_1878, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2256);
    float _2268 = _1558 * _2224;
    float _2270 = _1556 * _2242;
    float _2272 = _1562 * _2224;
    float _2274 = fma(_1558, _2264, _2258);
    float _2276 = -_1906;
    float _2278 = _2276 + _2262;
    float _2280 = -_1954;
    float _2282 = _2280 + _2260;
    float _2284 = -_2272;
    float _2286 = fma(_1558, _2270, _2284);
    float _2288 = -_2268;
    float _2290 = fma(_1562, _2270, _2288);
    float _2292 = _2274 * _2278;
    float _2294 = -_2026;
    float _2296 = _2294 + _2228;
    float _2298 = -_2026;
    float _2300 = _2298 + _2266;
    float _2302 = fma(_2010, _2218, _2230);
    float _2304 = fma(_2286, _2282, _2292);
    float _2306 = fma(_1556, _2270, _2204);
    float _2308 = _2290 * _2278;
    float _2310 = fma(_2008, _2296, _2232);
    float _2312 = fma(_2250, _2300, _2304);
    float _2314 = fma(_1558, _2270, _2272);
    float _2316 = fma(_2306, _2282, _2308);
    float _2318 = fma(_2004, _2296, _2302);
    float _2320 = _2026 + _2310;
    float _2322 = _2026 + _2312;
    float _2324 = fma(_2314, _2300, _2316);
    float _2326 = _1954 + _2318;
    float _2328 = _2080 * _2320;
    float _2330 = _2012 * _2212;
    float _2332 = _1954 + _2324;
    float _2334 = _2080 * _2326;
    float _2336 = fma(_2322, _2022, _2328);
    float _2338 = fma(_1562, _2264, _2204);
    float _2340 = fma(_1562, _2270, _2268);
    float _2342 = fma(_2332, _2022, _2334);
    float _2344 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2346 = _2336 + _2344;
    float _2348 = fma(_1994, _2218, _2330);
    float _2350 = _2338 * _2278;
    float _2352 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2354 = _2342 + _2352;
    float _2356 = _2346 * _2346;
    float _2358 = -_2258;
    float _2360 = fma(_1558, _2264, _2358);
    float _2362 = fma(_2018, _2296, _2348);
    float _2364 = fma(_2340, _2282, _2350);
    float _2366 = fma(_2354, _2354, _2356);
    float _2368 = _1906 + _2362;
    float _2370 = fma(_2360, _2300, _2364);
    float _2372 = sqrt(_2366);
    float _2374 = _2080 * _2368;
    float _2376 = _1906 + _2370;
    float _2378 = fma(_2376, _2022, _2374);
    bool _2380 = _2372 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2382 = _2368;
    float _2384 = _2282;
    float _2386 = _2360;
    float _2388 = _2354;
    float _2390 = _2270;
    bool _2392 = _1806;
    float _2394 = _1894;
    float _2396 = _2126;
    if (!_2380)
    {
        _2382 = _2342;
    }
    float _2398 = _2382;
    float _2400 = _2398;
    if (!_2380)
    {
        _2384 = _2336;
    }
    float _2402 = _2384;
    float _2404 = _2402;
    if (!_2380)
    {
        _2386 = _2378;
    }
    float _2406 = _2386;
    bool _2408 = !_2380;
    float _2410 = _2406;
    if (!_2408)
    {
        float _2412 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2416 = _2372 + _2414;
        float _2418 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2420 = rsqrt(_2366);
        float _2422 = _2416 * _2412;
        float _2424 = _2422 * 0.15915493667125701904296875;
        float _2426 = _2424 * 6.283185482025146484375;
        float _2428 = cos(_2426);
        float _2430 = _2424 * 6.283185482025146484375;
        float _2432 = sin(_2430);
        float _2434 = _2428 + (-1.0);
        float _2436 = _2434 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2438 = fma(_2432, _2418, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2440 = fma(_2378, _2428, _2436);
        float _2442 = _2420 * _2438;
        float _2444 = fma(_2354, _2442, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2446 = fma(_2346, _2442, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2410 = _2440;
        _2400 = _2444;
        _2404 = _2446;
    }
    float _2448 = _2410;
    float _2450 = _2400;
    float _2452 = _2404;
    float _2454 = -_1406;
    float _2456 = fma(_2454, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2448);
    float _2458 = -_1414;
    float _2460 = fma(_2458, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2450);
    float _2462 = -_1448;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2452);
    float _2466 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2468 = _2456 + _2466;
    float _2470 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2472 = _2460 + _2470;
    float _2474 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2476 = _2464 + _2474;
    float _2478 = _2468 * _2468;
    float _2480 = fma(_2472, _2472, _2478);
    float _2482 = fma(_2476, _2476, _2480);
    float _2484 = rsqrt(_2482);
    float _2486 = _2484 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2488 = _2472 * _2486;
    float _2490 = _2476 * _2486;
    float _2492 = _2488 * _2488;
    float _2494 = _2490 * _2490;
    float _2496 = _2492 + _2494;
    float _2498 = sqrt(_2496);
    bool _2500 = _2498 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2504 = _2498 + _2502;
    float _2506 = _2484;
    float _2508 = _2496;
    float _2510 = _2504;
    float _2512 = _2468;
    if (_2500)
    {
        float _2514 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2506 = _2514;
    }
    float _2516 = _2506;
    if (_2500)
    {
        float _2518 = rsqrt(_2496);
        _2508 = _2518;
    }
    float _2520 = _2508;
    float _2522 = _2520;
    if (_2500)
    {
        float _2524 = _2504 * _2516;
        _2510 = _2524;
    }
    float _2526 = _2510;
    if (_2500)
    {
        float _2528 = _2526 * 0.15915493667125701904296875;
        _1616 = _2528;
    }
    float _2530 = _1616;
    float _2532 = _2476;
    if (_2500)
    {
        float _2534 = _2530 * 6.283185482025146484375;
        float _2536 = sin(_2534);
        _2532 = _2536;
    }
    float _2538 = _2532;
    float _2540 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2542 = precise::max(0.0, _2540);
    float _2544 = _2516;
    float _2546 = _2542;
    if (_2500)
    {
        float _2548 = _2530 * 6.283185482025146484375;
        float _2550 = cos(_2548);
        _2544 = _2550;
    }
    float _2552 = _2544;
    float _2554 = -_2486;
    float _2556 = -_2542;
    float _2558 = fma(_2468, _2554, _2556);
    if (_2500)
    {
        float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2512 = _2560;
    }
    float _2562 = _2512;
    float _2564 = sqrt(_2482);
    float _2566 = _2562;
    float _2568 = _2538;
    if (_2500)
    {
        float _2570 = fma(_2538, _2562, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2566 = _2570;
    }
    float _2572 = _2566;
    float _2574 = _2572;
    if (!_2500)
    {
        _2568 = _2488;
    }
    float _2576 = _2568;
    float _2578 = _2576;
    float _2580 = _2552;
    if (_2500)
    {
        float _2582 = _2552 + (-1.0);
        _2546 = _2582;
    }
    float _2584 = _2546;
    float _2586 = _2584;
    if (_2500)
    {
        float _2588 = _2520 * _2572;
        _2388 = _2588;
    }
    float _2590 = _2388;
    if (!_2500)
    {
        _2574 = _2558;
    }
    float _2592 = _2574;
    float _2594 = _2592;
    if (_2500)
    {
        float _2596 = _2584 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2390 = _2596;
    }
    float _2598 = _2390;
    if (_2500)
    {
        float _2600 = _2488 * _2590;
        _2578 = _2600;
    }
    float _2602 = _2578;
    if (!_2500)
    {
        _2586 = _2490;
    }
    float _2604 = _2586;
    float _2606 = _2604;
    if (_2500)
    {
        float _2608 = _2490 * _2590;
        _2606 = _2608;
    }
    float _2610 = _2606;
    if (!_2500)
    {
        _2522 = _2492;
    }
    float _2612 = _2522;
    float _2614 = _2612;
    if (_2500)
    {
        float _2616 = fma(_2558, _2552, _2598);
        _2594 = _2616;
    }
    float _2618 = _2594;
    if (_2500)
    {
        float _2620 = _2602 * _2602;
        _2614 = _2620;
    }
    float _2622 = _2614;
    if (!_2500)
    {
        _2580 = _2494;
    }
    float _2624 = _2580;
    float _2626 = _2624;
    if (_2500)
    {
        float _2628 = _2610 * _2610;
        _2626 = _2628;
    }
    float _2630 = _2626;
    float _2632 = fma(_2618, _2618, _2622);
    float _2634 = _2456 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2636 = _2632 + _2630;
    float _2638 = _2456 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2640 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2642 = fma(_2564, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2640);
    float _2644 = precise::clamp(_2642, 0.0, 1.0);
    float _2646 = _2456 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2648 = rsqrt(_2636);
    float _2650 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2638);
    float _2652 = -_2644;
    float _2654 = _2652 + 1.0;
    float _2656 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2646);
    float _2658 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2660 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2650);
    float _2662 = _2456 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2664 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2656);
    float _2666 = abs(_2654);
    float _2668 = log2(_2666);
    float _2670 = _2660 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2672 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2662);
    float _2674 = _2664 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2676 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2634);
    float _2678 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2680 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2672);
    float _2682 = _2648 * _2602;
    float _2684 = _2648 * _2618;
    float _2686 = _2680 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2688 = _2674 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2690 = _2682 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2692 = -_2678;
    float _2694 = fma(_2692, _2658, 1.0);
    float _2696 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2676);
    float _2698 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2688);
    float _2700 = _2648 * _2610;
    float _2702 = -_2690;
    float _2704 = fma(_2684, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2702);
    float _2706 = _2696 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2708 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2698);
    float _2710 = _2668 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2712 = -_2700;
    float _2714 = fma(_2712, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2704);
    float _2716 = log2(_2694);
    float _2718 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2708);
    float _2720 = _2674 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2722 = fma(_2714, -0.5, 0.5);
    float _2724 = _2674 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2726 = _2684 + 1.0;
    float _2728 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2720);
    float _2730 = exp2(_2710);
    float _2732 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2728);
    float _2734 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2732);
    float _2736 = 1.0 / _2718;
    float _2738 = fma(_2714, 0.5, 0.5);
    float _2740 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2724);
    float _2742 = _2716 * 0.693147182464599609375;
    float _2744 = fma(_2738, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2746 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2740);
    float _2748 = _2742 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2750 = sqrt(_2722);
    float _2752 = -_2684;
    float _2754 = fma(_2730, _2726, _2752);
    float _2756 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2746);
    float _2758 = fma(_2738, _2744, -0.212114393711090087890625);
    float _2760 = fma(_2754, 0.5, 0.5);
    float _2762 = fma(_2738, _2758, 1.570728778839111328125);
    float _2764 = _2734 * _2736;
    float _2766 = _2756 * _2736;
    float _2768 = fma(_2764, 0.5, 0.5);
    float _2770 = fma(_2766, -0.5, 0.5);
    float _2772 = _2750 * 0.636619746685028076171875;
    float3 _7568 = float3(_2768, _2770, _2748);
    float _2774 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7568, float3(0.0), isnan(_7568)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7568, float3(0.0), isnan(_7568)), level(0.0)).x;
    float _2776 = -_2762;
    float _2778 = fma(_2772, _2776, 1.0);
    float3 _7584 = float3(_2768, _2770, _2748);
    float4 _2781 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7584, float3(0.0), isnan(_7584)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7584, float3(0.0), isnan(_7584)), level(0.0)).xyzw;
    float _2783 = _2781.x;
    float _2785 = _2781.y;
    float _2787 = _2781.z;
    float _2789 = _2781.w;
    float2 _7601 = float2(_2778, _2760);
    float3 _2793 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7601, float2(0.0), isnan(_7601)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7601, float2(0.0), isnan(_7601)), level(0.0)).xyz;
    float _2795 = _2793.x;
    float _2797 = _2793.y;
    float _2799 = _2793.z;
    float _2801 = in.m_63.x;
    int _2803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2805 = _2803 != 0;
    float _2807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2809 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    out.m_67.x = _1474;
    int _2811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2813 = _2811 != 0;
    float _2815 = _2674 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2819 = _2817 != 0;
    out.m_69.w = _810;
    float _2821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2823 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2825 = _2813 ? _1596 : _1430;
    float _2827 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2815);
    int _2829 = as_type<int>(_2736);
    float _2831 = _2758;
    float _2833 = _2823;
    if (_2805)
    {
        bool _2835 = _1102 > 0.5;
        _2392 = _2835;
    }
    bool _2837 = _2392;
    float _2839 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2843 = _2841 != 0;
    float _2845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2847 = _2807 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2849 = fma(_2809, -2.0, _2839);
    float _2851 = _2668 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2853 = (*spvDescriptorSet0.vp_c9)._m0[88].z;
    float _2855 = _2849;
    float _2857 = _2801;
    if (_2805)
    {
        float _2859 = -_2801;
        float _2861 = _2859 + 1.0;
        _2829 = as_type<int>(_2861);
    }
    int _2863 = _2829;
    if (!_2805)
    {
        _2831 = _2801;
    }
    float _2865 = _2831;
    float _2867 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2869 = _2865;
    if (!_2819)
    {
        _1618 = _1102;
    }
    float _2871 = _1618;
    float _2873 = fma(_2847, _1600, -0.5);
    float _2875 = _2871;
    float _2877 = _2873;
    if (_2805)
    {
        float _2879 = _2837 ? as_type<float>(_2863) : _2801;
        _2869 = _2879;
    }
    float _2881 = _2869;
    float _2883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2885 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2827);
    int _2887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2889 = _2887 != 0;
    float _2891 = _2845 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2895 = _2893 != 0;
    float _2897 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2899 = fma(_1656, _2891, -0.5);
    int _2901 = as_type<int>(_2891);
    if (!_2819)
    {
        _2394 = _1464;
    }
    float _2903 = _2394;
    float _2905 = -_2897;
    float _2907 = fma(_2823, 2.0, _2905);
    float _2909 = _2821 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2911 = _2903;
    if (!_2819)
    {
        _2833 = _1446;
    }
    float _2913 = _2833;
    float _2915 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2917 = fma(_2909, _1564, -0.5);
    float _2919 = _2913;
    int _2921 = as_type<int>(_2915);
    if (!_2819)
    {
        _1456 = _2913;
    }
    float _2923 = _1456;
    float _2925 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2927 = _2923;
    if (_2819)
    {
        _2919 = _1446;
    }
    float _2929 = _2919;
    float _2931 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2933 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2867);
    if (!_2819)
    {
        _2853 = _2871;
    }
    float _2935 = _2853;
    float _2937 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2925);
    float _2939 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2931);
    float _2941 = _2935;
    if (_2819)
    {
        _2875 = _1102;
    }
    float _2943 = _2875;
    float _2945 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2933);
    float _2947 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2849);
    float _2949 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2915);
    int _2951 = as_type<int>(_2945);
    if (_2895)
    {
        float _2953 = -_2801;
        float _2955 = _2953 + 1.0;
        _2901 = as_type<int>(_2955);
    }
    int _2957 = _2901;
    float _2959 = as_type<float>(_2957);
    if (_2843)
    {
        float _2961 = -_2801;
        float _2963 = _2961 + 1.0;
        _2921 = as_type<int>(_2963);
    }
    int _2965 = _2921;
    float _2967 = -_2947;
    float _2969 = fma(_2945, _2873, _2967);
    float _2971 = as_type<float>(_2965);
    if (_2889)
    {
        float _2973 = -_2801;
        float _2975 = _2973 + 1.0;
        _2951 = as_type<int>(_2975);
    }
    int _2977 = _2951;
    if (!_2819)
    {
        _2855 = _2903;
    }
    float _2979 = _2855;
    float _2981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2983 = _2979;
    if (_2819)
    {
        _2911 = _1464;
    }
    float _2985 = _2911;
    float _2987 = -_106;
    float _2989 = fma(_2987, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2907);
    if (!_2889)
    {
        _2396 = _2801;
    }
    float _2991 = _2396;
    float _2993 = _2825 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2995 = _2991;
    if (!_2895)
    {
        _2877 = _2801;
    }
    float _2997 = _2877;
    float _2999 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2885);
    float _3001 = _2997;
    if (_2889)
    {
        float _3003 = _1526 ? as_type<float>(_2977) : _2801;
        _2995 = _3003;
    }
    float _3005 = _2995;
    out.m_67.w = _2022;
    if (_2895)
    {
        float _3007 = _1534 ? as_type<float>(_2957) : _2801;
        _3001 = _3007;
    }
    float _3009 = _3001;
    out.m_71.x = _2460;
    out.m_71.y = _2456;
    out.m_71.z = _2464;
    float _3011 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3013 = _3011;
    if (_2843)
    {
        float _3015 = _1534 ? as_type<float>(_2965) : _2801;
        _2857 = _3015;
    }
    float _3017 = _2857;
    out.gl_Position.x = _2734;
    out.gl_Position.y = _2756;
    out.gl_Position.z = _2999;
    out.gl_Position.w = _2718;
    if (!_2819)
    {
        _2971 = _2979;
    }
    float _3019 = _2971;
    float _3021 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _3023 = _3017 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _3025 = _3019;
    if (_2819)
    {
        _2983 = _2943;
    }
    float _3027 = _2983;
    if (_2819)
    {
        _2941 = _2929;
    }
    float _3029 = _2941;
    float _3031 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3033 = _3029;
    if (!_2819)
    {
        _1458 = _2923;
    }
    float _3035 = _1458;
    float _3037 = fma(_3027, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3011);
    float _3039 = _3035;
    if (_2819)
    {
        _2927 = _2985;
    }
    float _3041 = _2927;
    float _3043 = fma(_3029, (*spvDescriptorSet0.vp_c9)._m0[84].z, _3021);
    if (_2819)
    {
        _3013 = _2929;
    }
    float _3045 = _3013;
    float _3047 = _3045;
    if (_2819)
    {
        _3033 = _2985;
    }
    float _3049 = _3033;
    float _3051 = fma(_3041, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3031);
    float _3053 = _3049;
    if (_2819)
    {
        _3039 = _2985;
    }
    float _3055 = _3039;
    float _3057 = _2981 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_2819)
    {
        _3047 = _2985;
    }
    float _3059 = _3047;
    float _3061 = fma(_3057, _2881, -0.5);
    if (_2819)
    {
        _3025 = _2943;
    }
    float _3063 = _3025;
    float _3065 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _3067 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    if (_2819)
    {
        _2959 = _2943;
    }
    float _3069 = _2959;
    float _3071 = _3063 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3073 = _3069;
    if (!_2819)
    {
        _3073 = _2929;
    }
    float _3075 = _3073;
    float _3077 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[84].x, _3043);
    float _3079 = _2883 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3081 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3083 = fma(_3059, (*spvDescriptorSet0.vp_c9)._m0[89].z, _3067);
    float _3085 = _3077 * (-0.15915493667125701904296875);
    float _3087 = fma(_3079, _3005, -0.5);
    float _3089 = -_3081;
    float _3091 = fma(_3071, 2.0, _3089);
    float _3093 = _3055 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3095 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[89].x, _3083);
    float _3097 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3099 = _3075 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_2819)
    {
        _3053 = _2943;
    }
    float _3101 = _3053;
    float _3103 = _3095 * (-0.15915493667125701904296875);
    float _3105 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3107 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3109 = fma(_3093, -2.0, _3097);
    float _3111 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2939);
    float _3113 = -_3105;
    float _3115 = fma(_3099, 2.0, _3113);
    float _3117 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2937);
    float _3119 = fma(_3111, _3061, _2989);
    float _3121 = _3101 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _3125 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3051);
    float _3127 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3129 = -_106;
    float _3131 = fma(_3129, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3091);
    float _3133 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3109);
    float _3135 = -_106;
    float _3137 = fma(_3135, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3115);
    float _3139 = fma(_3121, -2.0, _3127);
    float _3141 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2949);
    float _3143 = _3103 * 6.283185482025146484375;
    float _3145 = sin(_3143);
    float _3147 = _3107 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3149 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3139);
    float _3151 = _2993 * _3065;
    float _3153 = fma(_3147, _3009, -0.5);
    float _3155 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3037);
    float _3157 = _3103 * 6.283185482025146484375;
    float _3159 = cos(_3157);
    float _3161 = _3023 * _3123;
    float _3163 = _2969 + 0.5;
    float _3165 = _2734 + _2718;
    out.m_73.x = _3161;
    out.m_73.y = _3151;
    float _3167 = _3085 * 6.283185482025146484375;
    float _3169 = sin(_3167);
    float _3171 = _3145 * _2899;
    float _3173 = _3085 * 6.283185482025146484375;
    float _3175 = cos(_3173);
    float _3177 = _3159 * _2899;
    float _3179 = -_3171;
    float _3181 = fma(_3159, _3153, _3179);
    float _3183 = fma(_3145, _3153, _3177);
    float _3185 = fma(_3117, _3181, _3137);
    float _3187 = exp2(_2851);
    float _3189 = _3169 * _2917;
    float _3191 = -_3149;
    float _3193 = fma(_3141, _3183, _3191);
    float _3195 = _3119 + 0.5;
    float _3197 = _3185 + 0.5;
    float _3199 = _3193 + 0.5;
    float _3201 = _3175 * _2917;
    float _3203 = -_3189;
    float _3205 = fma(_3175, _3087, _3203);
    float _3207 = _2718 * 0.5;
    out.m_75.x = _3197;
    out.m_75.y = _3199;
    float _3209 = fma(_3169, _3087, _3201);
    float _3211 = _3165 * 0.5;
    float _3213 = fma(_3155, _3205, _3131);
    float _3215 = -_3187;
    float _3217 = _3215 + 1.0;
    float _3219 = -_3133;
    float _3221 = fma(_3125, _3209, _3219);
    float _3223 = fma(_2756, -0.5, _3207);
    float _3225 = _3213 + 0.5;
    float _3227 = _3217 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3229 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3231 = _2999 + _2718;
    float _3233 = _3221 + 0.5;
    float _3235 = _3231 * 0.5;
    out.m_49.x = _3229;
    out.m_77.x = _3195;
    out.m_77.y = _3163;
    out.m_77.z = _3225;
    out.m_77.w = _3233;
    out.m_79.x = _3211;
    out.m_79.y = _3223;
    out.m_79.z = _3235;
    out.m_79.w = _2718;
    float _3237 = _3227 * _2774;
    float _3239 = -_3227;
    float _3241 = _3239 + 1.0;
    float _3243 = _2789 * _3237;
    float _3245 = _2789 * _3241;
    float _3247 = _2799 * _3237;
    float _3249 = fma(_2795, _3243, _2783);
    float _3251 = fma(_2797, _3243, _2785);
    float _3253 = fma(_2789, _3247, _2787);
    out.m_81.x = _3249;
    out.m_81.y = _3251;
    out.m_81.z = _3253;
    out.m_81.w = _3245;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _670 = false;
    bool _510 = false;
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
    float _114 = _97;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    float _118 = _116;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _120 = 0;
    if (!_110)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3321 = as_type<float>(_124);
        out.gl_Position.z = _3321;
    }
    if (!_110)
    {
        return out;
    }
    bool _128 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_97);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = float(_102);
    bool _140 = _106 >= _138;
    bool _142 = !_136;
    bool _144 = _140 || _142;
    if (_144)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _114;
    float _148 = _146;
    if (_144)
    {
        out.m_49.x = 0.0;
    }
    if (_144)
    {
        float _150 = _146 * 5.0;
        _126 = as_type<int>(_150);
    }
    int _152 = _126;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3377 = as_type<float>(_152);
        out.gl_Position.z = _3377;
    }
    if (_144)
    {
        return out;
    }
    float _154 = in.m_44.x;
    float _156 = in.m_44.y;
    float _158 = in.m_44.z;
    float _160 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = 0.0;
    float _174 = _160;
    if (!_170)
    {
        float _176 = _160 * _160;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = 0.0;
    float _184 = _180;
    if (!_170)
    {
        float _186 = _106 * _106;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    if (!_170)
    {
        float _192 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _192;
    }
    float _194 = _184;
    bool _196 = !_170;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _160 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _160);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _148 = _218;
        _198 = _228;
        _118 = _216;
    }
    float _230 = _148;
    float _232 = _198;
    float _234 = _118;
    bool _236 = !_170;
    float _238 = _230;
    float _240 = _234;
    if (!_236)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _160 * _244;
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
    if (!_170)
    {
        _268 = _106;
    }
    float _272 = _268;
    float _274 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _276 = _272;
    if (!_170)
    {
        float _278 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _270 = _278;
    }
    float _280 = _270;
    bool _282 = !_170;
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
    bool _318 = !_170;
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
    float _348 = fma(_266, _154, _274);
    float _350 = fma(_266, _156, _342);
    float _352 = fma(_340, _156, _344);
    float _354 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _356 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _358 = fma(_340, _154, _346);
    float _360 = -_352;
    float _362 = _350 + _360;
    float _364 = fma(_266, _158, _354);
    float _366 = fma(_340, _158, _356);
    float _368 = -_358;
    float _370 = _348 + _368;
    float _372 = _362 * _362;
    float _374 = in.m_51.w;
    float _376 = -_366;
    float _378 = _364 + _376;
    float _380 = 1.0 / _138;
    float _382 = fma(_370, _370, _372);
    float _384 = in.m_42.x;
    float _386 = in.m_42.y;
    float _388 = in.m_42.z;
    float _390 = fma(_378, _378, _382);
    float _392 = in.m_53.y;
    float _394 = in.m_55.y;
    float _396 = sqrt(_390);
    float _398 = in.m_57.y;
    float _400 = in.m_53.x;
    float _402 = in.m_57.x;
    float _404 = in.m_53.z;
    float _406 = fma(_348, _374, _384);
    bool _408 = _396 >= 9.9999999747524270787835121154785e-07;
    bool _410 = isnan(_396);
    bool _412 = _408 || _410;
    bool _414 = isnan(9.9999999747524270787835121154785e-07);
    bool _416 = _412 || _414;
    float _418 = fma(_350, _374, _386);
    float _420 = in.m_55.x;
    float _422 = _362 * _392;
    float _424 = fma(_364, _374, _388);
    float _426 = in.m_57.z;
    float _428 = _362 * _394;
    float _430 = in.m_55.z;
    float _432 = _362 * _398;
    float _434 = _392 * _392;
    float _436 = fma(_370, _400, _422);
    float _438 = fma(_394, _394, _434);
    float _440 = fma(_370, _402, _432);
    float _442 = fma(_398, _398, _438);
    float _444 = fma(_378, _404, _436);
    float _446 = fma(_370, _420, _428);
    float _448 = _106 * _380;
    float _450 = fma(_378, _426, _440);
    float _452 = _440;
    float _454 = _450;
    float _456 = _450;
    float _458 = _448;
    if (_416)
    {
        _452 = _444;
    }
    float _460 = _452;
    float _462 = fma(_378, _430, _446);
    float _464 = _462;
    float _466 = _460;
    float _468 = _460;
    float _470 = _462;
    if (!_416)
    {
        bool _472 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _474 = !_472;
        if (!_474)
        {
            float _476 = _392 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _478 = _394 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _480 = _398 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _482 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[16].x, _476);
            float _484 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[16].x, _478);
            float _486 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[16].x, _480);
            float _488 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[16].z, _482);
            float _490 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[16].z, _484);
            float _492 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[16].z, _486);
            float _494 = _488 * _488;
            float _496 = fma(_490, _490, _494);
            float _498 = fma(_492, _492, _496);
            float _500 = rsqrt(_498);
            float _502 = _500 * 9.9999999747524270787835121154785e-07;
            float _504 = _490 * _502;
            float _506 = _488 * _502;
            float _508 = _492 * _502;
            _468 = _506;
            _470 = _504;
            _456 = _508;
            _510 = true;
        }
        else
        {
            float _512 = _156 * _156;
            float _514 = fma(_154, _154, _512);
            float _516 = fma(_158, _158, _514);
            float _518 = sqrt(_516);
            bool _520 = _518 >= 9.9999999747524270787835121154785e-07;
            bool _522 = isnan(_518);
            bool _524 = _520 || _522;
            bool _526 = isnan(9.9999999747524270787835121154785e-07);
            bool _528 = _524 || _526;
            if (!_528)
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
                float _548 = _442;
                if (!_546)
                {
                    float _550 = rsqrt(_442);
                    _548 = _550;
                }
                float _552 = _548;
                if (!_546)
                {
                    float _554 = _552 * 9.9999999747524270787835121154785e-07;
                    _454 = _554;
                }
                float _556 = _454;
                float _558 = _556;
                if (!_546)
                {
                    float _560 = _394 * _556;
                    _464 = _560;
                }
                float _562 = _464;
                _470 = _562;
                if (!_546)
                {
                    float _564 = _392 * _556;
                    _466 = _564;
                }
                float _566 = _466;
                _468 = _566;
                if (!_546)
                {
                    float _568 = _398 * _556;
                    _558 = _568;
                }
                float _570 = _558;
                bool _572 = !_546;
                _456 = _570;
                _510 = _572;
                if (!_510)
                {
                    float _574 = _392 * _386;
                    float _576 = _394 * _386;
                    float _578 = _398 * _386;
                    float _580 = fma(_384, _400, _574);
                    float _582 = fma(_384, _420, _576);
                    float _584 = fma(_384, _402, _578);
                    float _586 = fma(_388, _404, _580);
                    float _588 = fma(_388, _430, _582);
                    float _590 = fma(_388, _426, _584);
                    float _592 = _586 * _586;
                    float _594 = fma(_588, _588, _592);
                    float _596 = fma(_590, _590, _594);
                    float _598 = rsqrt(_596);
                    float _600 = _598 * 9.9999999747524270787835121154785e-07;
                    float _602 = _588 * _600;
                    float _604 = _586 * _600;
                    float _606 = _590 * _600;
                    _468 = _604;
                    _470 = _602;
                    _456 = _606;
                    _510 = true;
                }
            }
            else
            {
                float _608 = _392 * _156;
                float _610 = _394 * _156;
                float _612 = _398 * _156;
                float _614 = fma(_154, _400, _608);
                float _616 = fma(_154, _420, _610);
                float _618 = fma(_154, _402, _612);
                float _620 = fma(_158, _404, _614);
                float _622 = fma(_158, _430, _616);
                float _624 = fma(_158, _426, _618);
                float _626 = _620 * _620;
                float _628 = fma(_622, _622, _626);
                float _630 = fma(_624, _624, _628);
                float _632 = rsqrt(_630);
                float _634 = _632 * 9.9999999747524270787835121154785e-07;
                float _636 = _622 * _634;
                float _638 = _620 * _634;
                float _640 = _624 * _634;
                _468 = _638;
                _470 = _636;
                _456 = _640;
            }
        }
    }
    _510 = false;
    float _642 = _468;
    float _644 = _470;
    float _646 = _456;
    bool _648 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    bool _650 = !_648;
    float _668;
    if (!_650)
    {
        float _652 = in.m_59.x;
        float _654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _656 = _652 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[11].w, _106);
        float _660 = _658 * _654;
        float _662 = floor(_660);
        float _664 = -_662;
        float _666 = _660 + _664;
        _668 = _666;
        _670 = true;
    }
    else
    {
        _668 = _448;
    }
    _670 = false;
    float _672 = _668;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _676 = _672 + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _682 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _684 = isnan(_672);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _702 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _704 = isnan(_672);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _710 = _706 || _708;
    float _712 = float(_710);
    float _714 = 1.0 / _680;
    float _716 = -_692;
    float _718 = _716 + 1.0;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _720;
    bool _724 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _726 = isnan(_672);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = _712 * _718;
    float _738 = -_712;
    float _740 = _738 + 1.0;
    bool _742 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _744 = 1.0 / _696;
    float _746 = _734 * _740;
    float _748 = -_734;
    float _750 = _748 + 1.0;
    float _752 = 1.0 / _700;
    float _754 = _722 * _714;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _760 = fma(_754, _676, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _762 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _764 = isnan(_672);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    float _774 = _758 * _744;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _776;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _782 = _672 + _780;
    float _784 = _760 * _746;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _788 = _672 + _786;
    float _790 = fma(_774, _782, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _792 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[131].x, _784);
    float _794 = _778 * _752;
    float _796 = -_772;
    float _798 = _796 + 1.0;
    float _800 = fma(_790, _736, _792);
    float _802 = fma(_794, _788, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _804 = _692 * _798;
    float _806 = fma(_802, _804, _800);
    float _808 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[134].x, _806);
    float _810 = _808 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _812 = !_742;
    if (!_812)
    {
        float _814 = in.m_59.x;
        float _816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _818 = _814 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _820 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[14].x, _106);
        float _822 = _820 * _816;
        float _824 = floor(_822);
        float _826 = -_824;
        float _828 = _822 + _826;
        _458 = _828;
    }
    float _830 = _458;
    float _832 = in.m_59.w;
    float _834 = _418 * _394;
    float _836 = in.m_51.x;
    float _838 = in.m_51.y;
    float _840 = in.m_51.z;
    float _842 = _418 * _392;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _844;
    float _848 = _418 * _398;
    float _850 = fma(_406, _420, _834);
    float _852 = fma(_406, _400, _842);
    float _854 = 1.0 / _846;
    float _856 = fma(_406, _402, _848);
    float _858 = fma(_424, _430, _850);
    float _860 = fma(_424, _404, _852);
    float _862 = fma(_424, _426, _856);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _868 = in.m_53.w;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _870;
    float _874 = 1.0 / _866;
    float _876 = in.m_55.w;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _880 = _830 + _878;
    float _882 = 30.0 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    bool _884 = _832 > 0.5;
    float _886 = in.m_61.x;
    float _888 = in.m_61.y;
    float _890 = in.m_61.z;
    float _892 = _840 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _894 = _836 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _898 = _896 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _900 = _838 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _902 = 1.0 / _872;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _904;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _912 = 30.0 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _914;
    float _918 = 1.0 / _898;
    float _920 = fma(300.0, (*spvDescriptorSet0.vp_c10)._m0[10].y, _912);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _924 = _830 + _922;
    bool _926 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _928 = isnan(_830);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = _920 + (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _940 = (*spvDescriptorSet0.vp_c10)._m0[9].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _942 = 1.0 / _906;
    float _944 = 30.0 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _948 = _830 + _946;
    float _950 = fma((*spvDescriptorSet0.vp_c10)._m0[8].y, (*spvDescriptorSet0.vp_c10)._m0[8].y, _940);
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _952;
    float _956 = fma(300.0, (*spvDescriptorSet0.vp_c10)._m0[8].y, _944);
    float _958 = _948 * _902;
    float _960 = _860 + _868;
    float _962 = 1.0 / _910;
    float _964 = fma(300.0, (*spvDescriptorSet0.vp_c10)._m0[9].y, _882);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _968 = _830 + _966;
    float _970 = in.m_57.w;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _974 = _972 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _976;
    float _980 = _968 * _854;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _984 = _830 + _982;
    float _986 = 1.0 / _916;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _990 = _830 + _988;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _996 = _984 * _918;
    float _998 = _990 * _874;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1002 = _830 + _1000;
    float _1004 = _880 * _962;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1006;
    float _1010 = _1002 * _942;
    bool _1012 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1014 = isnan(_830);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1020 = _1016 || _1018;
    float _1022 = float(_1020);
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1024;
    float _1028 = _858 + _876;
    float _1030 = fma((*spvDescriptorSet0.vp_c10)._m0[10].y, (*spvDescriptorSet0.vp_c10)._m0[10].y, _950);
    float _1032 = fma(_1008, _980, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1034 = fma(_1026, _980, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1036 = _862 + _970;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1038;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1046;
    bool _1050 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1052 = isnan(_830);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1058 = _1054 || _1056;
    float _1060 = float(_1058);
    float _1062 = fma(_1040, _980, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1064;
    float _1068 = -_936;
    float _1070 = _1068 + 1.0;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1074 = _1072 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1080 = -_1022;
    float _1082 = _1080 + 1.0;
    float _1084 = _1022 * _1070;
    float _1086 = fma(_1074, _996, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1088 = fma(_974, _996, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1090 = fma(_1078, _996, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1092 = _1060 * _1082;
    float _1094 = -_1060;
    float _1096 = _1094 + 1.0;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1098;
    float _1102 = in.m_59.x;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1106 = _1104 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1114 = _1112 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1116 = _924 * _986;
    float _1118 = fma(_1106, _1004, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1120 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1122 = isnan(_830);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1128 = _1124 || _1126;
    float _1130 = float(_1128);
    float _1132 = fma(_994, _1004, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1134 = _642 * _642;
    float _1136 = fma(_1114, _1004, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    bool _1138 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1140 = isnan(_830);
    bool _1142 = _1138 || _1140;
    bool _1144 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1146 = _1142 || _1144;
    float _1148 = float(_1146);
    float _1150 = _1130 * _1096;
    float _1152 = -_1130;
    float _1154 = _1152 + 1.0;
    bool _1156 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1158 = isnan(_830);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1164 = _1160 || _1162;
    float _1166 = float(_1164);
    float _1168 = fma(_644, _644, _1134);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1176 = _1174 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1178 = fma(_1066, _958, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1180 = fma(_954, _958, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1182 = fma(_1048, _958, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    bool _1184 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1186 = isnan(_830);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1192 = _1188 || _1190;
    float _1194 = float(_1192);
    float _1196 = _1148 * _1154;
    float _1198 = -_1148;
    float _1200 = _1198 + 1.0;
    bool _1202 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1204 = isnan(_830);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1210 = _1206 || _1208;
    float _1212 = float(_1210);
    float _1214 = fma(_646, _646, _1168);
    float _1216 = fma(_1172, _998, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1218 = fma(_1044, _998, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1220 = fma(_1176, _998, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1222 = -_1166;
    float _1224 = _1222 + 1.0;
    float _1226 = fma(_1100, _1010, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1228 = fma(_978, _1010, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1230 = fma(_1110, _1010, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1232 = _1212 * _1224;
    float _1234 = -_1212;
    float _1236 = _1234 + 1.0;
    float _1238 = _1166 * _1200;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1240;
    float _1244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _886);
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1246;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1252 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1250;
    float _1254 = fma(_106, 0.02999999932944774627685546875, -0.119999997317790985107421875);
    float _1256 = _1102 * 6.283185482025146484375;
    float _1258 = fma(_1248, _1116, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1260 = _1194 * _1236;
    float _1262 = rsqrt(_1214);
    float _1264 = _1256 + _1254;
    float _1266 = -_1194;
    float _1268 = _1266 + 1.0;
    float _1270 = _964 + (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1272 = fma(_1242, _1116, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1274 = _1032 * _1260;
    float _1276 = _1062 * _1260;
    float _1278 = _956 + (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1280 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1282 = _960 + _1280;
    float _1284 = _1264 * (-0.15915493667125701904296875);
    float _1286 = _1034 * _1260;
    float _1288 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1290 = _960 + _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1294 = _1028 + _1292;
    float _1296 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1298 = _1028 + _1296;
    float _1300 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1286);
    float _1302 = _1290 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1304 = _1290 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1306 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1274);
    float _1308 = fma(_1216, _1232, _1300);
    float _1310 = _1270 * _1270;
    float _1312 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1276);
    float _1314 = fma(_1218, _1232, _1306);
    float _1316 = _1282 * _1282;
    float _1318 = fma(_1278, _1278, _1310);
    float _1320 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1322 = _1036 + _1320;
    float _1324 = _1262 * _644;
    float _1326 = fma(_1294, _1294, _1316);
    float _1328 = fma(_938, _938, _1318);
    float _1330 = _1262 * _642;
    float _1332 = _1262 * _646;
    float _1334 = fma(_1298, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1302);
    float _1336 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1338 = _1036 + _1336;
    float _1340 = fma(_1298, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1304);
    float _1342 = rsqrt(_1328);
    float _1344 = fma(_1322, _1322, _1326);
    float _1346 = fma(_1338, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1334);
    float _1348 = fma(_1338, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1340);
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1352 = _1332 * _1350;
    float _1354 = fma(_1220, _1232, _1312);
    float _1356 = fma(_1180, _1238, _1314);
    float _1358 = fma(_1178, _1238, _1308);
    float _1360 = rsqrt(_1344);
    float _1362 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1364 = -_1352;
    float _1366 = fma(_1324, _1362, _1364);
    float _1368 = fma(_1182, _1238, _1354);
    float _1370 = fma(_1088, _1196, _1356);
    float _1372 = fma(_1252, _1116, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1374 = _892 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1376 = fma(_1090, _1196, _1368);
    float _1378 = _900 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1380 = _1270 * _1342;
    float _1382 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1384 = _1330 * _1382;
    float _1386 = _1278 * _1342;
    float _1388 = _938 * _1342;
    float _1390 = fma(_1086, _1196, _1358);
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1394 = -_1384;
    float _1396 = fma(_1332, _1392, _1394);
    float _1398 = _1366 * _1366;
    float _1400 = abs(_1346);
    float _1402 = abs(_1348);
    float _1404 = precise::max(_1400, _1402);
    float _1406 = _1282 * _1360;
    float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1410 = _1324 * _1408;
    float _1412 = fma(_1396, _1396, _1398);
    float _1414 = _1294 * _1360;
    float _1416 = -_1406;
    float _1418 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1282);
    bool _1420 = _1404 >= 16.0;
    float _1422 = fma(_1226, _1150, _1390);
    float _1424 = -_1414;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1294);
    float _1428 = _1418 * _1418;
    float _1430 = in.m_63.y;
    float _1432 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1434 = -_1410;
    float _1436 = fma(_1330, _1432, _1434);
    float _1438 = fma(_1230, _1150, _1376);
    float _1440 = fma(_1426, _1426, _1428);
    float _1442 = fma(_1228, _1150, _1370);
    float _1444 = fma(_1436, _1436, _1412);
    float _1446 = in.m_59.z;
    float _1448 = _1322 * _1360;
    float _1450 = fma(_1132, _1092, _1442);
    float _1452 = _1346;
    float _1454 = _1348;
    float _1456 = _1414;
    float _1458 = _1448;
    if (_1420)
    {
        float _1460 = _1346 * 0.0625;
        _1452 = _1460;
    }
    float _1462 = _1452;
    float _1464 = in.m_59.y;
    float _1466 = -_1448;
    float _1468 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1322);
    float _1470 = rsqrt(_1444);
    float _1472 = fma(_1136, _1092, _1438);
    float _1474 = in.m_65.x;
    float _1476 = fma(_1468, _1468, _1440);
    float _1478 = fma(_1118, _1092, _1422);
    float _1480 = fma(_1272, _1084, _1450);
    if (_1420)
    {
        float _1482 = _1348 * 0.0625;
        _1454 = _1482;
    }
    float _1484 = _1454;
    float _1486 = abs(_1462);
    bool _1488 = _1486 != 0.0;
    bool _1490 = isnan(_1486);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan(0.0);
    bool _1496 = _1492 || _1494;
    float _1498 = fma(_1258, _1084, _1478);
    float _1500 = rsqrt(_1030);
    float _1502 = fma(_1372, _1084, _1472);
    float _1504 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1480);
    float _1506 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1498);
    float _1508 = -_1430;
    float _1510 = _1508 + 1.0;
    float _1512 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1502);
    float _1514 = abs(_1484);
    bool _1516 = _1514 == 0.0;
    bool _1518 = !_1496;
    bool _1520 = _1516 && _1518;
    float _1522 = _1284 * 6.283185482025146484375;
    float _1524 = cos(_1522);
    bool _1526 = _1446 > 0.5;
    float _1528 = _1504 * (-100.0);
    int _1530 = _884 ? as_type<int>(_1510) : as_type<int>(_1430);
    float _1532 = _1366 * _1470;
    bool _1534 = _1464 > 0.5;
    float _1536 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _888);
    float _1538 = sqrt(_1476);
    float _1540 = -_1474;
    float _1542 = _1540 + 1.0;
    int _1544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1546 = _1544 != 0;
    int _1548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1550 = _1548 != 0;
    int _1552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1554 = _1552 != 0;
    float _1556 = _1500 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1558 = _1500 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1560 = fma(_1528, _1542, _106);
    float _1562 = _1500 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1564 = _1550 ? as_type<float>(_1530) : _1430;
    float _1566 = _1284 * 6.283185482025146484375;
    float _1568 = sin(_1566);
    float _1570 = abs(_1484);
    bool _1572 = _1570 == 0.0;
    float _1574 = -_1524;
    float _1576 = _1574 + 1.0;
    float _1578 = _1558 * _1558;
    float _1580 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _890);
    float _1582 = _1396 * _1470;
    float _1584 = _1562 * _1576;
    float _1586 = _1436 * _1470;
    float _1588 = _1360 * _1538;
    int _1590 = _1534 ? as_type<int>(_1510) : as_type<int>(_1430);
    float _1592 = _1556 * _1576;
    float _1594 = _894 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1596 = _1526 ? _1510 : _1430;
    float _1598 = _1374 * _1588;
    float _1600 = _1546 ? as_type<float>(_1590) : _1430;
    float _1602 = fma(_1556, _1592, _1524);
    float _1604 = _1558 * _1568;
    float _1606 = _1562 * _1568;
    bool _1608 = _1546;
    int _1610 = as_type<int>(_1504);
    int _1612 = _1496 ? (-1) : 0;
    bool _1614 = _1572;
    float _1616 = _1558;
    float _1618 = _1596;
    if (_1520)
    {
        bool _1620 = as_type<int>(_1484) >= 0;
        _1608 = _1620;
    }
    bool _1622 = _1608;
    float _1624 = _1556 * _1568;
    float _1626 = fma(_1562, _1592, _1604);
    float _1628 = -_1604;
    float _1630 = fma(_1562, _1592, _1628);
    float _1632 = -_1606;
    float _1634 = fma(_1558, _1592, _1632);
    float _1636 = fma(_1558, _1592, _1606);
    if (_1520)
    {
        int _1638 = _1622 ? 0 : 1078530011;
        _1610 = _1638;
    }
    int _1640 = _1610;
    float _1642 = fma(_1558, _1584, _1624);
    float _1644 = -_1624;
    float _1646 = fma(_1558, _1584, _1644);
    float _1648 = fma(_1562, _1584, _1524);
    float _1650 = fma(_1576, _1578, _1524);
    float _1652 = _1594 * _1588;
    float _1654 = _1378 * _1588;
    float _1656 = _1554 ? _1596 : _1430;
    int _1658 = _1640;
    if (_1520)
    {
        int _1660 = int(0x80000000) & as_type<int>(_1462);
        int _1662 = _1640 | _1660;
        _1658 = _1662;
    }
    int _1664 = _1658;
    bool _1666 = !_1496;
    bool _1668 = _1666 && _1572;
    int _1670 = _1664;
    float _1672 = as_type<float>(_1664);
    if (!_1668)
    {
        float _1674 = abs(_1462);
        bool _1676 = _1674 != as_type<float>(0x7f800000u /* inf */);
        bool _1678 = isnan(_1674);
        bool _1680 = _1676 || _1678;
        bool _1682 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1684 = _1680 || _1682;
        float _1686 = abs(_1484);
        bool _1688 = _1686 == as_type<float>(0x7f800000u /* inf */);
        float _1690 = abs(_1484);
        bool _1692 = _1690 == as_type<float>(0x7f800000u /* inf */);
        bool _1694 = !_1684;
        bool _1696 = _1692 && _1694;
        _1614 = _1684;
        if (_1696)
        {
            bool _1698 = as_type<int>(_1484) >= 0;
            _1612 = _1698 ? (-1) : 0;
        }
        int _1700 = _1612;
        if (_1696)
        {
            _1670 = 1075235812;
        }
        int _1702 = _1670;
        int _1704 = _1702;
        if (_1696)
        {
            int _1706 = ~_1700;
            int _1708 = (_1706 != 0) ? _1702 : 1061752795;
            _1704 = _1708;
        }
        int _1710 = _1704;
        float _1712 = as_type<float>(_1710);
        if (_1696)
        {
            int _1714 = int(0x80000000) & as_type<int>(_1462);
            int _1716 = _1710 | _1714;
            _1712 = as_type<float>(_1716);
        }
        float _1718 = _1712;
        bool _1720 = !_1684;
        bool _1722 = _1720 && _1688;
        _1672 = _1718;
        if (!_1722)
        {
            float _1724 = abs(_1462);
            float _1726 = abs(_1484);
            float _1728 = precise::max(_1724, _1726);
            float _1730 = abs(_1462);
            float _1732 = abs(_1484);
            float _1734 = precise::min(_1730, _1732);
            float _1736 = 1.0 / _1728;
            float _1738 = abs(_1462);
            float _1740 = abs(_1484);
            bool _1742 = _1738 > _1740;
            bool _1744 = as_type<int>(_1484) >= 0;
            float _1746 = abs(_1462);
            float _1748 = abs(_1484);
            float _1750 = _1746 + _1748;
            int _1752 = as_type<int>(_1462) & int(0x80000000);
            bool _1754 = _1750 > as_type<float>(0x7f800000u /* inf */);
            bool _1756 = isnan(_1750);
            bool _1758 = _1754 || _1756;
            bool _1760 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1762 = _1758 || _1760;
            float _1764 = _1734 * _1736;
            float _1766 = _1764 * _1764;
            float _1768 = _1766 + 11.33538818359375;
            float _1770 = fma(_1766, _1768, 28.84246826171875);
            float _1772 = fma(_1766, _1770, 19.6966705322265625);
            float _1774 = fma(_1766, -0.82336294651031494140625, -5.674867153167724609375);
            float _1776 = fma(_1766, _1774, -6.565555095672607421875);
            float _1778 = 1.0 / _1772;
            float _1780 = _1766 * _1776;
            float _1782 = _1764 * _1780;
            float _1784 = fma(_1782, _1778, _1764);
            float _1786 = _1784;
            _1672 = _1750;
            _1614 = _1762;
            if (_1742)
            {
                float _1788 = -_1784;
                float _1790 = _1788 + 1.57079637050628662109375;
                _1786 = _1790;
            }
            float _1792 = _1786;
            int _1794 = as_type<int>(_1792);
            if (!_1744)
            {
                float _1796 = -_1792;
                float _1798 = _1796 + 3.1415927410125732421875;
                _1794 = as_type<int>(_1798);
            }
            int _1800 = _1794;
            if (!_1762)
            {
                int _1802 = _1752 | _1800;
                _1672 = as_type<float>(_1802);
            }
        }
    }
    float _1804 = _1672;
    bool _1806 = _1614;
    float _1808 = _1652 * _1244;
    float _1810 = _106 + (-4.0);
    float _1812 = _1654 * _1536;
    float _1814 = _1598 * _1580;
    float _1816 = fma(_1810, 0.01333333365619182586669921875, -1.0);
    float _1818 = _1560 * (-0.02300000004470348358154296875);
    float _1820 = _1330 * _1586;
    float _1822 = fma(_1560, 0.01333333365619182586669921875, -1.0);
    float _1824 = _1816 * _1816;
    float _1826 = _1818 * 0.15915493667125701904296875;
    float _1828 = fma(_1560, 0.02999999932944774627685546875, _1256);
    float _1830 = _1332 * _1582;
    float _1832 = _1822 * _1822;
    float _1834 = _1828 * 0.15915493667125701904296875;
    float _1836 = _1826 * 6.283185482025146484375;
    float _1838 = sin(_1836);
    float _1840 = -_1820;
    float _1842 = fma(_1332, _1532, _1840);
    float _1844 = -_1830;
    float _1846 = fma(_1324, _1586, _1844);
    float _1848 = _1812 * _1330;
    float _1850 = _1812 * _1324;
    float _1852 = _1812 * _1332;
    float _1854 = fma(_1824, 0.300000011920928955078125, 0.699999988079071044921875);
    float _1856 = precise::clamp(_1854, 0.0, 1.0);
    float _1858 = fma(_1832, 0.300000011920928955078125, 0.699999988079071044921875);
    float _1860 = precise::clamp(_1858, 0.0, 1.0);
    float _1862 = _1834 * 6.283185482025146484375;
    float _1864 = cos(_1862);
    float _1866 = _1324 * _1532;
    float _1868 = -_1804;
    float _1870 = _1254 + _1868;
    float _1872 = _1474 * _1474;
    float _1874 = -_1804;
    float _1876 = fma(_1560, 0.02999999932944774627685546875, _1874);
    float _1878 = fma(_1560, 1.5, -50.0);
    float _1880 = -_1866;
    float _1882 = fma(_1330, _1582, _1880);
    float _1884 = _1834 * 6.283185482025146484375;
    float _1886 = sin(_1884);
    float _1888 = fma(_1838, 0.1500000059604644775390625, 1.0);
    float _1890 = fma(_1810, 1.5, -50.0);
    float _1892 = _1870 * 0.15915493667125701904296875;
    float _1894 = fma(_1808, _1532, _1848);
    float _1896 = fma(_1872, -0.980000019073486328125, 1.0);
    float _1898 = fma(_1808, _1582, _1850);
    float _1900 = fma(_1808, _1586, _1852);
    float _1902 = -_1864;
    float _1904 = _1902 + 1.0;
    float _1906 = _960 + _964;
    float _1908 = _1860 * 50.0;
    float _1910 = _1892 * 6.283185482025146484375;
    float _1912 = cos(_1910);
    float _1914 = _1388 * _1388;
    float _1916 = _1386 * _1904;
    float _1918 = _1380 * _1904;
    float _1920 = fma(_1908, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1906);
    float _1922 = _1388 * _1886;
    float _1924 = fma(_1814, _1842, _1898);
    float _1926 = fma(_1904, _1914, _1864);
    float _1928 = _1892 * 6.283185482025146484375;
    float _1930 = sin(_1928);
    float _1932 = _1386 * _1886;
    float _1934 = _1380 * _1886;
    float _1936 = fma(_1380, _1916, _1922);
    float _1938 = -_1922;
    float _1940 = fma(_1380, _1916, _1938);
    float _1942 = fma(_1380, _1918, _1864);
    float _1944 = fma(_1878, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1920);
    float _1946 = fma(_1386, _1916, _1864);
    float _1948 = fma(_1388, _1918, _1932);
    float _1950 = -_1932;
    float _1952 = fma(_1388, _1918, _1950);
    float _1954 = _1028 + _956;
    float _1956 = -_960;
    float _1958 = _1956 + _1944;
    float _1960 = -_1934;
    float _1962 = fma(_1388, _1916, _1960);
    float _1964 = fma(_1388, _1916, _1934);
    float _1966 = fma(_1908, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1954);
    float _1968 = _1940 * _1958;
    float _1970 = _1942 * _1958;
    float _1972 = _1948 * _1958;
    float _1974 = -_1912;
    float _1976 = _1974 + 1.0;
    float _1978 = fma(_1878, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1966);
    float _1980 = _1558 * _1930;
    float _1982 = _1556 * _1930;
    float _1984 = _1556 * _1976;
    float _1986 = _1562 * _1930;
    float _1988 = _1562 * _1976;
    float _1990 = -_1028;
    float _1992 = _1990 + _1978;
    float _1994 = fma(_1562, _1984, _1980);
    float _1996 = -_1980;
    float _1998 = fma(_1562, _1984, _1996);
    float _2000 = -_1986;
    float _2002 = fma(_1558, _1984, _2000);
    float _2004 = fma(_1558, _1984, _1986);
    float _2006 = _1856 * 50.0;
    float _2008 = fma(_1578, _1976, _1912);
    float _2010 = fma(_1556, _1984, _1912);
    float _2012 = fma(_1562, _1988, _1912);
    float _2014 = fma(_1558, _1988, _1982);
    float _2016 = -_1982;
    float _2018 = fma(_1558, _1988, _2016);
    float _2020 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1906);
    float _2022 = in.m_65.w;
    float _2024 = fma(_1936, _1992, _1970);
    float _2026 = _1036 + _920;
    float _2028 = fma(_1962, _1992, _1972);
    float _2030 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1954);
    float _2032 = fma(_1890, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2020);
    float _2034 = fma(_1908, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2026);
    float _2036 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2026);
    float _2038 = fma(_1890, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2030);
    float _2040 = -_1906;
    float _2042 = _2040 + _2032;
    float _2044 = fma(_1946, _1992, _1968);
    float _2046 = fma(_1878, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2034);
    float _2048 = -_1954;
    float _2050 = _2048 + _2038;
    float _2052 = fma(_1890, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2036);
    float _2054 = _2012 * _2042;
    float _2056 = -_1036;
    float _2058 = _2056 + _2046;
    float _2060 = _1998 * _2042;
    float _2062 = -_2026;
    float _2064 = _2062 + _2052;
    float _2066 = fma(_1994, _2050, _2054);
    float _2068 = fma(_1964, _2058, _2044);
    float _2070 = fma(_1952, _2058, _2024);
    float _2072 = fma(_2010, _2050, _2060);
    float _2074 = fma(_2018, _2064, _2066);
    float _2076 = _2014 * _2042;
    float _2078 = -_2022;
    float _2080 = _2078 + 1.0;
    float _2082 = fma(_2004, _2064, _2072);
    float _2084 = _1906 + _2074;
    float _2086 = fma(_2002, _2050, _2076);
    float _2088 = _960 + _2070;
    float _2090 = _1954 + _2082;
    float _2092 = _2084 * _2080;
    float _2094 = fma(_2008, _2064, _2086);
    float _2096 = _1028 + _2068;
    float _2098 = _2090 * _2080;
    float _2100 = fma(_2088, _2022, _2092);
    float _2102 = fma(_1926, _2058, _2028);
    float _2104 = _2026 + _2094;
    float _2106 = fma(_2096, _2022, _2098);
    float _2108 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2110 = _2100 + _2108;
    float _2112 = _1036 + _2102;
    float _2114 = _2104 * _2080;
    float _2116 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2118 = _2106 + _2116;
    float _2120 = _2110 * _2110;
    float _2122 = fma(_1814, _1846, _1894);
    float _2124 = fma(_2112, _2022, _2114);
    float _2126 = fma(_1814, _1882, _1900);
    float _2128 = fma(_2118, _2118, _2120);
    float _2130 = fma(_1506, _2122, _960);
    float _2132 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2134 = _2124 + _2132;
    float _2136 = fma(_1506, _1924, _1028);
    float _2138 = _1896 * _1888;
    float _2140 = -_960;
    float _2142 = _2140 + _2130;
    float _2144 = fma(_2134, _2134, _2128);
    float _2146 = -_1028;
    float _2148 = _2146 + _2136;
    float _2150 = fma(_1506, _2126, _1036);
    float _2152 = _1630 * _2142;
    float _2154 = _1648 * _2142;
    float _2156 = _1642 * _2142;
    float _2158 = sqrt(_2144);
    float _2160 = fma(_1602, _2148, _2152);
    float _2162 = -_1036;
    float _2164 = _2162 + _2150;
    float _2166 = fma(_1626, _2148, _2154);
    float _2168 = fma(_1634, _2148, _2156);
    float _2170 = _1876 * 0.15915493667125701904296875;
    float _2172 = fma(_1636, _2164, _2160);
    float _2174 = fma(_1646, _2164, _2166);
    float _2176 = fma(_1650, _2164, _2168);
    float _2178 = _1954 + _2172;
    float _2180 = _1906 + _2174;
    float _2182 = _2026 + _2176;
    float _2184 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2178);
    float _2186 = fma(_2158, 0.006666666828095912933349609375, -0.666666686534881591796875);
    float _2188 = precise::clamp(_2186, 0.0, 1.0);
    float _2190 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2180);
    float _2192 = _1512 * _2138;
    float _2194 = fma(_1890, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2184);
    float _2196 = fma(_2188, -2.0, 3.0);
    float _2198 = _2188 * _2188;
    float _2200 = fma(_1890, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2190);
    float _2202 = _2170 * 6.283185482025146484375;
    float _2204 = cos(_2202);
    float _2206 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2182);
    float _2208 = _2196 * _2198;
    float _2210 = -_1906;
    float _2212 = _2210 + _2200;
    float _2214 = fma(_2208, 0.800000011920928955078125, 0.20000000298023223876953125);
    float _2216 = -_1954;
    float _2218 = _2216 + _2194;
    float _2220 = _2014 * _2212;
    float _2222 = _2170 * 6.283185482025146484375;
    float _2224 = sin(_2222);
    float _2226 = _2192 * _2214;
    float _2228 = fma(_1890, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2206);
    float _2230 = _1998 * _2212;
    float _2232 = fma(_2002, _2218, _2220);
    float _2234 = fma(_1924, _2226, _1028);
    float _2236 = fma(_2122, _2226, _960);
    float _2238 = fma(_2126, _2226, _1036);
    float _2240 = -_2204;
    float _2242 = _2240 + 1.0;
    float _2244 = _956 + _2234;
    float _2246 = _964 + _2236;
    float _2248 = _920 + _2238;
    float _2250 = fma(_1578, _2242, _2204);
    float _2252 = fma(_1908, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2244);
    float _2254 = fma(_1908, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2246);
    float _2256 = fma(_1908, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2248);
    float _2258 = _1556 * _2224;
    float _2260 = fma(_1878, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2252);
    float _2262 = fma(_1878, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2254);
    float _2264 = _1562 * _2242;
    float _2266 = fma(_1878, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2256);
    float _2268 = _1558 * _2224;
    float _2270 = _1556 * _2242;
    float _2272 = _1562 * _2224;
    float _2274 = fma(_1558, _2264, _2258);
    float _2276 = -_1906;
    float _2278 = _2276 + _2262;
    float _2280 = -_1954;
    float _2282 = _2280 + _2260;
    float _2284 = -_2272;
    float _2286 = fma(_1558, _2270, _2284);
    float _2288 = -_2268;
    float _2290 = fma(_1562, _2270, _2288);
    float _2292 = _2274 * _2278;
    float _2294 = -_2026;
    float _2296 = _2294 + _2228;
    float _2298 = -_2026;
    float _2300 = _2298 + _2266;
    float _2302 = fma(_2010, _2218, _2230);
    float _2304 = fma(_2286, _2282, _2292);
    float _2306 = fma(_1556, _2270, _2204);
    float _2308 = _2290 * _2278;
    float _2310 = fma(_2008, _2296, _2232);
    float _2312 = fma(_2250, _2300, _2304);
    float _2314 = fma(_1558, _2270, _2272);
    float _2316 = fma(_2306, _2282, _2308);
    float _2318 = fma(_2004, _2296, _2302);
    float _2320 = _2026 + _2310;
    float _2322 = _2026 + _2312;
    float _2324 = fma(_2314, _2300, _2316);
    float _2326 = _1954 + _2318;
    float _2328 = _2080 * _2320;
    float _2330 = _2012 * _2212;
    float _2332 = _1954 + _2324;
    float _2334 = _2080 * _2326;
    float _2336 = fma(_2322, _2022, _2328);
    float _2338 = fma(_1562, _2264, _2204);
    float _2340 = fma(_1562, _2270, _2268);
    float _2342 = fma(_2332, _2022, _2334);
    float _2344 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2346 = _2336 + _2344;
    float _2348 = fma(_1994, _2218, _2330);
    float _2350 = _2338 * _2278;
    float _2352 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2354 = _2342 + _2352;
    float _2356 = _2346 * _2346;
    float _2358 = -_2258;
    float _2360 = fma(_1558, _2264, _2358);
    float _2362 = fma(_2018, _2296, _2348);
    float _2364 = fma(_2340, _2282, _2350);
    float _2366 = fma(_2354, _2354, _2356);
    float _2368 = _1906 + _2362;
    float _2370 = fma(_2360, _2300, _2364);
    float _2372 = sqrt(_2366);
    float _2374 = _2080 * _2368;
    float _2376 = _1906 + _2370;
    float _2378 = fma(_2376, _2022, _2374);
    bool _2380 = _2372 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2382 = _2368;
    float _2384 = _2282;
    float _2386 = _2360;
    float _2388 = _2354;
    float _2390 = _2270;
    bool _2392 = _1806;
    float _2394 = _1894;
    float _2396 = _2126;
    if (!_2380)
    {
        _2382 = _2342;
    }
    float _2398 = _2382;
    float _2400 = _2398;
    if (!_2380)
    {
        _2384 = _2336;
    }
    float _2402 = _2384;
    float _2404 = _2402;
    if (!_2380)
    {
        _2386 = _2378;
    }
    float _2406 = _2386;
    bool _2408 = !_2380;
    float _2410 = _2406;
    if (!_2408)
    {
        float _2412 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2416 = _2372 + _2414;
        float _2418 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2420 = rsqrt(_2366);
        float _2422 = _2416 * _2412;
        float _2424 = _2422 * 0.15915493667125701904296875;
        float _2426 = _2424 * 6.283185482025146484375;
        float _2428 = cos(_2426);
        float _2430 = _2424 * 6.283185482025146484375;
        float _2432 = sin(_2430);
        float _2434 = _2428 + (-1.0);
        float _2436 = _2434 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2438 = fma(_2432, _2418, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2440 = fma(_2378, _2428, _2436);
        float _2442 = _2420 * _2438;
        float _2444 = fma(_2354, _2442, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2446 = fma(_2346, _2442, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2410 = _2440;
        _2400 = _2444;
        _2404 = _2446;
    }
    float _2448 = _2410;
    float _2450 = _2400;
    float _2452 = _2404;
    float _2454 = -_1406;
    float _2456 = fma(_2454, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2448);
    float _2458 = -_1414;
    float _2460 = fma(_2458, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2450);
    float _2462 = -_1448;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2452);
    float _2466 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2468 = _2456 + _2466;
    float _2470 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2472 = _2460 + _2470;
    float _2474 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2476 = _2464 + _2474;
    float _2478 = _2468 * _2468;
    float _2480 = fma(_2472, _2472, _2478);
    float _2482 = fma(_2476, _2476, _2480);
    float _2484 = rsqrt(_2482);
    float _2486 = _2484 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2488 = _2472 * _2486;
    float _2490 = _2476 * _2486;
    float _2492 = _2488 * _2488;
    float _2494 = _2490 * _2490;
    float _2496 = _2492 + _2494;
    float _2498 = sqrt(_2496);
    bool _2500 = _2498 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2504 = _2498 + _2502;
    float _2506 = _2484;
    float _2508 = _2496;
    float _2510 = _2504;
    float _2512 = _2468;
    if (_2500)
    {
        float _2514 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2506 = _2514;
    }
    float _2516 = _2506;
    if (_2500)
    {
        float _2518 = rsqrt(_2496);
        _2508 = _2518;
    }
    float _2520 = _2508;
    float _2522 = _2520;
    if (_2500)
    {
        float _2524 = _2504 * _2516;
        _2510 = _2524;
    }
    float _2526 = _2510;
    if (_2500)
    {
        float _2528 = _2526 * 0.15915493667125701904296875;
        _1616 = _2528;
    }
    float _2530 = _1616;
    float _2532 = _2476;
    if (_2500)
    {
        float _2534 = _2530 * 6.283185482025146484375;
        float _2536 = sin(_2534);
        _2532 = _2536;
    }
    float _2538 = _2532;
    float _2540 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2542 = precise::max(0.0, _2540);
    float _2544 = _2516;
    float _2546 = _2542;
    if (_2500)
    {
        float _2548 = _2530 * 6.283185482025146484375;
        float _2550 = cos(_2548);
        _2544 = _2550;
    }
    float _2552 = _2544;
    float _2554 = -_2486;
    float _2556 = -_2542;
    float _2558 = fma(_2468, _2554, _2556);
    if (_2500)
    {
        float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2512 = _2560;
    }
    float _2562 = _2512;
    float _2564 = sqrt(_2482);
    float _2566 = _2562;
    float _2568 = _2538;
    if (_2500)
    {
        float _2570 = fma(_2538, _2562, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2566 = _2570;
    }
    float _2572 = _2566;
    float _2574 = _2572;
    if (!_2500)
    {
        _2568 = _2488;
    }
    float _2576 = _2568;
    float _2578 = _2576;
    float _2580 = _2552;
    if (_2500)
    {
        float _2582 = _2552 + (-1.0);
        _2546 = _2582;
    }
    float _2584 = _2546;
    float _2586 = _2584;
    if (_2500)
    {
        float _2588 = _2520 * _2572;
        _2388 = _2588;
    }
    float _2590 = _2388;
    if (!_2500)
    {
        _2574 = _2558;
    }
    float _2592 = _2574;
    float _2594 = _2592;
    if (_2500)
    {
        float _2596 = _2584 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2390 = _2596;
    }
    float _2598 = _2390;
    if (_2500)
    {
        float _2600 = _2488 * _2590;
        _2578 = _2600;
    }
    float _2602 = _2578;
    if (!_2500)
    {
        _2586 = _2490;
    }
    float _2604 = _2586;
    float _2606 = _2604;
    if (_2500)
    {
        float _2608 = _2490 * _2590;
        _2606 = _2608;
    }
    float _2610 = _2606;
    if (!_2500)
    {
        _2522 = _2492;
    }
    float _2612 = _2522;
    float _2614 = _2612;
    if (_2500)
    {
        float _2616 = fma(_2558, _2552, _2598);
        _2594 = _2616;
    }
    float _2618 = _2594;
    if (_2500)
    {
        float _2620 = _2602 * _2602;
        _2614 = _2620;
    }
    float _2622 = _2614;
    if (!_2500)
    {
        _2580 = _2494;
    }
    float _2624 = _2580;
    float _2626 = _2624;
    if (_2500)
    {
        float _2628 = _2610 * _2610;
        _2626 = _2628;
    }
    float _2630 = _2626;
    float _2632 = fma(_2618, _2618, _2622);
    float _2634 = _2456 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2636 = _2632 + _2630;
    float _2638 = _2456 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2640 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2642 = fma(_2564, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2640);
    float _2644 = precise::clamp(_2642, 0.0, 1.0);
    float _2646 = _2456 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2648 = rsqrt(_2636);
    float _2650 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2638);
    float _2652 = -_2644;
    float _2654 = _2652 + 1.0;
    float _2656 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2646);
    float _2658 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2660 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2650);
    float _2662 = _2456 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2664 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2656);
    float _2666 = abs(_2654);
    float _2668 = log2(_2666);
    float _2670 = _2660 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2672 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2662);
    float _2674 = _2664 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2676 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2634);
    float _2678 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2680 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2672);
    float _2682 = _2648 * _2602;
    float _2684 = _2648 * _2618;
    float _2686 = _2680 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2688 = _2674 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2690 = _2682 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2692 = -_2678;
    float _2694 = fma(_2692, _2658, 1.0);
    float _2696 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2676);
    float _2698 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2688);
    float _2700 = _2648 * _2610;
    float _2702 = -_2690;
    float _2704 = fma(_2684, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2702);
    float _2706 = _2696 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2708 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2698);
    float _2710 = _2668 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2712 = -_2700;
    float _2714 = fma(_2712, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2704);
    float _2716 = log2(_2694);
    float _2718 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2708);
    float _2720 = _2674 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2722 = fma(_2714, -0.5, 0.5);
    float _2724 = _2674 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2726 = _2684 + 1.0;
    float _2728 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2720);
    float _2730 = exp2(_2710);
    float _2732 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2728);
    float _2734 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2732);
    float _2736 = 1.0 / _2718;
    float _2738 = fma(_2714, 0.5, 0.5);
    float _2740 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2724);
    float _2742 = _2716 * 0.693147182464599609375;
    float _2744 = fma(_2738, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2746 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2740);
    float _2748 = _2742 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2750 = sqrt(_2722);
    float _2752 = -_2684;
    float _2754 = fma(_2730, _2726, _2752);
    float _2756 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2746);
    float _2758 = fma(_2738, _2744, -0.212114393711090087890625);
    float _2760 = fma(_2754, 0.5, 0.5);
    float _2762 = fma(_2738, _2758, 1.570728778839111328125);
    float _2764 = _2734 * _2736;
    float _2766 = _2756 * _2736;
    float _2768 = fma(_2764, 0.5, 0.5);
    float _2770 = fma(_2766, -0.5, 0.5);
    float _2772 = _2750 * 0.636619746685028076171875;
    float3 _7568 = float3(_2768, _2770, _2748);
    float _2774 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7568, float3(0.0), isnan(_7568)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7568, float3(0.0), isnan(_7568)), level(0.0)).x;
    float _2776 = -_2762;
    float _2778 = fma(_2772, _2776, 1.0);
    float3 _7584 = float3(_2768, _2770, _2748);
    float4 _2781 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7584, float3(0.0), isnan(_7584)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7584, float3(0.0), isnan(_7584)), level(0.0)).xyzw;
    float _2783 = _2781.x;
    float _2785 = _2781.y;
    float _2787 = _2781.z;
    float _2789 = _2781.w;
    float2 _7601 = float2(_2778, _2760);
    float3 _2793 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7601, float2(0.0), isnan(_7601)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7601, float2(0.0), isnan(_7601)), level(0.0)).xyz;
    float _2795 = _2793.x;
    float _2797 = _2793.y;
    float _2799 = _2793.z;
    float _2801 = in.m_63.x;
    int _2803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2805 = _2803 != 0;
    float _2807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2809 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    out.m_67.x = _1474;
    int _2811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2813 = _2811 != 0;
    float _2815 = _2674 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2819 = _2817 != 0;
    out.m_69.w = _810;
    float _2821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2823 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2825 = _2813 ? _1596 : _1430;
    float _2827 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2815);
    int _2829 = as_type<int>(_2736);
    float _2831 = _2758;
    float _2833 = _2823;
    if (_2805)
    {
        bool _2835 = _1102 > 0.5;
        _2392 = _2835;
    }
    bool _2837 = _2392;
    float _2839 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2843 = _2841 != 0;
    float _2845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2847 = _2807 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2849 = fma(_2809, -2.0, _2839);
    float _2851 = _2668 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2853 = (*spvDescriptorSet0.vp_c9)._m0[88].z;
    float _2855 = _2849;
    float _2857 = _2801;
    if (_2805)
    {
        float _2859 = -_2801;
        float _2861 = _2859 + 1.0;
        _2829 = as_type<int>(_2861);
    }
    int _2863 = _2829;
    if (!_2805)
    {
        _2831 = _2801;
    }
    float _2865 = _2831;
    float _2867 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2869 = _2865;
    if (!_2819)
    {
        _1618 = _1102;
    }
    float _2871 = _1618;
    float _2873 = fma(_2847, _1600, -0.5);
    float _2875 = _2871;
    float _2877 = _2873;
    if (_2805)
    {
        float _2879 = _2837 ? as_type<float>(_2863) : _2801;
        _2869 = _2879;
    }
    float _2881 = _2869;
    float _2883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2885 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2827);
    int _2887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2889 = _2887 != 0;
    float _2891 = _2845 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2895 = _2893 != 0;
    float _2897 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2899 = fma(_1656, _2891, -0.5);
    int _2901 = as_type<int>(_2891);
    if (!_2819)
    {
        _2394 = _1464;
    }
    float _2903 = _2394;
    float _2905 = -_2897;
    float _2907 = fma(_2823, 2.0, _2905);
    float _2909 = _2821 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2911 = _2903;
    if (!_2819)
    {
        _2833 = _1446;
    }
    float _2913 = _2833;
    float _2915 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2917 = fma(_2909, _1564, -0.5);
    float _2919 = _2913;
    int _2921 = as_type<int>(_2915);
    if (!_2819)
    {
        _1456 = _2913;
    }
    float _2923 = _1456;
    float _2925 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2927 = _2923;
    if (_2819)
    {
        _2919 = _1446;
    }
    float _2929 = _2919;
    float _2931 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2933 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2867);
    if (!_2819)
    {
        _2853 = _2871;
    }
    float _2935 = _2853;
    float _2937 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2925);
    float _2939 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2931);
    float _2941 = _2935;
    if (_2819)
    {
        _2875 = _1102;
    }
    float _2943 = _2875;
    float _2945 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2933);
    float _2947 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2849);
    float _2949 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2915);
    int _2951 = as_type<int>(_2945);
    if (_2895)
    {
        float _2953 = -_2801;
        float _2955 = _2953 + 1.0;
        _2901 = as_type<int>(_2955);
    }
    int _2957 = _2901;
    float _2959 = as_type<float>(_2957);
    if (_2843)
    {
        float _2961 = -_2801;
        float _2963 = _2961 + 1.0;
        _2921 = as_type<int>(_2963);
    }
    int _2965 = _2921;
    float _2967 = -_2947;
    float _2969 = fma(_2945, _2873, _2967);
    float _2971 = as_type<float>(_2965);
    if (_2889)
    {
        float _2973 = -_2801;
        float _2975 = _2973 + 1.0;
        _2951 = as_type<int>(_2975);
    }
    int _2977 = _2951;
    if (!_2819)
    {
        _2855 = _2903;
    }
    float _2979 = _2855;
    float _2981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2983 = _2979;
    if (_2819)
    {
        _2911 = _1464;
    }
    float _2985 = _2911;
    float _2987 = -_106;
    float _2989 = fma(_2987, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2907);
    if (!_2889)
    {
        _2396 = _2801;
    }
    float _2991 = _2396;
    float _2993 = _2825 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2995 = _2991;
    if (!_2895)
    {
        _2877 = _2801;
    }
    float _2997 = _2877;
    float _2999 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2885);
    float _3001 = _2997;
    if (_2889)
    {
        float _3003 = _1526 ? as_type<float>(_2977) : _2801;
        _2995 = _3003;
    }
    float _3005 = _2995;
    out.m_67.w = _2022;
    if (_2895)
    {
        float _3007 = _1534 ? as_type<float>(_2957) : _2801;
        _3001 = _3007;
    }
    float _3009 = _3001;
    out.m_71.x = _2460;
    out.m_71.y = _2456;
    out.m_71.z = _2464;
    float _3011 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3013 = _3011;
    if (_2843)
    {
        float _3015 = _1534 ? as_type<float>(_2965) : _2801;
        _2857 = _3015;
    }
    float _3017 = _2857;
    out.gl_Position.x = _2734;
    out.gl_Position.y = _2756;
    out.gl_Position.z = _2999;
    out.gl_Position.w = _2718;
    if (!_2819)
    {
        _2971 = _2979;
    }
    float _3019 = _2971;
    float _3021 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _3023 = _3017 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _3025 = _3019;
    if (_2819)
    {
        _2983 = _2943;
    }
    float _3027 = _2983;
    if (_2819)
    {
        _2941 = _2929;
    }
    float _3029 = _2941;
    float _3031 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3033 = _3029;
    if (!_2819)
    {
        _1458 = _2923;
    }
    float _3035 = _1458;
    float _3037 = fma(_3027, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3011);
    float _3039 = _3035;
    if (_2819)
    {
        _2927 = _2985;
    }
    float _3041 = _2927;
    float _3043 = fma(_3029, (*spvDescriptorSet0.vp_c9)._m0[84].z, _3021);
    if (_2819)
    {
        _3013 = _2929;
    }
    float _3045 = _3013;
    float _3047 = _3045;
    if (_2819)
    {
        _3033 = _2985;
    }
    float _3049 = _3033;
    float _3051 = fma(_3041, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3031);
    float _3053 = _3049;
    if (_2819)
    {
        _3039 = _2985;
    }
    float _3055 = _3039;
    float _3057 = _2981 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_2819)
    {
        _3047 = _2985;
    }
    float _3059 = _3047;
    float _3061 = fma(_3057, _2881, -0.5);
    if (_2819)
    {
        _3025 = _2943;
    }
    float _3063 = _3025;
    float _3065 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _3067 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    if (_2819)
    {
        _2959 = _2943;
    }
    float _3069 = _2959;
    float _3071 = _3063 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3073 = _3069;
    if (!_2819)
    {
        _3073 = _2929;
    }
    float _3075 = _3073;
    float _3077 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[84].x, _3043);
    float _3079 = _2883 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3081 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3083 = fma(_3059, (*spvDescriptorSet0.vp_c9)._m0[89].z, _3067);
    float _3085 = _3077 * (-0.15915493667125701904296875);
    float _3087 = fma(_3079, _3005, -0.5);
    float _3089 = -_3081;
    float _3091 = fma(_3071, 2.0, _3089);
    float _3093 = _3055 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3095 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[89].x, _3083);
    float _3097 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3099 = _3075 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_2819)
    {
        _3053 = _2943;
    }
    float _3101 = _3053;
    float _3103 = _3095 * (-0.15915493667125701904296875);
    float _3105 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3107 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3109 = fma(_3093, -2.0, _3097);
    float _3111 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2939);
    float _3113 = -_3105;
    float _3115 = fma(_3099, 2.0, _3113);
    float _3117 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2937);
    float _3119 = fma(_3111, _3061, _2989);
    float _3121 = _3101 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _3125 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3051);
    float _3127 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3129 = -_106;
    float _3131 = fma(_3129, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3091);
    float _3133 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3109);
    float _3135 = -_106;
    float _3137 = fma(_3135, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3115);
    float _3139 = fma(_3121, -2.0, _3127);
    float _3141 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2949);
    float _3143 = _3103 * 6.283185482025146484375;
    float _3145 = sin(_3143);
    float _3147 = _3107 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3149 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3139);
    float _3151 = _2993 * _3065;
    float _3153 = fma(_3147, _3009, -0.5);
    float _3155 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3037);
    float _3157 = _3103 * 6.283185482025146484375;
    float _3159 = cos(_3157);
    float _3161 = _3023 * _3123;
    float _3163 = _2969 + 0.5;
    float _3165 = _2734 + _2718;
    out.m_73.x = _3161;
    out.m_73.y = _3151;
    float _3167 = _3085 * 6.283185482025146484375;
    float _3169 = sin(_3167);
    float _3171 = _3145 * _2899;
    float _3173 = _3085 * 6.283185482025146484375;
    float _3175 = cos(_3173);
    float _3177 = _3159 * _2899;
    float _3179 = -_3171;
    float _3181 = fma(_3159, _3153, _3179);
    float _3183 = fma(_3145, _3153, _3177);
    float _3185 = fma(_3117, _3181, _3137);
    float _3187 = exp2(_2851);
    float _3189 = _3169 * _2917;
    float _3191 = -_3149;
    float _3193 = fma(_3141, _3183, _3191);
    float _3195 = _3119 + 0.5;
    float _3197 = _3185 + 0.5;
    float _3199 = _3193 + 0.5;
    float _3201 = _3175 * _2917;
    float _3203 = -_3189;
    float _3205 = fma(_3175, _3087, _3203);
    float _3207 = _2718 * 0.5;
    out.m_75.x = _3197;
    out.m_75.y = _3199;
    float _3209 = fma(_3169, _3087, _3201);
    float _3211 = _3165 * 0.5;
    float _3213 = fma(_3155, _3205, _3131);
    float _3215 = -_3187;
    float _3217 = _3215 + 1.0;
    float _3219 = -_3133;
    float _3221 = fma(_3125, _3209, _3219);
    float _3223 = fma(_2756, -0.5, _3207);
    float _3225 = _3213 + 0.5;
    float _3227 = _3217 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3229 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3231 = _2999 + _2718;
    float _3233 = _3221 + 0.5;
    float _3235 = _3231 * 0.5;
    out.m_49.x = _3229;
    out.m_77.x = _3195;
    out.m_77.y = _3163;
    out.m_77.z = _3225;
    out.m_77.w = _3233;
    out.m_79.x = _3211;
    out.m_79.y = _3223;
    out.m_79.z = _3235;
    out.m_79.w = _2718;
    float _3237 = _3227 * _2774;
    float _3239 = -_3227;
    float _3241 = _3239 + 1.0;
    float _3243 = _2789 * _3237;
    float _3245 = _2789 * _3241;
    float _3247 = _2799 * _3237;
    float _3249 = fma(_2795, _3243, _2783);
    float _3251 = fma(_2797, _3243, _2785);
    float _3253 = fma(_2789, _3247, _2787);
    out.m_81.x = _3249;
    out.m_81.y = _3251;
    out.m_81.z = _3253;
    out.m_81.w = _3245;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _670 = false;
    bool _510 = false;
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
    float _114 = _97;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    float _118 = _116;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _120 = 0;
    if (!_110)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3321 = as_type<float>(_124);
        out.gl_Position.z = _3321;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _128 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_97);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = float(_102);
    bool _140 = _106 >= _138;
    bool _142 = !_136;
    bool _144 = _140 || _142;
    if (_144)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _114;
    float _148 = _146;
    if (_144)
    {
        out.m_49.x = 0.0;
    }
    if (_144)
    {
        float _150 = _146 * 5.0;
        _126 = as_type<int>(_150);
    }
    int _152 = _126;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3377 = as_type<float>(_152);
        out.gl_Position.z = _3377;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_44.x;
    float _156 = in.m_44.y;
    float _158 = in.m_44.z;
    float _160 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = 0.0;
    float _174 = _160;
    if (!_170)
    {
        float _176 = _160 * _160;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = 0.0;
    float _184 = _180;
    if (!_170)
    {
        float _186 = _106 * _106;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    if (!_170)
    {
        float _192 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _192;
    }
    float _194 = _184;
    bool _196 = !_170;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _160 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _160);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _148 = _218;
        _198 = _228;
        _118 = _216;
    }
    float _230 = _148;
    float _232 = _198;
    float _234 = _118;
    bool _236 = !_170;
    float _238 = _230;
    float _240 = _234;
    if (!_236)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _160 * _244;
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
    if (!_170)
    {
        _268 = _106;
    }
    float _272 = _268;
    float _274 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _276 = _272;
    if (!_170)
    {
        float _278 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _270 = _278;
    }
    float _280 = _270;
    bool _282 = !_170;
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
    bool _318 = !_170;
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
    float _348 = fma(_266, _154, _274);
    float _350 = fma(_266, _156, _342);
    float _352 = fma(_340, _156, _344);
    float _354 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _356 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _358 = fma(_340, _154, _346);
    float _360 = -_352;
    float _362 = _350 + _360;
    float _364 = fma(_266, _158, _354);
    float _366 = fma(_340, _158, _356);
    float _368 = -_358;
    float _370 = _348 + _368;
    float _372 = _362 * _362;
    float _374 = in.m_51.w;
    float _376 = -_366;
    float _378 = _364 + _376;
    float _380 = 1.0 / _138;
    float _382 = fma(_370, _370, _372);
    float _384 = in.m_42.x;
    float _386 = in.m_42.y;
    float _388 = in.m_42.z;
    float _390 = fma(_378, _378, _382);
    float _392 = in.m_53.y;
    float _394 = in.m_55.y;
    float _396 = sqrt(_390);
    float _398 = in.m_57.y;
    float _400 = in.m_53.x;
    float _402 = in.m_57.x;
    float _404 = in.m_53.z;
    float _406 = fma(_348, _374, _384);
    bool _408 = _396 >= 9.9999999747524270787835121154785e-07;
    bool _410 = isnan(_396);
    bool _412 = _408 || _410;
    bool _414 = isnan(9.9999999747524270787835121154785e-07);
    bool _416 = _412 || _414;
    float _418 = fma(_350, _374, _386);
    float _420 = in.m_55.x;
    float _422 = _362 * _392;
    float _424 = fma(_364, _374, _388);
    float _426 = in.m_57.z;
    float _428 = _362 * _394;
    float _430 = in.m_55.z;
    float _432 = _362 * _398;
    float _434 = _392 * _392;
    float _436 = fma(_370, _400, _422);
    float _438 = fma(_394, _394, _434);
    float _440 = fma(_370, _402, _432);
    float _442 = fma(_398, _398, _438);
    float _444 = fma(_378, _404, _436);
    float _446 = fma(_370, _420, _428);
    float _448 = _106 * _380;
    float _450 = fma(_378, _426, _440);
    float _452 = _440;
    float _454 = _450;
    float _456 = _450;
    float _458 = _448;
    if (_416)
    {
        _452 = _444;
    }
    float _460 = _452;
    float _462 = fma(_378, _430, _446);
    float _464 = _462;
    float _466 = _460;
    float _468 = _460;
    float _470 = _462;
    if (!_416)
    {
        bool _472 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _474 = !_472;
        if (!_474)
        {
            float _476 = _392 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _478 = _394 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _480 = _398 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _482 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[16].x, _476);
            float _484 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[16].x, _478);
            float _486 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[16].x, _480);
            float _488 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[16].z, _482);
            float _490 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[16].z, _484);
            float _492 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[16].z, _486);
            float _494 = _488 * _488;
            float _496 = fma(_490, _490, _494);
            float _498 = fma(_492, _492, _496);
            float _500 = rsqrt(_498);
            float _502 = _500 * 9.9999999747524270787835121154785e-07;
            float _504 = _490 * _502;
            float _506 = _488 * _502;
            float _508 = _492 * _502;
            _468 = _506;
            _470 = _504;
            _456 = _508;
            _510 = true;
        }
        else
        {
            float _512 = _156 * _156;
            float _514 = fma(_154, _154, _512);
            float _516 = fma(_158, _158, _514);
            float _518 = sqrt(_516);
            bool _520 = _518 >= 9.9999999747524270787835121154785e-07;
            bool _522 = isnan(_518);
            bool _524 = _520 || _522;
            bool _526 = isnan(9.9999999747524270787835121154785e-07);
            bool _528 = _524 || _526;
            if (!_528)
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
                float _548 = _442;
                if (!_546)
                {
                    float _550 = rsqrt(_442);
                    _548 = _550;
                }
                float _552 = _548;
                if (!_546)
                {
                    float _554 = _552 * 9.9999999747524270787835121154785e-07;
                    _454 = _554;
                }
                float _556 = _454;
                float _558 = _556;
                if (!_546)
                {
                    float _560 = _394 * _556;
                    _464 = _560;
                }
                float _562 = _464;
                _470 = _562;
                if (!_546)
                {
                    float _564 = _392 * _556;
                    _466 = _564;
                }
                float _566 = _466;
                _468 = _566;
                if (!_546)
                {
                    float _568 = _398 * _556;
                    _558 = _568;
                }
                float _570 = _558;
                bool _572 = !_546;
                _456 = _570;
                _510 = _572;
                if (!_510)
                {
                    float _574 = _392 * _386;
                    float _576 = _394 * _386;
                    float _578 = _398 * _386;
                    float _580 = fma(_384, _400, _574);
                    float _582 = fma(_384, _420, _576);
                    float _584 = fma(_384, _402, _578);
                    float _586 = fma(_388, _404, _580);
                    float _588 = fma(_388, _430, _582);
                    float _590 = fma(_388, _426, _584);
                    float _592 = _586 * _586;
                    float _594 = fma(_588, _588, _592);
                    float _596 = fma(_590, _590, _594);
                    float _598 = rsqrt(_596);
                    float _600 = _598 * 9.9999999747524270787835121154785e-07;
                    float _602 = _588 * _600;
                    float _604 = _586 * _600;
                    float _606 = _590 * _600;
                    _468 = _604;
                    _470 = _602;
                    _456 = _606;
                    _510 = true;
                }
            }
            else
            {
                float _608 = _392 * _156;
                float _610 = _394 * _156;
                float _612 = _398 * _156;
                float _614 = fma(_154, _400, _608);
                float _616 = fma(_154, _420, _610);
                float _618 = fma(_154, _402, _612);
                float _620 = fma(_158, _404, _614);
                float _622 = fma(_158, _430, _616);
                float _624 = fma(_158, _426, _618);
                float _626 = _620 * _620;
                float _628 = fma(_622, _622, _626);
                float _630 = fma(_624, _624, _628);
                float _632 = rsqrt(_630);
                float _634 = _632 * 9.9999999747524270787835121154785e-07;
                float _636 = _622 * _634;
                float _638 = _620 * _634;
                float _640 = _624 * _634;
                _468 = _638;
                _470 = _636;
                _456 = _640;
            }
        }
    }
    _510 = false;
    float _642 = _468;
    float _644 = _470;
    float _646 = _456;
    bool _648 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    bool _650 = !_648;
    float _668;
    if (!_650)
    {
        float _652 = in.m_59.x;
        float _654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _656 = _652 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[11].w, _106);
        float _660 = _658 * _654;
        float _662 = floor(_660);
        float _664 = -_662;
        float _666 = _660 + _664;
        _668 = _666;
        _670 = true;
    }
    else
    {
        _668 = _448;
    }
    _670 = false;
    float _672 = _668;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _676 = _672 + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _682 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _684 = isnan(_672);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _702 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _704 = isnan(_672);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _710 = _706 || _708;
    float _712 = float(_710);
    float _714 = 1.0 / _680;
    float _716 = -_692;
    float _718 = _716 + 1.0;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _720;
    bool _724 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _726 = isnan(_672);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = _712 * _718;
    float _738 = -_712;
    float _740 = _738 + 1.0;
    bool _742 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _744 = 1.0 / _696;
    float _746 = _734 * _740;
    float _748 = -_734;
    float _750 = _748 + 1.0;
    float _752 = 1.0 / _700;
    float _754 = _722 * _714;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _760 = fma(_754, _676, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _762 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _764 = isnan(_672);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    float _774 = _758 * _744;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _776;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _782 = _672 + _780;
    float _784 = _760 * _746;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _788 = _672 + _786;
    float _790 = fma(_774, _782, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _792 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[131].x, _784);
    float _794 = _778 * _752;
    float _796 = -_772;
    float _798 = _796 + 1.0;
    float _800 = fma(_790, _736, _792);
    float _802 = fma(_794, _788, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _804 = _692 * _798;
    float _806 = fma(_802, _804, _800);
    float _808 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[134].x, _806);
    float _810 = _808 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _812 = !_742;
    if (!_812)
    {
        float _814 = in.m_59.x;
        float _816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _818 = _814 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _820 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[14].x, _106);
        float _822 = _820 * _816;
        float _824 = floor(_822);
        float _826 = -_824;
        float _828 = _822 + _826;
        _458 = _828;
    }
    float _830 = _458;
    float _832 = in.m_59.w;
    float _834 = _418 * _394;
    float _836 = in.m_51.x;
    float _838 = in.m_51.y;
    float _840 = in.m_51.z;
    float _842 = _418 * _392;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _844;
    float _848 = _418 * _398;
    float _850 = fma(_406, _420, _834);
    float _852 = fma(_406, _400, _842);
    float _854 = 1.0 / _846;
    float _856 = fma(_406, _402, _848);
    float _858 = fma(_424, _430, _850);
    float _860 = fma(_424, _404, _852);
    float _862 = fma(_424, _426, _856);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _868 = in.m_53.w;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _870;
    float _874 = 1.0 / _866;
    float _876 = in.m_55.w;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _880 = _830 + _878;
    float _882 = 30.0 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    bool _884 = _832 > 0.5;
    float _886 = in.m_61.x;
    float _888 = in.m_61.y;
    float _890 = in.m_61.z;
    float _892 = _840 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _894 = _836 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _898 = _896 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _900 = _838 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _902 = 1.0 / _872;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _904;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _912 = 30.0 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _914;
    float _918 = 1.0 / _898;
    float _920 = fma(300.0, (*spvDescriptorSet0.vp_c10)._m0[10].y, _912);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _924 = _830 + _922;
    bool _926 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _928 = isnan(_830);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = _920 + (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _940 = (*spvDescriptorSet0.vp_c10)._m0[9].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _942 = 1.0 / _906;
    float _944 = 30.0 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _948 = _830 + _946;
    float _950 = fma((*spvDescriptorSet0.vp_c10)._m0[8].y, (*spvDescriptorSet0.vp_c10)._m0[8].y, _940);
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _952;
    float _956 = fma(300.0, (*spvDescriptorSet0.vp_c10)._m0[8].y, _944);
    float _958 = _948 * _902;
    float _960 = _860 + _868;
    float _962 = 1.0 / _910;
    float _964 = fma(300.0, (*spvDescriptorSet0.vp_c10)._m0[9].y, _882);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _968 = _830 + _966;
    float _970 = in.m_57.w;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _974 = _972 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _976;
    float _980 = _968 * _854;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _984 = _830 + _982;
    float _986 = 1.0 / _916;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _990 = _830 + _988;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _996 = _984 * _918;
    float _998 = _990 * _874;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1002 = _830 + _1000;
    float _1004 = _880 * _962;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1006;
    float _1010 = _1002 * _942;
    bool _1012 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1014 = isnan(_830);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1020 = _1016 || _1018;
    float _1022 = float(_1020);
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1024;
    float _1028 = _858 + _876;
    float _1030 = fma((*spvDescriptorSet0.vp_c10)._m0[10].y, (*spvDescriptorSet0.vp_c10)._m0[10].y, _950);
    float _1032 = fma(_1008, _980, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1034 = fma(_1026, _980, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1036 = _862 + _970;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1038;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1046;
    bool _1050 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1052 = isnan(_830);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1058 = _1054 || _1056;
    float _1060 = float(_1058);
    float _1062 = fma(_1040, _980, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1064;
    float _1068 = -_936;
    float _1070 = _1068 + 1.0;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1074 = _1072 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1080 = -_1022;
    float _1082 = _1080 + 1.0;
    float _1084 = _1022 * _1070;
    float _1086 = fma(_1074, _996, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1088 = fma(_974, _996, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1090 = fma(_1078, _996, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1092 = _1060 * _1082;
    float _1094 = -_1060;
    float _1096 = _1094 + 1.0;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1098;
    float _1102 = in.m_59.x;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1106 = _1104 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1114 = _1112 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1116 = _924 * _986;
    float _1118 = fma(_1106, _1004, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1120 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1122 = isnan(_830);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1128 = _1124 || _1126;
    float _1130 = float(_1128);
    float _1132 = fma(_994, _1004, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1134 = _642 * _642;
    float _1136 = fma(_1114, _1004, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    bool _1138 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1140 = isnan(_830);
    bool _1142 = _1138 || _1140;
    bool _1144 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1146 = _1142 || _1144;
    float _1148 = float(_1146);
    float _1150 = _1130 * _1096;
    float _1152 = -_1130;
    float _1154 = _1152 + 1.0;
    bool _1156 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1158 = isnan(_830);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1164 = _1160 || _1162;
    float _1166 = float(_1164);
    float _1168 = fma(_644, _644, _1134);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1176 = _1174 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1178 = fma(_1066, _958, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1180 = fma(_954, _958, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1182 = fma(_1048, _958, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    bool _1184 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1186 = isnan(_830);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1192 = _1188 || _1190;
    float _1194 = float(_1192);
    float _1196 = _1148 * _1154;
    float _1198 = -_1148;
    float _1200 = _1198 + 1.0;
    bool _1202 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1204 = isnan(_830);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1210 = _1206 || _1208;
    float _1212 = float(_1210);
    float _1214 = fma(_646, _646, _1168);
    float _1216 = fma(_1172, _998, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1218 = fma(_1044, _998, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1220 = fma(_1176, _998, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1222 = -_1166;
    float _1224 = _1222 + 1.0;
    float _1226 = fma(_1100, _1010, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1228 = fma(_978, _1010, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1230 = fma(_1110, _1010, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1232 = _1212 * _1224;
    float _1234 = -_1212;
    float _1236 = _1234 + 1.0;
    float _1238 = _1166 * _1200;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1240;
    float _1244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _886);
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1246;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1252 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1250;
    float _1254 = fma(_106, 0.02999999932944774627685546875, -0.119999997317790985107421875);
    float _1256 = _1102 * 6.283185482025146484375;
    float _1258 = fma(_1248, _1116, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1260 = _1194 * _1236;
    float _1262 = rsqrt(_1214);
    float _1264 = _1256 + _1254;
    float _1266 = -_1194;
    float _1268 = _1266 + 1.0;
    float _1270 = _964 + (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1272 = fma(_1242, _1116, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1274 = _1032 * _1260;
    float _1276 = _1062 * _1260;
    float _1278 = _956 + (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1280 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1282 = _960 + _1280;
    float _1284 = _1264 * (-0.15915493667125701904296875);
    float _1286 = _1034 * _1260;
    float _1288 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1290 = _960 + _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1294 = _1028 + _1292;
    float _1296 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1298 = _1028 + _1296;
    float _1300 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1286);
    float _1302 = _1290 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1304 = _1290 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1306 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1274);
    float _1308 = fma(_1216, _1232, _1300);
    float _1310 = _1270 * _1270;
    float _1312 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1276);
    float _1314 = fma(_1218, _1232, _1306);
    float _1316 = _1282 * _1282;
    float _1318 = fma(_1278, _1278, _1310);
    float _1320 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1322 = _1036 + _1320;
    float _1324 = _1262 * _644;
    float _1326 = fma(_1294, _1294, _1316);
    float _1328 = fma(_938, _938, _1318);
    float _1330 = _1262 * _642;
    float _1332 = _1262 * _646;
    float _1334 = fma(_1298, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1302);
    float _1336 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1338 = _1036 + _1336;
    float _1340 = fma(_1298, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1304);
    float _1342 = rsqrt(_1328);
    float _1344 = fma(_1322, _1322, _1326);
    float _1346 = fma(_1338, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1334);
    float _1348 = fma(_1338, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1340);
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1352 = _1332 * _1350;
    float _1354 = fma(_1220, _1232, _1312);
    float _1356 = fma(_1180, _1238, _1314);
    float _1358 = fma(_1178, _1238, _1308);
    float _1360 = rsqrt(_1344);
    float _1362 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1364 = -_1352;
    float _1366 = fma(_1324, _1362, _1364);
    float _1368 = fma(_1182, _1238, _1354);
    float _1370 = fma(_1088, _1196, _1356);
    float _1372 = fma(_1252, _1116, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1374 = _892 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1376 = fma(_1090, _1196, _1368);
    float _1378 = _900 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1380 = _1270 * _1342;
    float _1382 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1384 = _1330 * _1382;
    float _1386 = _1278 * _1342;
    float _1388 = _938 * _1342;
    float _1390 = fma(_1086, _1196, _1358);
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1394 = -_1384;
    float _1396 = fma(_1332, _1392, _1394);
    float _1398 = _1366 * _1366;
    float _1400 = abs(_1346);
    float _1402 = abs(_1348);
    float _1404 = precise::max(_1400, _1402);
    float _1406 = _1282 * _1360;
    float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1410 = _1324 * _1408;
    float _1412 = fma(_1396, _1396, _1398);
    float _1414 = _1294 * _1360;
    float _1416 = -_1406;
    float _1418 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1282);
    bool _1420 = _1404 >= 16.0;
    float _1422 = fma(_1226, _1150, _1390);
    float _1424 = -_1414;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1294);
    float _1428 = _1418 * _1418;
    float _1430 = in.m_63.y;
    float _1432 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1434 = -_1410;
    float _1436 = fma(_1330, _1432, _1434);
    float _1438 = fma(_1230, _1150, _1376);
    float _1440 = fma(_1426, _1426, _1428);
    float _1442 = fma(_1228, _1150, _1370);
    float _1444 = fma(_1436, _1436, _1412);
    float _1446 = in.m_59.z;
    float _1448 = _1322 * _1360;
    float _1450 = fma(_1132, _1092, _1442);
    float _1452 = _1346;
    float _1454 = _1348;
    float _1456 = _1414;
    float _1458 = _1448;
    if (_1420)
    {
        float _1460 = _1346 * 0.0625;
        _1452 = _1460;
    }
    float _1462 = _1452;
    float _1464 = in.m_59.y;
    float _1466 = -_1448;
    float _1468 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1322);
    float _1470 = rsqrt(_1444);
    float _1472 = fma(_1136, _1092, _1438);
    float _1474 = in.m_65.x;
    float _1476 = fma(_1468, _1468, _1440);
    float _1478 = fma(_1118, _1092, _1422);
    float _1480 = fma(_1272, _1084, _1450);
    if (_1420)
    {
        float _1482 = _1348 * 0.0625;
        _1454 = _1482;
    }
    float _1484 = _1454;
    float _1486 = abs(_1462);
    bool _1488 = _1486 != 0.0;
    bool _1490 = isnan(_1486);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan(0.0);
    bool _1496 = _1492 || _1494;
    float _1498 = fma(_1258, _1084, _1478);
    float _1500 = rsqrt(_1030);
    float _1502 = fma(_1372, _1084, _1472);
    float _1504 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1480);
    float _1506 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1498);
    float _1508 = -_1430;
    float _1510 = _1508 + 1.0;
    float _1512 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1502);
    float _1514 = abs(_1484);
    bool _1516 = _1514 == 0.0;
    bool _1518 = !_1496;
    bool _1520 = _1516 && _1518;
    float _1522 = _1284 * 6.283185482025146484375;
    float _1524 = cos(_1522);
    bool _1526 = _1446 > 0.5;
    float _1528 = _1504 * (-100.0);
    int _1530 = _884 ? as_type<int>(_1510) : as_type<int>(_1430);
    float _1532 = _1366 * _1470;
    bool _1534 = _1464 > 0.5;
    float _1536 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _888);
    float _1538 = sqrt(_1476);
    float _1540 = -_1474;
    float _1542 = _1540 + 1.0;
    int _1544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1546 = _1544 != 0;
    int _1548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1550 = _1548 != 0;
    int _1552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1554 = _1552 != 0;
    float _1556 = _1500 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1558 = _1500 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1560 = fma(_1528, _1542, _106);
    float _1562 = _1500 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1564 = _1550 ? as_type<float>(_1530) : _1430;
    float _1566 = _1284 * 6.283185482025146484375;
    float _1568 = sin(_1566);
    float _1570 = abs(_1484);
    bool _1572 = _1570 == 0.0;
    float _1574 = -_1524;
    float _1576 = _1574 + 1.0;
    float _1578 = _1558 * _1558;
    float _1580 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _890);
    float _1582 = _1396 * _1470;
    float _1584 = _1562 * _1576;
    float _1586 = _1436 * _1470;
    float _1588 = _1360 * _1538;
    int _1590 = _1534 ? as_type<int>(_1510) : as_type<int>(_1430);
    float _1592 = _1556 * _1576;
    float _1594 = _894 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1596 = _1526 ? _1510 : _1430;
    float _1598 = _1374 * _1588;
    float _1600 = _1546 ? as_type<float>(_1590) : _1430;
    float _1602 = fma(_1556, _1592, _1524);
    float _1604 = _1558 * _1568;
    float _1606 = _1562 * _1568;
    bool _1608 = _1546;
    int _1610 = as_type<int>(_1504);
    int _1612 = _1496 ? (-1) : 0;
    bool _1614 = _1572;
    float _1616 = _1558;
    float _1618 = _1596;
    if (_1520)
    {
        bool _1620 = as_type<int>(_1484) >= 0;
        _1608 = _1620;
    }
    bool _1622 = _1608;
    float _1624 = _1556 * _1568;
    float _1626 = fma(_1562, _1592, _1604);
    float _1628 = -_1604;
    float _1630 = fma(_1562, _1592, _1628);
    float _1632 = -_1606;
    float _1634 = fma(_1558, _1592, _1632);
    float _1636 = fma(_1558, _1592, _1606);
    if (_1520)
    {
        int _1638 = _1622 ? 0 : 1078530011;
        _1610 = _1638;
    }
    int _1640 = _1610;
    float _1642 = fma(_1558, _1584, _1624);
    float _1644 = -_1624;
    float _1646 = fma(_1558, _1584, _1644);
    float _1648 = fma(_1562, _1584, _1524);
    float _1650 = fma(_1576, _1578, _1524);
    float _1652 = _1594 * _1588;
    float _1654 = _1378 * _1588;
    float _1656 = _1554 ? _1596 : _1430;
    int _1658 = _1640;
    if (_1520)
    {
        int _1660 = int(0x80000000) & as_type<int>(_1462);
        int _1662 = _1640 | _1660;
        _1658 = _1662;
    }
    int _1664 = _1658;
    bool _1666 = !_1496;
    bool _1668 = _1666 && _1572;
    int _1670 = _1664;
    float _1672 = as_type<float>(_1664);
    if (!_1668)
    {
        float _1674 = abs(_1462);
        bool _1676 = _1674 != as_type<float>(0x7f800000u /* inf */);
        bool _1678 = isnan(_1674);
        bool _1680 = _1676 || _1678;
        bool _1682 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1684 = _1680 || _1682;
        float _1686 = abs(_1484);
        bool _1688 = _1686 == as_type<float>(0x7f800000u /* inf */);
        float _1690 = abs(_1484);
        bool _1692 = _1690 == as_type<float>(0x7f800000u /* inf */);
        bool _1694 = !_1684;
        bool _1696 = _1692 && _1694;
        _1614 = _1684;
        if (_1696)
        {
            bool _1698 = as_type<int>(_1484) >= 0;
            _1612 = _1698 ? (-1) : 0;
        }
        int _1700 = _1612;
        if (_1696)
        {
            _1670 = 1075235812;
        }
        int _1702 = _1670;
        int _1704 = _1702;
        if (_1696)
        {
            int _1706 = ~_1700;
            int _1708 = (_1706 != 0) ? _1702 : 1061752795;
            _1704 = _1708;
        }
        int _1710 = _1704;
        float _1712 = as_type<float>(_1710);
        if (_1696)
        {
            int _1714 = int(0x80000000) & as_type<int>(_1462);
            int _1716 = _1710 | _1714;
            _1712 = as_type<float>(_1716);
        }
        float _1718 = _1712;
        bool _1720 = !_1684;
        bool _1722 = _1720 && _1688;
        _1672 = _1718;
        if (!_1722)
        {
            float _1724 = abs(_1462);
            float _1726 = abs(_1484);
            float _1728 = precise::max(_1724, _1726);
            float _1730 = abs(_1462);
            float _1732 = abs(_1484);
            float _1734 = precise::min(_1730, _1732);
            float _1736 = 1.0 / _1728;
            float _1738 = abs(_1462);
            float _1740 = abs(_1484);
            bool _1742 = _1738 > _1740;
            bool _1744 = as_type<int>(_1484) >= 0;
            float _1746 = abs(_1462);
            float _1748 = abs(_1484);
            float _1750 = _1746 + _1748;
            int _1752 = as_type<int>(_1462) & int(0x80000000);
            bool _1754 = _1750 > as_type<float>(0x7f800000u /* inf */);
            bool _1756 = isnan(_1750);
            bool _1758 = _1754 || _1756;
            bool _1760 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1762 = _1758 || _1760;
            float _1764 = _1734 * _1736;
            float _1766 = _1764 * _1764;
            float _1768 = _1766 + 11.33538818359375;
            float _1770 = fma(_1766, _1768, 28.84246826171875);
            float _1772 = fma(_1766, _1770, 19.6966705322265625);
            float _1774 = fma(_1766, -0.82336294651031494140625, -5.674867153167724609375);
            float _1776 = fma(_1766, _1774, -6.565555095672607421875);
            float _1778 = 1.0 / _1772;
            float _1780 = _1766 * _1776;
            float _1782 = _1764 * _1780;
            float _1784 = fma(_1782, _1778, _1764);
            float _1786 = _1784;
            _1672 = _1750;
            _1614 = _1762;
            if (_1742)
            {
                float _1788 = -_1784;
                float _1790 = _1788 + 1.57079637050628662109375;
                _1786 = _1790;
            }
            float _1792 = _1786;
            int _1794 = as_type<int>(_1792);
            if (!_1744)
            {
                float _1796 = -_1792;
                float _1798 = _1796 + 3.1415927410125732421875;
                _1794 = as_type<int>(_1798);
            }
            int _1800 = _1794;
            if (!_1762)
            {
                int _1802 = _1752 | _1800;
                _1672 = as_type<float>(_1802);
            }
        }
    }
    float _1804 = _1672;
    bool _1806 = _1614;
    float _1808 = _1652 * _1244;
    float _1810 = _106 + (-4.0);
    float _1812 = _1654 * _1536;
    float _1814 = _1598 * _1580;
    float _1816 = fma(_1810, 0.01333333365619182586669921875, -1.0);
    float _1818 = _1560 * (-0.02300000004470348358154296875);
    float _1820 = _1330 * _1586;
    float _1822 = fma(_1560, 0.01333333365619182586669921875, -1.0);
    float _1824 = _1816 * _1816;
    float _1826 = _1818 * 0.15915493667125701904296875;
    float _1828 = fma(_1560, 0.02999999932944774627685546875, _1256);
    float _1830 = _1332 * _1582;
    float _1832 = _1822 * _1822;
    float _1834 = _1828 * 0.15915493667125701904296875;
    float _1836 = _1826 * 6.283185482025146484375;
    float _1838 = sin(_1836);
    float _1840 = -_1820;
    float _1842 = fma(_1332, _1532, _1840);
    float _1844 = -_1830;
    float _1846 = fma(_1324, _1586, _1844);
    float _1848 = _1812 * _1330;
    float _1850 = _1812 * _1324;
    float _1852 = _1812 * _1332;
    float _1854 = fma(_1824, 0.300000011920928955078125, 0.699999988079071044921875);
    float _1856 = precise::clamp(_1854, 0.0, 1.0);
    float _1858 = fma(_1832, 0.300000011920928955078125, 0.699999988079071044921875);
    float _1860 = precise::clamp(_1858, 0.0, 1.0);
    float _1862 = _1834 * 6.283185482025146484375;
    float _1864 = cos(_1862);
    float _1866 = _1324 * _1532;
    float _1868 = -_1804;
    float _1870 = _1254 + _1868;
    float _1872 = _1474 * _1474;
    float _1874 = -_1804;
    float _1876 = fma(_1560, 0.02999999932944774627685546875, _1874);
    float _1878 = fma(_1560, 1.5, -50.0);
    float _1880 = -_1866;
    float _1882 = fma(_1330, _1582, _1880);
    float _1884 = _1834 * 6.283185482025146484375;
    float _1886 = sin(_1884);
    float _1888 = fma(_1838, 0.1500000059604644775390625, 1.0);
    float _1890 = fma(_1810, 1.5, -50.0);
    float _1892 = _1870 * 0.15915493667125701904296875;
    float _1894 = fma(_1808, _1532, _1848);
    float _1896 = fma(_1872, -0.980000019073486328125, 1.0);
    float _1898 = fma(_1808, _1582, _1850);
    float _1900 = fma(_1808, _1586, _1852);
    float _1902 = -_1864;
    float _1904 = _1902 + 1.0;
    float _1906 = _960 + _964;
    float _1908 = _1860 * 50.0;
    float _1910 = _1892 * 6.283185482025146484375;
    float _1912 = cos(_1910);
    float _1914 = _1388 * _1388;
    float _1916 = _1386 * _1904;
    float _1918 = _1380 * _1904;
    float _1920 = fma(_1908, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1906);
    float _1922 = _1388 * _1886;
    float _1924 = fma(_1814, _1842, _1898);
    float _1926 = fma(_1904, _1914, _1864);
    float _1928 = _1892 * 6.283185482025146484375;
    float _1930 = sin(_1928);
    float _1932 = _1386 * _1886;
    float _1934 = _1380 * _1886;
    float _1936 = fma(_1380, _1916, _1922);
    float _1938 = -_1922;
    float _1940 = fma(_1380, _1916, _1938);
    float _1942 = fma(_1380, _1918, _1864);
    float _1944 = fma(_1878, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1920);
    float _1946 = fma(_1386, _1916, _1864);
    float _1948 = fma(_1388, _1918, _1932);
    float _1950 = -_1932;
    float _1952 = fma(_1388, _1918, _1950);
    float _1954 = _1028 + _956;
    float _1956 = -_960;
    float _1958 = _1956 + _1944;
    float _1960 = -_1934;
    float _1962 = fma(_1388, _1916, _1960);
    float _1964 = fma(_1388, _1916, _1934);
    float _1966 = fma(_1908, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1954);
    float _1968 = _1940 * _1958;
    float _1970 = _1942 * _1958;
    float _1972 = _1948 * _1958;
    float _1974 = -_1912;
    float _1976 = _1974 + 1.0;
    float _1978 = fma(_1878, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1966);
    float _1980 = _1558 * _1930;
    float _1982 = _1556 * _1930;
    float _1984 = _1556 * _1976;
    float _1986 = _1562 * _1930;
    float _1988 = _1562 * _1976;
    float _1990 = -_1028;
    float _1992 = _1990 + _1978;
    float _1994 = fma(_1562, _1984, _1980);
    float _1996 = -_1980;
    float _1998 = fma(_1562, _1984, _1996);
    float _2000 = -_1986;
    float _2002 = fma(_1558, _1984, _2000);
    float _2004 = fma(_1558, _1984, _1986);
    float _2006 = _1856 * 50.0;
    float _2008 = fma(_1578, _1976, _1912);
    float _2010 = fma(_1556, _1984, _1912);
    float _2012 = fma(_1562, _1988, _1912);
    float _2014 = fma(_1558, _1988, _1982);
    float _2016 = -_1982;
    float _2018 = fma(_1558, _1988, _2016);
    float _2020 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1906);
    float _2022 = in.m_65.w;
    float _2024 = fma(_1936, _1992, _1970);
    float _2026 = _1036 + _920;
    float _2028 = fma(_1962, _1992, _1972);
    float _2030 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1954);
    float _2032 = fma(_1890, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2020);
    float _2034 = fma(_1908, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2026);
    float _2036 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2026);
    float _2038 = fma(_1890, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2030);
    float _2040 = -_1906;
    float _2042 = _2040 + _2032;
    float _2044 = fma(_1946, _1992, _1968);
    float _2046 = fma(_1878, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2034);
    float _2048 = -_1954;
    float _2050 = _2048 + _2038;
    float _2052 = fma(_1890, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2036);
    float _2054 = _2012 * _2042;
    float _2056 = -_1036;
    float _2058 = _2056 + _2046;
    float _2060 = _1998 * _2042;
    float _2062 = -_2026;
    float _2064 = _2062 + _2052;
    float _2066 = fma(_1994, _2050, _2054);
    float _2068 = fma(_1964, _2058, _2044);
    float _2070 = fma(_1952, _2058, _2024);
    float _2072 = fma(_2010, _2050, _2060);
    float _2074 = fma(_2018, _2064, _2066);
    float _2076 = _2014 * _2042;
    float _2078 = -_2022;
    float _2080 = _2078 + 1.0;
    float _2082 = fma(_2004, _2064, _2072);
    float _2084 = _1906 + _2074;
    float _2086 = fma(_2002, _2050, _2076);
    float _2088 = _960 + _2070;
    float _2090 = _1954 + _2082;
    float _2092 = _2084 * _2080;
    float _2094 = fma(_2008, _2064, _2086);
    float _2096 = _1028 + _2068;
    float _2098 = _2090 * _2080;
    float _2100 = fma(_2088, _2022, _2092);
    float _2102 = fma(_1926, _2058, _2028);
    float _2104 = _2026 + _2094;
    float _2106 = fma(_2096, _2022, _2098);
    float _2108 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2110 = _2100 + _2108;
    float _2112 = _1036 + _2102;
    float _2114 = _2104 * _2080;
    float _2116 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2118 = _2106 + _2116;
    float _2120 = _2110 * _2110;
    float _2122 = fma(_1814, _1846, _1894);
    float _2124 = fma(_2112, _2022, _2114);
    float _2126 = fma(_1814, _1882, _1900);
    float _2128 = fma(_2118, _2118, _2120);
    float _2130 = fma(_1506, _2122, _960);
    float _2132 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2134 = _2124 + _2132;
    float _2136 = fma(_1506, _1924, _1028);
    float _2138 = _1896 * _1888;
    float _2140 = -_960;
    float _2142 = _2140 + _2130;
    float _2144 = fma(_2134, _2134, _2128);
    float _2146 = -_1028;
    float _2148 = _2146 + _2136;
    float _2150 = fma(_1506, _2126, _1036);
    float _2152 = _1630 * _2142;
    float _2154 = _1648 * _2142;
    float _2156 = _1642 * _2142;
    float _2158 = sqrt(_2144);
    float _2160 = fma(_1602, _2148, _2152);
    float _2162 = -_1036;
    float _2164 = _2162 + _2150;
    float _2166 = fma(_1626, _2148, _2154);
    float _2168 = fma(_1634, _2148, _2156);
    float _2170 = _1876 * 0.15915493667125701904296875;
    float _2172 = fma(_1636, _2164, _2160);
    float _2174 = fma(_1646, _2164, _2166);
    float _2176 = fma(_1650, _2164, _2168);
    float _2178 = _1954 + _2172;
    float _2180 = _1906 + _2174;
    float _2182 = _2026 + _2176;
    float _2184 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2178);
    float _2186 = fma(_2158, 0.006666666828095912933349609375, -0.666666686534881591796875);
    float _2188 = precise::clamp(_2186, 0.0, 1.0);
    float _2190 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2180);
    float _2192 = _1512 * _2138;
    float _2194 = fma(_1890, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2184);
    float _2196 = fma(_2188, -2.0, 3.0);
    float _2198 = _2188 * _2188;
    float _2200 = fma(_1890, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2190);
    float _2202 = _2170 * 6.283185482025146484375;
    float _2204 = cos(_2202);
    float _2206 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2182);
    float _2208 = _2196 * _2198;
    float _2210 = -_1906;
    float _2212 = _2210 + _2200;
    float _2214 = fma(_2208, 0.800000011920928955078125, 0.20000000298023223876953125);
    float _2216 = -_1954;
    float _2218 = _2216 + _2194;
    float _2220 = _2014 * _2212;
    float _2222 = _2170 * 6.283185482025146484375;
    float _2224 = sin(_2222);
    float _2226 = _2192 * _2214;
    float _2228 = fma(_1890, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2206);
    float _2230 = _1998 * _2212;
    float _2232 = fma(_2002, _2218, _2220);
    float _2234 = fma(_1924, _2226, _1028);
    float _2236 = fma(_2122, _2226, _960);
    float _2238 = fma(_2126, _2226, _1036);
    float _2240 = -_2204;
    float _2242 = _2240 + 1.0;
    float _2244 = _956 + _2234;
    float _2246 = _964 + _2236;
    float _2248 = _920 + _2238;
    float _2250 = fma(_1578, _2242, _2204);
    float _2252 = fma(_1908, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2244);
    float _2254 = fma(_1908, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2246);
    float _2256 = fma(_1908, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2248);
    float _2258 = _1556 * _2224;
    float _2260 = fma(_1878, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2252);
    float _2262 = fma(_1878, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2254);
    float _2264 = _1562 * _2242;
    float _2266 = fma(_1878, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2256);
    float _2268 = _1558 * _2224;
    float _2270 = _1556 * _2242;
    float _2272 = _1562 * _2224;
    float _2274 = fma(_1558, _2264, _2258);
    float _2276 = -_1906;
    float _2278 = _2276 + _2262;
    float _2280 = -_1954;
    float _2282 = _2280 + _2260;
    float _2284 = -_2272;
    float _2286 = fma(_1558, _2270, _2284);
    float _2288 = -_2268;
    float _2290 = fma(_1562, _2270, _2288);
    float _2292 = _2274 * _2278;
    float _2294 = -_2026;
    float _2296 = _2294 + _2228;
    float _2298 = -_2026;
    float _2300 = _2298 + _2266;
    float _2302 = fma(_2010, _2218, _2230);
    float _2304 = fma(_2286, _2282, _2292);
    float _2306 = fma(_1556, _2270, _2204);
    float _2308 = _2290 * _2278;
    float _2310 = fma(_2008, _2296, _2232);
    float _2312 = fma(_2250, _2300, _2304);
    float _2314 = fma(_1558, _2270, _2272);
    float _2316 = fma(_2306, _2282, _2308);
    float _2318 = fma(_2004, _2296, _2302);
    float _2320 = _2026 + _2310;
    float _2322 = _2026 + _2312;
    float _2324 = fma(_2314, _2300, _2316);
    float _2326 = _1954 + _2318;
    float _2328 = _2080 * _2320;
    float _2330 = _2012 * _2212;
    float _2332 = _1954 + _2324;
    float _2334 = _2080 * _2326;
    float _2336 = fma(_2322, _2022, _2328);
    float _2338 = fma(_1562, _2264, _2204);
    float _2340 = fma(_1562, _2270, _2268);
    float _2342 = fma(_2332, _2022, _2334);
    float _2344 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2346 = _2336 + _2344;
    float _2348 = fma(_1994, _2218, _2330);
    float _2350 = _2338 * _2278;
    float _2352 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2354 = _2342 + _2352;
    float _2356 = _2346 * _2346;
    float _2358 = -_2258;
    float _2360 = fma(_1558, _2264, _2358);
    float _2362 = fma(_2018, _2296, _2348);
    float _2364 = fma(_2340, _2282, _2350);
    float _2366 = fma(_2354, _2354, _2356);
    float _2368 = _1906 + _2362;
    float _2370 = fma(_2360, _2300, _2364);
    float _2372 = sqrt(_2366);
    float _2374 = _2080 * _2368;
    float _2376 = _1906 + _2370;
    float _2378 = fma(_2376, _2022, _2374);
    bool _2380 = _2372 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2382 = _2368;
    float _2384 = _2282;
    float _2386 = _2360;
    float _2388 = _2354;
    float _2390 = _2270;
    bool _2392 = _1806;
    float _2394 = _1894;
    float _2396 = _2126;
    if (!_2380)
    {
        _2382 = _2342;
    }
    float _2398 = _2382;
    float _2400 = _2398;
    if (!_2380)
    {
        _2384 = _2336;
    }
    float _2402 = _2384;
    float _2404 = _2402;
    if (!_2380)
    {
        _2386 = _2378;
    }
    float _2406 = _2386;
    bool _2408 = !_2380;
    float _2410 = _2406;
    if (!_2408)
    {
        float _2412 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2416 = _2372 + _2414;
        float _2418 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2420 = rsqrt(_2366);
        float _2422 = _2416 * _2412;
        float _2424 = _2422 * 0.15915493667125701904296875;
        float _2426 = _2424 * 6.283185482025146484375;
        float _2428 = cos(_2426);
        float _2430 = _2424 * 6.283185482025146484375;
        float _2432 = sin(_2430);
        float _2434 = _2428 + (-1.0);
        float _2436 = _2434 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2438 = fma(_2432, _2418, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2440 = fma(_2378, _2428, _2436);
        float _2442 = _2420 * _2438;
        float _2444 = fma(_2354, _2442, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2446 = fma(_2346, _2442, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2410 = _2440;
        _2400 = _2444;
        _2404 = _2446;
    }
    float _2448 = _2410;
    float _2450 = _2400;
    float _2452 = _2404;
    float _2454 = -_1406;
    float _2456 = fma(_2454, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2448);
    float _2458 = -_1414;
    float _2460 = fma(_2458, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2450);
    float _2462 = -_1448;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2452);
    float _2466 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2468 = _2456 + _2466;
    float _2470 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2472 = _2460 + _2470;
    float _2474 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2476 = _2464 + _2474;
    float _2478 = _2468 * _2468;
    float _2480 = fma(_2472, _2472, _2478);
    float _2482 = fma(_2476, _2476, _2480);
    float _2484 = rsqrt(_2482);
    float _2486 = _2484 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2488 = _2472 * _2486;
    float _2490 = _2476 * _2486;
    float _2492 = _2488 * _2488;
    float _2494 = _2490 * _2490;
    float _2496 = _2492 + _2494;
    float _2498 = sqrt(_2496);
    bool _2500 = _2498 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2504 = _2498 + _2502;
    float _2506 = _2484;
    float _2508 = _2496;
    float _2510 = _2504;
    float _2512 = _2468;
    if (_2500)
    {
        float _2514 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2506 = _2514;
    }
    float _2516 = _2506;
    if (_2500)
    {
        float _2518 = rsqrt(_2496);
        _2508 = _2518;
    }
    float _2520 = _2508;
    float _2522 = _2520;
    if (_2500)
    {
        float _2524 = _2504 * _2516;
        _2510 = _2524;
    }
    float _2526 = _2510;
    if (_2500)
    {
        float _2528 = _2526 * 0.15915493667125701904296875;
        _1616 = _2528;
    }
    float _2530 = _1616;
    float _2532 = _2476;
    if (_2500)
    {
        float _2534 = _2530 * 6.283185482025146484375;
        float _2536 = sin(_2534);
        _2532 = _2536;
    }
    float _2538 = _2532;
    float _2540 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2542 = precise::max(0.0, _2540);
    float _2544 = _2516;
    float _2546 = _2542;
    if (_2500)
    {
        float _2548 = _2530 * 6.283185482025146484375;
        float _2550 = cos(_2548);
        _2544 = _2550;
    }
    float _2552 = _2544;
    float _2554 = -_2486;
    float _2556 = -_2542;
    float _2558 = fma(_2468, _2554, _2556);
    if (_2500)
    {
        float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2512 = _2560;
    }
    float _2562 = _2512;
    float _2564 = sqrt(_2482);
    float _2566 = _2562;
    float _2568 = _2538;
    if (_2500)
    {
        float _2570 = fma(_2538, _2562, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2566 = _2570;
    }
    float _2572 = _2566;
    float _2574 = _2572;
    if (!_2500)
    {
        _2568 = _2488;
    }
    float _2576 = _2568;
    float _2578 = _2576;
    float _2580 = _2552;
    if (_2500)
    {
        float _2582 = _2552 + (-1.0);
        _2546 = _2582;
    }
    float _2584 = _2546;
    float _2586 = _2584;
    if (_2500)
    {
        float _2588 = _2520 * _2572;
        _2388 = _2588;
    }
    float _2590 = _2388;
    if (!_2500)
    {
        _2574 = _2558;
    }
    float _2592 = _2574;
    float _2594 = _2592;
    if (_2500)
    {
        float _2596 = _2584 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2390 = _2596;
    }
    float _2598 = _2390;
    if (_2500)
    {
        float _2600 = _2488 * _2590;
        _2578 = _2600;
    }
    float _2602 = _2578;
    if (!_2500)
    {
        _2586 = _2490;
    }
    float _2604 = _2586;
    float _2606 = _2604;
    if (_2500)
    {
        float _2608 = _2490 * _2590;
        _2606 = _2608;
    }
    float _2610 = _2606;
    if (!_2500)
    {
        _2522 = _2492;
    }
    float _2612 = _2522;
    float _2614 = _2612;
    if (_2500)
    {
        float _2616 = fma(_2558, _2552, _2598);
        _2594 = _2616;
    }
    float _2618 = _2594;
    if (_2500)
    {
        float _2620 = _2602 * _2602;
        _2614 = _2620;
    }
    float _2622 = _2614;
    if (!_2500)
    {
        _2580 = _2494;
    }
    float _2624 = _2580;
    float _2626 = _2624;
    if (_2500)
    {
        float _2628 = _2610 * _2610;
        _2626 = _2628;
    }
    float _2630 = _2626;
    float _2632 = fma(_2618, _2618, _2622);
    float _2634 = _2456 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2636 = _2632 + _2630;
    float _2638 = _2456 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2640 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2642 = fma(_2564, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2640);
    float _2644 = precise::clamp(_2642, 0.0, 1.0);
    float _2646 = _2456 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2648 = rsqrt(_2636);
    float _2650 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2638);
    float _2652 = -_2644;
    float _2654 = _2652 + 1.0;
    float _2656 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2646);
    float _2658 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2660 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2650);
    float _2662 = _2456 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2664 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2656);
    float _2666 = abs(_2654);
    float _2668 = log2(_2666);
    float _2670 = _2660 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2672 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2662);
    float _2674 = _2664 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2676 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2634);
    float _2678 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2680 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2672);
    float _2682 = _2648 * _2602;
    float _2684 = _2648 * _2618;
    float _2686 = _2680 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2688 = _2674 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2690 = _2682 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2692 = -_2678;
    float _2694 = fma(_2692, _2658, 1.0);
    float _2696 = fma(_2464, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2676);
    float _2698 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2688);
    float _2700 = _2648 * _2610;
    float _2702 = -_2690;
    float _2704 = fma(_2684, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2702);
    float _2706 = _2696 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2708 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2698);
    float _2710 = _2668 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2712 = -_2700;
    float _2714 = fma(_2712, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2704);
    float _2716 = log2(_2694);
    float _2718 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2708);
    float _2720 = _2674 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2722 = fma(_2714, -0.5, 0.5);
    float _2724 = _2674 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2726 = _2684 + 1.0;
    float _2728 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2720);
    float _2730 = exp2(_2710);
    float _2732 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2728);
    float _2734 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2732);
    float _2736 = 1.0 / _2718;
    float _2738 = fma(_2714, 0.5, 0.5);
    float _2740 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2724);
    float _2742 = _2716 * 0.693147182464599609375;
    float _2744 = fma(_2738, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2746 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2740);
    float _2748 = _2742 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2750 = sqrt(_2722);
    float _2752 = -_2684;
    float _2754 = fma(_2730, _2726, _2752);
    float _2756 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2746);
    float _2758 = fma(_2738, _2744, -0.212114393711090087890625);
    float _2760 = fma(_2754, 0.5, 0.5);
    float _2762 = fma(_2738, _2758, 1.570728778839111328125);
    float _2764 = _2734 * _2736;
    float _2766 = _2756 * _2736;
    float _2768 = fma(_2764, 0.5, 0.5);
    float _2770 = fma(_2766, -0.5, 0.5);
    float _2772 = _2750 * 0.636619746685028076171875;
    float3 _7568 = float3(_2768, _2770, _2748);
    float _2774 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7568, float3(0.0), isnan(_7568)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7568, float3(0.0), isnan(_7568)), level(0.0)).x;
    float _2776 = -_2762;
    float _2778 = fma(_2772, _2776, 1.0);
    float3 _7584 = float3(_2768, _2770, _2748);
    float4 _2781 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7584, float3(0.0), isnan(_7584)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7584, float3(0.0), isnan(_7584)), level(0.0)).xyzw;
    float _2783 = _2781.x;
    float _2785 = _2781.y;
    float _2787 = _2781.z;
    float _2789 = _2781.w;
    float2 _7601 = float2(_2778, _2760);
    float3 _2793 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7601, float2(0.0), isnan(_7601)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7601, float2(0.0), isnan(_7601)), level(0.0)).xyz;
    float _2795 = _2793.x;
    float _2797 = _2793.y;
    float _2799 = _2793.z;
    float _2801 = in.m_63.x;
    int _2803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2805 = _2803 != 0;
    float _2807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2809 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    out.m_67.x = _1474;
    int _2811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2813 = _2811 != 0;
    float _2815 = _2674 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2819 = _2817 != 0;
    out.m_69.w = _810;
    float _2821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2823 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2825 = _2813 ? _1596 : _1430;
    float _2827 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2815);
    int _2829 = as_type<int>(_2736);
    float _2831 = _2758;
    float _2833 = _2823;
    if (_2805)
    {
        bool _2835 = _1102 > 0.5;
        _2392 = _2835;
    }
    bool _2837 = _2392;
    float _2839 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2843 = _2841 != 0;
    float _2845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2847 = _2807 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2849 = fma(_2809, -2.0, _2839);
    float _2851 = _2668 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2853 = (*spvDescriptorSet0.vp_c9)._m0[88].z;
    float _2855 = _2849;
    float _2857 = _2801;
    if (_2805)
    {
        float _2859 = -_2801;
        float _2861 = _2859 + 1.0;
        _2829 = as_type<int>(_2861);
    }
    int _2863 = _2829;
    if (!_2805)
    {
        _2831 = _2801;
    }
    float _2865 = _2831;
    float _2867 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2869 = _2865;
    if (!_2819)
    {
        _1618 = _1102;
    }
    float _2871 = _1618;
    float _2873 = fma(_2847, _1600, -0.5);
    float _2875 = _2871;
    float _2877 = _2873;
    if (_2805)
    {
        float _2879 = _2837 ? as_type<float>(_2863) : _2801;
        _2869 = _2879;
    }
    float _2881 = _2869;
    float _2883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2885 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2827);
    int _2887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2889 = _2887 != 0;
    float _2891 = _2845 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2895 = _2893 != 0;
    float _2897 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2899 = fma(_1656, _2891, -0.5);
    int _2901 = as_type<int>(_2891);
    if (!_2819)
    {
        _2394 = _1464;
    }
    float _2903 = _2394;
    float _2905 = -_2897;
    float _2907 = fma(_2823, 2.0, _2905);
    float _2909 = _2821 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2911 = _2903;
    if (!_2819)
    {
        _2833 = _1446;
    }
    float _2913 = _2833;
    float _2915 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2917 = fma(_2909, _1564, -0.5);
    float _2919 = _2913;
    int _2921 = as_type<int>(_2915);
    if (!_2819)
    {
        _1456 = _2913;
    }
    float _2923 = _1456;
    float _2925 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2927 = _2923;
    if (_2819)
    {
        _2919 = _1446;
    }
    float _2929 = _2919;
    float _2931 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2933 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2867);
    if (!_2819)
    {
        _2853 = _2871;
    }
    float _2935 = _2853;
    float _2937 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2925);
    float _2939 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2931);
    float _2941 = _2935;
    if (_2819)
    {
        _2875 = _1102;
    }
    float _2943 = _2875;
    float _2945 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2933);
    float _2947 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2849);
    float _2949 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2915);
    int _2951 = as_type<int>(_2945);
    if (_2895)
    {
        float _2953 = -_2801;
        float _2955 = _2953 + 1.0;
        _2901 = as_type<int>(_2955);
    }
    int _2957 = _2901;
    float _2959 = as_type<float>(_2957);
    if (_2843)
    {
        float _2961 = -_2801;
        float _2963 = _2961 + 1.0;
        _2921 = as_type<int>(_2963);
    }
    int _2965 = _2921;
    float _2967 = -_2947;
    float _2969 = fma(_2945, _2873, _2967);
    float _2971 = as_type<float>(_2965);
    if (_2889)
    {
        float _2973 = -_2801;
        float _2975 = _2973 + 1.0;
        _2951 = as_type<int>(_2975);
    }
    int _2977 = _2951;
    if (!_2819)
    {
        _2855 = _2903;
    }
    float _2979 = _2855;
    float _2981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2983 = _2979;
    if (_2819)
    {
        _2911 = _1464;
    }
    float _2985 = _2911;
    float _2987 = -_106;
    float _2989 = fma(_2987, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2907);
    if (!_2889)
    {
        _2396 = _2801;
    }
    float _2991 = _2396;
    float _2993 = _2825 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2995 = _2991;
    if (!_2895)
    {
        _2877 = _2801;
    }
    float _2997 = _2877;
    float _2999 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2885);
    float _3001 = _2997;
    if (_2889)
    {
        float _3003 = _1526 ? as_type<float>(_2977) : _2801;
        _2995 = _3003;
    }
    float _3005 = _2995;
    out.m_67.w = _2022;
    if (_2895)
    {
        float _3007 = _1534 ? as_type<float>(_2957) : _2801;
        _3001 = _3007;
    }
    float _3009 = _3001;
    out.m_71.x = _2460;
    out.m_71.y = _2456;
    out.m_71.z = _2464;
    float _3011 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3013 = _3011;
    if (_2843)
    {
        float _3015 = _1534 ? as_type<float>(_2965) : _2801;
        _2857 = _3015;
    }
    float _3017 = _2857;
    out.gl_Position.x = _2734;
    out.gl_Position.y = _2756;
    out.gl_Position.z = _2999;
    out.gl_Position.w = _2718;
    if (!_2819)
    {
        _2971 = _2979;
    }
    float _3019 = _2971;
    float _3021 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _3023 = _3017 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _3025 = _3019;
    if (_2819)
    {
        _2983 = _2943;
    }
    float _3027 = _2983;
    if (_2819)
    {
        _2941 = _2929;
    }
    float _3029 = _2941;
    float _3031 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3033 = _3029;
    if (!_2819)
    {
        _1458 = _2923;
    }
    float _3035 = _1458;
    float _3037 = fma(_3027, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3011);
    float _3039 = _3035;
    if (_2819)
    {
        _2927 = _2985;
    }
    float _3041 = _2927;
    float _3043 = fma(_3029, (*spvDescriptorSet0.vp_c9)._m0[84].z, _3021);
    if (_2819)
    {
        _3013 = _2929;
    }
    float _3045 = _3013;
    float _3047 = _3045;
    if (_2819)
    {
        _3033 = _2985;
    }
    float _3049 = _3033;
    float _3051 = fma(_3041, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3031);
    float _3053 = _3049;
    if (_2819)
    {
        _3039 = _2985;
    }
    float _3055 = _3039;
    float _3057 = _2981 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_2819)
    {
        _3047 = _2985;
    }
    float _3059 = _3047;
    float _3061 = fma(_3057, _2881, -0.5);
    if (_2819)
    {
        _3025 = _2943;
    }
    float _3063 = _3025;
    float _3065 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _3067 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    if (_2819)
    {
        _2959 = _2943;
    }
    float _3069 = _2959;
    float _3071 = _3063 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3073 = _3069;
    if (!_2819)
    {
        _3073 = _2929;
    }
    float _3075 = _3073;
    float _3077 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[84].x, _3043);
    float _3079 = _2883 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3081 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3083 = fma(_3059, (*spvDescriptorSet0.vp_c9)._m0[89].z, _3067);
    float _3085 = _3077 * (-0.15915493667125701904296875);
    float _3087 = fma(_3079, _3005, -0.5);
    float _3089 = -_3081;
    float _3091 = fma(_3071, 2.0, _3089);
    float _3093 = _3055 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3095 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[89].x, _3083);
    float _3097 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3099 = _3075 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_2819)
    {
        _3053 = _2943;
    }
    float _3101 = _3053;
    float _3103 = _3095 * (-0.15915493667125701904296875);
    float _3105 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3107 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3109 = fma(_3093, -2.0, _3097);
    float _3111 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2939);
    float _3113 = -_3105;
    float _3115 = fma(_3099, 2.0, _3113);
    float _3117 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2937);
    float _3119 = fma(_3111, _3061, _2989);
    float _3121 = _3101 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _3125 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3051);
    float _3127 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3129 = -_106;
    float _3131 = fma(_3129, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3091);
    float _3133 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3109);
    float _3135 = -_106;
    float _3137 = fma(_3135, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3115);
    float _3139 = fma(_3121, -2.0, _3127);
    float _3141 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2949);
    float _3143 = _3103 * 6.283185482025146484375;
    float _3145 = sin(_3143);
    float _3147 = _3107 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3149 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3139);
    float _3151 = _2993 * _3065;
    float _3153 = fma(_3147, _3009, -0.5);
    float _3155 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3037);
    float _3157 = _3103 * 6.283185482025146484375;
    float _3159 = cos(_3157);
    float _3161 = _3023 * _3123;
    float _3163 = _2969 + 0.5;
    float _3165 = _2734 + _2718;
    out.m_73.x = _3161;
    out.m_73.y = _3151;
    float _3167 = _3085 * 6.283185482025146484375;
    float _3169 = sin(_3167);
    float _3171 = _3145 * _2899;
    float _3173 = _3085 * 6.283185482025146484375;
    float _3175 = cos(_3173);
    float _3177 = _3159 * _2899;
    float _3179 = -_3171;
    float _3181 = fma(_3159, _3153, _3179);
    float _3183 = fma(_3145, _3153, _3177);
    float _3185 = fma(_3117, _3181, _3137);
    float _3187 = exp2(_2851);
    float _3189 = _3169 * _2917;
    float _3191 = -_3149;
    float _3193 = fma(_3141, _3183, _3191);
    float _3195 = _3119 + 0.5;
    float _3197 = _3185 + 0.5;
    float _3199 = _3193 + 0.5;
    float _3201 = _3175 * _2917;
    float _3203 = -_3189;
    float _3205 = fma(_3175, _3087, _3203);
    float _3207 = _2718 * 0.5;
    out.m_75.x = _3197;
    out.m_75.y = _3199;
    float _3209 = fma(_3169, _3087, _3201);
    float _3211 = _3165 * 0.5;
    float _3213 = fma(_3155, _3205, _3131);
    float _3215 = -_3187;
    float _3217 = _3215 + 1.0;
    float _3219 = -_3133;
    float _3221 = fma(_3125, _3209, _3219);
    float _3223 = fma(_2756, -0.5, _3207);
    float _3225 = _3213 + 0.5;
    float _3227 = _3217 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3229 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3231 = _2999 + _2718;
    float _3233 = _3221 + 0.5;
    float _3235 = _3231 * 0.5;
    out.m_49.x = _3229;
    out.m_77.x = _3195;
    out.m_77.y = _3163;
    out.m_77.z = _3225;
    out.m_77.w = _3233;
    out.m_79.x = _3211;
    out.m_79.y = _3223;
    out.m_79.z = _3235;
    out.m_79.w = _2718;
    float _3237 = _3227 * _2774;
    float _3239 = -_3227;
    float _3241 = _3239 + 1.0;
    float _3243 = _2789 * _3237;
    float _3245 = _2789 * _3241;
    float _3247 = _2799 * _3237;
    float _3249 = fma(_2795, _3243, _2783);
    float _3251 = fma(_2797, _3243, _2785);
    float _3253 = fma(_2789, _3247, _2787);
    out.m_81.x = _3249;
    out.m_81.y = _3251;
    out.m_81.z = _3253;
    out.m_81.w = _3245;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

