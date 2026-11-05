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
    float4 m_65 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_45 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_67 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_59 [[attribute(9)]];
    float4 m_55 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _714 = false;
    bool _478 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2926 = as_type<float>(_112);
        out.gl_Position.z = _2926;
    }
    if (!_100)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = 0.0;
    float _134 = 0.0;
    if (_126)
    {
        float _136 = float(_96);
        _106 = _136;
    }
    float _138 = _106;
    bool _140 = _130 >= _138;
    bool _142 = !_126;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _114 = as_type<int>(_150);
    }
    int _152 = _114;
    float _154 = as_type<float>(_152);
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2997 = as_type<float>(_152);
        out.gl_Position.z = _2997;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
        float _186 = _130 * _130;
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
        _132 = _218;
        _198 = _228;
        _134 = _216;
    }
    float _230 = _132;
    float _232 = _198;
    float _234 = _134;
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
        _268 = _130;
    }
    float _272 = _268;
    float _274 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
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
        float _296 = _130 * _288;
        float _298 = 1.0 / _292;
        float _300 = _294 * 0.693147182464599609375;
        float _302 = exp2(_296);
        float _304 = 1.0 / _300;
        float _306 = _302 + (-1.0);
        float _308 = -_306;
        float _310 = fma(_308, _304, _130);
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
        float _330 = _130 * _322;
        float _332 = exp2(_330);
        float _334 = -_332;
        float _336 = _334 + 1.0;
        float _338 = _336 * _328;
        _276 = _338;
    }
    float _340 = _276;
    float _342 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _344 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _346 = fma(_266, _158, _274);
    float _348 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _350 = fma(_340, _158, _342);
    float _352 = fma(_266, _156, _344);
    float _354 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _356 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _358 = fma(_340, _156, _348);
    float _360 = -_350;
    float _362 = _346 + _360;
    float _364 = fma(_266, _160, _354);
    float _366 = fma(_340, _160, _356);
    float _368 = -_358;
    float _370 = _352 + _368;
    float _372 = _362 * _362;
    float _374 = in.m_49.w;
    float _376 = -_366;
    float _378 = _364 + _376;
    float _380 = _362 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _382 = fma(_370, _370, _372);
    float _384 = in.m_42.x;
    float _386 = in.m_42.y;
    float _388 = in.m_42.z;
    float _390 = _362 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _392 = _362 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _394 = fma(_378, _378, _382);
    float _396 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[5].x, _380);
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[4].x, _390);
    float _400 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[6].x, _392);
    float _402 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[5].z, _396);
    float _404 = sqrt(_394);
    float _406 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].z, _398);
    float _408 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[6].z, _400);
    float _410 = fma(_352, _374, _384);
    bool _412 = _404 >= 9.9999999747524270787835121154785e-07;
    bool _414 = isnan(_404);
    bool _416 = _412 || _414;
    bool _418 = isnan(9.9999999747524270787835121154785e-07);
    bool _420 = _416 || _418;
    float _422 = fma(_346, _374, _386);
    float _424 = fma(_364, _374, _388);
    float _426 = _352;
    float _428 = _374;
    float _430 = _408;
    if (_420)
    {
        _426 = _406;
    }
    float _432 = _426;
    float _434 = _432;
    if (_420)
    {
        _428 = _402;
    }
    float _436 = _428;
    float _438 = _436;
    if (!_420)
    {
        bool _440 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _442 = !_440;
        if (!_442)
        {
            float _444 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _446 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _448 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _450 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _444);
            float _452 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _446);
            float _454 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _448);
            float _456 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _450);
            float _458 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _452);
            float _460 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _454);
            float _462 = _456 * _456;
            float _464 = fma(_458, _458, _462);
            float _466 = fma(_460, _460, _464);
            float _468 = rsqrt(_466);
            float _470 = _468 * 9.9999999747524270787835121154785e-07;
            float _472 = _458 * _470;
            float _474 = _456 * _470;
            float _476 = _460 * _470;
            _438 = _474;
            _434 = _472;
            _430 = _476;
            _478 = true;
        }
        else
        {
            float _480 = _158 * _158;
            float _482 = fma(_156, _156, _480);
            float _484 = fma(_160, _160, _482);
            float _486 = sqrt(_484);
            bool _488 = _486 >= 9.9999999747524270787835121154785e-07;
            bool _490 = isnan(_486);
            bool _492 = _488 || _490;
            bool _494 = isnan(9.9999999747524270787835121154785e-07);
            bool _496 = _492 || _494;
            if (!_496)
            {
                float _498 = _386 * _386;
                float _500 = fma(_384, _384, _498);
                float _502 = fma(_388, _388, _500);
                float _504 = sqrt(_502);
                bool _506 = _504 >= 9.9999999747524270787835121154785e-07;
                bool _508 = isnan(_504);
                bool _510 = _506 || _508;
                bool _512 = isnan(9.9999999747524270787835121154785e-07);
                bool _514 = _510 || _512;
                if (!_514)
                {
                    float _516 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _518 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _516);
                    float _520 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _518);
                    float _522 = rsqrt(_520);
                    float _524 = _522 * 9.9999999747524270787835121154785e-07;
                    float _526 = _524 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _528 = _524 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _530 = _524 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _438 = _528;
                    _434 = _526;
                    _430 = _530;
                    _478 = true;
                }
                else
                {
                    float _532 = _386 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _534 = _386 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _536 = _386 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _538 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[5].x, _532);
                    float _540 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[4].x, _534);
                    float _542 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[6].x, _536);
                    float _544 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].z, _538);
                    float _546 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].z, _540);
                    float _548 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].z, _542);
                    float _550 = _544 * _544;
                    float _552 = fma(_546, _546, _550);
                    float _554 = fma(_548, _548, _552);
                    float _556 = rsqrt(_554);
                    float _558 = _556 * 9.9999999747524270787835121154785e-07;
                    float _560 = _546 * _558;
                    float _562 = _544 * _558;
                    float _564 = _548 * _558;
                    _438 = _562;
                    _434 = _560;
                    _430 = _564;
                    _478 = true;
                }
            }
            else
            {
                float _566 = _158 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _568 = _158 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _570 = _158 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _572 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[5].x, _566);
                float _574 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[4].x, _568);
                float _576 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[6].x, _570);
                float _578 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[5].z, _572);
                float _580 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[4].z, _574);
                float _582 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[6].z, _576);
                float _584 = _578 * _578;
                float _586 = fma(_580, _580, _584);
                float _588 = fma(_582, _582, _586);
                float _590 = rsqrt(_588);
                float _592 = _590 * 9.9999999747524270787835121154785e-07;
                float _594 = _580 * _592;
                float _596 = _578 * _592;
                float _598 = _582 * _592;
                _438 = _596;
                _434 = _594;
                _430 = _598;
            }
        }
    }
    _478 = false;
    float _600 = _438;
    float _602 = _434;
    float _604 = _430;
    float _606 = in.m_51.x;
    float _608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _610 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _618 = _616 != 0;
    int _620 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _622 = _620 != 0;
    float _624 = _610 * _608;
    float _626 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[20].x, _624);
    float _628 = _626 * 6.283185482025146484375;
    float _630 = floor(_626);
    float _632 = _628 * 0.15915493667125701904296875;
    bool _634 = !_614;
    int _636 = _634 ? 0 : 1;
    int _638 = abs(_636);
    float _640 = _632 * 6.283185482025146484375;
    float _642 = cos(_640);
    bool _644 = !_622;
    int _646 = _644 ? 0 : 1;
    bool _648 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _650 = abs(_646);
    float _652 = -_630;
    float _654 = _626 + _652;
    bool _656 = !_618;
    int _658 = _656 ? 0 : 1;
    float _660 = float(_638);
    int _662 = abs(_658);
    float _664 = -_654;
    float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _668 = fma(_642, 0.5, 0.5);
    float _670 = abs(_666);
    float _672 = _660 * _670;
    bool _674 = _654 < 0.5;
    float _676 = float(_674);
    float _678 = -_668;
    float _680 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _682 = float(_650);
    float _684 = -_676;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _688 = float(_662);
    float _690 = fma(_682, _680, _672);
    float _692 = abs(_686);
    float _694 = fma(_688, _692, _690);
    bool _696 = !_648;
    float _712;
    if (!_696)
    {
        float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _700 = _606 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _704 = _702 * _698;
        float _706 = floor(_704);
        float _708 = -_706;
        float _710 = _704 + _708;
        _712 = _710;
        _714 = true;
    }
    else
    {
        float _716 = float(_96);
        float _718 = 1.0 / _716;
        float _720 = _130 * _718;
        _712 = _720;
    }
    _714 = false;
    float _722 = _712;
    float _724 = _606 * 2.0;
    float _726 = in.m_51.z;
    float _728 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _730 = log2(_728);
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _734 = _722 + _732;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _738 = _722 + _736;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _742 = _740 != 0;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _746 = _744 != 0;
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _750 = _748 != 0;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _754 = _722 + _752;
    float _756 = floor(_724);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _758;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _766 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _768 = _130 * _730;
    float _770 = 1.0 / _764;
    float _772 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _766);
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _774;
    bool _778 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _780 = isnan(0.0);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _786 = _782 || _784;
    float _788 = _726 * 2.0;
    bool _790 = _756 > 0.0;
    float _792 = 1.0 / _760;
    bool _794 = _756 >= 0.0;
    bool _796 = isnan(_756);
    bool _798 = _794 || _796;
    bool _800 = isnan(0.0);
    bool _802 = _798 || _800;
    float _804 = abs(_424);
    float _806 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.00166666693985462188720703125, _804);
    float _808 = in.m_51.y;
    float _810 = floor(_806);
    float _812 = _754 * _770;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _814;
    int _818 = _802 ? 0 : 1;
    float _820 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _826 = exp2(_768);
    float _828 = _734 * _792;
    float _830 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _820);
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _834 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _832;
    float _836 = fma(_816, _828, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _838 = fma(_824, _812, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _840 = 1.0 / _776;
    float _842 = -_810;
    float _844 = _806 + _842;
    float _846 = _808 * 2.0;
    float _848 = _606 + _808;
    float _850 = _808 + _726;
    int _852 = ~_818;
    int _854 = _852 + 1;
    int _856 = _854 + 1;
    float _858 = floor(_788);
    float _860 = -_826;
    float _862 = _860 + 1.0;
    float _864 = _848 + (-1.0);
    float _866 = _850 + (-1.0);
    int _868 = _856;
    if (!_790)
    {
        int _870 = ~_818;
        int _872 = _870 + 1;
        _868 = _872;
    }
    int _874 = _868;
    float _876 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _878 = floor(_846);
    float _880 = _786 ? _862 : 0.0;
    float _882 = _738 * _840;
    float _884 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _876);
    float _886 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _888 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _830);
    bool _890 = _858 > 0.0;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _892;
    bool _896 = _858 >= 0.0;
    bool _898 = isnan(_858);
    bool _900 = _896 || _898;
    bool _902 = isnan(0.0);
    bool _904 = _900 || _902;
    float _906 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _908 = _606 + _726;
    float _910 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _884);
    float _912 = _908 + (-1.0);
    float _914 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _916 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _914;
    int _918 = _904 ? 0 : 1;
    float _920 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _922;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _926;
    bool _930 = _878 > 0.0;
    float _932 = _916 * _916;
    bool _934 = _878 >= 0.0;
    bool _936 = isnan(_878);
    bool _938 = _934 || _936;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    float _944 = fma(_924, _828, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _946 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _772);
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _950 = _948 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _956 = _424 >= 0.0;
    bool _958 = isnan(_424);
    bool _960 = _956 || _958;
    bool _962 = isnan(0.0);
    bool _964 = _960 || _962;
    float _966 = float(_964);
    float _968 = fma(_928, _828, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _970 = fma(_950, _812, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _972 = fma(_834, _834, _932);
    float _974 = fma(_954, _812, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _976 = fma(_966, -3.1415927410125732421875, 3.1415927410125732421875);
    float _978 = in.m_53.x;
    float _980 = in.m_53.y;
    float _982 = in.m_53.z;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _984;
    float _988 = _976 * 0.15915493667125701904296875;
    bool _990 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _992 = isnan(1.0);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _998 = _994 || _996;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1002 = 1.0 + _1000;
    float _1004 = fma(_986, _882, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1006;
    bool _1010 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1012 = isnan(_722);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = _988 * 6.283185482025146484375;
    float _1024 = sin(_1022);
    bool _1026 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1028 = isnan(_722);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1034 = _1030 || _1032;
    float _1036 = float(_1034);
    float _1038 = fma(_1008, _882, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1040 = fma(_894, _882, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _1042 = -_1020;
    float _1044 = _1042 + 1.0;
    float _1046 = -_1036;
    float _1048 = _1046 + 1.0;
    bool _1050 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1052 = isnan(_722);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1058 = _1054 || _1056;
    float _1060 = float(_1058);
    float _1062 = _988 * 6.283185482025146484375;
    float _1064 = cos(_1062);
    float _1066 = _1036 * _1044;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1070 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1068;
    float _1072 = in.m_55.z;
    float _1074 = _1060 * _1048;
    float _1076 = -_1060;
    float _1078 = _1076 + 1.0;
    float _1080 = 1.0 / _1002;
    bool _1082 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1084 = isnan(_722);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1090 = _1086 || _1088;
    float _1092 = float(_1090);
    float _1094 = _1024 * _978;
    float _1096 = fma(_606, 800.0, (*spvDescriptorSet0.vp_c10)._m0[2].x);
    float _1098 = _1092 * _1078;
    float _1100 = _1064 * _978;
    float _1102 = fma(_1070, _1070, _972);
    float _1104 = -_1094;
    float _1106 = fma(_1064, _982, _1104);
    float _1108 = fma(_1024, _982, _1100);
    float _1110 = _944 * _1098;
    float _1112 = _836 * _1098;
    float _1114 = _968 * _1098;
    float _1116 = _880 * _1080;
    float _1118 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1120 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _1118;
    float _1122 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1124 = -_1092;
    float _1126 = _1124 + 1.0;
    float _1128 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1130 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _1128;
    float _1132 = _1120 * _1120;
    float _1134 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1136 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _1134;
    float _1138 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1122);
    float _1140 = _1096 * 0.01666666753590106964111328125;
    float _1142 = fma(_1130, _1130, _1132);
    float _1144 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1110);
    float _1146 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1112);
    float _1148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _1150 = fma(_1136, _1136, _1142);
    float _1152 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1114);
    float _1154 = _1140 * (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1156 = precise::max(_844, 0.800000011920928955078125);
    float _1158 = fma(_970, _1074, _1144);
    int _1160 = _942 ? 0 : 1;
    float _1162 = _1154 * 6.283185482025146484375;
    float _1164 = rsqrt(_1150);
    float _1166 = precise::min(_1156, 1.0);
    float _1168 = fma(_974, _1074, _1152);
    float _1170 = _1162 * 0.15915493667125701904296875;
    int _1172 = ~_1160;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    float _1178 = fma(_1004, _1066, _1158);
    float _1180 = fma(_1166, -5.000000476837158203125, 5.000000476837158203125);
    bool _1182 = !_746;
    int _1184 = _1182 ? 0 : 1;
    float _1186 = _1106 * _1148;
    int _1188 = _1176;
    if (!_930)
    {
        int _1190 = ~_1160;
        int _1192 = _1190 + 1;
        _1188 = _1192;
    }
    int _1194 = _1188;
    float _1196 = fma(_844, -2.57610607147216796875, 2.8274333477020263671875);
    int _1198 = ~_918;
    int _1200 = _1198 + 1;
    int _1202 = _1200 + 1;
    float _1204 = fma(_1040, _1066, _1168);
    int _1206 = abs(_1184);
    float _1208 = 3.1415927410125732421875 * (*spvDescriptorSet0.vp_c9)._m0[191].w;
    int _1210 = _1202;
    if (!_890)
    {
        int _1212 = ~_918;
        int _1214 = _1212 + 1;
        _1210 = _1214;
    }
    int _1216 = _1210;
    float _1218 = _1130 * _1164;
    float _1220 = _1170 * 6.283185482025146484375;
    float _1222 = sin(_1220);
    float _1224 = _1196 * 0.15915493667125701904296875;
    float _1226 = _1120 * _1164;
    float _1228 = _1136 * _1164;
    float _1230 = precise::max(0.0, _844);
    float _1232 = _1186 * 6.283185482025146484375;
    float _1234 = _1170 * 6.283185482025146484375;
    float _1236 = cos(_1234);
    float _1238 = precise::min(_1230, 0.20000000298023223876953125);
    float _1240 = _1208 * _1072;
    float _1242 = fma(_838, _1074, _1146);
    float _1244 = _1238 * 5.0;
    float _1246 = fma(_1038, _1066, _1242);
    float _1248 = _1224 * 6.283185482025146484375;
    float _1250 = sin(_1248);
    float _1252 = _1240 * 0.15915493667125701904296875;
    float _1254 = _1244 * _1180;
    float _1256 = _1222 * _980;
    float _1258 = float(_874);
    float _1260 = _1226 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1262 = float(_1206);
    float _1264 = _422 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1266 = _1236 * _980;
    float _1268 = -_1256;
    float _1270 = fma(_1108, _1236, _1268);
    float _1272 = sqrt(_1102);
    float _1274 = _1262 * _1258;
    float _1276 = fma(_1108, _1222, _1266);
    bool _1278 = !_742;
    int _1280 = _1278 ? 0 : 1;
    float _1282 = fma(_1218, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1260);
    bool _1284 = !_750;
    int _1286 = _1284 ? 0 : 1;
    float _1288 = _1250 + _1250;
    float _1290 = _1274 * (-2.0);
    float _1292 = _1224 * 6.283185482025146484375;
    float _1294 = cos(_1292);
    int _1296 = abs(_1286);
    float _1298 = -_1250;
    float _1300 = fma(_966, _1288, _1298);
    float _1302 = _1138 * 6.283185482025146484375;
    float _1304 = fma(_1254, 0.14999997615814208984375, 0.85000002384185791015625);
    int _1306 = abs(_1280);
    float _1308 = fma(_886, _1290, _886);
    float _1310 = in.m_57.x;
    float _1312 = in.m_57.y;
    float _1314 = in.m_57.z;
    float _1316 = _1302 * 0.15915493667125701904296875;
    float _1318 = _1252 * 6.283185482025146484375;
    float _1320 = cos(_1318);
    float _1322 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1324 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1264);
    float _1326 = float(_1306);
    float _1328 = fma(_1228, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1282);
    float _1330 = float(_1216);
    float _1332 = _1316 * 6.283185482025146484375;
    float _1334 = sin(_1332);
    float _1336 = float(_1296);
    float _1338 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1340 = float(_1194);
    float _1342 = _1326 * _1330;
    float _1344 = precise::max(_1272, 200.0);
    float _1346 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1348 = _1252 * 6.283185482025146484375;
    float _1350 = sin(_1348);
    float _1352 = _1336 * _1340;
    float _1354 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1178);
    float _1356 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1246);
    float _1358 = precise::min(_1344, 500.0);
    float _1360 = -_1346;
    float _1362 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1360);
    float _1364 = fma(_1290, _1312, _1312);
    float _1366 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1324);
    float _1368 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1270);
    float _1370 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1204);
    float _1372 = _1276 * _1320;
    float _1374 = sqrt(_946);
    float _1376 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1378 = fma(_1358, 0.0033333334140479564666748046875, -0.666666686534881591796875);
    float _1380 = _422 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1382 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1362);
    float _1384 = _1276 * _1350;
    float _1386 = fma(_1368, _1350, _1372);
    float _1388 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1390 = sqrt(_888);
    float _1392 = -_1384;
    float _1394 = fma(_1368, _1320, _1392);
    float _1396 = _1342 * (-2.0);
    float _1398 = -_1388;
    float _1400 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1398);
    float _1402 = -_1376;
    float _1404 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1402);
    float _1406 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1380);
    float _1408 = fma(_906, _1396, _906);
    float _1410 = fma(_1396, _1310, _1310);
    float _1412 = _422 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1414 = sqrt(_910);
    float _1416 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1400);
    float _1418 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1404);
    float _1420 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1412);
    float _1422 = -_424;
    float _1424 = _1422 + _1382;
    float _1426 = -_422;
    float _1428 = _1426 + _1416;
    float _1430 = -_410;
    float _1432 = _1430 + _1418;
    float _1434 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1420);
    float _1436 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1406);
    float _1438 = _1428 * _1374;
    float _1440 = _1432 * _1390;
    float _1442 = _1434 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1444 = in.m_49.x;
    float _1446 = in.m_49.y;
    float _1448 = in.m_49.z;
    float _1450 = fma(_1438, (*spvDescriptorSet0.vp_c10)._m0[2].w, _600);
    float _1452 = fma(_1440, (*spvDescriptorSet0.vp_c10)._m0[2].w, _602);
    float _1454 = _1440 + _1442;
    float _1456 = _1424 * _1414;
    float _1458 = _1450 * _1450;
    float _1460 = _1366 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1462 = _1232 * 0.15915493667125701904296875;
    float _1464 = fma(_1456, (*spvDescriptorSet0.vp_c10)._m0[2].w, _604);
    float _1466 = fma(_1452, _1452, _1458);
    float _1468 = _1438 + _1460;
    float _1470 = _1436 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1472 = _1352 * (-2.0);
    float _1474 = fma(_1464, _1464, _1466);
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1478 = _1468 + _1476;
    float _1480 = _1456 + _1470;
    float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1484 = _1454 + _1482;
    float _1486 = _808 + (-0.5);
    float _1488 = _1478 * _1478;
    float _1490 = rsqrt(_1474);
    float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1494 = _1480 + _1492;
    bool _1496 = !_998;
    float _1498 = _1496 ? _130 : _1116;
    float _1500 = fma(_1484, _1484, _1488);
    float _1502 = fma(_920, _1472, _920);
    float _1504 = fma(_1472, _1314, _1314);
    float _1506 = _1356 * _1446;
    float _1508 = fma(_1486, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1364);
    float _1510 = _1462 * 6.283185482025146484375;
    float _1512 = sin(_1510);
    float _1514 = _606 + (-0.5);
    float _1516 = _726 + (-0.5);
    float _1518 = fma(_1494, _1494, _1500);
    float _1520 = fma(_1498, _1308, _1508);
    float _1522 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1410);
    float _1524 = fma(_1516, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1504);
    float _1526 = _1370 * _1448;
    float _1528 = _1450 * _1490;
    float _1530 = rsqrt(_1518);
    float _1532 = _1520 * 0.15915493667125701904296875;
    float _1534 = fma(_1498, _1502, _1524);
    float _1536 = _1452 * _1490;
    float _1538 = _1528 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1540 = fma(_1498, _1408, _1522);
    float _1542 = _1394 + (-1.41421401500701904296875);
    float _1544 = _1464 * _1490;
    float _1546 = _1462 * 6.283185482025146484375;
    float _1548 = cos(_1546);
    float _1550 = fma(_1536, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1538);
    float _1552 = _1512 * _1542;
    float _1554 = _1540 * 0.15915493667125701904296875;
    float _1556 = fma(_1544, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1550);
    float _1558 = _1354 * _1444;
    float _1560 = _1478 * _1530;
    float _1562 = _1484 * _1530;
    float _1564 = abs(_1556);
    bool _1566 = _1564 > 0.99989998340606689453125;
    float _1568 = _1386 * _1304;
    float _1570 = -_1560;
    float _1572 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1478);
    float _1574 = -_1562;
    float _1576 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1484);
    float _1578 = _1552 * _1304;
    float _1580 = _1554 * 6.283185482025146484375;
    float _1582 = sin(_1580);
    float _1584 = fma(_1548, _1542, 1.41421401500701904296875);
    float _1586 = _1572 * _1572;
    float _1588 = _1494 * _1530;
    float _1590 = _1584 * _1304;
    float _1592 = fma(_1576, _1576, _1586);
    float _1594 = _1534 * 0.15915493667125701904296875;
    float _1596 = _1586;
    float _1598 = _1538;
    float _1600 = _1556;
    float _1602 = _1554;
    int _1604 = as_type<int>(_1322);
    int _1606 = as_type<int>(_1282);
    if (_1566)
    {
        _1596 = 0.001000000047497451305389404296875;
    }
    float _1608 = _1596;
    float _1610 = -_1588;
    float _1612 = fma(_1610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1494);
    if (!_1566)
    {
        _1598 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1614 = _1598;
    float _1616 = _1554 * 6.283185482025146484375;
    float _1618 = cos(_1616);
    float _1620 = _1614;
    if (!_1566)
    {
        _1600 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1622 = _1600;
    float _1624 = _1622;
    if (_1566)
    {
        float _1626 = fma(_1608, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1620 = _1626;
    }
    float _1628 = _1620;
    float _1630 = fma(_1612, _1612, _1592);
    if (_1566)
    {
        float _1632 = fma(_1608, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1624 = _1632;
    }
    float _1634 = _1624;
    bool _1636 = _1328 > 0.0;
    float _1638 = -_1628;
    float _1640 = _1544 * _1638;
    bool _1642 = _1328 >= 0.0;
    bool _1644 = isnan(_1328);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan(0.0);
    bool _1650 = _1646 || _1648;
    float _1652 = -_1634;
    float _1654 = _1528 * _1652;
    if (!_1566)
    {
        _1602 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1656 = _1602;
    float _1658 = _1656;
    if (_1566)
    {
        float _1660 = fma(_1608, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1658 = _1660;
    }
    float _1662 = _1658;
    float _1664 = -_1634;
    float _1666 = -_1640;
    float _1668 = fma(_1536, _1664, _1666);
    float _1670 = _1532 * 6.283185482025146484375;
    float _1672 = sin(_1670);
    int _1674 = _1650 ? 0 : 1;
    float _1676 = -_1662;
    float _1678 = _1536 * _1676;
    float _1680 = -_1662;
    float _1682 = -_1654;
    float _1684 = fma(_1544, _1680, _1682);
    float _1686 = _1668 * _1668;
    int _1688 = ~_1674;
    int _1690 = _1688 + 1;
    int _1692 = _1690 + 1;
    float _1694 = -_1628;
    float _1696 = -_1678;
    float _1698 = fma(_1528, _1694, _1696);
    int _1700 = _1692;
    if (!_1636)
    {
        int _1702 = ~_1674;
        int _1704 = _1702 + 1;
        _1700 = _1704;
    }
    int _1706 = _1700;
    float _1708 = fma(_1684, _1684, _1686);
    float _1710 = _1532 * 6.283185482025146484375;
    float _1712 = cos(_1710);
    float _1714 = abs(_1328);
    float _1716 = _1714 * 5.0;
    float _1718 = float(_1706);
    float _1720 = fma(_1698, _1698, _1708);
    float _1722 = _1506 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1724 = _1526 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1726 = _808 > 0.5;
    float _1728 = _1582 * _1672;
    float _1730 = _1594 * 6.283185482025146484375;
    float _1732 = cos(_1730);
    float _1734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1568);
    float _1736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1578);
    float _1738 = _1718 * _1716;
    bool _1740 = _726 > 0.5;
    float _1742 = _1378 * _1738;
    float _1744 = sqrt(_1630);
    float _1746 = _1582 * _1712;
    float _1748 = _1618 * _1712;
    float _1750 = fma(_1378, 0.5, 1.0);
    float _1752 = _1594 * 6.283185482025146484375;
    float _1754 = sin(_1752);
    float _1756 = _1712 * _1732;
    float _1758 = _1558 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1760 = _1582 * _1732;
    float _1762 = _1618 * _1672;
    float _1764 = _1618 * _1732;
    float _1766 = _1672 * _1732;
    float _1768 = rsqrt(_1720);
    float _1770 = _1530 * _1744;
    float _1772 = _1764 * _1536;
    float _1774 = _1758 * _1770;
    float _1776 = _1722 * _1770;
    float _1778 = _1724 * _1770;
    float _1780 = fma(_1754, _1748, _1728);
    float _1782 = fma(_1754, _1728, _1748);
    float _1784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1590);
    float _1786 = -_1762;
    float _1788 = fma(_1754, _1746, _1786);
    float _1790 = -_1746;
    float _1792 = fma(_1754, _1762, _1790);
    float _1794 = _1780 * _1536;
    float _1796 = _1774 * _1784;
    float _1798 = _1778 * _1736;
    float _1800 = _1684 * _1768;
    float _1802 = _1668 * _1768;
    float _1804 = _1698 * _1768;
    float _1806 = _1780 * _1544;
    float _1808 = fma(_1756, _1800, _1794);
    float _1810 = _1764 * _1544;
    float _1812 = _1536 * _1802;
    float _1814 = fma(_1756, _1804, _1806);
    float _1816 = _1528 * _1804;
    float _1818 = -_1754;
    float _1820 = fma(_1818, _1804, _1810);
    float _1822 = -_1812;
    float _1824 = fma(_1528, _1800, _1822);
    float _1826 = _1776 * _1734;
    float _1828 = _1792 * _1536;
    float _1830 = -_1754;
    float _1832 = fma(_1830, _1800, _1772);
    float _1834 = -_1816;
    float _1836 = fma(_1544, _1802, _1834);
    float _1838 = _1792 * _1544;
    float _1840 = fma(_1760, _1824, _1820);
    float _1842 = fma(_1766, _1800, _1828);
    float _1844 = fma(_1760, _1836, _1832);
    float _1846 = fma(_1766, _1804, _1838);
    float _1848 = fma(_1788, _1824, _1814);
    float _1850 = _1826 * _1840;
    float _1852 = fma(_1788, _1836, _1808);
    float _1854 = _1826 * _1844;
    float _1856 = fma(_1782, _1824, _1846);
    float _1858 = fma(_1796, _1848, _1850);
    float _1860 = fma(_1782, _1836, _1842);
    float _1862 = fma(_1796, _1852, _1854);
    float _1864 = _1780 * _1528;
    float _1866 = fma(_1798, _1856, _1858);
    float _1868 = _1792 * _1528;
    float _1870 = fma(_1798, _1860, _1862);
    float _1872 = fma(_1756, _1802, _1864);
    float _1874 = _1480 + _1866;
    float _1876 = _1764 * _1528;
    float _1878 = _1454 + _1870;
    float _1880 = fma(_1766, _1802, _1868);
    float _1882 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1884 = _1874 + _1882;
    float _1886 = _1544 * _1800;
    float _1888 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1890 = _1878 + _1888;
    float _1892 = -_1754;
    float _1894 = fma(_1892, _1802, _1876);
    float _1896 = fma(_1884, _1750, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1898 = -_1886;
    float _1900 = fma(_1536, _1804, _1898);
    float _1902 = fma(_1890, _1750, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1904 = fma(_1742, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1896);
    float _1906 = fma(_1760, _1900, _1894);
    float _1908 = fma(_1742, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1902);
    float _1910 = in.m_59.y;
    float _1912 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1914 = _1904 + _1912;
    float _1916 = fma(_1788, _1900, _1872);
    float _1918 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1920 = _1908 + _1918;
    float _1922 = _1826 * _1906;
    float _1924 = _1914 * _1914;
    float _1926 = fma(_1782, _1900, _1880);
    float _1928 = fma(_1796, _1916, _1922);
    float _1930 = fma(_1920, _1920, _1924);
    float _1932 = in.m_51.w;
    float _1934 = fma(_1798, _1926, _1928);
    float _1936 = sqrt(_1930);
    int _1938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1940 = _1938 != 0;
    float _1942 = _1468 + _1934;
    int _1944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1946 = _1944 != 0;
    int _1948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1950 = _1948 != 0;
    float _1952 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1954 = _1942 + _1952;
    float _1956 = fma(_1954, _1750, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1958 = -_1910;
    float _1960 = _1958 + 1.0;
    float _1962 = fma(_1742, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1956);
    bool _1964 = _1936 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1966 = _1726 ? _1960 : _1910;
    int _1968 = _1740 ? as_type<int>(_1960) : as_type<int>(_1910);
    bool _1970 = _1932 > 0.5;
    float _1972 = _1946 ? _1966 : _1910;
    float _1974 = _1950 ? as_type<float>(_1968) : _1910;
    float _1976 = _1910;
    float _1978 = _1960;
    float _1980 = _1932;
    float _1982 = _1908;
    float _1984 = _1966;
    float _1986 = _1930;
    if (_1940)
    {
        float _1988 = _1970 ? _1960 : _1910;
        _1976 = _1988;
    }
    float _1990 = _1976;
    if (!_1964)
    {
        _1978 = _1904;
    }
    float _1992 = _1978;
    float _1994 = _1992;
    if (!_1964)
    {
        _1980 = _1962;
    }
    float _1996 = _1980;
    bool _1998 = !_1964;
    float _2000 = _1996;
    if (!_1998)
    {
        float _2002 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2004 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2006 = _1936 + _2004;
        float _2008 = _1962 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2010 = rsqrt(_1930);
        float _2012 = _2006 * _2002;
        float _2014 = _2012 * 0.15915493667125701904296875;
        float _2016 = _2014 * 6.283185482025146484375;
        float _2018 = sin(_2016);
        float _2020 = _2014 * 6.283185482025146484375;
        float _2022 = cos(_2020);
        float _2024 = fma(_2018, _2008, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2026 = _2010 * _2024;
        float _2028 = _2022 + (-1.0);
        float _2030 = fma(_1920, _2026, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2032 = fma(_1914, _2026, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2034 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2036 = fma(_1962, _2022, _2034);
        _2000 = _2036;
        _1982 = _2030;
        _1994 = _2032;
        _1984 = _2014;
    }
    float _2038 = _2000;
    float _2040 = _1982;
    float _2042 = _1994;
    float _2044 = _1984;
    float _2046 = -_1560;
    float _2048 = fma(_2046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2038);
    float _2050 = -_1562;
    float _2052 = fma(_2050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2040);
    float _2054 = -_1588;
    float _2056 = fma(_2054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2042);
    float _2058 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2060 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2062 = _2048 + _2060;
    float _2064 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2066 = _2052 + _2064;
    float _2068 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2070 = _2056 + _2068;
    float _2072 = _2062 * _2062;
    float _2074 = fma(_2066, _2066, _2072);
    float _2076 = fma(_2070, _2070, _2074);
    float _2078 = rsqrt(_2076);
    float _2080 = _2078 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2082 = _2066 * _2080;
    float _2084 = _2070 * _2080;
    float _2086 = _2082 * _2082;
    float _2088 = _2084 * _2084;
    float _2090 = _2086 + _2088;
    float _2092 = sqrt(_2090);
    bool _2094 = _2092 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2096 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2098 = _2092 + _2096;
    float _2100 = _2078;
    float _2102 = _2044;
    float _2104 = _2098;
    float _2106 = _2062;
    float _2108 = _2090;
    float _2110 = _2058;
    float _2112 = _2082;
    if (_2094)
    {
        float _2114 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2100 = _2114;
    }
    float _2116 = _2100;
    if (_2094)
    {
        float _2118 = rsqrt(_2090);
        _2102 = _2118;
    }
    float _2120 = _2102;
    if (_2094)
    {
        float _2122 = _2098 * _2116;
        _2104 = _2122;
    }
    float _2124 = _2104;
    if (_2094)
    {
        float _2126 = _2124 * 0.15915493667125701904296875;
        _1986 = _2126;
    }
    float _2128 = _1986;
    float _2130 = precise::max(0.0, _2058);
    float _2132 = _2116;
    float _2134 = _2130;
    if (_2094)
    {
        float _2136 = _2128 * 6.283185482025146484375;
        float _2138 = sin(_2136);
        _2132 = _2138;
    }
    float _2140 = _2132;
    float _2142 = -_2080;
    float _2144 = -_2130;
    float _2146 = fma(_2062, _2142, _2144);
    if (!_2094)
    {
        _2106 = _2082;
    }
    float _2148 = _2106;
    float _2150 = _2148;
    if (_2094)
    {
        float _2152 = _2146 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2134 = _2152;
    }
    float _2154 = _2134;
    float _2156 = _2070;
    float _2158 = _2154;
    if (_2094)
    {
        float _2160 = _2128 * 6.283185482025146484375;
        float _2162 = cos(_2160);
        _2156 = _2162;
    }
    float _2164 = _2156;
    float _2166 = _2140;
    if (_2094)
    {
        float _2168 = fma(_2140, _2154, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2166 = _2168;
    }
    float _2170 = _2166;
    float _2172 = _2170;
    if (!_2094)
    {
        _2158 = _2146;
    }
    float _2174 = _2158;
    float _2176 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2178 = _2174;
    if (_2094)
    {
        float _2180 = _2120 * _2170;
        _2108 = _2180;
    }
    float _2182 = _2108;
    if (!_2094)
    {
        _2172 = _2086;
    }
    float _2184 = _2172;
    float _2186 = sqrt(_2076);
    float _2188 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2176);
    float _2190 = _2184;
    float _2192 = _2164;
    if (_2094)
    {
        float _2194 = _2164 + (-1.0);
        _2110 = _2194;
    }
    float _2196 = _2110;
    float _2198 = _2196;
    if (_2094)
    {
        float _2200 = _2082 * _2182;
        _2150 = _2200;
    }
    float _2202 = _2150;
    if (_2094)
    {
        float _2204 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2112 = _2204;
    }
    float _2206 = _2112;
    if (!_2094)
    {
        _2198 = _2084;
    }
    float _2208 = _2198;
    float _2210 = _2208;
    if (_2094)
    {
        float _2212 = _2084 * _2182;
        _2210 = _2212;
    }
    float _2214 = _2210;
    if (_2094)
    {
        float _2216 = _2202 * _2202;
        _2190 = _2216;
    }
    float _2218 = _2190;
    if (_2094)
    {
        float _2220 = fma(_2146, _2164, _2206);
        _2178 = _2220;
    }
    float _2222 = _2178;
    if (!_2094)
    {
        _2192 = _2088;
    }
    float _2224 = _2192;
    float _2226 = _2224;
    if (_2094)
    {
        float _2228 = _2214 * _2214;
        _2226 = _2228;
    }
    float _2230 = _2226;
    float _2232 = fma(_2222, _2222, _2218);
    float _2234 = _2232 + _2230;
    float _2236 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2238 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2240 = fma(_2186, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2238);
    float _2242 = precise::clamp(_2240, 0.0, 1.0);
    float _2244 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2246 = rsqrt(_2234);
    float _2248 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2236);
    float _2250 = -_2242;
    float _2252 = _2250 + 1.0;
    float _2254 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2244);
    float _2256 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2258 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2248);
    float _2260 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2262 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2254);
    float _2264 = abs(_2252);
    float _2266 = log2(_2264);
    float _2268 = _2258 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2270 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2260);
    float _2272 = _2262 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2274 = _2268 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2276 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2270);
    float _2278 = _2246 * _2202;
    float _2280 = -_2274;
    float _2282 = fma(_2280, _2256, 1.0);
    float _2284 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2188);
    float _2286 = _2276 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2288 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2290 = _2246 * _2222;
    float _2292 = _2278 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2294 = _2246 * _2214;
    float _2296 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2288);
    float _2298 = _2284 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2300 = -_2292;
    float _2302 = fma(_2290, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2300);
    float _2304 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2306 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2296);
    float _2308 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2310 = -_2294;
    float _2312 = fma(_2310, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2302);
    float _2314 = log2(_2282);
    float _2316 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2306);
    float _2318 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2320 = fma(_2312, -0.5, 0.5);
    float _2322 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2308);
    float _2324 = fma(_2312, 0.5, 0.5);
    float _2326 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2318);
    float _2328 = _2290 + 1.0;
    float _2330 = 1.0 / _2316;
    float _2332 = fma(_2324, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2334 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2326);
    float _2336 = fma(_2324, _2332, -0.212114393711090087890625);
    float _2338 = exp2(_2304);
    float _2340 = _2314 * 0.693147182464599609375;
    float _2342 = fma(_2324, _2336, 1.570728778839111328125);
    float _2344 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2346 = sqrt(_2320);
    float _2348 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2322);
    float _2350 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2334);
    float _2352 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2348);
    float _2354 = -_2290;
    float _2356 = fma(_2338, _2328, _2354);
    float _2358 = _2352 * _2330;
    float _2360 = _2350 * _2330;
    float _2362 = fma(_2360, 0.5, 0.5);
    float _2364 = _2346 * 0.636619746685028076171875;
    float _2366 = fma(_2358, -0.5, 0.5);
    float _2368 = fma(_2356, 0.5, 0.5);
    float _2370 = -_2342;
    float _2372 = fma(_2364, _2370, 1.0);
    float3 _6506 = float3(_2362, _2366, _2344);
    float _2374 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6506, float3(0.0), isnan(_6506)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6506, float3(0.0), isnan(_6506)), level(0.0)).x;
    float3 _6517 = float3(_2362, _2366, _2344);
    float4 _2377 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6517, float3(0.0), isnan(_6517)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6517, float3(0.0), isnan(_6517)), level(0.0)).xyzw;
    float _2379 = _2377.x;
    float _2381 = _2377.y;
    float _2383 = _2377.z;
    float _2385 = _2377.w;
    float2 _6534 = float2(_2372, _2368);
    float3 _2389 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6534, float2(0.0), isnan(_6534)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6534, float2(0.0), isnan(_6534)), level(0.0)).xyz;
    float _2391 = _2389.x;
    float _2393 = _2389.y;
    float _2395 = _2389.z;
    float _2397 = in.m_59.x;
    float _2399 = -_1560;
    float _2401 = fma(_2399, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1468);
    int _2403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2405 = _2403 != 0;
    out.m_61.z = _1072;
    int _2407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2409 = _2407 != 0;
    float _2411 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2415 = _2413 != 0;
    float _2417 = _808 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2421 = _2419 != 0;
    float _2423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2425 = fma(_2417, -2.0, _2411);
    float _2427 = _606 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2429 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2431 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2433 = (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2435 = _2427;
    float _2437 = (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2439 = _2405;
    if (!_2405)
    {
        _2433 = _726;
    }
    float _2441 = _2433;
    float _2443 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2445 = -_2429;
    float _2447 = fma(_2427, 2.0, _2445);
    bool _2449 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2451 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2453 = _2449 || _2451;
    bool _2455 = isnan(0.5);
    bool _2457 = _2453 || _2455;
    out.m_63.w = _2431;
    float _2459 = _2441;
    if (!_2405)
    {
        _2435 = _726;
    }
    float _2461 = _2435;
    float _2463 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2443);
    float _2465 = -_1588;
    float _2467 = fma(_2465, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1480);
    float _2469 = _2461;
    if (!_2405)
    {
        _2437 = _808;
    }
    float _2471 = _2437;
    float _2473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2475 = _2471;
    if (_2405)
    {
        _2469 = _808;
    }
    float _2477 = _2469;
    float _2479 = -_1562;
    float _2481 = fma(_2479, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1454);
    if (_2405)
    {
        _2459 = _808;
    }
    float _2483 = _2459;
    float _2485 = _2401 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2487 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2489 = _2485;
    if (_2405)
    {
        _2475 = _606;
    }
    float _2491 = _2475;
    float _2493 = fma(_2481, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2485);
    if (_2409)
    {
        bool _2495 = _606 > 0.5;
        _2439 = _2495;
    }
    bool _2497 = _2439;
    float _2499 = (*spvDescriptorSet0.vp_c9)._m0[83].y + (*spvDescriptorSet0.vp_c9)._m0[83].w;
    float _2501 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2487);
    float _2503 = fma(_2467, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2493);
    float _2505 = _2423 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2507 = _2505;
    if (!_2409)
    {
        _2489 = _2397;
    }
    float _2509 = _2489;
    float _2511 = fma(_2483, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2499);
    float _2513 = _2503 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2515 = _2401 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2517 = fma(_2505, _1972, -0.5);
    float _2519 = _2509;
    if (!_2409)
    {
        _2507 = _2509;
    }
    float _2521 = _2507;
    float _2523 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2425);
    float _2525 = _2521;
    if (_2409)
    {
        _2519 = _2397;
    }
    float _2527 = _2519;
    float _2529 = fma(_2481, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2515);
    float _2531 = 1.0 / _2513;
    float _2533 = _2473 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2535 = fma(_2467, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2529);
    float _2537 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2463);
    float _2539 = (*spvDescriptorSet0.vp_c9)._m0[83].x + (*spvDescriptorSet0.vp_c9)._m0[83].z;
    float _2541 = _2535 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2543 = _2477 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2545 = (*spvDescriptorSet0.vp_c9)._m0[81].w + (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2547 = fma(_2491, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2539);
    float _2549 = _2541 + _2513;
    float _2551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2553 = -_2523;
    float _2555 = fma(_2537, _2517, _2553);
    float _2557 = fma(_2533, _1990, -0.5);
    float _2559 = fma(_2543, -2.0, _2545);
    float _2561 = _2549 * _2531;
    float _2563 = _2561 * 0.5;
    float _2565 = _2491 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2569 = (*spvDescriptorSet0.vp_c9)._m0[81].z + (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[83].x);
    float _2573 = _2565;
    float _2575 = _2545;
    if (_2409)
    {
        float _2577 = -_2527;
        float _2579 = _2577 + 1.0;
        _2571 = as_type<int>(_2579);
    }
    int _2581 = _2571;
    float _2583 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2585 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2583);
    if (_2415)
    {
        float _2587 = -_2527;
        float _2589 = _2587 + 1.0;
        _1604 = as_type<int>(_2589);
    }
    int _2591 = _1604;
    if (_2421)
    {
        float _2593 = -_2527;
        float _2595 = _2593 + 1.0;
        _1606 = as_type<int>(_2595);
    }
    int _2597 = _1606;
    float _2599 = -_2569;
    float _2601 = fma(_2565, 2.0, _2599);
    if (!_2415)
    {
        _2573 = _2527;
    }
    float _2603 = _2573;
    float _2605 = _2551 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2607 = _2603;
    if (!_2421)
    {
        _2575 = _2527;
    }
    float _2609 = _2575;
    float _2611 = 1.0 / _2585;
    float _2613 = _2609;
    if (_2409)
    {
        float _2615 = _2497 ? as_type<float>(_2581) : _2527;
        _2525 = _2615;
    }
    float _2617 = _2525;
    float _2619 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2547);
    if (_2415)
    {
        float _2621 = _1740 ? as_type<float>(_2591) : _2527;
        _2607 = _2621;
    }
    float _2623 = _2607;
    float _2625 = -_130;
    float _2627 = fma(_2625, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2601);
    if (_2421)
    {
        float _2629 = _1726 ? as_type<float>(_2597) : _2527;
        _2613 = _2629;
    }
    float _2631 = _2613;
    float _2633 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2501);
    float _2635 = -_130;
    float _2637 = fma(_2635, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2447);
    float _2639 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2511);
    float _2641 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2559);
    float _2643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _2645 = _2567 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2647 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2649 = fma(_2605, _2623, -0.5);
    float _2651 = -_2641;
    float _2653 = fma(_2557, _2639, _2651);
    float _2655 = fma(_2645, _2617, -0.5);
    float _2657 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2647);
    float _2659 = _2639;
    float _2661 = _2655;
    if (_2457)
    {
        _2659 = 1.0;
    }
    float _2663 = _2659;
    float _2665 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _2667 = fma(_2633, _2655, _2637);
    float _2669 = fma(_2619, _2649, _2627);
    float _2671 = _2663;
    if (_2457)
    {
        _2661 = 1.0;
    }
    float _2673 = _2661;
    float _2675 = _1974 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2677 = _2631 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2679 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2681 = _2611 * _2679;
    float _2683 = _2673;
    if (!_2457)
    {
        float _2685 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2687 = _2685 * 0.15915493667125701904296875;
        float _2689 = _2687 * 6.283185482025146484375;
        float _2691 = cos(_2689);
        float _2693 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2695 = _2693 * 0.15915493667125701904296875;
        float _2697 = _2687 * 6.283185482025146484375;
        float _2699 = sin(_2697);
        float _2701 = 1.0 / _2691;
        float _2703 = _2695 * 6.283185482025146484375;
        float _2705 = cos(_2703);
        float _2707 = _2699 * _2701;
        float _2709 = _2695 * 6.283185482025146484375;
        float _2711 = sin(_2709);
        float _2713 = _2705 * _2707;
        float _2715 = 1.0 / _2713;
        float _2717 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2719 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2717;
        float _2721 = 1.0 / _2719;
        float _2723 = _2711 * _2715;
        float _2725 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2727 = fma(_2681, _2723, _2725);
        float _2729 = _2727 * _2721;
        float _2731 = precise::clamp(_2729, 0.0, 1.0);
        _2671 = _2731;
    }
    float _2733 = _2671;
    if (!_2457)
    {
        float _2735 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2737 = _2735 * 0.15915493667125701904296875;
        float _2739 = _2737 * 6.283185482025146484375;
        float _2741 = cos(_2739);
        float _2743 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2745 = _2743 * 0.15915493667125701904296875;
        float _2747 = _2737 * 6.283185482025146484375;
        float _2749 = sin(_2747);
        float _2751 = 1.0 / _2741;
        float _2753 = _2745 * 6.283185482025146484375;
        float _2755 = cos(_2753);
        float _2757 = _2749 * _2751;
        float _2759 = _2745 * 6.283185482025146484375;
        float _2761 = sin(_2759);
        float _2763 = _2755 * _2757;
        float _2765 = 1.0 / _2763;
        float _2767 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2769 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2767;
        float _2771 = 1.0 / _2769;
        float _2773 = _2761 * _2765;
        float _2775 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2777 = fma(_2681, _2773, _2775);
        float _2779 = _2777 * _2771;
        float _2781 = precise::clamp(_2779, 0.0, 1.0);
        float _2783 = -_2781;
        float _2785 = _2783 + 1.0;
        _2683 = _2785;
    }
    float _2787 = _2683;
    float _2789 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2657);
    float _2791 = _2677 * _2665;
    float _2793 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2795 = _2733 * _2787;
    float _2797 = _2675 * _2643;
    float _2799 = _2667 + 0.5;
    bool _2801 = _2733 > 0.0;
    bool _2803 = isnan(_2733);
    bool _2805 = _2801 || _2803;
    bool _2807 = isnan(0.0);
    bool _2809 = _2805 || _2807;
    float _2811 = _2795 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2813 = exp2(_2793);
    out.m_65.x = _2481;
    out.m_65.y = _2401;
    out.m_65.z = _2467;
    float _2815 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2789);
    float _2817 = _694 * _2811;
    bool _2819 = _2787 <= 0.0;
    bool _2821 = !_2809;
    bool _2823 = _2819 || _2821;
    float _2825 = _2653 + 0.5;
    float _2827 = _2815 + _2316;
    float _2829 = _2817 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2831 = _2350 + _2316;
    float _2833 = _2316 * 0.5;
    out.m_67.x = _2052;
    out.m_67.y = _2048;
    out.m_67.z = _2056;
    float _2835 = _2555 + 0.5;
    float _2837 = _2669 + 0.5;
    out.m_45.x = _2829;
    float _2839 = _2827 * 0.5;
    float _2841 = -_2813;
    float _2843 = _2841 + 1.0;
    float _2845 = _2831 * 0.5;
    float _2847 = fma(_2352, -0.5, _2833);
    out.m_69.y = _844;
    float _2849 = _2843 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.x = _2791;
    out.m_71.y = _2797;
    float _2851 = _2849 * _2374;
    float _2853 = -_2849;
    float _2855 = _2853 + 1.0;
    out.m_73.x = _2799;
    out.m_73.y = _2835;
    out.m_73.z = _2837;
    out.m_73.w = _2825;
    float _2857 = _2385 * _2851;
    float _2859 = _2395 * _2851;
    float _2861 = _2385 * _2855;
    float _2863 = fma(_2391, _2857, _2379);
    float _2865 = fma(_2393, _2857, _2381);
    float _2867 = fma(_2385, _2859, _2383);
    out.gl_Position.x = _2350;
    out.gl_Position.y = _2352;
    out.gl_Position.z = _2815;
    out.gl_Position.w = _2316;
    out.m_75.x = _2845;
    out.m_75.y = _2847;
    out.m_75.z = _2839;
    out.m_75.w = _2316;
    out.m_77.x = _2863;
    out.m_77.y = _2865;
    out.m_77.z = _2867;
    out.m_77.w = _2861;
    if (!_2823)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2869 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2869;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _714 = false;
    bool _478 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2926 = as_type<float>(_112);
        out.gl_Position.z = _2926;
    }
    if (!_100)
    {
        return out;
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = 0.0;
    float _134 = 0.0;
    if (_126)
    {
        float _136 = float(_96);
        _106 = _136;
    }
    float _138 = _106;
    bool _140 = _130 >= _138;
    bool _142 = !_126;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _114 = as_type<int>(_150);
    }
    int _152 = _114;
    float _154 = as_type<float>(_152);
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2997 = as_type<float>(_152);
        out.gl_Position.z = _2997;
    }
    if (_144)
    {
        return out;
    }
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
        float _186 = _130 * _130;
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
        _132 = _218;
        _198 = _228;
        _134 = _216;
    }
    float _230 = _132;
    float _232 = _198;
    float _234 = _134;
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
        _268 = _130;
    }
    float _272 = _268;
    float _274 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
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
        float _296 = _130 * _288;
        float _298 = 1.0 / _292;
        float _300 = _294 * 0.693147182464599609375;
        float _302 = exp2(_296);
        float _304 = 1.0 / _300;
        float _306 = _302 + (-1.0);
        float _308 = -_306;
        float _310 = fma(_308, _304, _130);
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
        float _330 = _130 * _322;
        float _332 = exp2(_330);
        float _334 = -_332;
        float _336 = _334 + 1.0;
        float _338 = _336 * _328;
        _276 = _338;
    }
    float _340 = _276;
    float _342 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _344 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _346 = fma(_266, _158, _274);
    float _348 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _350 = fma(_340, _158, _342);
    float _352 = fma(_266, _156, _344);
    float _354 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _356 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _358 = fma(_340, _156, _348);
    float _360 = -_350;
    float _362 = _346 + _360;
    float _364 = fma(_266, _160, _354);
    float _366 = fma(_340, _160, _356);
    float _368 = -_358;
    float _370 = _352 + _368;
    float _372 = _362 * _362;
    float _374 = in.m_49.w;
    float _376 = -_366;
    float _378 = _364 + _376;
    float _380 = _362 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _382 = fma(_370, _370, _372);
    float _384 = in.m_42.x;
    float _386 = in.m_42.y;
    float _388 = in.m_42.z;
    float _390 = _362 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _392 = _362 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _394 = fma(_378, _378, _382);
    float _396 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[5].x, _380);
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[4].x, _390);
    float _400 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[6].x, _392);
    float _402 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[5].z, _396);
    float _404 = sqrt(_394);
    float _406 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].z, _398);
    float _408 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[6].z, _400);
    float _410 = fma(_352, _374, _384);
    bool _412 = _404 >= 9.9999999747524270787835121154785e-07;
    bool _414 = isnan(_404);
    bool _416 = _412 || _414;
    bool _418 = isnan(9.9999999747524270787835121154785e-07);
    bool _420 = _416 || _418;
    float _422 = fma(_346, _374, _386);
    float _424 = fma(_364, _374, _388);
    float _426 = _352;
    float _428 = _374;
    float _430 = _408;
    if (_420)
    {
        _426 = _406;
    }
    float _432 = _426;
    float _434 = _432;
    if (_420)
    {
        _428 = _402;
    }
    float _436 = _428;
    float _438 = _436;
    if (!_420)
    {
        bool _440 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _442 = !_440;
        if (!_442)
        {
            float _444 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _446 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _448 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _450 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _444);
            float _452 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _446);
            float _454 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _448);
            float _456 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _450);
            float _458 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _452);
            float _460 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _454);
            float _462 = _456 * _456;
            float _464 = fma(_458, _458, _462);
            float _466 = fma(_460, _460, _464);
            float _468 = rsqrt(_466);
            float _470 = _468 * 9.9999999747524270787835121154785e-07;
            float _472 = _458 * _470;
            float _474 = _456 * _470;
            float _476 = _460 * _470;
            _438 = _474;
            _434 = _472;
            _430 = _476;
            _478 = true;
        }
        else
        {
            float _480 = _158 * _158;
            float _482 = fma(_156, _156, _480);
            float _484 = fma(_160, _160, _482);
            float _486 = sqrt(_484);
            bool _488 = _486 >= 9.9999999747524270787835121154785e-07;
            bool _490 = isnan(_486);
            bool _492 = _488 || _490;
            bool _494 = isnan(9.9999999747524270787835121154785e-07);
            bool _496 = _492 || _494;
            if (!_496)
            {
                float _498 = _386 * _386;
                float _500 = fma(_384, _384, _498);
                float _502 = fma(_388, _388, _500);
                float _504 = sqrt(_502);
                bool _506 = _504 >= 9.9999999747524270787835121154785e-07;
                bool _508 = isnan(_504);
                bool _510 = _506 || _508;
                bool _512 = isnan(9.9999999747524270787835121154785e-07);
                bool _514 = _510 || _512;
                if (!_514)
                {
                    float _516 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _518 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _516);
                    float _520 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _518);
                    float _522 = rsqrt(_520);
                    float _524 = _522 * 9.9999999747524270787835121154785e-07;
                    float _526 = _524 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _528 = _524 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _530 = _524 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _438 = _528;
                    _434 = _526;
                    _430 = _530;
                    _478 = true;
                }
                else
                {
                    float _532 = _386 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _534 = _386 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _536 = _386 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _538 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[5].x, _532);
                    float _540 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[4].x, _534);
                    float _542 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[6].x, _536);
                    float _544 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].z, _538);
                    float _546 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].z, _540);
                    float _548 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].z, _542);
                    float _550 = _544 * _544;
                    float _552 = fma(_546, _546, _550);
                    float _554 = fma(_548, _548, _552);
                    float _556 = rsqrt(_554);
                    float _558 = _556 * 9.9999999747524270787835121154785e-07;
                    float _560 = _546 * _558;
                    float _562 = _544 * _558;
                    float _564 = _548 * _558;
                    _438 = _562;
                    _434 = _560;
                    _430 = _564;
                    _478 = true;
                }
            }
            else
            {
                float _566 = _158 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _568 = _158 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _570 = _158 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _572 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[5].x, _566);
                float _574 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[4].x, _568);
                float _576 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[6].x, _570);
                float _578 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[5].z, _572);
                float _580 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[4].z, _574);
                float _582 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[6].z, _576);
                float _584 = _578 * _578;
                float _586 = fma(_580, _580, _584);
                float _588 = fma(_582, _582, _586);
                float _590 = rsqrt(_588);
                float _592 = _590 * 9.9999999747524270787835121154785e-07;
                float _594 = _580 * _592;
                float _596 = _578 * _592;
                float _598 = _582 * _592;
                _438 = _596;
                _434 = _594;
                _430 = _598;
            }
        }
    }
    _478 = false;
    float _600 = _438;
    float _602 = _434;
    float _604 = _430;
    float _606 = in.m_51.x;
    float _608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _610 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _618 = _616 != 0;
    int _620 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _622 = _620 != 0;
    float _624 = _610 * _608;
    float _626 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[20].x, _624);
    float _628 = _626 * 6.283185482025146484375;
    float _630 = floor(_626);
    float _632 = _628 * 0.15915493667125701904296875;
    bool _634 = !_614;
    int _636 = _634 ? 0 : 1;
    int _638 = abs(_636);
    float _640 = _632 * 6.283185482025146484375;
    float _642 = cos(_640);
    bool _644 = !_622;
    int _646 = _644 ? 0 : 1;
    bool _648 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _650 = abs(_646);
    float _652 = -_630;
    float _654 = _626 + _652;
    bool _656 = !_618;
    int _658 = _656 ? 0 : 1;
    float _660 = float(_638);
    int _662 = abs(_658);
    float _664 = -_654;
    float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _668 = fma(_642, 0.5, 0.5);
    float _670 = abs(_666);
    float _672 = _660 * _670;
    bool _674 = _654 < 0.5;
    float _676 = float(_674);
    float _678 = -_668;
    float _680 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _682 = float(_650);
    float _684 = -_676;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _688 = float(_662);
    float _690 = fma(_682, _680, _672);
    float _692 = abs(_686);
    float _694 = fma(_688, _692, _690);
    bool _696 = !_648;
    float _712;
    if (!_696)
    {
        float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _700 = _606 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _704 = _702 * _698;
        float _706 = floor(_704);
        float _708 = -_706;
        float _710 = _704 + _708;
        _712 = _710;
        _714 = true;
    }
    else
    {
        float _716 = float(_96);
        float _718 = 1.0 / _716;
        float _720 = _130 * _718;
        _712 = _720;
    }
    _714 = false;
    float _722 = _712;
    float _724 = _606 * 2.0;
    float _726 = in.m_51.z;
    float _728 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _730 = log2(_728);
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _734 = _722 + _732;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _738 = _722 + _736;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _742 = _740 != 0;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _746 = _744 != 0;
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _750 = _748 != 0;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _754 = _722 + _752;
    float _756 = floor(_724);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _758;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _766 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _768 = _130 * _730;
    float _770 = 1.0 / _764;
    float _772 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _766);
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _774;
    bool _778 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _780 = isnan(0.0);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _786 = _782 || _784;
    float _788 = _726 * 2.0;
    bool _790 = _756 > 0.0;
    float _792 = 1.0 / _760;
    bool _794 = _756 >= 0.0;
    bool _796 = isnan(_756);
    bool _798 = _794 || _796;
    bool _800 = isnan(0.0);
    bool _802 = _798 || _800;
    float _804 = abs(_424);
    float _806 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.00166666693985462188720703125, _804);
    float _808 = in.m_51.y;
    float _810 = floor(_806);
    float _812 = _754 * _770;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _814;
    int _818 = _802 ? 0 : 1;
    float _820 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _826 = exp2(_768);
    float _828 = _734 * _792;
    float _830 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _820);
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _834 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _832;
    float _836 = fma(_816, _828, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _838 = fma(_824, _812, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _840 = 1.0 / _776;
    float _842 = -_810;
    float _844 = _806 + _842;
    float _846 = _808 * 2.0;
    float _848 = _606 + _808;
    float _850 = _808 + _726;
    int _852 = ~_818;
    int _854 = _852 + 1;
    int _856 = _854 + 1;
    float _858 = floor(_788);
    float _860 = -_826;
    float _862 = _860 + 1.0;
    float _864 = _848 + (-1.0);
    float _866 = _850 + (-1.0);
    int _868 = _856;
    if (!_790)
    {
        int _870 = ~_818;
        int _872 = _870 + 1;
        _868 = _872;
    }
    int _874 = _868;
    float _876 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _878 = floor(_846);
    float _880 = _786 ? _862 : 0.0;
    float _882 = _738 * _840;
    float _884 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _876);
    float _886 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _888 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _830);
    bool _890 = _858 > 0.0;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _892;
    bool _896 = _858 >= 0.0;
    bool _898 = isnan(_858);
    bool _900 = _896 || _898;
    bool _902 = isnan(0.0);
    bool _904 = _900 || _902;
    float _906 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _908 = _606 + _726;
    float _910 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _884);
    float _912 = _908 + (-1.0);
    float _914 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _916 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _914;
    int _918 = _904 ? 0 : 1;
    float _920 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _922;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _926;
    bool _930 = _878 > 0.0;
    float _932 = _916 * _916;
    bool _934 = _878 >= 0.0;
    bool _936 = isnan(_878);
    bool _938 = _934 || _936;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    float _944 = fma(_924, _828, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _946 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _772);
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _950 = _948 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _956 = _424 >= 0.0;
    bool _958 = isnan(_424);
    bool _960 = _956 || _958;
    bool _962 = isnan(0.0);
    bool _964 = _960 || _962;
    float _966 = float(_964);
    float _968 = fma(_928, _828, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _970 = fma(_950, _812, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _972 = fma(_834, _834, _932);
    float _974 = fma(_954, _812, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _976 = fma(_966, -3.1415927410125732421875, 3.1415927410125732421875);
    float _978 = in.m_53.x;
    float _980 = in.m_53.y;
    float _982 = in.m_53.z;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _984;
    float _988 = _976 * 0.15915493667125701904296875;
    bool _990 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _992 = isnan(1.0);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _998 = _994 || _996;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1002 = 1.0 + _1000;
    float _1004 = fma(_986, _882, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1006;
    bool _1010 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1012 = isnan(_722);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = _988 * 6.283185482025146484375;
    float _1024 = sin(_1022);
    bool _1026 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1028 = isnan(_722);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1034 = _1030 || _1032;
    float _1036 = float(_1034);
    float _1038 = fma(_1008, _882, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1040 = fma(_894, _882, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _1042 = -_1020;
    float _1044 = _1042 + 1.0;
    float _1046 = -_1036;
    float _1048 = _1046 + 1.0;
    bool _1050 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1052 = isnan(_722);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1058 = _1054 || _1056;
    float _1060 = float(_1058);
    float _1062 = _988 * 6.283185482025146484375;
    float _1064 = cos(_1062);
    float _1066 = _1036 * _1044;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1070 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1068;
    float _1072 = in.m_55.z;
    float _1074 = _1060 * _1048;
    float _1076 = -_1060;
    float _1078 = _1076 + 1.0;
    float _1080 = 1.0 / _1002;
    bool _1082 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1084 = isnan(_722);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1090 = _1086 || _1088;
    float _1092 = float(_1090);
    float _1094 = _1024 * _978;
    float _1096 = fma(_606, 800.0, (*spvDescriptorSet0.vp_c10)._m0[2].x);
    float _1098 = _1092 * _1078;
    float _1100 = _1064 * _978;
    float _1102 = fma(_1070, _1070, _972);
    float _1104 = -_1094;
    float _1106 = fma(_1064, _982, _1104);
    float _1108 = fma(_1024, _982, _1100);
    float _1110 = _944 * _1098;
    float _1112 = _836 * _1098;
    float _1114 = _968 * _1098;
    float _1116 = _880 * _1080;
    float _1118 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1120 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _1118;
    float _1122 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1124 = -_1092;
    float _1126 = _1124 + 1.0;
    float _1128 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1130 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _1128;
    float _1132 = _1120 * _1120;
    float _1134 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1136 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _1134;
    float _1138 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1122);
    float _1140 = _1096 * 0.01666666753590106964111328125;
    float _1142 = fma(_1130, _1130, _1132);
    float _1144 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1110);
    float _1146 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1112);
    float _1148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _1150 = fma(_1136, _1136, _1142);
    float _1152 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1114);
    float _1154 = _1140 * (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1156 = precise::max(_844, 0.800000011920928955078125);
    float _1158 = fma(_970, _1074, _1144);
    int _1160 = _942 ? 0 : 1;
    float _1162 = _1154 * 6.283185482025146484375;
    float _1164 = rsqrt(_1150);
    float _1166 = precise::min(_1156, 1.0);
    float _1168 = fma(_974, _1074, _1152);
    float _1170 = _1162 * 0.15915493667125701904296875;
    int _1172 = ~_1160;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    float _1178 = fma(_1004, _1066, _1158);
    float _1180 = fma(_1166, -5.000000476837158203125, 5.000000476837158203125);
    bool _1182 = !_746;
    int _1184 = _1182 ? 0 : 1;
    float _1186 = _1106 * _1148;
    int _1188 = _1176;
    if (!_930)
    {
        int _1190 = ~_1160;
        int _1192 = _1190 + 1;
        _1188 = _1192;
    }
    int _1194 = _1188;
    float _1196 = fma(_844, -2.57610607147216796875, 2.8274333477020263671875);
    int _1198 = ~_918;
    int _1200 = _1198 + 1;
    int _1202 = _1200 + 1;
    float _1204 = fma(_1040, _1066, _1168);
    int _1206 = abs(_1184);
    float _1208 = 3.1415927410125732421875 * (*spvDescriptorSet0.vp_c9)._m0[191].w;
    int _1210 = _1202;
    if (!_890)
    {
        int _1212 = ~_918;
        int _1214 = _1212 + 1;
        _1210 = _1214;
    }
    int _1216 = _1210;
    float _1218 = _1130 * _1164;
    float _1220 = _1170 * 6.283185482025146484375;
    float _1222 = sin(_1220);
    float _1224 = _1196 * 0.15915493667125701904296875;
    float _1226 = _1120 * _1164;
    float _1228 = _1136 * _1164;
    float _1230 = precise::max(0.0, _844);
    float _1232 = _1186 * 6.283185482025146484375;
    float _1234 = _1170 * 6.283185482025146484375;
    float _1236 = cos(_1234);
    float _1238 = precise::min(_1230, 0.20000000298023223876953125);
    float _1240 = _1208 * _1072;
    float _1242 = fma(_838, _1074, _1146);
    float _1244 = _1238 * 5.0;
    float _1246 = fma(_1038, _1066, _1242);
    float _1248 = _1224 * 6.283185482025146484375;
    float _1250 = sin(_1248);
    float _1252 = _1240 * 0.15915493667125701904296875;
    float _1254 = _1244 * _1180;
    float _1256 = _1222 * _980;
    float _1258 = float(_874);
    float _1260 = _1226 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1262 = float(_1206);
    float _1264 = _422 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1266 = _1236 * _980;
    float _1268 = -_1256;
    float _1270 = fma(_1108, _1236, _1268);
    float _1272 = sqrt(_1102);
    float _1274 = _1262 * _1258;
    float _1276 = fma(_1108, _1222, _1266);
    bool _1278 = !_742;
    int _1280 = _1278 ? 0 : 1;
    float _1282 = fma(_1218, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1260);
    bool _1284 = !_750;
    int _1286 = _1284 ? 0 : 1;
    float _1288 = _1250 + _1250;
    float _1290 = _1274 * (-2.0);
    float _1292 = _1224 * 6.283185482025146484375;
    float _1294 = cos(_1292);
    int _1296 = abs(_1286);
    float _1298 = -_1250;
    float _1300 = fma(_966, _1288, _1298);
    float _1302 = _1138 * 6.283185482025146484375;
    float _1304 = fma(_1254, 0.14999997615814208984375, 0.85000002384185791015625);
    int _1306 = abs(_1280);
    float _1308 = fma(_886, _1290, _886);
    float _1310 = in.m_57.x;
    float _1312 = in.m_57.y;
    float _1314 = in.m_57.z;
    float _1316 = _1302 * 0.15915493667125701904296875;
    float _1318 = _1252 * 6.283185482025146484375;
    float _1320 = cos(_1318);
    float _1322 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1324 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1264);
    float _1326 = float(_1306);
    float _1328 = fma(_1228, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1282);
    float _1330 = float(_1216);
    float _1332 = _1316 * 6.283185482025146484375;
    float _1334 = sin(_1332);
    float _1336 = float(_1296);
    float _1338 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1340 = float(_1194);
    float _1342 = _1326 * _1330;
    float _1344 = precise::max(_1272, 200.0);
    float _1346 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1348 = _1252 * 6.283185482025146484375;
    float _1350 = sin(_1348);
    float _1352 = _1336 * _1340;
    float _1354 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1178);
    float _1356 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1246);
    float _1358 = precise::min(_1344, 500.0);
    float _1360 = -_1346;
    float _1362 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1360);
    float _1364 = fma(_1290, _1312, _1312);
    float _1366 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1324);
    float _1368 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1270);
    float _1370 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1204);
    float _1372 = _1276 * _1320;
    float _1374 = sqrt(_946);
    float _1376 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1378 = fma(_1358, 0.0033333334140479564666748046875, -0.666666686534881591796875);
    float _1380 = _422 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1382 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1362);
    float _1384 = _1276 * _1350;
    float _1386 = fma(_1368, _1350, _1372);
    float _1388 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1390 = sqrt(_888);
    float _1392 = -_1384;
    float _1394 = fma(_1368, _1320, _1392);
    float _1396 = _1342 * (-2.0);
    float _1398 = -_1388;
    float _1400 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1398);
    float _1402 = -_1376;
    float _1404 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1402);
    float _1406 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1380);
    float _1408 = fma(_906, _1396, _906);
    float _1410 = fma(_1396, _1310, _1310);
    float _1412 = _422 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1414 = sqrt(_910);
    float _1416 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1400);
    float _1418 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1404);
    float _1420 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1412);
    float _1422 = -_424;
    float _1424 = _1422 + _1382;
    float _1426 = -_422;
    float _1428 = _1426 + _1416;
    float _1430 = -_410;
    float _1432 = _1430 + _1418;
    float _1434 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1420);
    float _1436 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1406);
    float _1438 = _1428 * _1374;
    float _1440 = _1432 * _1390;
    float _1442 = _1434 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1444 = in.m_49.x;
    float _1446 = in.m_49.y;
    float _1448 = in.m_49.z;
    float _1450 = fma(_1438, (*spvDescriptorSet0.vp_c10)._m0[2].w, _600);
    float _1452 = fma(_1440, (*spvDescriptorSet0.vp_c10)._m0[2].w, _602);
    float _1454 = _1440 + _1442;
    float _1456 = _1424 * _1414;
    float _1458 = _1450 * _1450;
    float _1460 = _1366 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1462 = _1232 * 0.15915493667125701904296875;
    float _1464 = fma(_1456, (*spvDescriptorSet0.vp_c10)._m0[2].w, _604);
    float _1466 = fma(_1452, _1452, _1458);
    float _1468 = _1438 + _1460;
    float _1470 = _1436 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1472 = _1352 * (-2.0);
    float _1474 = fma(_1464, _1464, _1466);
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1478 = _1468 + _1476;
    float _1480 = _1456 + _1470;
    float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1484 = _1454 + _1482;
    float _1486 = _808 + (-0.5);
    float _1488 = _1478 * _1478;
    float _1490 = rsqrt(_1474);
    float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1494 = _1480 + _1492;
    bool _1496 = !_998;
    float _1498 = _1496 ? _130 : _1116;
    float _1500 = fma(_1484, _1484, _1488);
    float _1502 = fma(_920, _1472, _920);
    float _1504 = fma(_1472, _1314, _1314);
    float _1506 = _1356 * _1446;
    float _1508 = fma(_1486, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1364);
    float _1510 = _1462 * 6.283185482025146484375;
    float _1512 = sin(_1510);
    float _1514 = _606 + (-0.5);
    float _1516 = _726 + (-0.5);
    float _1518 = fma(_1494, _1494, _1500);
    float _1520 = fma(_1498, _1308, _1508);
    float _1522 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1410);
    float _1524 = fma(_1516, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1504);
    float _1526 = _1370 * _1448;
    float _1528 = _1450 * _1490;
    float _1530 = rsqrt(_1518);
    float _1532 = _1520 * 0.15915493667125701904296875;
    float _1534 = fma(_1498, _1502, _1524);
    float _1536 = _1452 * _1490;
    float _1538 = _1528 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1540 = fma(_1498, _1408, _1522);
    float _1542 = _1394 + (-1.41421401500701904296875);
    float _1544 = _1464 * _1490;
    float _1546 = _1462 * 6.283185482025146484375;
    float _1548 = cos(_1546);
    float _1550 = fma(_1536, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1538);
    float _1552 = _1512 * _1542;
    float _1554 = _1540 * 0.15915493667125701904296875;
    float _1556 = fma(_1544, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1550);
    float _1558 = _1354 * _1444;
    float _1560 = _1478 * _1530;
    float _1562 = _1484 * _1530;
    float _1564 = abs(_1556);
    bool _1566 = _1564 > 0.99989998340606689453125;
    float _1568 = _1386 * _1304;
    float _1570 = -_1560;
    float _1572 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1478);
    float _1574 = -_1562;
    float _1576 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1484);
    float _1578 = _1552 * _1304;
    float _1580 = _1554 * 6.283185482025146484375;
    float _1582 = sin(_1580);
    float _1584 = fma(_1548, _1542, 1.41421401500701904296875);
    float _1586 = _1572 * _1572;
    float _1588 = _1494 * _1530;
    float _1590 = _1584 * _1304;
    float _1592 = fma(_1576, _1576, _1586);
    float _1594 = _1534 * 0.15915493667125701904296875;
    float _1596 = _1586;
    float _1598 = _1538;
    float _1600 = _1556;
    float _1602 = _1554;
    int _1604 = as_type<int>(_1322);
    int _1606 = as_type<int>(_1282);
    if (_1566)
    {
        _1596 = 0.001000000047497451305389404296875;
    }
    float _1608 = _1596;
    float _1610 = -_1588;
    float _1612 = fma(_1610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1494);
    if (!_1566)
    {
        _1598 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1614 = _1598;
    float _1616 = _1554 * 6.283185482025146484375;
    float _1618 = cos(_1616);
    float _1620 = _1614;
    if (!_1566)
    {
        _1600 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1622 = _1600;
    float _1624 = _1622;
    if (_1566)
    {
        float _1626 = fma(_1608, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1620 = _1626;
    }
    float _1628 = _1620;
    float _1630 = fma(_1612, _1612, _1592);
    if (_1566)
    {
        float _1632 = fma(_1608, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1624 = _1632;
    }
    float _1634 = _1624;
    bool _1636 = _1328 > 0.0;
    float _1638 = -_1628;
    float _1640 = _1544 * _1638;
    bool _1642 = _1328 >= 0.0;
    bool _1644 = isnan(_1328);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan(0.0);
    bool _1650 = _1646 || _1648;
    float _1652 = -_1634;
    float _1654 = _1528 * _1652;
    if (!_1566)
    {
        _1602 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1656 = _1602;
    float _1658 = _1656;
    if (_1566)
    {
        float _1660 = fma(_1608, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1658 = _1660;
    }
    float _1662 = _1658;
    float _1664 = -_1634;
    float _1666 = -_1640;
    float _1668 = fma(_1536, _1664, _1666);
    float _1670 = _1532 * 6.283185482025146484375;
    float _1672 = sin(_1670);
    int _1674 = _1650 ? 0 : 1;
    float _1676 = -_1662;
    float _1678 = _1536 * _1676;
    float _1680 = -_1662;
    float _1682 = -_1654;
    float _1684 = fma(_1544, _1680, _1682);
    float _1686 = _1668 * _1668;
    int _1688 = ~_1674;
    int _1690 = _1688 + 1;
    int _1692 = _1690 + 1;
    float _1694 = -_1628;
    float _1696 = -_1678;
    float _1698 = fma(_1528, _1694, _1696);
    int _1700 = _1692;
    if (!_1636)
    {
        int _1702 = ~_1674;
        int _1704 = _1702 + 1;
        _1700 = _1704;
    }
    int _1706 = _1700;
    float _1708 = fma(_1684, _1684, _1686);
    float _1710 = _1532 * 6.283185482025146484375;
    float _1712 = cos(_1710);
    float _1714 = abs(_1328);
    float _1716 = _1714 * 5.0;
    float _1718 = float(_1706);
    float _1720 = fma(_1698, _1698, _1708);
    float _1722 = _1506 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1724 = _1526 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1726 = _808 > 0.5;
    float _1728 = _1582 * _1672;
    float _1730 = _1594 * 6.283185482025146484375;
    float _1732 = cos(_1730);
    float _1734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1568);
    float _1736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1578);
    float _1738 = _1718 * _1716;
    bool _1740 = _726 > 0.5;
    float _1742 = _1378 * _1738;
    float _1744 = sqrt(_1630);
    float _1746 = _1582 * _1712;
    float _1748 = _1618 * _1712;
    float _1750 = fma(_1378, 0.5, 1.0);
    float _1752 = _1594 * 6.283185482025146484375;
    float _1754 = sin(_1752);
    float _1756 = _1712 * _1732;
    float _1758 = _1558 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1760 = _1582 * _1732;
    float _1762 = _1618 * _1672;
    float _1764 = _1618 * _1732;
    float _1766 = _1672 * _1732;
    float _1768 = rsqrt(_1720);
    float _1770 = _1530 * _1744;
    float _1772 = _1764 * _1536;
    float _1774 = _1758 * _1770;
    float _1776 = _1722 * _1770;
    float _1778 = _1724 * _1770;
    float _1780 = fma(_1754, _1748, _1728);
    float _1782 = fma(_1754, _1728, _1748);
    float _1784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1590);
    float _1786 = -_1762;
    float _1788 = fma(_1754, _1746, _1786);
    float _1790 = -_1746;
    float _1792 = fma(_1754, _1762, _1790);
    float _1794 = _1780 * _1536;
    float _1796 = _1774 * _1784;
    float _1798 = _1778 * _1736;
    float _1800 = _1684 * _1768;
    float _1802 = _1668 * _1768;
    float _1804 = _1698 * _1768;
    float _1806 = _1780 * _1544;
    float _1808 = fma(_1756, _1800, _1794);
    float _1810 = _1764 * _1544;
    float _1812 = _1536 * _1802;
    float _1814 = fma(_1756, _1804, _1806);
    float _1816 = _1528 * _1804;
    float _1818 = -_1754;
    float _1820 = fma(_1818, _1804, _1810);
    float _1822 = -_1812;
    float _1824 = fma(_1528, _1800, _1822);
    float _1826 = _1776 * _1734;
    float _1828 = _1792 * _1536;
    float _1830 = -_1754;
    float _1832 = fma(_1830, _1800, _1772);
    float _1834 = -_1816;
    float _1836 = fma(_1544, _1802, _1834);
    float _1838 = _1792 * _1544;
    float _1840 = fma(_1760, _1824, _1820);
    float _1842 = fma(_1766, _1800, _1828);
    float _1844 = fma(_1760, _1836, _1832);
    float _1846 = fma(_1766, _1804, _1838);
    float _1848 = fma(_1788, _1824, _1814);
    float _1850 = _1826 * _1840;
    float _1852 = fma(_1788, _1836, _1808);
    float _1854 = _1826 * _1844;
    float _1856 = fma(_1782, _1824, _1846);
    float _1858 = fma(_1796, _1848, _1850);
    float _1860 = fma(_1782, _1836, _1842);
    float _1862 = fma(_1796, _1852, _1854);
    float _1864 = _1780 * _1528;
    float _1866 = fma(_1798, _1856, _1858);
    float _1868 = _1792 * _1528;
    float _1870 = fma(_1798, _1860, _1862);
    float _1872 = fma(_1756, _1802, _1864);
    float _1874 = _1480 + _1866;
    float _1876 = _1764 * _1528;
    float _1878 = _1454 + _1870;
    float _1880 = fma(_1766, _1802, _1868);
    float _1882 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1884 = _1874 + _1882;
    float _1886 = _1544 * _1800;
    float _1888 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1890 = _1878 + _1888;
    float _1892 = -_1754;
    float _1894 = fma(_1892, _1802, _1876);
    float _1896 = fma(_1884, _1750, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1898 = -_1886;
    float _1900 = fma(_1536, _1804, _1898);
    float _1902 = fma(_1890, _1750, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1904 = fma(_1742, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1896);
    float _1906 = fma(_1760, _1900, _1894);
    float _1908 = fma(_1742, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1902);
    float _1910 = in.m_59.y;
    float _1912 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1914 = _1904 + _1912;
    float _1916 = fma(_1788, _1900, _1872);
    float _1918 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1920 = _1908 + _1918;
    float _1922 = _1826 * _1906;
    float _1924 = _1914 * _1914;
    float _1926 = fma(_1782, _1900, _1880);
    float _1928 = fma(_1796, _1916, _1922);
    float _1930 = fma(_1920, _1920, _1924);
    float _1932 = in.m_51.w;
    float _1934 = fma(_1798, _1926, _1928);
    float _1936 = sqrt(_1930);
    int _1938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1940 = _1938 != 0;
    float _1942 = _1468 + _1934;
    int _1944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1946 = _1944 != 0;
    int _1948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1950 = _1948 != 0;
    float _1952 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1954 = _1942 + _1952;
    float _1956 = fma(_1954, _1750, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1958 = -_1910;
    float _1960 = _1958 + 1.0;
    float _1962 = fma(_1742, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1956);
    bool _1964 = _1936 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1966 = _1726 ? _1960 : _1910;
    int _1968 = _1740 ? as_type<int>(_1960) : as_type<int>(_1910);
    bool _1970 = _1932 > 0.5;
    float _1972 = _1946 ? _1966 : _1910;
    float _1974 = _1950 ? as_type<float>(_1968) : _1910;
    float _1976 = _1910;
    float _1978 = _1960;
    float _1980 = _1932;
    float _1982 = _1908;
    float _1984 = _1966;
    float _1986 = _1930;
    if (_1940)
    {
        float _1988 = _1970 ? _1960 : _1910;
        _1976 = _1988;
    }
    float _1990 = _1976;
    if (!_1964)
    {
        _1978 = _1904;
    }
    float _1992 = _1978;
    float _1994 = _1992;
    if (!_1964)
    {
        _1980 = _1962;
    }
    float _1996 = _1980;
    bool _1998 = !_1964;
    float _2000 = _1996;
    if (!_1998)
    {
        float _2002 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2004 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2006 = _1936 + _2004;
        float _2008 = _1962 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2010 = rsqrt(_1930);
        float _2012 = _2006 * _2002;
        float _2014 = _2012 * 0.15915493667125701904296875;
        float _2016 = _2014 * 6.283185482025146484375;
        float _2018 = sin(_2016);
        float _2020 = _2014 * 6.283185482025146484375;
        float _2022 = cos(_2020);
        float _2024 = fma(_2018, _2008, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2026 = _2010 * _2024;
        float _2028 = _2022 + (-1.0);
        float _2030 = fma(_1920, _2026, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2032 = fma(_1914, _2026, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2034 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2036 = fma(_1962, _2022, _2034);
        _2000 = _2036;
        _1982 = _2030;
        _1994 = _2032;
        _1984 = _2014;
    }
    float _2038 = _2000;
    float _2040 = _1982;
    float _2042 = _1994;
    float _2044 = _1984;
    float _2046 = -_1560;
    float _2048 = fma(_2046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2038);
    float _2050 = -_1562;
    float _2052 = fma(_2050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2040);
    float _2054 = -_1588;
    float _2056 = fma(_2054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2042);
    float _2058 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2060 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2062 = _2048 + _2060;
    float _2064 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2066 = _2052 + _2064;
    float _2068 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2070 = _2056 + _2068;
    float _2072 = _2062 * _2062;
    float _2074 = fma(_2066, _2066, _2072);
    float _2076 = fma(_2070, _2070, _2074);
    float _2078 = rsqrt(_2076);
    float _2080 = _2078 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2082 = _2066 * _2080;
    float _2084 = _2070 * _2080;
    float _2086 = _2082 * _2082;
    float _2088 = _2084 * _2084;
    float _2090 = _2086 + _2088;
    float _2092 = sqrt(_2090);
    bool _2094 = _2092 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2096 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2098 = _2092 + _2096;
    float _2100 = _2078;
    float _2102 = _2044;
    float _2104 = _2098;
    float _2106 = _2062;
    float _2108 = _2090;
    float _2110 = _2058;
    float _2112 = _2082;
    if (_2094)
    {
        float _2114 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2100 = _2114;
    }
    float _2116 = _2100;
    if (_2094)
    {
        float _2118 = rsqrt(_2090);
        _2102 = _2118;
    }
    float _2120 = _2102;
    if (_2094)
    {
        float _2122 = _2098 * _2116;
        _2104 = _2122;
    }
    float _2124 = _2104;
    if (_2094)
    {
        float _2126 = _2124 * 0.15915493667125701904296875;
        _1986 = _2126;
    }
    float _2128 = _1986;
    float _2130 = precise::max(0.0, _2058);
    float _2132 = _2116;
    float _2134 = _2130;
    if (_2094)
    {
        float _2136 = _2128 * 6.283185482025146484375;
        float _2138 = sin(_2136);
        _2132 = _2138;
    }
    float _2140 = _2132;
    float _2142 = -_2080;
    float _2144 = -_2130;
    float _2146 = fma(_2062, _2142, _2144);
    if (!_2094)
    {
        _2106 = _2082;
    }
    float _2148 = _2106;
    float _2150 = _2148;
    if (_2094)
    {
        float _2152 = _2146 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2134 = _2152;
    }
    float _2154 = _2134;
    float _2156 = _2070;
    float _2158 = _2154;
    if (_2094)
    {
        float _2160 = _2128 * 6.283185482025146484375;
        float _2162 = cos(_2160);
        _2156 = _2162;
    }
    float _2164 = _2156;
    float _2166 = _2140;
    if (_2094)
    {
        float _2168 = fma(_2140, _2154, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2166 = _2168;
    }
    float _2170 = _2166;
    float _2172 = _2170;
    if (!_2094)
    {
        _2158 = _2146;
    }
    float _2174 = _2158;
    float _2176 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2178 = _2174;
    if (_2094)
    {
        float _2180 = _2120 * _2170;
        _2108 = _2180;
    }
    float _2182 = _2108;
    if (!_2094)
    {
        _2172 = _2086;
    }
    float _2184 = _2172;
    float _2186 = sqrt(_2076);
    float _2188 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2176);
    float _2190 = _2184;
    float _2192 = _2164;
    if (_2094)
    {
        float _2194 = _2164 + (-1.0);
        _2110 = _2194;
    }
    float _2196 = _2110;
    float _2198 = _2196;
    if (_2094)
    {
        float _2200 = _2082 * _2182;
        _2150 = _2200;
    }
    float _2202 = _2150;
    if (_2094)
    {
        float _2204 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2112 = _2204;
    }
    float _2206 = _2112;
    if (!_2094)
    {
        _2198 = _2084;
    }
    float _2208 = _2198;
    float _2210 = _2208;
    if (_2094)
    {
        float _2212 = _2084 * _2182;
        _2210 = _2212;
    }
    float _2214 = _2210;
    if (_2094)
    {
        float _2216 = _2202 * _2202;
        _2190 = _2216;
    }
    float _2218 = _2190;
    if (_2094)
    {
        float _2220 = fma(_2146, _2164, _2206);
        _2178 = _2220;
    }
    float _2222 = _2178;
    if (!_2094)
    {
        _2192 = _2088;
    }
    float _2224 = _2192;
    float _2226 = _2224;
    if (_2094)
    {
        float _2228 = _2214 * _2214;
        _2226 = _2228;
    }
    float _2230 = _2226;
    float _2232 = fma(_2222, _2222, _2218);
    float _2234 = _2232 + _2230;
    float _2236 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2238 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2240 = fma(_2186, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2238);
    float _2242 = precise::clamp(_2240, 0.0, 1.0);
    float _2244 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2246 = rsqrt(_2234);
    float _2248 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2236);
    float _2250 = -_2242;
    float _2252 = _2250 + 1.0;
    float _2254 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2244);
    float _2256 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2258 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2248);
    float _2260 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2262 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2254);
    float _2264 = abs(_2252);
    float _2266 = log2(_2264);
    float _2268 = _2258 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2270 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2260);
    float _2272 = _2262 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2274 = _2268 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2276 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2270);
    float _2278 = _2246 * _2202;
    float _2280 = -_2274;
    float _2282 = fma(_2280, _2256, 1.0);
    float _2284 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2188);
    float _2286 = _2276 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2288 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2290 = _2246 * _2222;
    float _2292 = _2278 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2294 = _2246 * _2214;
    float _2296 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2288);
    float _2298 = _2284 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2300 = -_2292;
    float _2302 = fma(_2290, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2300);
    float _2304 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2306 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2296);
    float _2308 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2310 = -_2294;
    float _2312 = fma(_2310, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2302);
    float _2314 = log2(_2282);
    float _2316 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2306);
    float _2318 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2320 = fma(_2312, -0.5, 0.5);
    float _2322 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2308);
    float _2324 = fma(_2312, 0.5, 0.5);
    float _2326 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2318);
    float _2328 = _2290 + 1.0;
    float _2330 = 1.0 / _2316;
    float _2332 = fma(_2324, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2334 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2326);
    float _2336 = fma(_2324, _2332, -0.212114393711090087890625);
    float _2338 = exp2(_2304);
    float _2340 = _2314 * 0.693147182464599609375;
    float _2342 = fma(_2324, _2336, 1.570728778839111328125);
    float _2344 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2346 = sqrt(_2320);
    float _2348 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2322);
    float _2350 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2334);
    float _2352 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2348);
    float _2354 = -_2290;
    float _2356 = fma(_2338, _2328, _2354);
    float _2358 = _2352 * _2330;
    float _2360 = _2350 * _2330;
    float _2362 = fma(_2360, 0.5, 0.5);
    float _2364 = _2346 * 0.636619746685028076171875;
    float _2366 = fma(_2358, -0.5, 0.5);
    float _2368 = fma(_2356, 0.5, 0.5);
    float _2370 = -_2342;
    float _2372 = fma(_2364, _2370, 1.0);
    float3 _6506 = float3(_2362, _2366, _2344);
    float _2374 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6506, float3(0.0), isnan(_6506)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6506, float3(0.0), isnan(_6506)), level(0.0)).x;
    float3 _6517 = float3(_2362, _2366, _2344);
    float4 _2377 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6517, float3(0.0), isnan(_6517)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6517, float3(0.0), isnan(_6517)), level(0.0)).xyzw;
    float _2379 = _2377.x;
    float _2381 = _2377.y;
    float _2383 = _2377.z;
    float _2385 = _2377.w;
    float2 _6534 = float2(_2372, _2368);
    float3 _2389 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6534, float2(0.0), isnan(_6534)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6534, float2(0.0), isnan(_6534)), level(0.0)).xyz;
    float _2391 = _2389.x;
    float _2393 = _2389.y;
    float _2395 = _2389.z;
    float _2397 = in.m_59.x;
    float _2399 = -_1560;
    float _2401 = fma(_2399, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1468);
    int _2403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2405 = _2403 != 0;
    out.m_61.z = _1072;
    int _2407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2409 = _2407 != 0;
    float _2411 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2415 = _2413 != 0;
    float _2417 = _808 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2421 = _2419 != 0;
    float _2423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2425 = fma(_2417, -2.0, _2411);
    float _2427 = _606 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2429 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2431 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2433 = (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2435 = _2427;
    float _2437 = (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2439 = _2405;
    if (!_2405)
    {
        _2433 = _726;
    }
    float _2441 = _2433;
    float _2443 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2445 = -_2429;
    float _2447 = fma(_2427, 2.0, _2445);
    bool _2449 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2451 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2453 = _2449 || _2451;
    bool _2455 = isnan(0.5);
    bool _2457 = _2453 || _2455;
    out.m_63.w = _2431;
    float _2459 = _2441;
    if (!_2405)
    {
        _2435 = _726;
    }
    float _2461 = _2435;
    float _2463 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2443);
    float _2465 = -_1588;
    float _2467 = fma(_2465, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1480);
    float _2469 = _2461;
    if (!_2405)
    {
        _2437 = _808;
    }
    float _2471 = _2437;
    float _2473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2475 = _2471;
    if (_2405)
    {
        _2469 = _808;
    }
    float _2477 = _2469;
    float _2479 = -_1562;
    float _2481 = fma(_2479, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1454);
    if (_2405)
    {
        _2459 = _808;
    }
    float _2483 = _2459;
    float _2485 = _2401 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2487 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2489 = _2485;
    if (_2405)
    {
        _2475 = _606;
    }
    float _2491 = _2475;
    float _2493 = fma(_2481, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2485);
    if (_2409)
    {
        bool _2495 = _606 > 0.5;
        _2439 = _2495;
    }
    bool _2497 = _2439;
    float _2499 = (*spvDescriptorSet0.vp_c9)._m0[83].y + (*spvDescriptorSet0.vp_c9)._m0[83].w;
    float _2501 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2487);
    float _2503 = fma(_2467, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2493);
    float _2505 = _2423 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2507 = _2505;
    if (!_2409)
    {
        _2489 = _2397;
    }
    float _2509 = _2489;
    float _2511 = fma(_2483, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2499);
    float _2513 = _2503 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2515 = _2401 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2517 = fma(_2505, _1972, -0.5);
    float _2519 = _2509;
    if (!_2409)
    {
        _2507 = _2509;
    }
    float _2521 = _2507;
    float _2523 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2425);
    float _2525 = _2521;
    if (_2409)
    {
        _2519 = _2397;
    }
    float _2527 = _2519;
    float _2529 = fma(_2481, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2515);
    float _2531 = 1.0 / _2513;
    float _2533 = _2473 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2535 = fma(_2467, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2529);
    float _2537 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2463);
    float _2539 = (*spvDescriptorSet0.vp_c9)._m0[83].x + (*spvDescriptorSet0.vp_c9)._m0[83].z;
    float _2541 = _2535 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2543 = _2477 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2545 = (*spvDescriptorSet0.vp_c9)._m0[81].w + (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2547 = fma(_2491, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2539);
    float _2549 = _2541 + _2513;
    float _2551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2553 = -_2523;
    float _2555 = fma(_2537, _2517, _2553);
    float _2557 = fma(_2533, _1990, -0.5);
    float _2559 = fma(_2543, -2.0, _2545);
    float _2561 = _2549 * _2531;
    float _2563 = _2561 * 0.5;
    float _2565 = _2491 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2569 = (*spvDescriptorSet0.vp_c9)._m0[81].z + (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[83].x);
    float _2573 = _2565;
    float _2575 = _2545;
    if (_2409)
    {
        float _2577 = -_2527;
        float _2579 = _2577 + 1.0;
        _2571 = as_type<int>(_2579);
    }
    int _2581 = _2571;
    float _2583 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2585 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2583);
    if (_2415)
    {
        float _2587 = -_2527;
        float _2589 = _2587 + 1.0;
        _1604 = as_type<int>(_2589);
    }
    int _2591 = _1604;
    if (_2421)
    {
        float _2593 = -_2527;
        float _2595 = _2593 + 1.0;
        _1606 = as_type<int>(_2595);
    }
    int _2597 = _1606;
    float _2599 = -_2569;
    float _2601 = fma(_2565, 2.0, _2599);
    if (!_2415)
    {
        _2573 = _2527;
    }
    float _2603 = _2573;
    float _2605 = _2551 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2607 = _2603;
    if (!_2421)
    {
        _2575 = _2527;
    }
    float _2609 = _2575;
    float _2611 = 1.0 / _2585;
    float _2613 = _2609;
    if (_2409)
    {
        float _2615 = _2497 ? as_type<float>(_2581) : _2527;
        _2525 = _2615;
    }
    float _2617 = _2525;
    float _2619 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2547);
    if (_2415)
    {
        float _2621 = _1740 ? as_type<float>(_2591) : _2527;
        _2607 = _2621;
    }
    float _2623 = _2607;
    float _2625 = -_130;
    float _2627 = fma(_2625, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2601);
    if (_2421)
    {
        float _2629 = _1726 ? as_type<float>(_2597) : _2527;
        _2613 = _2629;
    }
    float _2631 = _2613;
    float _2633 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2501);
    float _2635 = -_130;
    float _2637 = fma(_2635, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2447);
    float _2639 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2511);
    float _2641 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2559);
    float _2643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _2645 = _2567 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2647 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2649 = fma(_2605, _2623, -0.5);
    float _2651 = -_2641;
    float _2653 = fma(_2557, _2639, _2651);
    float _2655 = fma(_2645, _2617, -0.5);
    float _2657 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2647);
    float _2659 = _2639;
    float _2661 = _2655;
    if (_2457)
    {
        _2659 = 1.0;
    }
    float _2663 = _2659;
    float _2665 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _2667 = fma(_2633, _2655, _2637);
    float _2669 = fma(_2619, _2649, _2627);
    float _2671 = _2663;
    if (_2457)
    {
        _2661 = 1.0;
    }
    float _2673 = _2661;
    float _2675 = _1974 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2677 = _2631 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2679 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2681 = _2611 * _2679;
    float _2683 = _2673;
    if (!_2457)
    {
        float _2685 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2687 = _2685 * 0.15915493667125701904296875;
        float _2689 = _2687 * 6.283185482025146484375;
        float _2691 = cos(_2689);
        float _2693 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2695 = _2693 * 0.15915493667125701904296875;
        float _2697 = _2687 * 6.283185482025146484375;
        float _2699 = sin(_2697);
        float _2701 = 1.0 / _2691;
        float _2703 = _2695 * 6.283185482025146484375;
        float _2705 = cos(_2703);
        float _2707 = _2699 * _2701;
        float _2709 = _2695 * 6.283185482025146484375;
        float _2711 = sin(_2709);
        float _2713 = _2705 * _2707;
        float _2715 = 1.0 / _2713;
        float _2717 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2719 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2717;
        float _2721 = 1.0 / _2719;
        float _2723 = _2711 * _2715;
        float _2725 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2727 = fma(_2681, _2723, _2725);
        float _2729 = _2727 * _2721;
        float _2731 = precise::clamp(_2729, 0.0, 1.0);
        _2671 = _2731;
    }
    float _2733 = _2671;
    if (!_2457)
    {
        float _2735 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2737 = _2735 * 0.15915493667125701904296875;
        float _2739 = _2737 * 6.283185482025146484375;
        float _2741 = cos(_2739);
        float _2743 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2745 = _2743 * 0.15915493667125701904296875;
        float _2747 = _2737 * 6.283185482025146484375;
        float _2749 = sin(_2747);
        float _2751 = 1.0 / _2741;
        float _2753 = _2745 * 6.283185482025146484375;
        float _2755 = cos(_2753);
        float _2757 = _2749 * _2751;
        float _2759 = _2745 * 6.283185482025146484375;
        float _2761 = sin(_2759);
        float _2763 = _2755 * _2757;
        float _2765 = 1.0 / _2763;
        float _2767 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2769 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2767;
        float _2771 = 1.0 / _2769;
        float _2773 = _2761 * _2765;
        float _2775 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2777 = fma(_2681, _2773, _2775);
        float _2779 = _2777 * _2771;
        float _2781 = precise::clamp(_2779, 0.0, 1.0);
        float _2783 = -_2781;
        float _2785 = _2783 + 1.0;
        _2683 = _2785;
    }
    float _2787 = _2683;
    float _2789 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2657);
    float _2791 = _2677 * _2665;
    float _2793 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2795 = _2733 * _2787;
    float _2797 = _2675 * _2643;
    float _2799 = _2667 + 0.5;
    bool _2801 = _2733 > 0.0;
    bool _2803 = isnan(_2733);
    bool _2805 = _2801 || _2803;
    bool _2807 = isnan(0.0);
    bool _2809 = _2805 || _2807;
    float _2811 = _2795 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2813 = exp2(_2793);
    out.m_65.x = _2481;
    out.m_65.y = _2401;
    out.m_65.z = _2467;
    float _2815 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2789);
    float _2817 = _694 * _2811;
    bool _2819 = _2787 <= 0.0;
    bool _2821 = !_2809;
    bool _2823 = _2819 || _2821;
    float _2825 = _2653 + 0.5;
    float _2827 = _2815 + _2316;
    float _2829 = _2817 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2831 = _2350 + _2316;
    float _2833 = _2316 * 0.5;
    out.m_67.x = _2052;
    out.m_67.y = _2048;
    out.m_67.z = _2056;
    float _2835 = _2555 + 0.5;
    float _2837 = _2669 + 0.5;
    out.m_45.x = _2829;
    float _2839 = _2827 * 0.5;
    float _2841 = -_2813;
    float _2843 = _2841 + 1.0;
    float _2845 = _2831 * 0.5;
    float _2847 = fma(_2352, -0.5, _2833);
    out.m_69.y = _844;
    float _2849 = _2843 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.x = _2791;
    out.m_71.y = _2797;
    float _2851 = _2849 * _2374;
    float _2853 = -_2849;
    float _2855 = _2853 + 1.0;
    out.m_73.x = _2799;
    out.m_73.y = _2835;
    out.m_73.z = _2837;
    out.m_73.w = _2825;
    float _2857 = _2385 * _2851;
    float _2859 = _2395 * _2851;
    float _2861 = _2385 * _2855;
    float _2863 = fma(_2391, _2857, _2379);
    float _2865 = fma(_2393, _2857, _2381);
    float _2867 = fma(_2385, _2859, _2383);
    out.gl_Position.x = _2350;
    out.gl_Position.y = _2352;
    out.gl_Position.z = _2815;
    out.gl_Position.w = _2316;
    out.m_75.x = _2845;
    out.m_75.y = _2847;
    out.m_75.z = _2839;
    out.m_75.w = _2316;
    out.m_77.x = _2863;
    out.m_77.y = _2865;
    out.m_77.z = _2867;
    out.m_77.w = _2861;
    if (!_2823)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2869 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2869;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _714 = false;
    bool _478 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2926 = as_type<float>(_112);
        out.gl_Position.z = _2926;
    }
    if (!_100)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = 0.0;
    float _134 = 0.0;
    if (_126)
    {
        float _136 = float(_96);
        _106 = _136;
    }
    float _138 = _106;
    bool _140 = _130 >= _138;
    bool _142 = !_126;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _114 = as_type<int>(_150);
    }
    int _152 = _114;
    float _154 = as_type<float>(_152);
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2997 = as_type<float>(_152);
        out.gl_Position.z = _2997;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
        float _186 = _130 * _130;
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
        _132 = _218;
        _198 = _228;
        _134 = _216;
    }
    float _230 = _132;
    float _232 = _198;
    float _234 = _134;
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
        _268 = _130;
    }
    float _272 = _268;
    float _274 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
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
        float _296 = _130 * _288;
        float _298 = 1.0 / _292;
        float _300 = _294 * 0.693147182464599609375;
        float _302 = exp2(_296);
        float _304 = 1.0 / _300;
        float _306 = _302 + (-1.0);
        float _308 = -_306;
        float _310 = fma(_308, _304, _130);
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
        float _330 = _130 * _322;
        float _332 = exp2(_330);
        float _334 = -_332;
        float _336 = _334 + 1.0;
        float _338 = _336 * _328;
        _276 = _338;
    }
    float _340 = _276;
    float _342 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _344 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _346 = fma(_266, _158, _274);
    float _348 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _350 = fma(_340, _158, _342);
    float _352 = fma(_266, _156, _344);
    float _354 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _356 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _358 = fma(_340, _156, _348);
    float _360 = -_350;
    float _362 = _346 + _360;
    float _364 = fma(_266, _160, _354);
    float _366 = fma(_340, _160, _356);
    float _368 = -_358;
    float _370 = _352 + _368;
    float _372 = _362 * _362;
    float _374 = in.m_49.w;
    float _376 = -_366;
    float _378 = _364 + _376;
    float _380 = _362 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _382 = fma(_370, _370, _372);
    float _384 = in.m_42.x;
    float _386 = in.m_42.y;
    float _388 = in.m_42.z;
    float _390 = _362 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _392 = _362 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _394 = fma(_378, _378, _382);
    float _396 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[5].x, _380);
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[4].x, _390);
    float _400 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[6].x, _392);
    float _402 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[5].z, _396);
    float _404 = sqrt(_394);
    float _406 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].z, _398);
    float _408 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[6].z, _400);
    float _410 = fma(_352, _374, _384);
    bool _412 = _404 >= 9.9999999747524270787835121154785e-07;
    bool _414 = isnan(_404);
    bool _416 = _412 || _414;
    bool _418 = isnan(9.9999999747524270787835121154785e-07);
    bool _420 = _416 || _418;
    float _422 = fma(_346, _374, _386);
    float _424 = fma(_364, _374, _388);
    float _426 = _352;
    float _428 = _374;
    float _430 = _408;
    if (_420)
    {
        _426 = _406;
    }
    float _432 = _426;
    float _434 = _432;
    if (_420)
    {
        _428 = _402;
    }
    float _436 = _428;
    float _438 = _436;
    if (!_420)
    {
        bool _440 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _442 = !_440;
        if (!_442)
        {
            float _444 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _446 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _448 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _450 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _444);
            float _452 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _446);
            float _454 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _448);
            float _456 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _450);
            float _458 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _452);
            float _460 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _454);
            float _462 = _456 * _456;
            float _464 = fma(_458, _458, _462);
            float _466 = fma(_460, _460, _464);
            float _468 = rsqrt(_466);
            float _470 = _468 * 9.9999999747524270787835121154785e-07;
            float _472 = _458 * _470;
            float _474 = _456 * _470;
            float _476 = _460 * _470;
            _438 = _474;
            _434 = _472;
            _430 = _476;
            _478 = true;
        }
        else
        {
            float _480 = _158 * _158;
            float _482 = fma(_156, _156, _480);
            float _484 = fma(_160, _160, _482);
            float _486 = sqrt(_484);
            bool _488 = _486 >= 9.9999999747524270787835121154785e-07;
            bool _490 = isnan(_486);
            bool _492 = _488 || _490;
            bool _494 = isnan(9.9999999747524270787835121154785e-07);
            bool _496 = _492 || _494;
            if (!_496)
            {
                float _498 = _386 * _386;
                float _500 = fma(_384, _384, _498);
                float _502 = fma(_388, _388, _500);
                float _504 = sqrt(_502);
                bool _506 = _504 >= 9.9999999747524270787835121154785e-07;
                bool _508 = isnan(_504);
                bool _510 = _506 || _508;
                bool _512 = isnan(9.9999999747524270787835121154785e-07);
                bool _514 = _510 || _512;
                if (!_514)
                {
                    float _516 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _518 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _516);
                    float _520 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _518);
                    float _522 = rsqrt(_520);
                    float _524 = _522 * 9.9999999747524270787835121154785e-07;
                    float _526 = _524 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _528 = _524 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _530 = _524 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _438 = _528;
                    _434 = _526;
                    _430 = _530;
                    _478 = true;
                }
                else
                {
                    float _532 = _386 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _534 = _386 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _536 = _386 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _538 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[5].x, _532);
                    float _540 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[4].x, _534);
                    float _542 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[6].x, _536);
                    float _544 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].z, _538);
                    float _546 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].z, _540);
                    float _548 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].z, _542);
                    float _550 = _544 * _544;
                    float _552 = fma(_546, _546, _550);
                    float _554 = fma(_548, _548, _552);
                    float _556 = rsqrt(_554);
                    float _558 = _556 * 9.9999999747524270787835121154785e-07;
                    float _560 = _546 * _558;
                    float _562 = _544 * _558;
                    float _564 = _548 * _558;
                    _438 = _562;
                    _434 = _560;
                    _430 = _564;
                    _478 = true;
                }
            }
            else
            {
                float _566 = _158 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _568 = _158 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _570 = _158 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _572 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[5].x, _566);
                float _574 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[4].x, _568);
                float _576 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[6].x, _570);
                float _578 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[5].z, _572);
                float _580 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[4].z, _574);
                float _582 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[6].z, _576);
                float _584 = _578 * _578;
                float _586 = fma(_580, _580, _584);
                float _588 = fma(_582, _582, _586);
                float _590 = rsqrt(_588);
                float _592 = _590 * 9.9999999747524270787835121154785e-07;
                float _594 = _580 * _592;
                float _596 = _578 * _592;
                float _598 = _582 * _592;
                _438 = _596;
                _434 = _594;
                _430 = _598;
            }
        }
    }
    _478 = false;
    float _600 = _438;
    float _602 = _434;
    float _604 = _430;
    float _606 = in.m_51.x;
    float _608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _610 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _618 = _616 != 0;
    int _620 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _622 = _620 != 0;
    float _624 = _610 * _608;
    float _626 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[20].x, _624);
    float _628 = _626 * 6.283185482025146484375;
    float _630 = floor(_626);
    float _632 = _628 * 0.15915493667125701904296875;
    bool _634 = !_614;
    int _636 = _634 ? 0 : 1;
    int _638 = abs(_636);
    float _640 = _632 * 6.283185482025146484375;
    float _642 = cos(_640);
    bool _644 = !_622;
    int _646 = _644 ? 0 : 1;
    bool _648 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _650 = abs(_646);
    float _652 = -_630;
    float _654 = _626 + _652;
    bool _656 = !_618;
    int _658 = _656 ? 0 : 1;
    float _660 = float(_638);
    int _662 = abs(_658);
    float _664 = -_654;
    float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _668 = fma(_642, 0.5, 0.5);
    float _670 = abs(_666);
    float _672 = _660 * _670;
    bool _674 = _654 < 0.5;
    float _676 = float(_674);
    float _678 = -_668;
    float _680 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _682 = float(_650);
    float _684 = -_676;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _688 = float(_662);
    float _690 = fma(_682, _680, _672);
    float _692 = abs(_686);
    float _694 = fma(_688, _692, _690);
    bool _696 = !_648;
    float _712;
    if (!_696)
    {
        float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _700 = _606 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _704 = _702 * _698;
        float _706 = floor(_704);
        float _708 = -_706;
        float _710 = _704 + _708;
        _712 = _710;
        _714 = true;
    }
    else
    {
        float _716 = float(_96);
        float _718 = 1.0 / _716;
        float _720 = _130 * _718;
        _712 = _720;
    }
    _714 = false;
    float _722 = _712;
    float _724 = _606 * 2.0;
    float _726 = in.m_51.z;
    float _728 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _730 = log2(_728);
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _734 = _722 + _732;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _738 = _722 + _736;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _742 = _740 != 0;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _746 = _744 != 0;
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _750 = _748 != 0;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _754 = _722 + _752;
    float _756 = floor(_724);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _758;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _766 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _768 = _130 * _730;
    float _770 = 1.0 / _764;
    float _772 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _766);
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _774;
    bool _778 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _780 = isnan(0.0);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _786 = _782 || _784;
    float _788 = _726 * 2.0;
    bool _790 = _756 > 0.0;
    float _792 = 1.0 / _760;
    bool _794 = _756 >= 0.0;
    bool _796 = isnan(_756);
    bool _798 = _794 || _796;
    bool _800 = isnan(0.0);
    bool _802 = _798 || _800;
    float _804 = abs(_424);
    float _806 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.00166666693985462188720703125, _804);
    float _808 = in.m_51.y;
    float _810 = floor(_806);
    float _812 = _754 * _770;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _814;
    int _818 = _802 ? 0 : 1;
    float _820 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _826 = exp2(_768);
    float _828 = _734 * _792;
    float _830 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _820);
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _834 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _832;
    float _836 = fma(_816, _828, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _838 = fma(_824, _812, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _840 = 1.0 / _776;
    float _842 = -_810;
    float _844 = _806 + _842;
    float _846 = _808 * 2.0;
    float _848 = _606 + _808;
    float _850 = _808 + _726;
    int _852 = ~_818;
    int _854 = _852 + 1;
    int _856 = _854 + 1;
    float _858 = floor(_788);
    float _860 = -_826;
    float _862 = _860 + 1.0;
    float _864 = _848 + (-1.0);
    float _866 = _850 + (-1.0);
    int _868 = _856;
    if (!_790)
    {
        int _870 = ~_818;
        int _872 = _870 + 1;
        _868 = _872;
    }
    int _874 = _868;
    float _876 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _878 = floor(_846);
    float _880 = _786 ? _862 : 0.0;
    float _882 = _738 * _840;
    float _884 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _876);
    float _886 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _888 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _830);
    bool _890 = _858 > 0.0;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _892;
    bool _896 = _858 >= 0.0;
    bool _898 = isnan(_858);
    bool _900 = _896 || _898;
    bool _902 = isnan(0.0);
    bool _904 = _900 || _902;
    float _906 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _908 = _606 + _726;
    float _910 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _884);
    float _912 = _908 + (-1.0);
    float _914 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _916 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _914;
    int _918 = _904 ? 0 : 1;
    float _920 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _922;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _926;
    bool _930 = _878 > 0.0;
    float _932 = _916 * _916;
    bool _934 = _878 >= 0.0;
    bool _936 = isnan(_878);
    bool _938 = _934 || _936;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    float _944 = fma(_924, _828, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _946 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _772);
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _950 = _948 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _956 = _424 >= 0.0;
    bool _958 = isnan(_424);
    bool _960 = _956 || _958;
    bool _962 = isnan(0.0);
    bool _964 = _960 || _962;
    float _966 = float(_964);
    float _968 = fma(_928, _828, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _970 = fma(_950, _812, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _972 = fma(_834, _834, _932);
    float _974 = fma(_954, _812, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _976 = fma(_966, -3.1415927410125732421875, 3.1415927410125732421875);
    float _978 = in.m_53.x;
    float _980 = in.m_53.y;
    float _982 = in.m_53.z;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _984;
    float _988 = _976 * 0.15915493667125701904296875;
    bool _990 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _992 = isnan(1.0);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _998 = _994 || _996;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1002 = 1.0 + _1000;
    float _1004 = fma(_986, _882, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1006;
    bool _1010 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1012 = isnan(_722);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = _988 * 6.283185482025146484375;
    float _1024 = sin(_1022);
    bool _1026 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1028 = isnan(_722);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1034 = _1030 || _1032;
    float _1036 = float(_1034);
    float _1038 = fma(_1008, _882, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1040 = fma(_894, _882, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _1042 = -_1020;
    float _1044 = _1042 + 1.0;
    float _1046 = -_1036;
    float _1048 = _1046 + 1.0;
    bool _1050 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1052 = isnan(_722);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1058 = _1054 || _1056;
    float _1060 = float(_1058);
    float _1062 = _988 * 6.283185482025146484375;
    float _1064 = cos(_1062);
    float _1066 = _1036 * _1044;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1070 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1068;
    float _1072 = in.m_55.z;
    float _1074 = _1060 * _1048;
    float _1076 = -_1060;
    float _1078 = _1076 + 1.0;
    float _1080 = 1.0 / _1002;
    bool _1082 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1084 = isnan(_722);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1090 = _1086 || _1088;
    float _1092 = float(_1090);
    float _1094 = _1024 * _978;
    float _1096 = fma(_606, 800.0, (*spvDescriptorSet0.vp_c10)._m0[2].x);
    float _1098 = _1092 * _1078;
    float _1100 = _1064 * _978;
    float _1102 = fma(_1070, _1070, _972);
    float _1104 = -_1094;
    float _1106 = fma(_1064, _982, _1104);
    float _1108 = fma(_1024, _982, _1100);
    float _1110 = _944 * _1098;
    float _1112 = _836 * _1098;
    float _1114 = _968 * _1098;
    float _1116 = _880 * _1080;
    float _1118 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1120 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _1118;
    float _1122 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1124 = -_1092;
    float _1126 = _1124 + 1.0;
    float _1128 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1130 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _1128;
    float _1132 = _1120 * _1120;
    float _1134 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1136 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _1134;
    float _1138 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1122);
    float _1140 = _1096 * 0.01666666753590106964111328125;
    float _1142 = fma(_1130, _1130, _1132);
    float _1144 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1110);
    float _1146 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1112);
    float _1148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _1150 = fma(_1136, _1136, _1142);
    float _1152 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1114);
    float _1154 = _1140 * (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1156 = precise::max(_844, 0.800000011920928955078125);
    float _1158 = fma(_970, _1074, _1144);
    int _1160 = _942 ? 0 : 1;
    float _1162 = _1154 * 6.283185482025146484375;
    float _1164 = rsqrt(_1150);
    float _1166 = precise::min(_1156, 1.0);
    float _1168 = fma(_974, _1074, _1152);
    float _1170 = _1162 * 0.15915493667125701904296875;
    int _1172 = ~_1160;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    float _1178 = fma(_1004, _1066, _1158);
    float _1180 = fma(_1166, -5.000000476837158203125, 5.000000476837158203125);
    bool _1182 = !_746;
    int _1184 = _1182 ? 0 : 1;
    float _1186 = _1106 * _1148;
    int _1188 = _1176;
    if (!_930)
    {
        int _1190 = ~_1160;
        int _1192 = _1190 + 1;
        _1188 = _1192;
    }
    int _1194 = _1188;
    float _1196 = fma(_844, -2.57610607147216796875, 2.8274333477020263671875);
    int _1198 = ~_918;
    int _1200 = _1198 + 1;
    int _1202 = _1200 + 1;
    float _1204 = fma(_1040, _1066, _1168);
    int _1206 = abs(_1184);
    float _1208 = 3.1415927410125732421875 * (*spvDescriptorSet0.vp_c9)._m0[191].w;
    int _1210 = _1202;
    if (!_890)
    {
        int _1212 = ~_918;
        int _1214 = _1212 + 1;
        _1210 = _1214;
    }
    int _1216 = _1210;
    float _1218 = _1130 * _1164;
    float _1220 = _1170 * 6.283185482025146484375;
    float _1222 = sin(_1220);
    float _1224 = _1196 * 0.15915493667125701904296875;
    float _1226 = _1120 * _1164;
    float _1228 = _1136 * _1164;
    float _1230 = precise::max(0.0, _844);
    float _1232 = _1186 * 6.283185482025146484375;
    float _1234 = _1170 * 6.283185482025146484375;
    float _1236 = cos(_1234);
    float _1238 = precise::min(_1230, 0.20000000298023223876953125);
    float _1240 = _1208 * _1072;
    float _1242 = fma(_838, _1074, _1146);
    float _1244 = _1238 * 5.0;
    float _1246 = fma(_1038, _1066, _1242);
    float _1248 = _1224 * 6.283185482025146484375;
    float _1250 = sin(_1248);
    float _1252 = _1240 * 0.15915493667125701904296875;
    float _1254 = _1244 * _1180;
    float _1256 = _1222 * _980;
    float _1258 = float(_874);
    float _1260 = _1226 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1262 = float(_1206);
    float _1264 = _422 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1266 = _1236 * _980;
    float _1268 = -_1256;
    float _1270 = fma(_1108, _1236, _1268);
    float _1272 = sqrt(_1102);
    float _1274 = _1262 * _1258;
    float _1276 = fma(_1108, _1222, _1266);
    bool _1278 = !_742;
    int _1280 = _1278 ? 0 : 1;
    float _1282 = fma(_1218, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1260);
    bool _1284 = !_750;
    int _1286 = _1284 ? 0 : 1;
    float _1288 = _1250 + _1250;
    float _1290 = _1274 * (-2.0);
    float _1292 = _1224 * 6.283185482025146484375;
    float _1294 = cos(_1292);
    int _1296 = abs(_1286);
    float _1298 = -_1250;
    float _1300 = fma(_966, _1288, _1298);
    float _1302 = _1138 * 6.283185482025146484375;
    float _1304 = fma(_1254, 0.14999997615814208984375, 0.85000002384185791015625);
    int _1306 = abs(_1280);
    float _1308 = fma(_886, _1290, _886);
    float _1310 = in.m_57.x;
    float _1312 = in.m_57.y;
    float _1314 = in.m_57.z;
    float _1316 = _1302 * 0.15915493667125701904296875;
    float _1318 = _1252 * 6.283185482025146484375;
    float _1320 = cos(_1318);
    float _1322 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1324 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1264);
    float _1326 = float(_1306);
    float _1328 = fma(_1228, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1282);
    float _1330 = float(_1216);
    float _1332 = _1316 * 6.283185482025146484375;
    float _1334 = sin(_1332);
    float _1336 = float(_1296);
    float _1338 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1340 = float(_1194);
    float _1342 = _1326 * _1330;
    float _1344 = precise::max(_1272, 200.0);
    float _1346 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1348 = _1252 * 6.283185482025146484375;
    float _1350 = sin(_1348);
    float _1352 = _1336 * _1340;
    float _1354 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1178);
    float _1356 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1246);
    float _1358 = precise::min(_1344, 500.0);
    float _1360 = -_1346;
    float _1362 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1360);
    float _1364 = fma(_1290, _1312, _1312);
    float _1366 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1324);
    float _1368 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1270);
    float _1370 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1204);
    float _1372 = _1276 * _1320;
    float _1374 = sqrt(_946);
    float _1376 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1378 = fma(_1358, 0.0033333334140479564666748046875, -0.666666686534881591796875);
    float _1380 = _422 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1382 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1362);
    float _1384 = _1276 * _1350;
    float _1386 = fma(_1368, _1350, _1372);
    float _1388 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1390 = sqrt(_888);
    float _1392 = -_1384;
    float _1394 = fma(_1368, _1320, _1392);
    float _1396 = _1342 * (-2.0);
    float _1398 = -_1388;
    float _1400 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1398);
    float _1402 = -_1376;
    float _1404 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1402);
    float _1406 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1380);
    float _1408 = fma(_906, _1396, _906);
    float _1410 = fma(_1396, _1310, _1310);
    float _1412 = _422 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1414 = sqrt(_910);
    float _1416 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1400);
    float _1418 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1404);
    float _1420 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1412);
    float _1422 = -_424;
    float _1424 = _1422 + _1382;
    float _1426 = -_422;
    float _1428 = _1426 + _1416;
    float _1430 = -_410;
    float _1432 = _1430 + _1418;
    float _1434 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1420);
    float _1436 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1406);
    float _1438 = _1428 * _1374;
    float _1440 = _1432 * _1390;
    float _1442 = _1434 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1444 = in.m_49.x;
    float _1446 = in.m_49.y;
    float _1448 = in.m_49.z;
    float _1450 = fma(_1438, (*spvDescriptorSet0.vp_c10)._m0[2].w, _600);
    float _1452 = fma(_1440, (*spvDescriptorSet0.vp_c10)._m0[2].w, _602);
    float _1454 = _1440 + _1442;
    float _1456 = _1424 * _1414;
    float _1458 = _1450 * _1450;
    float _1460 = _1366 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1462 = _1232 * 0.15915493667125701904296875;
    float _1464 = fma(_1456, (*spvDescriptorSet0.vp_c10)._m0[2].w, _604);
    float _1466 = fma(_1452, _1452, _1458);
    float _1468 = _1438 + _1460;
    float _1470 = _1436 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1472 = _1352 * (-2.0);
    float _1474 = fma(_1464, _1464, _1466);
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1478 = _1468 + _1476;
    float _1480 = _1456 + _1470;
    float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1484 = _1454 + _1482;
    float _1486 = _808 + (-0.5);
    float _1488 = _1478 * _1478;
    float _1490 = rsqrt(_1474);
    float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1494 = _1480 + _1492;
    bool _1496 = !_998;
    float _1498 = _1496 ? _130 : _1116;
    float _1500 = fma(_1484, _1484, _1488);
    float _1502 = fma(_920, _1472, _920);
    float _1504 = fma(_1472, _1314, _1314);
    float _1506 = _1356 * _1446;
    float _1508 = fma(_1486, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1364);
    float _1510 = _1462 * 6.283185482025146484375;
    float _1512 = sin(_1510);
    float _1514 = _606 + (-0.5);
    float _1516 = _726 + (-0.5);
    float _1518 = fma(_1494, _1494, _1500);
    float _1520 = fma(_1498, _1308, _1508);
    float _1522 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1410);
    float _1524 = fma(_1516, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1504);
    float _1526 = _1370 * _1448;
    float _1528 = _1450 * _1490;
    float _1530 = rsqrt(_1518);
    float _1532 = _1520 * 0.15915493667125701904296875;
    float _1534 = fma(_1498, _1502, _1524);
    float _1536 = _1452 * _1490;
    float _1538 = _1528 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1540 = fma(_1498, _1408, _1522);
    float _1542 = _1394 + (-1.41421401500701904296875);
    float _1544 = _1464 * _1490;
    float _1546 = _1462 * 6.283185482025146484375;
    float _1548 = cos(_1546);
    float _1550 = fma(_1536, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1538);
    float _1552 = _1512 * _1542;
    float _1554 = _1540 * 0.15915493667125701904296875;
    float _1556 = fma(_1544, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1550);
    float _1558 = _1354 * _1444;
    float _1560 = _1478 * _1530;
    float _1562 = _1484 * _1530;
    float _1564 = abs(_1556);
    bool _1566 = _1564 > 0.99989998340606689453125;
    float _1568 = _1386 * _1304;
    float _1570 = -_1560;
    float _1572 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1478);
    float _1574 = -_1562;
    float _1576 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1484);
    float _1578 = _1552 * _1304;
    float _1580 = _1554 * 6.283185482025146484375;
    float _1582 = sin(_1580);
    float _1584 = fma(_1548, _1542, 1.41421401500701904296875);
    float _1586 = _1572 * _1572;
    float _1588 = _1494 * _1530;
    float _1590 = _1584 * _1304;
    float _1592 = fma(_1576, _1576, _1586);
    float _1594 = _1534 * 0.15915493667125701904296875;
    float _1596 = _1586;
    float _1598 = _1538;
    float _1600 = _1556;
    float _1602 = _1554;
    int _1604 = as_type<int>(_1322);
    int _1606 = as_type<int>(_1282);
    if (_1566)
    {
        _1596 = 0.001000000047497451305389404296875;
    }
    float _1608 = _1596;
    float _1610 = -_1588;
    float _1612 = fma(_1610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1494);
    if (!_1566)
    {
        _1598 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1614 = _1598;
    float _1616 = _1554 * 6.283185482025146484375;
    float _1618 = cos(_1616);
    float _1620 = _1614;
    if (!_1566)
    {
        _1600 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1622 = _1600;
    float _1624 = _1622;
    if (_1566)
    {
        float _1626 = fma(_1608, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1620 = _1626;
    }
    float _1628 = _1620;
    float _1630 = fma(_1612, _1612, _1592);
    if (_1566)
    {
        float _1632 = fma(_1608, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1624 = _1632;
    }
    float _1634 = _1624;
    bool _1636 = _1328 > 0.0;
    float _1638 = -_1628;
    float _1640 = _1544 * _1638;
    bool _1642 = _1328 >= 0.0;
    bool _1644 = isnan(_1328);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan(0.0);
    bool _1650 = _1646 || _1648;
    float _1652 = -_1634;
    float _1654 = _1528 * _1652;
    if (!_1566)
    {
        _1602 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1656 = _1602;
    float _1658 = _1656;
    if (_1566)
    {
        float _1660 = fma(_1608, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1658 = _1660;
    }
    float _1662 = _1658;
    float _1664 = -_1634;
    float _1666 = -_1640;
    float _1668 = fma(_1536, _1664, _1666);
    float _1670 = _1532 * 6.283185482025146484375;
    float _1672 = sin(_1670);
    int _1674 = _1650 ? 0 : 1;
    float _1676 = -_1662;
    float _1678 = _1536 * _1676;
    float _1680 = -_1662;
    float _1682 = -_1654;
    float _1684 = fma(_1544, _1680, _1682);
    float _1686 = _1668 * _1668;
    int _1688 = ~_1674;
    int _1690 = _1688 + 1;
    int _1692 = _1690 + 1;
    float _1694 = -_1628;
    float _1696 = -_1678;
    float _1698 = fma(_1528, _1694, _1696);
    int _1700 = _1692;
    if (!_1636)
    {
        int _1702 = ~_1674;
        int _1704 = _1702 + 1;
        _1700 = _1704;
    }
    int _1706 = _1700;
    float _1708 = fma(_1684, _1684, _1686);
    float _1710 = _1532 * 6.283185482025146484375;
    float _1712 = cos(_1710);
    float _1714 = abs(_1328);
    float _1716 = _1714 * 5.0;
    float _1718 = float(_1706);
    float _1720 = fma(_1698, _1698, _1708);
    float _1722 = _1506 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1724 = _1526 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1726 = _808 > 0.5;
    float _1728 = _1582 * _1672;
    float _1730 = _1594 * 6.283185482025146484375;
    float _1732 = cos(_1730);
    float _1734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1568);
    float _1736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1578);
    float _1738 = _1718 * _1716;
    bool _1740 = _726 > 0.5;
    float _1742 = _1378 * _1738;
    float _1744 = sqrt(_1630);
    float _1746 = _1582 * _1712;
    float _1748 = _1618 * _1712;
    float _1750 = fma(_1378, 0.5, 1.0);
    float _1752 = _1594 * 6.283185482025146484375;
    float _1754 = sin(_1752);
    float _1756 = _1712 * _1732;
    float _1758 = _1558 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1760 = _1582 * _1732;
    float _1762 = _1618 * _1672;
    float _1764 = _1618 * _1732;
    float _1766 = _1672 * _1732;
    float _1768 = rsqrt(_1720);
    float _1770 = _1530 * _1744;
    float _1772 = _1764 * _1536;
    float _1774 = _1758 * _1770;
    float _1776 = _1722 * _1770;
    float _1778 = _1724 * _1770;
    float _1780 = fma(_1754, _1748, _1728);
    float _1782 = fma(_1754, _1728, _1748);
    float _1784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1590);
    float _1786 = -_1762;
    float _1788 = fma(_1754, _1746, _1786);
    float _1790 = -_1746;
    float _1792 = fma(_1754, _1762, _1790);
    float _1794 = _1780 * _1536;
    float _1796 = _1774 * _1784;
    float _1798 = _1778 * _1736;
    float _1800 = _1684 * _1768;
    float _1802 = _1668 * _1768;
    float _1804 = _1698 * _1768;
    float _1806 = _1780 * _1544;
    float _1808 = fma(_1756, _1800, _1794);
    float _1810 = _1764 * _1544;
    float _1812 = _1536 * _1802;
    float _1814 = fma(_1756, _1804, _1806);
    float _1816 = _1528 * _1804;
    float _1818 = -_1754;
    float _1820 = fma(_1818, _1804, _1810);
    float _1822 = -_1812;
    float _1824 = fma(_1528, _1800, _1822);
    float _1826 = _1776 * _1734;
    float _1828 = _1792 * _1536;
    float _1830 = -_1754;
    float _1832 = fma(_1830, _1800, _1772);
    float _1834 = -_1816;
    float _1836 = fma(_1544, _1802, _1834);
    float _1838 = _1792 * _1544;
    float _1840 = fma(_1760, _1824, _1820);
    float _1842 = fma(_1766, _1800, _1828);
    float _1844 = fma(_1760, _1836, _1832);
    float _1846 = fma(_1766, _1804, _1838);
    float _1848 = fma(_1788, _1824, _1814);
    float _1850 = _1826 * _1840;
    float _1852 = fma(_1788, _1836, _1808);
    float _1854 = _1826 * _1844;
    float _1856 = fma(_1782, _1824, _1846);
    float _1858 = fma(_1796, _1848, _1850);
    float _1860 = fma(_1782, _1836, _1842);
    float _1862 = fma(_1796, _1852, _1854);
    float _1864 = _1780 * _1528;
    float _1866 = fma(_1798, _1856, _1858);
    float _1868 = _1792 * _1528;
    float _1870 = fma(_1798, _1860, _1862);
    float _1872 = fma(_1756, _1802, _1864);
    float _1874 = _1480 + _1866;
    float _1876 = _1764 * _1528;
    float _1878 = _1454 + _1870;
    float _1880 = fma(_1766, _1802, _1868);
    float _1882 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1884 = _1874 + _1882;
    float _1886 = _1544 * _1800;
    float _1888 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1890 = _1878 + _1888;
    float _1892 = -_1754;
    float _1894 = fma(_1892, _1802, _1876);
    float _1896 = fma(_1884, _1750, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1898 = -_1886;
    float _1900 = fma(_1536, _1804, _1898);
    float _1902 = fma(_1890, _1750, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1904 = fma(_1742, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1896);
    float _1906 = fma(_1760, _1900, _1894);
    float _1908 = fma(_1742, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1902);
    float _1910 = in.m_59.y;
    float _1912 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1914 = _1904 + _1912;
    float _1916 = fma(_1788, _1900, _1872);
    float _1918 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1920 = _1908 + _1918;
    float _1922 = _1826 * _1906;
    float _1924 = _1914 * _1914;
    float _1926 = fma(_1782, _1900, _1880);
    float _1928 = fma(_1796, _1916, _1922);
    float _1930 = fma(_1920, _1920, _1924);
    float _1932 = in.m_51.w;
    float _1934 = fma(_1798, _1926, _1928);
    float _1936 = sqrt(_1930);
    int _1938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1940 = _1938 != 0;
    float _1942 = _1468 + _1934;
    int _1944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1946 = _1944 != 0;
    int _1948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1950 = _1948 != 0;
    float _1952 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1954 = _1942 + _1952;
    float _1956 = fma(_1954, _1750, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1958 = -_1910;
    float _1960 = _1958 + 1.0;
    float _1962 = fma(_1742, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1956);
    bool _1964 = _1936 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1966 = _1726 ? _1960 : _1910;
    int _1968 = _1740 ? as_type<int>(_1960) : as_type<int>(_1910);
    bool _1970 = _1932 > 0.5;
    float _1972 = _1946 ? _1966 : _1910;
    float _1974 = _1950 ? as_type<float>(_1968) : _1910;
    float _1976 = _1910;
    float _1978 = _1960;
    float _1980 = _1932;
    float _1982 = _1908;
    float _1984 = _1966;
    float _1986 = _1930;
    if (_1940)
    {
        float _1988 = _1970 ? _1960 : _1910;
        _1976 = _1988;
    }
    float _1990 = _1976;
    if (!_1964)
    {
        _1978 = _1904;
    }
    float _1992 = _1978;
    float _1994 = _1992;
    if (!_1964)
    {
        _1980 = _1962;
    }
    float _1996 = _1980;
    bool _1998 = !_1964;
    float _2000 = _1996;
    if (!_1998)
    {
        float _2002 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2004 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2006 = _1936 + _2004;
        float _2008 = _1962 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2010 = rsqrt(_1930);
        float _2012 = _2006 * _2002;
        float _2014 = _2012 * 0.15915493667125701904296875;
        float _2016 = _2014 * 6.283185482025146484375;
        float _2018 = sin(_2016);
        float _2020 = _2014 * 6.283185482025146484375;
        float _2022 = cos(_2020);
        float _2024 = fma(_2018, _2008, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2026 = _2010 * _2024;
        float _2028 = _2022 + (-1.0);
        float _2030 = fma(_1920, _2026, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2032 = fma(_1914, _2026, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2034 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2036 = fma(_1962, _2022, _2034);
        _2000 = _2036;
        _1982 = _2030;
        _1994 = _2032;
        _1984 = _2014;
    }
    float _2038 = _2000;
    float _2040 = _1982;
    float _2042 = _1994;
    float _2044 = _1984;
    float _2046 = -_1560;
    float _2048 = fma(_2046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2038);
    float _2050 = -_1562;
    float _2052 = fma(_2050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2040);
    float _2054 = -_1588;
    float _2056 = fma(_2054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2042);
    float _2058 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2060 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2062 = _2048 + _2060;
    float _2064 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2066 = _2052 + _2064;
    float _2068 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2070 = _2056 + _2068;
    float _2072 = _2062 * _2062;
    float _2074 = fma(_2066, _2066, _2072);
    float _2076 = fma(_2070, _2070, _2074);
    float _2078 = rsqrt(_2076);
    float _2080 = _2078 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2082 = _2066 * _2080;
    float _2084 = _2070 * _2080;
    float _2086 = _2082 * _2082;
    float _2088 = _2084 * _2084;
    float _2090 = _2086 + _2088;
    float _2092 = sqrt(_2090);
    bool _2094 = _2092 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2096 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2098 = _2092 + _2096;
    float _2100 = _2078;
    float _2102 = _2044;
    float _2104 = _2098;
    float _2106 = _2062;
    float _2108 = _2090;
    float _2110 = _2058;
    float _2112 = _2082;
    if (_2094)
    {
        float _2114 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2100 = _2114;
    }
    float _2116 = _2100;
    if (_2094)
    {
        float _2118 = rsqrt(_2090);
        _2102 = _2118;
    }
    float _2120 = _2102;
    if (_2094)
    {
        float _2122 = _2098 * _2116;
        _2104 = _2122;
    }
    float _2124 = _2104;
    if (_2094)
    {
        float _2126 = _2124 * 0.15915493667125701904296875;
        _1986 = _2126;
    }
    float _2128 = _1986;
    float _2130 = precise::max(0.0, _2058);
    float _2132 = _2116;
    float _2134 = _2130;
    if (_2094)
    {
        float _2136 = _2128 * 6.283185482025146484375;
        float _2138 = sin(_2136);
        _2132 = _2138;
    }
    float _2140 = _2132;
    float _2142 = -_2080;
    float _2144 = -_2130;
    float _2146 = fma(_2062, _2142, _2144);
    if (!_2094)
    {
        _2106 = _2082;
    }
    float _2148 = _2106;
    float _2150 = _2148;
    if (_2094)
    {
        float _2152 = _2146 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2134 = _2152;
    }
    float _2154 = _2134;
    float _2156 = _2070;
    float _2158 = _2154;
    if (_2094)
    {
        float _2160 = _2128 * 6.283185482025146484375;
        float _2162 = cos(_2160);
        _2156 = _2162;
    }
    float _2164 = _2156;
    float _2166 = _2140;
    if (_2094)
    {
        float _2168 = fma(_2140, _2154, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2166 = _2168;
    }
    float _2170 = _2166;
    float _2172 = _2170;
    if (!_2094)
    {
        _2158 = _2146;
    }
    float _2174 = _2158;
    float _2176 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2178 = _2174;
    if (_2094)
    {
        float _2180 = _2120 * _2170;
        _2108 = _2180;
    }
    float _2182 = _2108;
    if (!_2094)
    {
        _2172 = _2086;
    }
    float _2184 = _2172;
    float _2186 = sqrt(_2076);
    float _2188 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2176);
    float _2190 = _2184;
    float _2192 = _2164;
    if (_2094)
    {
        float _2194 = _2164 + (-1.0);
        _2110 = _2194;
    }
    float _2196 = _2110;
    float _2198 = _2196;
    if (_2094)
    {
        float _2200 = _2082 * _2182;
        _2150 = _2200;
    }
    float _2202 = _2150;
    if (_2094)
    {
        float _2204 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2112 = _2204;
    }
    float _2206 = _2112;
    if (!_2094)
    {
        _2198 = _2084;
    }
    float _2208 = _2198;
    float _2210 = _2208;
    if (_2094)
    {
        float _2212 = _2084 * _2182;
        _2210 = _2212;
    }
    float _2214 = _2210;
    if (_2094)
    {
        float _2216 = _2202 * _2202;
        _2190 = _2216;
    }
    float _2218 = _2190;
    if (_2094)
    {
        float _2220 = fma(_2146, _2164, _2206);
        _2178 = _2220;
    }
    float _2222 = _2178;
    if (!_2094)
    {
        _2192 = _2088;
    }
    float _2224 = _2192;
    float _2226 = _2224;
    if (_2094)
    {
        float _2228 = _2214 * _2214;
        _2226 = _2228;
    }
    float _2230 = _2226;
    float _2232 = fma(_2222, _2222, _2218);
    float _2234 = _2232 + _2230;
    float _2236 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2238 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2240 = fma(_2186, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2238);
    float _2242 = precise::clamp(_2240, 0.0, 1.0);
    float _2244 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2246 = rsqrt(_2234);
    float _2248 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2236);
    float _2250 = -_2242;
    float _2252 = _2250 + 1.0;
    float _2254 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2244);
    float _2256 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2258 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2248);
    float _2260 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2262 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2254);
    float _2264 = abs(_2252);
    float _2266 = log2(_2264);
    float _2268 = _2258 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2270 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2260);
    float _2272 = _2262 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2274 = _2268 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2276 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2270);
    float _2278 = _2246 * _2202;
    float _2280 = -_2274;
    float _2282 = fma(_2280, _2256, 1.0);
    float _2284 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2188);
    float _2286 = _2276 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2288 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2290 = _2246 * _2222;
    float _2292 = _2278 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2294 = _2246 * _2214;
    float _2296 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2288);
    float _2298 = _2284 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2300 = -_2292;
    float _2302 = fma(_2290, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2300);
    float _2304 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2306 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2296);
    float _2308 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2310 = -_2294;
    float _2312 = fma(_2310, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2302);
    float _2314 = log2(_2282);
    float _2316 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2306);
    float _2318 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2320 = fma(_2312, -0.5, 0.5);
    float _2322 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2308);
    float _2324 = fma(_2312, 0.5, 0.5);
    float _2326 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2318);
    float _2328 = _2290 + 1.0;
    float _2330 = 1.0 / _2316;
    float _2332 = fma(_2324, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2334 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2326);
    float _2336 = fma(_2324, _2332, -0.212114393711090087890625);
    float _2338 = exp2(_2304);
    float _2340 = _2314 * 0.693147182464599609375;
    float _2342 = fma(_2324, _2336, 1.570728778839111328125);
    float _2344 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2346 = sqrt(_2320);
    float _2348 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2322);
    float _2350 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2334);
    float _2352 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2348);
    float _2354 = -_2290;
    float _2356 = fma(_2338, _2328, _2354);
    float _2358 = _2352 * _2330;
    float _2360 = _2350 * _2330;
    float _2362 = fma(_2360, 0.5, 0.5);
    float _2364 = _2346 * 0.636619746685028076171875;
    float _2366 = fma(_2358, -0.5, 0.5);
    float _2368 = fma(_2356, 0.5, 0.5);
    float _2370 = -_2342;
    float _2372 = fma(_2364, _2370, 1.0);
    float3 _6506 = float3(_2362, _2366, _2344);
    float _2374 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6506, float3(0.0), isnan(_6506)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6506, float3(0.0), isnan(_6506)), level(0.0)).x;
    float3 _6517 = float3(_2362, _2366, _2344);
    float4 _2377 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6517, float3(0.0), isnan(_6517)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6517, float3(0.0), isnan(_6517)), level(0.0)).xyzw;
    float _2379 = _2377.x;
    float _2381 = _2377.y;
    float _2383 = _2377.z;
    float _2385 = _2377.w;
    float2 _6534 = float2(_2372, _2368);
    float3 _2389 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6534, float2(0.0), isnan(_6534)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6534, float2(0.0), isnan(_6534)), level(0.0)).xyz;
    float _2391 = _2389.x;
    float _2393 = _2389.y;
    float _2395 = _2389.z;
    float _2397 = in.m_59.x;
    float _2399 = -_1560;
    float _2401 = fma(_2399, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1468);
    int _2403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2405 = _2403 != 0;
    out.m_61.z = _1072;
    int _2407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2409 = _2407 != 0;
    float _2411 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2415 = _2413 != 0;
    float _2417 = _808 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2421 = _2419 != 0;
    float _2423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2425 = fma(_2417, -2.0, _2411);
    float _2427 = _606 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2429 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2431 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2433 = (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2435 = _2427;
    float _2437 = (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2439 = _2405;
    if (!_2405)
    {
        _2433 = _726;
    }
    float _2441 = _2433;
    float _2443 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2445 = -_2429;
    float _2447 = fma(_2427, 2.0, _2445);
    bool _2449 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2451 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2453 = _2449 || _2451;
    bool _2455 = isnan(0.5);
    bool _2457 = _2453 || _2455;
    out.m_63.w = _2431;
    float _2459 = _2441;
    if (!_2405)
    {
        _2435 = _726;
    }
    float _2461 = _2435;
    float _2463 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2443);
    float _2465 = -_1588;
    float _2467 = fma(_2465, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1480);
    float _2469 = _2461;
    if (!_2405)
    {
        _2437 = _808;
    }
    float _2471 = _2437;
    float _2473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2475 = _2471;
    if (_2405)
    {
        _2469 = _808;
    }
    float _2477 = _2469;
    float _2479 = -_1562;
    float _2481 = fma(_2479, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1454);
    if (_2405)
    {
        _2459 = _808;
    }
    float _2483 = _2459;
    float _2485 = _2401 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2487 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2489 = _2485;
    if (_2405)
    {
        _2475 = _606;
    }
    float _2491 = _2475;
    float _2493 = fma(_2481, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2485);
    if (_2409)
    {
        bool _2495 = _606 > 0.5;
        _2439 = _2495;
    }
    bool _2497 = _2439;
    float _2499 = (*spvDescriptorSet0.vp_c9)._m0[83].y + (*spvDescriptorSet0.vp_c9)._m0[83].w;
    float _2501 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2487);
    float _2503 = fma(_2467, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2493);
    float _2505 = _2423 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2507 = _2505;
    if (!_2409)
    {
        _2489 = _2397;
    }
    float _2509 = _2489;
    float _2511 = fma(_2483, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2499);
    float _2513 = _2503 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2515 = _2401 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2517 = fma(_2505, _1972, -0.5);
    float _2519 = _2509;
    if (!_2409)
    {
        _2507 = _2509;
    }
    float _2521 = _2507;
    float _2523 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2425);
    float _2525 = _2521;
    if (_2409)
    {
        _2519 = _2397;
    }
    float _2527 = _2519;
    float _2529 = fma(_2481, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2515);
    float _2531 = 1.0 / _2513;
    float _2533 = _2473 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2535 = fma(_2467, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2529);
    float _2537 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2463);
    float _2539 = (*spvDescriptorSet0.vp_c9)._m0[83].x + (*spvDescriptorSet0.vp_c9)._m0[83].z;
    float _2541 = _2535 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2543 = _2477 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2545 = (*spvDescriptorSet0.vp_c9)._m0[81].w + (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2547 = fma(_2491, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2539);
    float _2549 = _2541 + _2513;
    float _2551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2553 = -_2523;
    float _2555 = fma(_2537, _2517, _2553);
    float _2557 = fma(_2533, _1990, -0.5);
    float _2559 = fma(_2543, -2.0, _2545);
    float _2561 = _2549 * _2531;
    float _2563 = _2561 * 0.5;
    float _2565 = _2491 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2569 = (*spvDescriptorSet0.vp_c9)._m0[81].z + (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[83].x);
    float _2573 = _2565;
    float _2575 = _2545;
    if (_2409)
    {
        float _2577 = -_2527;
        float _2579 = _2577 + 1.0;
        _2571 = as_type<int>(_2579);
    }
    int _2581 = _2571;
    float _2583 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2585 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2583);
    if (_2415)
    {
        float _2587 = -_2527;
        float _2589 = _2587 + 1.0;
        _1604 = as_type<int>(_2589);
    }
    int _2591 = _1604;
    if (_2421)
    {
        float _2593 = -_2527;
        float _2595 = _2593 + 1.0;
        _1606 = as_type<int>(_2595);
    }
    int _2597 = _1606;
    float _2599 = -_2569;
    float _2601 = fma(_2565, 2.0, _2599);
    if (!_2415)
    {
        _2573 = _2527;
    }
    float _2603 = _2573;
    float _2605 = _2551 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2607 = _2603;
    if (!_2421)
    {
        _2575 = _2527;
    }
    float _2609 = _2575;
    float _2611 = 1.0 / _2585;
    float _2613 = _2609;
    if (_2409)
    {
        float _2615 = _2497 ? as_type<float>(_2581) : _2527;
        _2525 = _2615;
    }
    float _2617 = _2525;
    float _2619 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2547);
    if (_2415)
    {
        float _2621 = _1740 ? as_type<float>(_2591) : _2527;
        _2607 = _2621;
    }
    float _2623 = _2607;
    float _2625 = -_130;
    float _2627 = fma(_2625, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2601);
    if (_2421)
    {
        float _2629 = _1726 ? as_type<float>(_2597) : _2527;
        _2613 = _2629;
    }
    float _2631 = _2613;
    float _2633 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2501);
    float _2635 = -_130;
    float _2637 = fma(_2635, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2447);
    float _2639 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2511);
    float _2641 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2559);
    float _2643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _2645 = _2567 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2647 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2649 = fma(_2605, _2623, -0.5);
    float _2651 = -_2641;
    float _2653 = fma(_2557, _2639, _2651);
    float _2655 = fma(_2645, _2617, -0.5);
    float _2657 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2647);
    float _2659 = _2639;
    float _2661 = _2655;
    if (_2457)
    {
        _2659 = 1.0;
    }
    float _2663 = _2659;
    float _2665 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _2667 = fma(_2633, _2655, _2637);
    float _2669 = fma(_2619, _2649, _2627);
    float _2671 = _2663;
    if (_2457)
    {
        _2661 = 1.0;
    }
    float _2673 = _2661;
    float _2675 = _1974 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2677 = _2631 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2679 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2681 = _2611 * _2679;
    float _2683 = _2673;
    if (!_2457)
    {
        float _2685 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2687 = _2685 * 0.15915493667125701904296875;
        float _2689 = _2687 * 6.283185482025146484375;
        float _2691 = cos(_2689);
        float _2693 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2695 = _2693 * 0.15915493667125701904296875;
        float _2697 = _2687 * 6.283185482025146484375;
        float _2699 = sin(_2697);
        float _2701 = 1.0 / _2691;
        float _2703 = _2695 * 6.283185482025146484375;
        float _2705 = cos(_2703);
        float _2707 = _2699 * _2701;
        float _2709 = _2695 * 6.283185482025146484375;
        float _2711 = sin(_2709);
        float _2713 = _2705 * _2707;
        float _2715 = 1.0 / _2713;
        float _2717 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2719 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2717;
        float _2721 = 1.0 / _2719;
        float _2723 = _2711 * _2715;
        float _2725 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2727 = fma(_2681, _2723, _2725);
        float _2729 = _2727 * _2721;
        float _2731 = precise::clamp(_2729, 0.0, 1.0);
        _2671 = _2731;
    }
    float _2733 = _2671;
    if (!_2457)
    {
        float _2735 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2737 = _2735 * 0.15915493667125701904296875;
        float _2739 = _2737 * 6.283185482025146484375;
        float _2741 = cos(_2739);
        float _2743 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2745 = _2743 * 0.15915493667125701904296875;
        float _2747 = _2737 * 6.283185482025146484375;
        float _2749 = sin(_2747);
        float _2751 = 1.0 / _2741;
        float _2753 = _2745 * 6.283185482025146484375;
        float _2755 = cos(_2753);
        float _2757 = _2749 * _2751;
        float _2759 = _2745 * 6.283185482025146484375;
        float _2761 = sin(_2759);
        float _2763 = _2755 * _2757;
        float _2765 = 1.0 / _2763;
        float _2767 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2769 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2767;
        float _2771 = 1.0 / _2769;
        float _2773 = _2761 * _2765;
        float _2775 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2777 = fma(_2681, _2773, _2775);
        float _2779 = _2777 * _2771;
        float _2781 = precise::clamp(_2779, 0.0, 1.0);
        float _2783 = -_2781;
        float _2785 = _2783 + 1.0;
        _2683 = _2785;
    }
    float _2787 = _2683;
    float _2789 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2657);
    float _2791 = _2677 * _2665;
    float _2793 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2795 = _2733 * _2787;
    float _2797 = _2675 * _2643;
    float _2799 = _2667 + 0.5;
    bool _2801 = _2733 > 0.0;
    bool _2803 = isnan(_2733);
    bool _2805 = _2801 || _2803;
    bool _2807 = isnan(0.0);
    bool _2809 = _2805 || _2807;
    float _2811 = _2795 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2813 = exp2(_2793);
    out.m_65.x = _2481;
    out.m_65.y = _2401;
    out.m_65.z = _2467;
    float _2815 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2789);
    float _2817 = _694 * _2811;
    bool _2819 = _2787 <= 0.0;
    bool _2821 = !_2809;
    bool _2823 = _2819 || _2821;
    float _2825 = _2653 + 0.5;
    float _2827 = _2815 + _2316;
    float _2829 = _2817 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2831 = _2350 + _2316;
    float _2833 = _2316 * 0.5;
    out.m_67.x = _2052;
    out.m_67.y = _2048;
    out.m_67.z = _2056;
    float _2835 = _2555 + 0.5;
    float _2837 = _2669 + 0.5;
    out.m_45.x = _2829;
    float _2839 = _2827 * 0.5;
    float _2841 = -_2813;
    float _2843 = _2841 + 1.0;
    float _2845 = _2831 * 0.5;
    float _2847 = fma(_2352, -0.5, _2833);
    out.m_69.y = _844;
    float _2849 = _2843 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.x = _2791;
    out.m_71.y = _2797;
    float _2851 = _2849 * _2374;
    float _2853 = -_2849;
    float _2855 = _2853 + 1.0;
    out.m_73.x = _2799;
    out.m_73.y = _2835;
    out.m_73.z = _2837;
    out.m_73.w = _2825;
    float _2857 = _2385 * _2851;
    float _2859 = _2395 * _2851;
    float _2861 = _2385 * _2855;
    float _2863 = fma(_2391, _2857, _2379);
    float _2865 = fma(_2393, _2857, _2381);
    float _2867 = fma(_2385, _2859, _2383);
    out.gl_Position.x = _2350;
    out.gl_Position.y = _2352;
    out.gl_Position.z = _2815;
    out.gl_Position.w = _2316;
    out.m_75.x = _2845;
    out.m_75.y = _2847;
    out.m_75.z = _2839;
    out.m_75.w = _2316;
    out.m_77.x = _2863;
    out.m_77.y = _2865;
    out.m_77.z = _2867;
    out.m_77.w = _2861;
    if (!_2823)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2869 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2869;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

