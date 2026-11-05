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

struct _35
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c12 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c15 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c10 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    const device _35* vp_s0 [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_32Smplr_w [[id(14)]];
    sampler vp_t_tcb_30Smplr_w [[id(15)]];
    sampler vp_t_tcb_1CSmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_56 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_66 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_68 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

vertex main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _650 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = as_type<float>(int(gl_VertexIndex));
    float _84 = (*spvDescriptorSet0.vp_c12)._m0[4].z * (*spvDescriptorSet0.vp_c12)._m0[5].w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    int _91 = as_type<int>(_82) >> 2;
    int _93 = _91 + _89;
    int _95 = _93 * 96;
    int _97 = _95 + 32;
    uint _100 = uint(int(uint(_95) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_100)];
    float _102 = as_type<float>(_dmw0.x);
    int _104 = _95 + 4;
    uint _106 = uint(int(uint(_104) >> uint(2)));
    float _108 = as_type<float>(_dmw0.y);
    int _110 = _95 + 8;
    uint _112 = uint(int(uint(_110) >> uint(2)));
    float _114 = as_type<float>(_dmw0.z);
    int _116 = _95 + 12;
    uint _118 = uint(int(uint(_116) >> uint(2)));
    float _120 = as_type<float>(_dmw0.w);
    uint _122 = uint(int(uint(_97) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_122)];
    float _124 = as_type<float>(_dmw2.x);
    int _126 = _97 + 4;
    uint _128 = uint(int(uint(_126) >> uint(2)));
    float _130 = as_type<float>(_dmw2.y);
    int _132 = _97 + 8;
    uint _134 = uint(int(uint(_132) >> uint(2)));
    float _136 = as_type<float>(_dmw2.z);
    int _138 = _95 + 16;
    uint _140 = uint(int(uint(_138) >> uint(2)));
    packed_uint3 _dmw1 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_140)];
    float _142 = as_type<float>(_dmw1.x);
    int _144 = _138 + 4;
    uint _146 = uint(int(uint(_144) >> uint(2)));
    float _148 = as_type<float>(_dmw1.y);
    int _150 = _138 + 8;
    uint _152 = uint(int(uint(_150) >> uint(2)));
    float _154 = as_type<float>(_dmw1.z);
    int _156 = _95 + 48;
    int _158 = as_type<int>(_82) & 2;
    bool _162 = _158 != 0;
    int _164 = as_type<int>(_82) & 1;
    bool _166 = _164 != 0;
    uint _168 = uint(int(uint(_156) >> uint(2)));
    packed_uint3 _dmw3 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_168)];
    float _170 = as_type<float>(_dmw3.x);
    int _172 = _156 + 4;
    uint _174 = uint(int(uint(_172) >> uint(2)));
    float _176 = as_type<float>(_dmw3.y);
    int _178 = _156 + 8;
    uint _180 = uint(int(uint(_178) >> uint(2)));
    float _182 = as_type<float>(_dmw3.z);
    float _184 = -_108;
    float _186 = _184 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _188 = _186 * _186;
    float _190 = _130 * _130;
    float _192 = -_102;
    float _194 = _192 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _196 = fma(_124, _124, _190);
    float _198 = -_114;
    float _200 = _198 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _202 = fma(_194, _194, _188);
    float _204 = fma(_136, _136, _196);
    float _206 = fma(_200, _200, _202);
    float _208 = rsqrt(_204);
    float _210 = rsqrt(_206);
    float _212 = _136 * _208;
    float _214 = _130 * _208;
    float _216 = _124 * _208;
    float _218 = _194 * _210;
    float _220 = _200 * _210;
    float _222 = _218 * _212;
    float _224 = _186 * _210;
    float _226 = _220 * _214;
    float _228 = -_222;
    float _230 = fma(_220, _216, _228);
    float _232 = _224 * _216;
    float _234 = -_226;
    float _236 = fma(_224, _212, _234);
    float _238 = _230 * _230;
    float _240 = -_232;
    float _242 = fma(_218, _214, _240);
    float _244 = _148 * _148;
    float _246 = fma(_236, _236, _238);
    float _248 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _250 = fma(_142, _142, _244);
    float _252 = fma(_242, _242, _246);
    float _254 = 1.0 / _248;
    float _256 = fma(_154, _154, _250);
    float _258 = rsqrt(_252);
    float _260 = float(_91);
    bool _262 = !_162;
    float _264 = _262 ? 1.0 : (-1.0);
    float _266 = rsqrt(_256);
    float _268 = abs(_120);
    float _270 = _268 * _264;
    float _272 = _270 * 0.5;
    float _274 = _260 * _254;
    float _276 = -(*spvDescriptorSet0.vp_c12)._m0[1].z;
    float _278 = _276 + (*spvDescriptorSet0.vp_c12)._m0[1].w;
    float _280 = _236 * _258;
    float _282 = _230 * _258;
    float _284 = _242 * _258;
    float _286 = fma(_274, _278, (*spvDescriptorSet0.vp_c12)._m0[1].z);
    float _288 = _142 * _266;
    float _290 = _148 * _266;
    float _292 = _154 * _266;
    float _294 = _286 * _272;
    float _296 = _148;
    float _298 = _154;
    float _300 = _142;
    float _302 = _294;
    float _304 = (*spvDescriptorSet0.vp_c12)._m0[4].y;
    float _306 = _280;
    float _308 = _254;
    float _310 = _82;
    float _312 = _102;
    float _314 = _114;
    float _316 = _274;
    if (!_166)
    {
        _296 = _280;
    }
    float _318 = _296;
    float _320 = _318;
    if (!_166)
    {
        _298 = _282;
    }
    float _322 = _298;
    float _324 = _322;
    if (!_166)
    {
        _300 = _284;
    }
    float _326 = _300;
    bool _328 = !_166;
    float _330 = _326;
    float _332 = _170;
    if (!_328)
    {
        float _334 = _292 * _280;
        float _336 = _290 * _284;
        float _338 = -_334;
        float _340 = fma(_288, _284, _338);
        float _342 = _288 * _282;
        float _344 = -_336;
        float _346 = fma(_292, _282, _344);
        float _348 = _340 * _340;
        float _350 = -_342;
        float _352 = fma(_290, _280, _350);
        float _354 = fma(_346, _346, _348);
        float _356 = fma(_352, _352, _354);
        float _358 = rsqrt(_356);
        float _360 = _346 * _358;
        float _362 = _340 * _358;
        float _364 = _352 * _358;
        _330 = _364;
        _320 = _360;
        _324 = _362;
    }
    float _366 = _330;
    float _368 = _320;
    float _370 = _324;
    float _372 = _366 * _272;
    float _374 = -_294;
    float _376 = fma(_368, _374, _102);
    float _378 = -_294;
    float _380 = fma(_370, _378, _108);
    float _382 = -_372;
    float _384 = fma(_286, _382, _114);
    float _386 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _388 = _376 + _386;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _392 = _390 != 0;
    float _394 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _396 = _384 + _394;
    float _398 = _388 * _388;
    float _400 = _396 * _396;
    float _402 = _398 + _400;
    float _404 = sqrt(_402);
    bool _406 = _404 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _408 = _398;
    float _410 = _400;
    float _412 = _370;
    float _414 = _376;
    float _416 = _384;
    float _418 = _388;
    if (!_406)
    {
        _302 = _380;
    }
    float _420 = _302;
    bool _422 = !_406;
    float _424 = _420;
    if (!_422)
    {
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _428 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _430 = _404 + _428;
        float _432 = rsqrt(_402);
        float _434 = _430 * _426;
        float _436 = _380 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _438 = _434 * 0.15915493667125701904296875;
        float _440 = _438 * 6.283185482025146484375;
        float _442 = sin(_440);
        float _444 = _438 * 6.283185482025146484375;
        float _446 = cos(_444);
        float _448 = fma(_442, _436, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _450 = _432 * _448;
        float _452 = _446 + (-1.0);
        float _454 = fma(_388, _450, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _456 = fma(_396, _450, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _458 = _452 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _460 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _462 = _454 + _460;
        float _464 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _466 = _456 + _464;
        float _468 = fma(_380, _446, _458);
        float _470 = _462 * _462;
        float _472 = _466 * _466;
        _424 = _468;
        _408 = _470;
        _410 = _472;
        _412 = _466;
        _414 = _454;
        _416 = _456;
    }
    float _474 = _424;
    float _476 = _408;
    float _478 = _410;
    float _480 = _412;
    float _482 = _414;
    float _484 = _416;
    float _486 = _480;
    if (_392)
    {
        _304 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    }
    float _488 = _304;
    float _490 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _492 = _474 + _490;
    float _494 = _488;
    if (_392)
    {
        _306 = (*spvDescriptorSet0.vp_c8)._m0[29].x;
    }
    float _496 = _306;
    float _498 = _496;
    if (_392)
    {
        _308 = (*spvDescriptorSet0.vp_c8)._m0[29].z;
    }
    float _500 = _308;
    float _502 = fma(_492, _492, _476);
    float _504 = _500;
    if (_392)
    {
        float _506 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _508 = _488 + _506;
        _494 = _508;
    }
    float _510 = _494;
    if (_392)
    {
        float _512 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _514 = _496 + _512;
        _498 = _514;
    }
    float _516 = _498;
    float _518 = _502 + _478;
    float _520 = _518;
    float _522 = _516;
    if (_392)
    {
        float _524 = _510 * _510;
        _486 = _524;
    }
    float _526 = _486;
    if (_392)
    {
        float _528 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _530 = _500 + _528;
        _504 = _530;
    }
    float _532 = _504;
    if (_392)
    {
        float _534 = fma(_516, _516, _526);
        _418 = _534;
    }
    float _536 = _418;
    float _538 = sqrt(_518);
    float _540 = (*spvDescriptorSet0.vp_c12)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _542 = (*spvDescriptorSet0.vp_c12)._m0[2].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _544 = (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _546 = (*spvDescriptorSet0.vp_c12)._m0[3].z;
    if (_392)
    {
        float _548 = fma(_532, _532, _536);
        _310 = _548;
    }
    float _550 = _310;
    float _552 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _554 = (*spvDescriptorSet0.vp_c12)._m0[3].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _556 = (*spvDescriptorSet0.vp_c12)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _558 = (*spvDescriptorSet0.vp_c12)._m0[3].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _560 = (*spvDescriptorSet0.vp_c12)._m0[3].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _562 = (*spvDescriptorSet0.vp_c12)._m0[3].w * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _564 = _550;
    float _566 = (*spvDescriptorSet0.vp_c12)._m0[3].w;
    float _568 = _560;
    float _570 = _562;
    if (_392)
    {
        float _572 = rsqrt(_550);
        _564 = _572;
    }
    float _574 = _564;
    out.m_56.x = _540;
    out.m_56.y = _556;
    out.m_56.z = _542;
    out.m_56.w = _552;
    bool _576 = _538 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _578 = isnan(_538);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _584 = _580 || _582;
    if (!_392)
    {
        _544 = 0.0;
        _520 = 0.0;
    }
    float _586 = _544;
    float _588 = _520;
    float _590 = _586;
    float _592 = _588;
    if (!_392)
    {
        _546 = 0.0;
    }
    float _594 = _546;
    out.m_58.x = _554;
    out.m_58.y = _558;
    out.m_58.z = _560;
    out.m_58.w = _562;
    float _596 = _594;
    float _598 = _574;
    if (_392)
    {
        float _600 = _574 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _566 = _600;
    }
    float _602 = _566;
    if (_392)
    {
        float _604 = _516 * _602;
        _596 = _604;
    }
    float _606 = _596;
    if (_392)
    {
        float _608 = _510 * _602;
        _590 = _608;
    }
    float _610 = _590;
    if (_392)
    {
        float _612 = _532 * _602;
        _592 = _612;
    }
    float _614 = _592;
    if (!_584)
    {
        _522 = 1.0;
    }
    float _616 = _522;
    bool _618 = !_584;
    float _620 = _616;
    if (!_618)
    {
        bool _622 = _538 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _624 = isnan(_538);
        bool _626 = _622 || _624;
        bool _628 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _630 = _626 || _628;
        if (!_630)
        {
            float _632 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _634 = _538 + _632;
            float _636 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _638 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _636;
            float _640 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _642 = _640 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _644 = 1.0 / _638;
            float _646 = _634 * _644;
            float _648 = fma(_646, _642, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _620 = _648;
            _650 = true;
        }
        else
        {
            bool _652 = _538 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _654 = isnan(_538);
            bool _656 = _652 || _654;
            bool _658 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _660 = _656 || _658;
            if (!_660)
            {
                float _662 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _664 = _538 + _662;
                float _666 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _668 = _666 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _670 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _672 = _670 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _674 = 1.0 / _668;
                float _676 = _664 * _674;
                float _678 = fma(_676, _672, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _620 = _678;
                _650 = true;
            }
            else
            {
                _620 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _650 = false;
    float _680 = _620;
    float _682 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _684 = _474 + _682;
    float _686 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _688 = _482 + _686;
    float _690 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _692 = _484 + _690;
    float _694 = fma(_684, _680, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _696 = fma(_688, _680, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _698 = fma(_692, _680, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _700 = _694 + _610;
    float _702 = _696 + _606;
    float _704 = _698 + _614;
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _708 = _700 + _706;
    float _710 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _712 = _702 + _710;
    float _714 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _716 = _704 + _714;
    float _718 = _708 * _708;
    float _720 = fma(_712, _712, _718);
    float _722 = fma(_716, _716, _720);
    float _724 = rsqrt(_722);
    float _726 = _724 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _728 = _712 * _726;
    float _730 = _716 * _726;
    float _732 = _728 * _728;
    float _734 = _730 * _730;
    float _736 = _732 + _734;
    float _738 = sqrt(_736);
    bool _740 = _738 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _742 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _744 = _738 + _742;
    float _746 = _716;
    float _748 = _744;
    float _750 = _708;
    float _752 = _728;
    if (_740)
    {
        float _754 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _746 = _754;
    }
    float _756 = _746;
    if (_740)
    {
        float _758 = rsqrt(_736);
        _568 = _758;
    }
    float _760 = _568;
    float _762 = _760;
    if (_740)
    {
        float _764 = _744 * _756;
        _748 = _764;
    }
    float _766 = _748;
    if (_740)
    {
        float _768 = _766 * 0.15915493667125701904296875;
        _570 = _768;
    }
    float _770 = _570;
    float _772 = _756;
    if (_740)
    {
        float _774 = _770 * 6.283185482025146484375;
        float _776 = sin(_774);
        _772 = _776;
    }
    float _778 = _772;
    float _780 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _782 = precise::max(0.0, _780);
    float _784 = _718;
    float _786 = _782;
    if (_740)
    {
        float _788 = _770 * 6.283185482025146484375;
        float _790 = cos(_788);
        _784 = _790;
    }
    float _792 = _784;
    float _794 = -_726;
    float _796 = -_782;
    float _798 = fma(_708, _794, _796);
    float _800 = _798;
    if (!_740)
    {
        _750 = _730;
    }
    float _802 = _750;
    float _804 = _802;
    if (_740)
    {
        float _806 = _798 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _786 = _806;
    }
    float _808 = _786;
    float _810 = sqrt(_722);
    float _812 = _778;
    float _814 = _808;
    if (_740)
    {
        float _816 = fma(_778, _808, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _812 = _816;
    }
    float _818 = _812;
    float _820 = _818;
    float _822 = _792;
    if (_740)
    {
        float _824 = _792 + (-1.0);
        _814 = _824;
    }
    float _826 = _814;
    float _828 = _826;
    if (_740)
    {
        float _830 = _760 * _818;
        _598 = _830;
    }
    float _832 = _598;
    if (!_740)
    {
        _820 = _798;
    }
    float _834 = _820;
    float _836 = _834;
    if (_740)
    {
        float _838 = _826 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _762 = _838;
    }
    float _840 = _762;
    if (_740)
    {
        float _842 = _728 * _832;
        _752 = _842;
    }
    float _844 = _752;
    if (!_740)
    {
        _828 = _732;
    }
    float _846 = _828;
    float _848 = _846;
    if (_740)
    {
        float _850 = _730 * _832;
        _804 = _850;
    }
    float _852 = _804;
    if (_740)
    {
        float _854 = fma(_798, _792, _840);
        _836 = _854;
    }
    float _856 = _836;
    if (_740)
    {
        float _858 = _844 * _844;
        _848 = _858;
    }
    float _860 = _848;
    if (!_740)
    {
        _822 = _734;
    }
    float _862 = _822;
    float _864 = _862;
    if (_740)
    {
        float _866 = _852 * _852;
        _864 = _866;
    }
    float _868 = _864;
    float _870 = fma(_856, _856, _860);
    float _872 = _870 + _868;
    float _874 = _700 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _876 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _878 = fma(_810, (*spvDescriptorSet0.vp_c15)._m0[23].w, _876);
    float _880 = precise::clamp(_878, 0.0, 1.0);
    float _882 = _700 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _884 = rsqrt(_872);
    float _886 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[2].x, _874);
    float _888 = -_880;
    float _890 = _888 + 1.0;
    float _892 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[1].x, _882);
    float _894 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _896 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[2].z, _886);
    float _898 = _700 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _900 = _700 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _902 = abs(_890);
    float _904 = log2(_902);
    float _906 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[1].z, _892);
    float _908 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[0].x, _898);
    float _910 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[3].x, _900);
    float _912 = _896 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _914 = _906 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _916 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[0].z, _908);
    float _918 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[3].z, _910);
    float _920 = _884 * _844;
    float _922 = _884 * _856;
    float _924 = _916 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _926 = _914 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _928 = _920 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _930 = _884 * _852;
    float _932 = _918 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _934 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[7].x, _926);
    float _936 = -_928;
    float _938 = fma(_922, (*spvDescriptorSet0.vp_c15)._m0[21].y, _936);
    float _940 = _904 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _942 = _912 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _944 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[7].z, _934);
    float _946 = -_930;
    float _948 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[21].z, _938);
    float _950 = _914 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _952 = -_942;
    float _954 = fma(_952, _894, 1.0);
    float _956 = exp2(_940);
    float _958 = fma(_948, -0.5, 0.5);
    float _960 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[7].w, _944);
    float _962 = _914 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _964 = fma(_948, 0.5, 0.5);
    float _966 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[5].x, _950);
    float _968 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[4].x, _962);
    float _970 = 1.0 / _960;
    float _972 = _922 + 1.0;
    float _974 = fma(_964, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _976 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[4].z, _968);
    float _978 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[5].z, _966);
    float _980 = fma(_964, _974, -0.212114393711090087890625);
    float _982 = log2(_954);
    float _984 = -_922;
    float _986 = fma(_956, _972, _984);
    float _988 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[4].w, _976);
    float _990 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[5].w, _978);
    float _992 = fma(_964, _980, 1.570728778839111328125);
    float _994 = sqrt(_958);
    float _996 = _988 * _970;
    float _998 = _990 * _970;
    float _1000 = fma(_996, 0.5, 0.5);
    float _1002 = fma(_998, -0.5, 0.5);
    float _1004 = fma(_986, 0.5, 0.5);
    float _1006 = _982 * 0.693147182464599609375;
    float _1008 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1010 = _994 * 0.636619746685028076171875;
    float _1012 = -_992;
    float _1014 = fma(_1010, _1012, 1.0);
    float3 _3174 = float3(_1000, _1002, _1008);
    float _1016 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3174, float3(0.0), isnan(_3174)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3174, float3(0.0), isnan(_3174)), level(0.0)).x;
    float3 _3185 = float3(_1000, _1002, _1008);
    float4 _1019 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3185, float3(0.0), isnan(_3185)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3185, float3(0.0), isnan(_3185)), level(0.0)).xyzw;
    float _1021 = _1019.x;
    float _1023 = _1019.y;
    float _1025 = _1019.z;
    float _1027 = _1019.w;
    float2 _3202 = float2(_1014, _1004);
    float3 _1031 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3202, float2(0.0), isnan(_3202)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3202, float2(0.0), isnan(_3202)), level(0.0)).xyz;
    float _1033 = _1031.x;
    float _1035 = _1031.y;
    float _1037 = _1031.z;
    int _1039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1041 = _1039 != 0;
    float _1043 = _108 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1047 = _1045 != 0;
    float _1049 = _914 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1053 = _1051 != 0;
    float _1055 = fma(_102, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1043);
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1059 = _1057 != 0;
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1063 = _1061 != 0;
    bool _1065 = !_162;
    float _1067 = _1065 ? 0.0 : 1.0;
    bool _1069 = _1041;
    float _1071 = _1000;
    bool _1073 = _1047;
    bool _1075 = _1059;
    float _1077 = _1055;
    if (!_1041)
    {
        float _1079 = -_170;
        float _1081 = (-0.0) + _1079;
        _800 = _1081;
    }
    float _1083 = _800;
    bool _1085 = false;
    float _1087 = _1083;
    if (_1041)
    {
        bool _1089 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _1085 = _1089;
    }
    bool _1091 = _1085;
    float _1093 = _108 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1095 = fma(_114, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1055);
    int _1097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1099 = _1097 != 0;
    float _1101 = fma(_102, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1093);
    float _1103 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1105 = _1091;
    float _1107 = _1101;
    if (_1041)
    {
        float _1109 = -_170;
        float _1111 = _1091 ? _170 : _1109;
        _1087 = _1111;
    }
    float _1113 = _1087;
    float _1115 = fma(_114, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1101);
    if (_1047)
    {
        bool _1117 = (*spvDescriptorSet0.vp_c12)._m0[0].x > 0.5;
        _1105 = _1117;
    }
    bool _1119 = _1105;
    bool _1121 = _1119;
    if (_1053)
    {
        bool _1123 = (*spvDescriptorSet0.vp_c12)._m0[0].z > 0.5;
        _1069 = _1123;
    }
    bool _1125 = _1069;
    if (!_1047)
    {
        _332 = _1067;
    }
    float _1127 = _332;
    float _1129 = 0.0;
    float _1131 = _1127;
    if (!_1099)
    {
        float _1133 = -_176;
        float _1135 = (-0.0) + _1133;
        _1129 = _1135;
    }
    float _1137 = _1129;
    float _1139 = _1137;
    if (!_1053)
    {
        _1071 = _1067;
    }
    float _1141 = _1071;
    float _1143 = _1141;
    if (_1047)
    {
        float _1145 = -_1067;
        float _1147 = _1119 ? _1145 : _1067;
        _1131 = _1147;
    }
    float _1149 = _1131;
    if (_1059)
    {
        bool _1151 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _1121 = _1151;
    }
    bool _1153 = _1121;
    float _1155 = _108 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1053)
    {
        float _1157 = -_1067;
        float _1159 = _1125 ? _1157 : _1067;
        _1143 = _1159;
    }
    float _1161 = _1143;
    float _1163 = _108 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1165 = _1163;
    if (_1063)
    {
        bool _1167 = (*spvDescriptorSet0.vp_c12)._m0[0].z > 0.5;
        _1073 = _1167;
    }
    bool _1169 = _1073;
    float _1171 = fma(_102, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1155);
    int _1173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1175 = _1173 != 0;
    float _1177 = fma(_102, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1163);
    float _1179 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (!_1063)
    {
        float _1181 = -_182;
        float _1183 = (-0.0) + _1181;
        _1165 = _1183;
    }
    float _1185 = _1165;
    float _1187 = _1185;
    if (_1063)
    {
        float _1189 = -_182;
        float _1191 = _1169 ? _182 : _1189;
        _1187 = _1191;
    }
    float _1193 = _1187;
    float _1195 = fma(_114, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1171);
    bool _1197 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1201 = _1197 || _1199;
    bool _1203 = isnan(0.5);
    bool _1205 = _1201 || _1203;
    float _1207 = fma(_114, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1177);
    if (_1099)
    {
        _1179 = (*spvDescriptorSet0.vp_c12)._m0[0].w;
    }
    float _1209 = _1179;
    float _1211 = _1195 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    if (!_1059)
    {
        _312 = _1067;
    }
    float _1213 = _312;
    float _1215 = _1213;
    if (_1059)
    {
        float _1217 = -_1067;
        float _1219 = _1153 ? _1217 : _1067;
        _1215 = _1219;
    }
    float _1221 = _1215;
    if (_1099)
    {
        bool _1223 = _1209 > 0.5;
        _1075 = _1223;
    }
    bool _1225 = _1075;
    float _1227 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _1229 = _1227 + (*spvDescriptorSet0.vp_c12)._m0[1].y;
    float _1231 = fma(_274, _1229, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    if (!_1175)
    {
        _314 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1233 = _314;
    float _1235 = _1233;
    if (_1099)
    {
        float _1237 = -_176;
        float _1239 = _1225 ? _176 : _1237;
        _1139 = _1239;
    }
    float _1241 = _1139;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    if (_1175)
    {
        _1235 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1245 = _1235;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1251 = _1245;
    if (!_1175)
    {
        _316 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1253 = _316;
    float _1255 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1243);
    float _1257 = _1253;
    if (_1175)
    {
        _1257 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1259 = _1257;
    float _1261 = fma((*spvDescriptorSet0.vp_c9)._m0[88].w, (*spvDescriptorSet0.vp_c12)._m0[0].y, _1247);
    if (!_1175)
    {
        _1077 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1263 = _1077;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1269 = _1263;
    if (!_1175)
    {
        _1251 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1271 = _1251;
    float _1273 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1265);
    float _1275 = _1271;
    if (_1175)
    {
        _1269 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1277 = _1269;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_1175)
    {
        _1275 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1281 = _1275;
    float _1283 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1285 = 0;
    if (_1175)
    {
        _1285 = 0;
    }
    int _1287 = _1285;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1291 = _1287;
    if (!_1175)
    {
        _1291 = 2;
    }
    int _1293 = _1291;
    float _1295 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1297 = -_1279;
    float _1299 = fma(_1283, 2.0, _1297);
    float _1301 = _1249 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1303 = fma(_1295, -2.0, _1289);
    float _1305 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    if (!_1175)
    {
        _1107 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1307 = _1107;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1311 = _1293 != 2;
    float _1313 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1315 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1317 = _1307;
    if (_1175)
    {
        _1317 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1319 = _1317;
    float _1321 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1313);
    float _1323 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1255);
    float _1325 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1309);
    float _1327 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1315);
    float _1329 = _1323 * (-0.15915493667125701904296875);
    float _1331 = _1207 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1333 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1321);
    float _1335 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1327);
    float _1337 = _1329 * 6.283185482025146484375;
    float _1339 = sin(_1337);
    float _1341 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1333);
    float _1343 = _1333;
    float _1345 = _1331;
    float _1347 = _1335;
    if (_1311)
    {
        _1343 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1349 = _1343;
    float _1351 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1335);
    float _1353 = _1349;
    if (!_1311)
    {
        _1353 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1355 = _1353;
    float _1357 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    if (_1311)
    {
        _1345 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1359 = _1345;
    float _1361 = _1329 * 6.283185482025146484375;
    float _1363 = cos(_1361);
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1367 = _1359;
    if (_1311)
    {
        _1347 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1369 = _1347;
    float _1371 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1373 = _1369;
    if (!_1311)
    {
        _1367 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1375 = _1367;
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (!_1311)
    {
        _1373 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1379 = _1373;
    float _1381 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1383 = 1.0 / _1351;
    float _1385 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1387 = fma((*spvDescriptorSet0.vp_c9)._m0[88].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1377);
    float _1389 = fma(_1379, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1357);
    float _1391 = -_1365;
    float _1393 = fma(_1371, 2.0, _1391);
    float _1395 = _1241 + 0.5;
    float _1397 = fma(_1385, -2.0, _1381);
    float _1399 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1389);
    float _1401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1403 = _1161 + (-0.5);
    float _1405 = _1395 * _1339;
    float _1407 = _1395 * _1363;
    float _1409 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1049);
    float _1411 = _1399 * (-0.15915493667125701904296875);
    float _1413 = -_1405;
    float _1415 = fma(_1403, _1363, _1413);
    float _1417 = fma(_1403, _1339, _1407);
    float _1419 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1409);
    float _1421 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1423 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1303);
    float _1425 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1299);
    float _1427 = _1415 + 0.5;
    float _1429 = _1341 + _1351;
    float _1431 = _1417 + (-0.5);
    float _1433 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1387);
    float _1435 = _1401 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1439 = _1429 * _1383;
    float _1441 = _1439 * 0.5;
    float _1443 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1261);
    float _1445 = fma(_1435, _1427, _1425);
    float _1447 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1273);
    float _1449 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1325);
    float _1451 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1393);
    float _1453 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1397);
    float _1455 = _1411 * 6.283185482025146484375;
    float _1457 = sin(_1455);
    float _1459 = -_1301;
    float _1461 = -_1423;
    float _1463 = fma(_1459, _1431, _1461);
    float _1465 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1419);
    float _1467 = _1425;
    if (_1205)
    {
        _1467 = 1.0;
    }
    float _1469 = _1467;
    float _1471 = _1411 * 6.283185482025146484375;
    float _1473 = cos(_1471);
    float _1475 = _1469;
    if (!_1205)
    {
        float _1477 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1479 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1481 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1479);
        float _1483 = _1477 * 0.15915493667125701904296875;
        float _1485 = _1483 * 6.283185482025146484375;
        float _1487 = cos(_1485);
        float _1489 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1491 = _1489 * 0.15915493667125701904296875;
        float _1493 = _1483 * 6.283185482025146484375;
        float _1495 = sin(_1493);
        float _1497 = 1.0 / _1487;
        float _1499 = _1491 * 6.283185482025146484375;
        float _1501 = cos(_1499);
        float _1503 = _1495 * _1497;
        float _1505 = 1.0 / _1481;
        float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1509 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1507;
        float _1511 = _1501 * _1503;
        float _1513 = _1491 * 6.283185482025146484375;
        float _1515 = sin(_1513);
        float _1517 = 1.0 / _1511;
        float _1519 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1521 = _1505 * _1519;
        float _1523 = 1.0 / _1509;
        float _1525 = _1515 * _1517;
        float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1529 = fma(_1525, _1521, _1527);
        float _1531 = _1529 * _1523;
        float _1533 = precise::clamp(_1531, 0.0, 1.0);
        float _1535 = -_1533;
        float _1537 = _1535 + 1.0;
        _1475 = _1537;
    }
    float _1539 = _1475;
    float _1541 = _904 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1543 = _1193 + 0.5;
    float _1545 = _1221 + (-0.5);
    float _1547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.gl_Position.x = _988;
    out.gl_Position.y = _990;
    out.gl_Position.z = _1465;
    out.gl_Position.w = _960;
    float _1549 = _1543 * _1457;
    float _1551 = _1543 * _1473;
    float _1553 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1555 = _1231 * _1539;
    float _1557 = -_1549;
    float _1559 = fma(_1545, _1473, _1557);
    float _1561 = fma(_1545, _1457, _1551);
    float _1563 = exp2(_1541);
    float _1565 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1567 = _1421 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1569 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1571 = _1465 + _960;
    float _1573 = -_1443;
    float _1575 = _1573 + 1.0;
    float _1577 = _1559 + 0.5;
    float _1579 = _1561 + (-0.5);
    float _1581 = -_1447;
    float _1583 = _1581 + 1.0;
    float _1585 = -_1449;
    float _1587 = _1585 + 1.0;
    float _1589 = fma(_1553, _1577, _1451);
    float _1591 = _1565 * _1267;
    float _1593 = -_1567;
    float _1595 = -_1453;
    float _1597 = fma(_1593, _1579, _1595);
    float _1599 = -_1569;
    float _1601 = fma(_1599, _1547, -0.0);
    float _1603 = -_1433;
    float _1605 = _1603 + 1.0;
    float _1607 = -_1563;
    float _1609 = _1607 + 1.0;
    float _1611 = _1555 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1613 = -_1583;
    float _1615 = fma(_1415, _1613, _1445);
    float _1617 = fma(_1417, _1587, _1463);
    float _1619 = _1609 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1621 = fma(_1561, _1575, _1597);
    float _1623 = _1571 * 0.5;
    float _1625 = -_1605;
    float _1627 = fma(_1559, _1625, _1589);
    float _1629 = _1619 * _1016;
    float _1631 = -_1619;
    float _1633 = _1631 + 1.0;
    float _1635 = _1611 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1591;
    out.m_60.y = _1601;
    out.m_60.z = _1615;
    out.m_60.w = _1617;
    float _1637 = _1027 * _1629;
    float _1639 = _1037 * _1629;
    float _1641 = _1027 * _1633;
    out.m_62.z = _1623;
    out.m_62.w = _960;
    float _1643 = fma(_1033, _1637, _1021);
    float _1645 = fma(_1035, _1637, _1023);
    float _1647 = fma(_1027, _1639, _1025);
    out.m_64.x = _1627;
    out.m_64.y = _1621;
    out.m_66.x = _1635;
    out.m_68.x = _1643;
    out.m_68.y = _1645;
    out.m_68.z = _1647;
    out.m_68.w = _1641;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _650 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = as_type<float>(int(gl_VertexIndex));
    float _84 = (*spvDescriptorSet0.vp_c12)._m0[4].z * (*spvDescriptorSet0.vp_c12)._m0[5].w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    int _91 = as_type<int>(_82) >> 2;
    int _93 = _91 + _89;
    int _95 = _93 * 96;
    int _97 = _95 + 32;
    uint _100 = uint(int(uint(_95) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_100)];
    float _102 = as_type<float>(_dmw0.x);
    int _104 = _95 + 4;
    uint _106 = uint(int(uint(_104) >> uint(2)));
    float _108 = as_type<float>(_dmw0.y);
    int _110 = _95 + 8;
    uint _112 = uint(int(uint(_110) >> uint(2)));
    float _114 = as_type<float>(_dmw0.z);
    int _116 = _95 + 12;
    uint _118 = uint(int(uint(_116) >> uint(2)));
    float _120 = as_type<float>(_dmw0.w);
    uint _122 = uint(int(uint(_97) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_122)];
    float _124 = as_type<float>(_dmw2.x);
    int _126 = _97 + 4;
    uint _128 = uint(int(uint(_126) >> uint(2)));
    float _130 = as_type<float>(_dmw2.y);
    int _132 = _97 + 8;
    uint _134 = uint(int(uint(_132) >> uint(2)));
    float _136 = as_type<float>(_dmw2.z);
    int _138 = _95 + 16;
    uint _140 = uint(int(uint(_138) >> uint(2)));
    packed_uint3 _dmw1 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_140)];
    float _142 = as_type<float>(_dmw1.x);
    int _144 = _138 + 4;
    uint _146 = uint(int(uint(_144) >> uint(2)));
    float _148 = as_type<float>(_dmw1.y);
    int _150 = _138 + 8;
    uint _152 = uint(int(uint(_150) >> uint(2)));
    float _154 = as_type<float>(_dmw1.z);
    int _156 = _95 + 48;
    int _158 = as_type<int>(_82) & 2;
    bool _162 = _158 != 0;
    int _164 = as_type<int>(_82) & 1;
    bool _166 = _164 != 0;
    uint _168 = uint(int(uint(_156) >> uint(2)));
    packed_uint3 _dmw3 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_168)];
    float _170 = as_type<float>(_dmw3.x);
    int _172 = _156 + 4;
    uint _174 = uint(int(uint(_172) >> uint(2)));
    float _176 = as_type<float>(_dmw3.y);
    int _178 = _156 + 8;
    uint _180 = uint(int(uint(_178) >> uint(2)));
    float _182 = as_type<float>(_dmw3.z);
    float _184 = -_108;
    float _186 = _184 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _188 = _186 * _186;
    float _190 = _130 * _130;
    float _192 = -_102;
    float _194 = _192 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _196 = fma(_124, _124, _190);
    float _198 = -_114;
    float _200 = _198 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _202 = fma(_194, _194, _188);
    float _204 = fma(_136, _136, _196);
    float _206 = fma(_200, _200, _202);
    float _208 = rsqrt(_204);
    float _210 = rsqrt(_206);
    float _212 = _136 * _208;
    float _214 = _130 * _208;
    float _216 = _124 * _208;
    float _218 = _194 * _210;
    float _220 = _200 * _210;
    float _222 = _218 * _212;
    float _224 = _186 * _210;
    float _226 = _220 * _214;
    float _228 = -_222;
    float _230 = fma(_220, _216, _228);
    float _232 = _224 * _216;
    float _234 = -_226;
    float _236 = fma(_224, _212, _234);
    float _238 = _230 * _230;
    float _240 = -_232;
    float _242 = fma(_218, _214, _240);
    float _244 = _148 * _148;
    float _246 = fma(_236, _236, _238);
    float _248 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _250 = fma(_142, _142, _244);
    float _252 = fma(_242, _242, _246);
    float _254 = 1.0 / _248;
    float _256 = fma(_154, _154, _250);
    float _258 = rsqrt(_252);
    float _260 = float(_91);
    bool _262 = !_162;
    float _264 = _262 ? 1.0 : (-1.0);
    float _266 = rsqrt(_256);
    float _268 = abs(_120);
    float _270 = _268 * _264;
    float _272 = _270 * 0.5;
    float _274 = _260 * _254;
    float _276 = -(*spvDescriptorSet0.vp_c12)._m0[1].z;
    float _278 = _276 + (*spvDescriptorSet0.vp_c12)._m0[1].w;
    float _280 = _236 * _258;
    float _282 = _230 * _258;
    float _284 = _242 * _258;
    float _286 = fma(_274, _278, (*spvDescriptorSet0.vp_c12)._m0[1].z);
    float _288 = _142 * _266;
    float _290 = _148 * _266;
    float _292 = _154 * _266;
    float _294 = _286 * _272;
    float _296 = _148;
    float _298 = _154;
    float _300 = _142;
    float _302 = _294;
    float _304 = (*spvDescriptorSet0.vp_c12)._m0[4].y;
    float _306 = _280;
    float _308 = _254;
    float _310 = _82;
    float _312 = _102;
    float _314 = _114;
    float _316 = _274;
    if (!_166)
    {
        _296 = _280;
    }
    float _318 = _296;
    float _320 = _318;
    if (!_166)
    {
        _298 = _282;
    }
    float _322 = _298;
    float _324 = _322;
    if (!_166)
    {
        _300 = _284;
    }
    float _326 = _300;
    bool _328 = !_166;
    float _330 = _326;
    float _332 = _170;
    if (!_328)
    {
        float _334 = _292 * _280;
        float _336 = _290 * _284;
        float _338 = -_334;
        float _340 = fma(_288, _284, _338);
        float _342 = _288 * _282;
        float _344 = -_336;
        float _346 = fma(_292, _282, _344);
        float _348 = _340 * _340;
        float _350 = -_342;
        float _352 = fma(_290, _280, _350);
        float _354 = fma(_346, _346, _348);
        float _356 = fma(_352, _352, _354);
        float _358 = rsqrt(_356);
        float _360 = _346 * _358;
        float _362 = _340 * _358;
        float _364 = _352 * _358;
        _330 = _364;
        _320 = _360;
        _324 = _362;
    }
    float _366 = _330;
    float _368 = _320;
    float _370 = _324;
    float _372 = _366 * _272;
    float _374 = -_294;
    float _376 = fma(_368, _374, _102);
    float _378 = -_294;
    float _380 = fma(_370, _378, _108);
    float _382 = -_372;
    float _384 = fma(_286, _382, _114);
    float _386 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _388 = _376 + _386;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _392 = _390 != 0;
    float _394 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _396 = _384 + _394;
    float _398 = _388 * _388;
    float _400 = _396 * _396;
    float _402 = _398 + _400;
    float _404 = sqrt(_402);
    bool _406 = _404 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _408 = _398;
    float _410 = _400;
    float _412 = _370;
    float _414 = _376;
    float _416 = _384;
    float _418 = _388;
    if (!_406)
    {
        _302 = _380;
    }
    float _420 = _302;
    bool _422 = !_406;
    float _424 = _420;
    if (!_422)
    {
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _428 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _430 = _404 + _428;
        float _432 = rsqrt(_402);
        float _434 = _430 * _426;
        float _436 = _380 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _438 = _434 * 0.15915493667125701904296875;
        float _440 = _438 * 6.283185482025146484375;
        float _442 = sin(_440);
        float _444 = _438 * 6.283185482025146484375;
        float _446 = cos(_444);
        float _448 = fma(_442, _436, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _450 = _432 * _448;
        float _452 = _446 + (-1.0);
        float _454 = fma(_388, _450, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _456 = fma(_396, _450, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _458 = _452 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _460 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _462 = _454 + _460;
        float _464 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _466 = _456 + _464;
        float _468 = fma(_380, _446, _458);
        float _470 = _462 * _462;
        float _472 = _466 * _466;
        _424 = _468;
        _408 = _470;
        _410 = _472;
        _412 = _466;
        _414 = _454;
        _416 = _456;
    }
    float _474 = _424;
    float _476 = _408;
    float _478 = _410;
    float _480 = _412;
    float _482 = _414;
    float _484 = _416;
    float _486 = _480;
    if (_392)
    {
        _304 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    }
    float _488 = _304;
    float _490 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _492 = _474 + _490;
    float _494 = _488;
    if (_392)
    {
        _306 = (*spvDescriptorSet0.vp_c8)._m0[29].x;
    }
    float _496 = _306;
    float _498 = _496;
    if (_392)
    {
        _308 = (*spvDescriptorSet0.vp_c8)._m0[29].z;
    }
    float _500 = _308;
    float _502 = fma(_492, _492, _476);
    float _504 = _500;
    if (_392)
    {
        float _506 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _508 = _488 + _506;
        _494 = _508;
    }
    float _510 = _494;
    if (_392)
    {
        float _512 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _514 = _496 + _512;
        _498 = _514;
    }
    float _516 = _498;
    float _518 = _502 + _478;
    float _520 = _518;
    float _522 = _516;
    if (_392)
    {
        float _524 = _510 * _510;
        _486 = _524;
    }
    float _526 = _486;
    if (_392)
    {
        float _528 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _530 = _500 + _528;
        _504 = _530;
    }
    float _532 = _504;
    if (_392)
    {
        float _534 = fma(_516, _516, _526);
        _418 = _534;
    }
    float _536 = _418;
    float _538 = sqrt(_518);
    float _540 = (*spvDescriptorSet0.vp_c12)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _542 = (*spvDescriptorSet0.vp_c12)._m0[2].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _544 = (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _546 = (*spvDescriptorSet0.vp_c12)._m0[3].z;
    if (_392)
    {
        float _548 = fma(_532, _532, _536);
        _310 = _548;
    }
    float _550 = _310;
    float _552 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _554 = (*spvDescriptorSet0.vp_c12)._m0[3].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _556 = (*spvDescriptorSet0.vp_c12)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _558 = (*spvDescriptorSet0.vp_c12)._m0[3].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _560 = (*spvDescriptorSet0.vp_c12)._m0[3].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _562 = (*spvDescriptorSet0.vp_c12)._m0[3].w * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _564 = _550;
    float _566 = (*spvDescriptorSet0.vp_c12)._m0[3].w;
    float _568 = _560;
    float _570 = _562;
    if (_392)
    {
        float _572 = rsqrt(_550);
        _564 = _572;
    }
    float _574 = _564;
    out.m_56.x = _540;
    out.m_56.y = _556;
    out.m_56.z = _542;
    out.m_56.w = _552;
    bool _576 = _538 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _578 = isnan(_538);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _584 = _580 || _582;
    if (!_392)
    {
        _544 = 0.0;
        _520 = 0.0;
    }
    float _586 = _544;
    float _588 = _520;
    float _590 = _586;
    float _592 = _588;
    if (!_392)
    {
        _546 = 0.0;
    }
    float _594 = _546;
    out.m_58.x = _554;
    out.m_58.y = _558;
    out.m_58.z = _560;
    out.m_58.w = _562;
    float _596 = _594;
    float _598 = _574;
    if (_392)
    {
        float _600 = _574 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _566 = _600;
    }
    float _602 = _566;
    if (_392)
    {
        float _604 = _516 * _602;
        _596 = _604;
    }
    float _606 = _596;
    if (_392)
    {
        float _608 = _510 * _602;
        _590 = _608;
    }
    float _610 = _590;
    if (_392)
    {
        float _612 = _532 * _602;
        _592 = _612;
    }
    float _614 = _592;
    if (!_584)
    {
        _522 = 1.0;
    }
    float _616 = _522;
    bool _618 = !_584;
    float _620 = _616;
    if (!_618)
    {
        bool _622 = _538 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _624 = isnan(_538);
        bool _626 = _622 || _624;
        bool _628 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _630 = _626 || _628;
        if (!_630)
        {
            float _632 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _634 = _538 + _632;
            float _636 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _638 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _636;
            float _640 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _642 = _640 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _644 = 1.0 / _638;
            float _646 = _634 * _644;
            float _648 = fma(_646, _642, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _620 = _648;
            _650 = true;
        }
        else
        {
            bool _652 = _538 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _654 = isnan(_538);
            bool _656 = _652 || _654;
            bool _658 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _660 = _656 || _658;
            if (!_660)
            {
                float _662 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _664 = _538 + _662;
                float _666 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _668 = _666 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _670 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _672 = _670 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _674 = 1.0 / _668;
                float _676 = _664 * _674;
                float _678 = fma(_676, _672, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _620 = _678;
                _650 = true;
            }
            else
            {
                _620 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _650 = false;
    float _680 = _620;
    float _682 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _684 = _474 + _682;
    float _686 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _688 = _482 + _686;
    float _690 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _692 = _484 + _690;
    float _694 = fma(_684, _680, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _696 = fma(_688, _680, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _698 = fma(_692, _680, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _700 = _694 + _610;
    float _702 = _696 + _606;
    float _704 = _698 + _614;
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _708 = _700 + _706;
    float _710 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _712 = _702 + _710;
    float _714 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _716 = _704 + _714;
    float _718 = _708 * _708;
    float _720 = fma(_712, _712, _718);
    float _722 = fma(_716, _716, _720);
    float _724 = rsqrt(_722);
    float _726 = _724 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _728 = _712 * _726;
    float _730 = _716 * _726;
    float _732 = _728 * _728;
    float _734 = _730 * _730;
    float _736 = _732 + _734;
    float _738 = sqrt(_736);
    bool _740 = _738 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _742 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _744 = _738 + _742;
    float _746 = _716;
    float _748 = _744;
    float _750 = _708;
    float _752 = _728;
    if (_740)
    {
        float _754 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _746 = _754;
    }
    float _756 = _746;
    if (_740)
    {
        float _758 = rsqrt(_736);
        _568 = _758;
    }
    float _760 = _568;
    float _762 = _760;
    if (_740)
    {
        float _764 = _744 * _756;
        _748 = _764;
    }
    float _766 = _748;
    if (_740)
    {
        float _768 = _766 * 0.15915493667125701904296875;
        _570 = _768;
    }
    float _770 = _570;
    float _772 = _756;
    if (_740)
    {
        float _774 = _770 * 6.283185482025146484375;
        float _776 = sin(_774);
        _772 = _776;
    }
    float _778 = _772;
    float _780 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _782 = precise::max(0.0, _780);
    float _784 = _718;
    float _786 = _782;
    if (_740)
    {
        float _788 = _770 * 6.283185482025146484375;
        float _790 = cos(_788);
        _784 = _790;
    }
    float _792 = _784;
    float _794 = -_726;
    float _796 = -_782;
    float _798 = fma(_708, _794, _796);
    float _800 = _798;
    if (!_740)
    {
        _750 = _730;
    }
    float _802 = _750;
    float _804 = _802;
    if (_740)
    {
        float _806 = _798 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _786 = _806;
    }
    float _808 = _786;
    float _810 = sqrt(_722);
    float _812 = _778;
    float _814 = _808;
    if (_740)
    {
        float _816 = fma(_778, _808, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _812 = _816;
    }
    float _818 = _812;
    float _820 = _818;
    float _822 = _792;
    if (_740)
    {
        float _824 = _792 + (-1.0);
        _814 = _824;
    }
    float _826 = _814;
    float _828 = _826;
    if (_740)
    {
        float _830 = _760 * _818;
        _598 = _830;
    }
    float _832 = _598;
    if (!_740)
    {
        _820 = _798;
    }
    float _834 = _820;
    float _836 = _834;
    if (_740)
    {
        float _838 = _826 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _762 = _838;
    }
    float _840 = _762;
    if (_740)
    {
        float _842 = _728 * _832;
        _752 = _842;
    }
    float _844 = _752;
    if (!_740)
    {
        _828 = _732;
    }
    float _846 = _828;
    float _848 = _846;
    if (_740)
    {
        float _850 = _730 * _832;
        _804 = _850;
    }
    float _852 = _804;
    if (_740)
    {
        float _854 = fma(_798, _792, _840);
        _836 = _854;
    }
    float _856 = _836;
    if (_740)
    {
        float _858 = _844 * _844;
        _848 = _858;
    }
    float _860 = _848;
    if (!_740)
    {
        _822 = _734;
    }
    float _862 = _822;
    float _864 = _862;
    if (_740)
    {
        float _866 = _852 * _852;
        _864 = _866;
    }
    float _868 = _864;
    float _870 = fma(_856, _856, _860);
    float _872 = _870 + _868;
    float _874 = _700 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _876 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _878 = fma(_810, (*spvDescriptorSet0.vp_c15)._m0[23].w, _876);
    float _880 = precise::clamp(_878, 0.0, 1.0);
    float _882 = _700 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _884 = rsqrt(_872);
    float _886 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[2].x, _874);
    float _888 = -_880;
    float _890 = _888 + 1.0;
    float _892 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[1].x, _882);
    float _894 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _896 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[2].z, _886);
    float _898 = _700 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _900 = _700 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _902 = abs(_890);
    float _904 = log2(_902);
    float _906 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[1].z, _892);
    float _908 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[0].x, _898);
    float _910 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[3].x, _900);
    float _912 = _896 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _914 = _906 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _916 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[0].z, _908);
    float _918 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[3].z, _910);
    float _920 = _884 * _844;
    float _922 = _884 * _856;
    float _924 = _916 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _926 = _914 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _928 = _920 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _930 = _884 * _852;
    float _932 = _918 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _934 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[7].x, _926);
    float _936 = -_928;
    float _938 = fma(_922, (*spvDescriptorSet0.vp_c15)._m0[21].y, _936);
    float _940 = _904 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _942 = _912 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _944 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[7].z, _934);
    float _946 = -_930;
    float _948 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[21].z, _938);
    float _950 = _914 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _952 = -_942;
    float _954 = fma(_952, _894, 1.0);
    float _956 = exp2(_940);
    float _958 = fma(_948, -0.5, 0.5);
    float _960 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[7].w, _944);
    float _962 = _914 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _964 = fma(_948, 0.5, 0.5);
    float _966 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[5].x, _950);
    float _968 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[4].x, _962);
    float _970 = 1.0 / _960;
    float _972 = _922 + 1.0;
    float _974 = fma(_964, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _976 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[4].z, _968);
    float _978 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[5].z, _966);
    float _980 = fma(_964, _974, -0.212114393711090087890625);
    float _982 = log2(_954);
    float _984 = -_922;
    float _986 = fma(_956, _972, _984);
    float _988 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[4].w, _976);
    float _990 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[5].w, _978);
    float _992 = fma(_964, _980, 1.570728778839111328125);
    float _994 = sqrt(_958);
    float _996 = _988 * _970;
    float _998 = _990 * _970;
    float _1000 = fma(_996, 0.5, 0.5);
    float _1002 = fma(_998, -0.5, 0.5);
    float _1004 = fma(_986, 0.5, 0.5);
    float _1006 = _982 * 0.693147182464599609375;
    float _1008 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1010 = _994 * 0.636619746685028076171875;
    float _1012 = -_992;
    float _1014 = fma(_1010, _1012, 1.0);
    float3 _3174 = float3(_1000, _1002, _1008);
    float _1016 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3174, float3(0.0), isnan(_3174)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3174, float3(0.0), isnan(_3174)), level(0.0)).x;
    float3 _3185 = float3(_1000, _1002, _1008);
    float4 _1019 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3185, float3(0.0), isnan(_3185)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3185, float3(0.0), isnan(_3185)), level(0.0)).xyzw;
    float _1021 = _1019.x;
    float _1023 = _1019.y;
    float _1025 = _1019.z;
    float _1027 = _1019.w;
    float2 _3202 = float2(_1014, _1004);
    float3 _1031 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3202, float2(0.0), isnan(_3202)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3202, float2(0.0), isnan(_3202)), level(0.0)).xyz;
    float _1033 = _1031.x;
    float _1035 = _1031.y;
    float _1037 = _1031.z;
    int _1039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1041 = _1039 != 0;
    float _1043 = _108 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1047 = _1045 != 0;
    float _1049 = _914 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1053 = _1051 != 0;
    float _1055 = fma(_102, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1043);
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1059 = _1057 != 0;
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1063 = _1061 != 0;
    bool _1065 = !_162;
    float _1067 = _1065 ? 0.0 : 1.0;
    bool _1069 = _1041;
    float _1071 = _1000;
    bool _1073 = _1047;
    bool _1075 = _1059;
    float _1077 = _1055;
    if (!_1041)
    {
        float _1079 = -_170;
        float _1081 = (-0.0) + _1079;
        _800 = _1081;
    }
    float _1083 = _800;
    bool _1085 = false;
    float _1087 = _1083;
    if (_1041)
    {
        bool _1089 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _1085 = _1089;
    }
    bool _1091 = _1085;
    float _1093 = _108 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1095 = fma(_114, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1055);
    int _1097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1099 = _1097 != 0;
    float _1101 = fma(_102, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1093);
    float _1103 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1105 = _1091;
    float _1107 = _1101;
    if (_1041)
    {
        float _1109 = -_170;
        float _1111 = _1091 ? _170 : _1109;
        _1087 = _1111;
    }
    float _1113 = _1087;
    float _1115 = fma(_114, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1101);
    if (_1047)
    {
        bool _1117 = (*spvDescriptorSet0.vp_c12)._m0[0].x > 0.5;
        _1105 = _1117;
    }
    bool _1119 = _1105;
    bool _1121 = _1119;
    if (_1053)
    {
        bool _1123 = (*spvDescriptorSet0.vp_c12)._m0[0].z > 0.5;
        _1069 = _1123;
    }
    bool _1125 = _1069;
    if (!_1047)
    {
        _332 = _1067;
    }
    float _1127 = _332;
    float _1129 = 0.0;
    float _1131 = _1127;
    if (!_1099)
    {
        float _1133 = -_176;
        float _1135 = (-0.0) + _1133;
        _1129 = _1135;
    }
    float _1137 = _1129;
    float _1139 = _1137;
    if (!_1053)
    {
        _1071 = _1067;
    }
    float _1141 = _1071;
    float _1143 = _1141;
    if (_1047)
    {
        float _1145 = -_1067;
        float _1147 = _1119 ? _1145 : _1067;
        _1131 = _1147;
    }
    float _1149 = _1131;
    if (_1059)
    {
        bool _1151 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _1121 = _1151;
    }
    bool _1153 = _1121;
    float _1155 = _108 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1053)
    {
        float _1157 = -_1067;
        float _1159 = _1125 ? _1157 : _1067;
        _1143 = _1159;
    }
    float _1161 = _1143;
    float _1163 = _108 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1165 = _1163;
    if (_1063)
    {
        bool _1167 = (*spvDescriptorSet0.vp_c12)._m0[0].z > 0.5;
        _1073 = _1167;
    }
    bool _1169 = _1073;
    float _1171 = fma(_102, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1155);
    int _1173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1175 = _1173 != 0;
    float _1177 = fma(_102, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1163);
    float _1179 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (!_1063)
    {
        float _1181 = -_182;
        float _1183 = (-0.0) + _1181;
        _1165 = _1183;
    }
    float _1185 = _1165;
    float _1187 = _1185;
    if (_1063)
    {
        float _1189 = -_182;
        float _1191 = _1169 ? _182 : _1189;
        _1187 = _1191;
    }
    float _1193 = _1187;
    float _1195 = fma(_114, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1171);
    bool _1197 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1201 = _1197 || _1199;
    bool _1203 = isnan(0.5);
    bool _1205 = _1201 || _1203;
    float _1207 = fma(_114, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1177);
    if (_1099)
    {
        _1179 = (*spvDescriptorSet0.vp_c12)._m0[0].w;
    }
    float _1209 = _1179;
    float _1211 = _1195 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    if (!_1059)
    {
        _312 = _1067;
    }
    float _1213 = _312;
    float _1215 = _1213;
    if (_1059)
    {
        float _1217 = -_1067;
        float _1219 = _1153 ? _1217 : _1067;
        _1215 = _1219;
    }
    float _1221 = _1215;
    if (_1099)
    {
        bool _1223 = _1209 > 0.5;
        _1075 = _1223;
    }
    bool _1225 = _1075;
    float _1227 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _1229 = _1227 + (*spvDescriptorSet0.vp_c12)._m0[1].y;
    float _1231 = fma(_274, _1229, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    if (!_1175)
    {
        _314 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1233 = _314;
    float _1235 = _1233;
    if (_1099)
    {
        float _1237 = -_176;
        float _1239 = _1225 ? _176 : _1237;
        _1139 = _1239;
    }
    float _1241 = _1139;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    if (_1175)
    {
        _1235 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1245 = _1235;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1251 = _1245;
    if (!_1175)
    {
        _316 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1253 = _316;
    float _1255 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1243);
    float _1257 = _1253;
    if (_1175)
    {
        _1257 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1259 = _1257;
    float _1261 = fma((*spvDescriptorSet0.vp_c9)._m0[88].w, (*spvDescriptorSet0.vp_c12)._m0[0].y, _1247);
    if (!_1175)
    {
        _1077 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1263 = _1077;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1269 = _1263;
    if (!_1175)
    {
        _1251 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1271 = _1251;
    float _1273 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1265);
    float _1275 = _1271;
    if (_1175)
    {
        _1269 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1277 = _1269;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_1175)
    {
        _1275 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1281 = _1275;
    float _1283 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1285 = 0;
    if (_1175)
    {
        _1285 = 0;
    }
    int _1287 = _1285;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1291 = _1287;
    if (!_1175)
    {
        _1291 = 2;
    }
    int _1293 = _1291;
    float _1295 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1297 = -_1279;
    float _1299 = fma(_1283, 2.0, _1297);
    float _1301 = _1249 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1303 = fma(_1295, -2.0, _1289);
    float _1305 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    if (!_1175)
    {
        _1107 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1307 = _1107;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1311 = _1293 != 2;
    float _1313 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1315 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1317 = _1307;
    if (_1175)
    {
        _1317 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1319 = _1317;
    float _1321 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1313);
    float _1323 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1255);
    float _1325 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1309);
    float _1327 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1315);
    float _1329 = _1323 * (-0.15915493667125701904296875);
    float _1331 = _1207 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1333 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1321);
    float _1335 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1327);
    float _1337 = _1329 * 6.283185482025146484375;
    float _1339 = sin(_1337);
    float _1341 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1333);
    float _1343 = _1333;
    float _1345 = _1331;
    float _1347 = _1335;
    if (_1311)
    {
        _1343 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1349 = _1343;
    float _1351 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1335);
    float _1353 = _1349;
    if (!_1311)
    {
        _1353 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1355 = _1353;
    float _1357 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    if (_1311)
    {
        _1345 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1359 = _1345;
    float _1361 = _1329 * 6.283185482025146484375;
    float _1363 = cos(_1361);
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1367 = _1359;
    if (_1311)
    {
        _1347 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1369 = _1347;
    float _1371 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1373 = _1369;
    if (!_1311)
    {
        _1367 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1375 = _1367;
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (!_1311)
    {
        _1373 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1379 = _1373;
    float _1381 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1383 = 1.0 / _1351;
    float _1385 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1387 = fma((*spvDescriptorSet0.vp_c9)._m0[88].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1377);
    float _1389 = fma(_1379, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1357);
    float _1391 = -_1365;
    float _1393 = fma(_1371, 2.0, _1391);
    float _1395 = _1241 + 0.5;
    float _1397 = fma(_1385, -2.0, _1381);
    float _1399 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1389);
    float _1401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1403 = _1161 + (-0.5);
    float _1405 = _1395 * _1339;
    float _1407 = _1395 * _1363;
    float _1409 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1049);
    float _1411 = _1399 * (-0.15915493667125701904296875);
    float _1413 = -_1405;
    float _1415 = fma(_1403, _1363, _1413);
    float _1417 = fma(_1403, _1339, _1407);
    float _1419 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1409);
    float _1421 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1423 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1303);
    float _1425 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1299);
    float _1427 = _1415 + 0.5;
    float _1429 = _1341 + _1351;
    float _1431 = _1417 + (-0.5);
    float _1433 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1387);
    float _1435 = _1401 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1439 = _1429 * _1383;
    float _1441 = _1439 * 0.5;
    float _1443 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1261);
    float _1445 = fma(_1435, _1427, _1425);
    float _1447 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1273);
    float _1449 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1325);
    float _1451 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1393);
    float _1453 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1397);
    float _1455 = _1411 * 6.283185482025146484375;
    float _1457 = sin(_1455);
    float _1459 = -_1301;
    float _1461 = -_1423;
    float _1463 = fma(_1459, _1431, _1461);
    float _1465 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1419);
    float _1467 = _1425;
    if (_1205)
    {
        _1467 = 1.0;
    }
    float _1469 = _1467;
    float _1471 = _1411 * 6.283185482025146484375;
    float _1473 = cos(_1471);
    float _1475 = _1469;
    if (!_1205)
    {
        float _1477 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1479 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1481 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1479);
        float _1483 = _1477 * 0.15915493667125701904296875;
        float _1485 = _1483 * 6.283185482025146484375;
        float _1487 = cos(_1485);
        float _1489 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1491 = _1489 * 0.15915493667125701904296875;
        float _1493 = _1483 * 6.283185482025146484375;
        float _1495 = sin(_1493);
        float _1497 = 1.0 / _1487;
        float _1499 = _1491 * 6.283185482025146484375;
        float _1501 = cos(_1499);
        float _1503 = _1495 * _1497;
        float _1505 = 1.0 / _1481;
        float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1509 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1507;
        float _1511 = _1501 * _1503;
        float _1513 = _1491 * 6.283185482025146484375;
        float _1515 = sin(_1513);
        float _1517 = 1.0 / _1511;
        float _1519 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1521 = _1505 * _1519;
        float _1523 = 1.0 / _1509;
        float _1525 = _1515 * _1517;
        float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1529 = fma(_1525, _1521, _1527);
        float _1531 = _1529 * _1523;
        float _1533 = precise::clamp(_1531, 0.0, 1.0);
        float _1535 = -_1533;
        float _1537 = _1535 + 1.0;
        _1475 = _1537;
    }
    float _1539 = _1475;
    float _1541 = _904 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1543 = _1193 + 0.5;
    float _1545 = _1221 + (-0.5);
    float _1547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.gl_Position.x = _988;
    out.gl_Position.y = _990;
    out.gl_Position.z = _1465;
    out.gl_Position.w = _960;
    float _1549 = _1543 * _1457;
    float _1551 = _1543 * _1473;
    float _1553 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1555 = _1231 * _1539;
    float _1557 = -_1549;
    float _1559 = fma(_1545, _1473, _1557);
    float _1561 = fma(_1545, _1457, _1551);
    float _1563 = exp2(_1541);
    float _1565 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1567 = _1421 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1569 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1571 = _1465 + _960;
    float _1573 = -_1443;
    float _1575 = _1573 + 1.0;
    float _1577 = _1559 + 0.5;
    float _1579 = _1561 + (-0.5);
    float _1581 = -_1447;
    float _1583 = _1581 + 1.0;
    float _1585 = -_1449;
    float _1587 = _1585 + 1.0;
    float _1589 = fma(_1553, _1577, _1451);
    float _1591 = _1565 * _1267;
    float _1593 = -_1567;
    float _1595 = -_1453;
    float _1597 = fma(_1593, _1579, _1595);
    float _1599 = -_1569;
    float _1601 = fma(_1599, _1547, -0.0);
    float _1603 = -_1433;
    float _1605 = _1603 + 1.0;
    float _1607 = -_1563;
    float _1609 = _1607 + 1.0;
    float _1611 = _1555 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1613 = -_1583;
    float _1615 = fma(_1415, _1613, _1445);
    float _1617 = fma(_1417, _1587, _1463);
    float _1619 = _1609 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1621 = fma(_1561, _1575, _1597);
    float _1623 = _1571 * 0.5;
    float _1625 = -_1605;
    float _1627 = fma(_1559, _1625, _1589);
    float _1629 = _1619 * _1016;
    float _1631 = -_1619;
    float _1633 = _1631 + 1.0;
    float _1635 = _1611 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1591;
    out.m_60.y = _1601;
    out.m_60.z = _1615;
    out.m_60.w = _1617;
    float _1637 = _1027 * _1629;
    float _1639 = _1037 * _1629;
    float _1641 = _1027 * _1633;
    out.m_62.z = _1623;
    out.m_62.w = _960;
    float _1643 = fma(_1033, _1637, _1021);
    float _1645 = fma(_1035, _1637, _1023);
    float _1647 = fma(_1027, _1639, _1025);
    out.m_64.x = _1627;
    out.m_64.y = _1621;
    out.m_66.x = _1635;
    out.m_68.x = _1643;
    out.m_68.y = _1645;
    out.m_68.z = _1647;
    out.m_68.w = _1641;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _650 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = as_type<float>(int(gl_VertexIndex));
    float _84 = (*spvDescriptorSet0.vp_c12)._m0[4].z * (*spvDescriptorSet0.vp_c12)._m0[5].w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    int _91 = as_type<int>(_82) >> 2;
    int _93 = _91 + _89;
    int _95 = _93 * 96;
    int _97 = _95 + 32;
    uint _100 = uint(int(uint(_95) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_100)];
    float _102 = as_type<float>(_dmw0.x);
    int _104 = _95 + 4;
    uint _106 = uint(int(uint(_104) >> uint(2)));
    float _108 = as_type<float>(_dmw0.y);
    int _110 = _95 + 8;
    uint _112 = uint(int(uint(_110) >> uint(2)));
    float _114 = as_type<float>(_dmw0.z);
    int _116 = _95 + 12;
    uint _118 = uint(int(uint(_116) >> uint(2)));
    float _120 = as_type<float>(_dmw0.w);
    uint _122 = uint(int(uint(_97) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_122)];
    float _124 = as_type<float>(_dmw2.x);
    int _126 = _97 + 4;
    uint _128 = uint(int(uint(_126) >> uint(2)));
    float _130 = as_type<float>(_dmw2.y);
    int _132 = _97 + 8;
    uint _134 = uint(int(uint(_132) >> uint(2)));
    float _136 = as_type<float>(_dmw2.z);
    int _138 = _95 + 16;
    uint _140 = uint(int(uint(_138) >> uint(2)));
    packed_uint3 _dmw1 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_140)];
    float _142 = as_type<float>(_dmw1.x);
    int _144 = _138 + 4;
    uint _146 = uint(int(uint(_144) >> uint(2)));
    float _148 = as_type<float>(_dmw1.y);
    int _150 = _138 + 8;
    uint _152 = uint(int(uint(_150) >> uint(2)));
    float _154 = as_type<float>(_dmw1.z);
    int _156 = _95 + 48;
    int _158 = as_type<int>(_82) & 2;
    bool _162 = _158 != 0;
    int _164 = as_type<int>(_82) & 1;
    bool _166 = _164 != 0;
    uint _168 = uint(int(uint(_156) >> uint(2)));
    packed_uint3 _dmw3 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_168)];
    float _170 = as_type<float>(_dmw3.x);
    int _172 = _156 + 4;
    uint _174 = uint(int(uint(_172) >> uint(2)));
    float _176 = as_type<float>(_dmw3.y);
    int _178 = _156 + 8;
    uint _180 = uint(int(uint(_178) >> uint(2)));
    float _182 = as_type<float>(_dmw3.z);
    float _184 = -_108;
    float _186 = _184 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _188 = _186 * _186;
    float _190 = _130 * _130;
    float _192 = -_102;
    float _194 = _192 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _196 = fma(_124, _124, _190);
    float _198 = -_114;
    float _200 = _198 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _202 = fma(_194, _194, _188);
    float _204 = fma(_136, _136, _196);
    float _206 = fma(_200, _200, _202);
    float _208 = rsqrt(_204);
    float _210 = rsqrt(_206);
    float _212 = _136 * _208;
    float _214 = _130 * _208;
    float _216 = _124 * _208;
    float _218 = _194 * _210;
    float _220 = _200 * _210;
    float _222 = _218 * _212;
    float _224 = _186 * _210;
    float _226 = _220 * _214;
    float _228 = -_222;
    float _230 = fma(_220, _216, _228);
    float _232 = _224 * _216;
    float _234 = -_226;
    float _236 = fma(_224, _212, _234);
    float _238 = _230 * _230;
    float _240 = -_232;
    float _242 = fma(_218, _214, _240);
    float _244 = _148 * _148;
    float _246 = fma(_236, _236, _238);
    float _248 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    float _250 = fma(_142, _142, _244);
    float _252 = fma(_242, _242, _246);
    float _254 = 1.0 / _248;
    float _256 = fma(_154, _154, _250);
    float _258 = rsqrt(_252);
    float _260 = float(_91);
    bool _262 = !_162;
    float _264 = _262 ? 1.0 : (-1.0);
    float _266 = rsqrt(_256);
    float _268 = abs(_120);
    float _270 = _268 * _264;
    float _272 = _270 * 0.5;
    float _274 = _260 * _254;
    float _276 = -(*spvDescriptorSet0.vp_c12)._m0[1].z;
    float _278 = _276 + (*spvDescriptorSet0.vp_c12)._m0[1].w;
    float _280 = _236 * _258;
    float _282 = _230 * _258;
    float _284 = _242 * _258;
    float _286 = fma(_274, _278, (*spvDescriptorSet0.vp_c12)._m0[1].z);
    float _288 = _142 * _266;
    float _290 = _148 * _266;
    float _292 = _154 * _266;
    float _294 = _286 * _272;
    float _296 = _148;
    float _298 = _154;
    float _300 = _142;
    float _302 = _294;
    float _304 = (*spvDescriptorSet0.vp_c12)._m0[4].y;
    float _306 = _280;
    float _308 = _254;
    float _310 = _82;
    float _312 = _102;
    float _314 = _114;
    float _316 = _274;
    if (!_166)
    {
        _296 = _280;
    }
    float _318 = _296;
    float _320 = _318;
    if (!_166)
    {
        _298 = _282;
    }
    float _322 = _298;
    float _324 = _322;
    if (!_166)
    {
        _300 = _284;
    }
    float _326 = _300;
    bool _328 = !_166;
    float _330 = _326;
    float _332 = _170;
    if (!_328)
    {
        float _334 = _292 * _280;
        float _336 = _290 * _284;
        float _338 = -_334;
        float _340 = fma(_288, _284, _338);
        float _342 = _288 * _282;
        float _344 = -_336;
        float _346 = fma(_292, _282, _344);
        float _348 = _340 * _340;
        float _350 = -_342;
        float _352 = fma(_290, _280, _350);
        float _354 = fma(_346, _346, _348);
        float _356 = fma(_352, _352, _354);
        float _358 = rsqrt(_356);
        float _360 = _346 * _358;
        float _362 = _340 * _358;
        float _364 = _352 * _358;
        _330 = _364;
        _320 = _360;
        _324 = _362;
    }
    float _366 = _330;
    float _368 = _320;
    float _370 = _324;
    float _372 = _366 * _272;
    float _374 = -_294;
    float _376 = fma(_368, _374, _102);
    float _378 = -_294;
    float _380 = fma(_370, _378, _108);
    float _382 = -_372;
    float _384 = fma(_286, _382, _114);
    float _386 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _388 = _376 + _386;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _392 = _390 != 0;
    float _394 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _396 = _384 + _394;
    float _398 = _388 * _388;
    float _400 = _396 * _396;
    float _402 = _398 + _400;
    float _404 = sqrt(_402);
    bool _406 = _404 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _408 = _398;
    float _410 = _400;
    float _412 = _370;
    float _414 = _376;
    float _416 = _384;
    float _418 = _388;
    if (!_406)
    {
        _302 = _380;
    }
    float _420 = _302;
    bool _422 = !_406;
    float _424 = _420;
    if (!_422)
    {
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _428 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _430 = _404 + _428;
        float _432 = rsqrt(_402);
        float _434 = _430 * _426;
        float _436 = _380 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _438 = _434 * 0.15915493667125701904296875;
        float _440 = _438 * 6.283185482025146484375;
        float _442 = sin(_440);
        float _444 = _438 * 6.283185482025146484375;
        float _446 = cos(_444);
        float _448 = fma(_442, _436, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _450 = _432 * _448;
        float _452 = _446 + (-1.0);
        float _454 = fma(_388, _450, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _456 = fma(_396, _450, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _458 = _452 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _460 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _462 = _454 + _460;
        float _464 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _466 = _456 + _464;
        float _468 = fma(_380, _446, _458);
        float _470 = _462 * _462;
        float _472 = _466 * _466;
        _424 = _468;
        _408 = _470;
        _410 = _472;
        _412 = _466;
        _414 = _454;
        _416 = _456;
    }
    float _474 = _424;
    float _476 = _408;
    float _478 = _410;
    float _480 = _412;
    float _482 = _414;
    float _484 = _416;
    float _486 = _480;
    if (_392)
    {
        _304 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    }
    float _488 = _304;
    float _490 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _492 = _474 + _490;
    float _494 = _488;
    if (_392)
    {
        _306 = (*spvDescriptorSet0.vp_c8)._m0[29].x;
    }
    float _496 = _306;
    float _498 = _496;
    if (_392)
    {
        _308 = (*spvDescriptorSet0.vp_c8)._m0[29].z;
    }
    float _500 = _308;
    float _502 = fma(_492, _492, _476);
    float _504 = _500;
    if (_392)
    {
        float _506 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _508 = _488 + _506;
        _494 = _508;
    }
    float _510 = _494;
    if (_392)
    {
        float _512 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _514 = _496 + _512;
        _498 = _514;
    }
    float _516 = _498;
    float _518 = _502 + _478;
    float _520 = _518;
    float _522 = _516;
    if (_392)
    {
        float _524 = _510 * _510;
        _486 = _524;
    }
    float _526 = _486;
    if (_392)
    {
        float _528 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _530 = _500 + _528;
        _504 = _530;
    }
    float _532 = _504;
    if (_392)
    {
        float _534 = fma(_516, _516, _526);
        _418 = _534;
    }
    float _536 = _418;
    float _538 = sqrt(_518);
    float _540 = (*spvDescriptorSet0.vp_c12)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _542 = (*spvDescriptorSet0.vp_c12)._m0[2].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _544 = (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _546 = (*spvDescriptorSet0.vp_c12)._m0[3].z;
    if (_392)
    {
        float _548 = fma(_532, _532, _536);
        _310 = _548;
    }
    float _550 = _310;
    float _552 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _554 = (*spvDescriptorSet0.vp_c12)._m0[3].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _556 = (*spvDescriptorSet0.vp_c12)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _558 = (*spvDescriptorSet0.vp_c12)._m0[3].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _560 = (*spvDescriptorSet0.vp_c12)._m0[3].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _562 = (*spvDescriptorSet0.vp_c12)._m0[3].w * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _564 = _550;
    float _566 = (*spvDescriptorSet0.vp_c12)._m0[3].w;
    float _568 = _560;
    float _570 = _562;
    if (_392)
    {
        float _572 = rsqrt(_550);
        _564 = _572;
    }
    float _574 = _564;
    out.m_56.x = _540;
    out.m_56.y = _556;
    out.m_56.z = _542;
    out.m_56.w = _552;
    bool _576 = _538 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _578 = isnan(_538);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _584 = _580 || _582;
    if (!_392)
    {
        _544 = 0.0;
        _520 = 0.0;
    }
    float _586 = _544;
    float _588 = _520;
    float _590 = _586;
    float _592 = _588;
    if (!_392)
    {
        _546 = 0.0;
    }
    float _594 = _546;
    out.m_58.x = _554;
    out.m_58.y = _558;
    out.m_58.z = _560;
    out.m_58.w = _562;
    float _596 = _594;
    float _598 = _574;
    if (_392)
    {
        float _600 = _574 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _566 = _600;
    }
    float _602 = _566;
    if (_392)
    {
        float _604 = _516 * _602;
        _596 = _604;
    }
    float _606 = _596;
    if (_392)
    {
        float _608 = _510 * _602;
        _590 = _608;
    }
    float _610 = _590;
    if (_392)
    {
        float _612 = _532 * _602;
        _592 = _612;
    }
    float _614 = _592;
    if (!_584)
    {
        _522 = 1.0;
    }
    float _616 = _522;
    bool _618 = !_584;
    float _620 = _616;
    if (!_618)
    {
        bool _622 = _538 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _624 = isnan(_538);
        bool _626 = _622 || _624;
        bool _628 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _630 = _626 || _628;
        if (!_630)
        {
            float _632 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _634 = _538 + _632;
            float _636 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _638 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _636;
            float _640 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _642 = _640 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _644 = 1.0 / _638;
            float _646 = _634 * _644;
            float _648 = fma(_646, _642, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _620 = _648;
            _650 = true;
        }
        else
        {
            bool _652 = _538 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _654 = isnan(_538);
            bool _656 = _652 || _654;
            bool _658 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _660 = _656 || _658;
            if (!_660)
            {
                float _662 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _664 = _538 + _662;
                float _666 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _668 = _666 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _670 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _672 = _670 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _674 = 1.0 / _668;
                float _676 = _664 * _674;
                float _678 = fma(_676, _672, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _620 = _678;
                _650 = true;
            }
            else
            {
                _620 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _650 = false;
    float _680 = _620;
    float _682 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _684 = _474 + _682;
    float _686 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _688 = _482 + _686;
    float _690 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _692 = _484 + _690;
    float _694 = fma(_684, _680, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _696 = fma(_688, _680, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _698 = fma(_692, _680, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _700 = _694 + _610;
    float _702 = _696 + _606;
    float _704 = _698 + _614;
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _708 = _700 + _706;
    float _710 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _712 = _702 + _710;
    float _714 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _716 = _704 + _714;
    float _718 = _708 * _708;
    float _720 = fma(_712, _712, _718);
    float _722 = fma(_716, _716, _720);
    float _724 = rsqrt(_722);
    float _726 = _724 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _728 = _712 * _726;
    float _730 = _716 * _726;
    float _732 = _728 * _728;
    float _734 = _730 * _730;
    float _736 = _732 + _734;
    float _738 = sqrt(_736);
    bool _740 = _738 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _742 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _744 = _738 + _742;
    float _746 = _716;
    float _748 = _744;
    float _750 = _708;
    float _752 = _728;
    if (_740)
    {
        float _754 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _746 = _754;
    }
    float _756 = _746;
    if (_740)
    {
        float _758 = rsqrt(_736);
        _568 = _758;
    }
    float _760 = _568;
    float _762 = _760;
    if (_740)
    {
        float _764 = _744 * _756;
        _748 = _764;
    }
    float _766 = _748;
    if (_740)
    {
        float _768 = _766 * 0.15915493667125701904296875;
        _570 = _768;
    }
    float _770 = _570;
    float _772 = _756;
    if (_740)
    {
        float _774 = _770 * 6.283185482025146484375;
        float _776 = sin(_774);
        _772 = _776;
    }
    float _778 = _772;
    float _780 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _782 = precise::max(0.0, _780);
    float _784 = _718;
    float _786 = _782;
    if (_740)
    {
        float _788 = _770 * 6.283185482025146484375;
        float _790 = cos(_788);
        _784 = _790;
    }
    float _792 = _784;
    float _794 = -_726;
    float _796 = -_782;
    float _798 = fma(_708, _794, _796);
    float _800 = _798;
    if (!_740)
    {
        _750 = _730;
    }
    float _802 = _750;
    float _804 = _802;
    if (_740)
    {
        float _806 = _798 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _786 = _806;
    }
    float _808 = _786;
    float _810 = sqrt(_722);
    float _812 = _778;
    float _814 = _808;
    if (_740)
    {
        float _816 = fma(_778, _808, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _812 = _816;
    }
    float _818 = _812;
    float _820 = _818;
    float _822 = _792;
    if (_740)
    {
        float _824 = _792 + (-1.0);
        _814 = _824;
    }
    float _826 = _814;
    float _828 = _826;
    if (_740)
    {
        float _830 = _760 * _818;
        _598 = _830;
    }
    float _832 = _598;
    if (!_740)
    {
        _820 = _798;
    }
    float _834 = _820;
    float _836 = _834;
    if (_740)
    {
        float _838 = _826 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _762 = _838;
    }
    float _840 = _762;
    if (_740)
    {
        float _842 = _728 * _832;
        _752 = _842;
    }
    float _844 = _752;
    if (!_740)
    {
        _828 = _732;
    }
    float _846 = _828;
    float _848 = _846;
    if (_740)
    {
        float _850 = _730 * _832;
        _804 = _850;
    }
    float _852 = _804;
    if (_740)
    {
        float _854 = fma(_798, _792, _840);
        _836 = _854;
    }
    float _856 = _836;
    if (_740)
    {
        float _858 = _844 * _844;
        _848 = _858;
    }
    float _860 = _848;
    if (!_740)
    {
        _822 = _734;
    }
    float _862 = _822;
    float _864 = _862;
    if (_740)
    {
        float _866 = _852 * _852;
        _864 = _866;
    }
    float _868 = _864;
    float _870 = fma(_856, _856, _860);
    float _872 = _870 + _868;
    float _874 = _700 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _876 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _878 = fma(_810, (*spvDescriptorSet0.vp_c15)._m0[23].w, _876);
    float _880 = precise::clamp(_878, 0.0, 1.0);
    float _882 = _700 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _884 = rsqrt(_872);
    float _886 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[2].x, _874);
    float _888 = -_880;
    float _890 = _888 + 1.0;
    float _892 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[1].x, _882);
    float _894 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _896 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[2].z, _886);
    float _898 = _700 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _900 = _700 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _902 = abs(_890);
    float _904 = log2(_902);
    float _906 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[1].z, _892);
    float _908 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[0].x, _898);
    float _910 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[3].x, _900);
    float _912 = _896 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _914 = _906 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _916 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[0].z, _908);
    float _918 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[3].z, _910);
    float _920 = _884 * _844;
    float _922 = _884 * _856;
    float _924 = _916 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _926 = _914 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _928 = _920 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _930 = _884 * _852;
    float _932 = _918 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _934 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[7].x, _926);
    float _936 = -_928;
    float _938 = fma(_922, (*spvDescriptorSet0.vp_c15)._m0[21].y, _936);
    float _940 = _904 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _942 = _912 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _944 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[7].z, _934);
    float _946 = -_930;
    float _948 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[21].z, _938);
    float _950 = _914 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _952 = -_942;
    float _954 = fma(_952, _894, 1.0);
    float _956 = exp2(_940);
    float _958 = fma(_948, -0.5, 0.5);
    float _960 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[7].w, _944);
    float _962 = _914 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _964 = fma(_948, 0.5, 0.5);
    float _966 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[5].x, _950);
    float _968 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[4].x, _962);
    float _970 = 1.0 / _960;
    float _972 = _922 + 1.0;
    float _974 = fma(_964, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _976 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[4].z, _968);
    float _978 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[5].z, _966);
    float _980 = fma(_964, _974, -0.212114393711090087890625);
    float _982 = log2(_954);
    float _984 = -_922;
    float _986 = fma(_956, _972, _984);
    float _988 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[4].w, _976);
    float _990 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[5].w, _978);
    float _992 = fma(_964, _980, 1.570728778839111328125);
    float _994 = sqrt(_958);
    float _996 = _988 * _970;
    float _998 = _990 * _970;
    float _1000 = fma(_996, 0.5, 0.5);
    float _1002 = fma(_998, -0.5, 0.5);
    float _1004 = fma(_986, 0.5, 0.5);
    float _1006 = _982 * 0.693147182464599609375;
    float _1008 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1010 = _994 * 0.636619746685028076171875;
    float _1012 = -_992;
    float _1014 = fma(_1010, _1012, 1.0);
    float3 _3174 = float3(_1000, _1002, _1008);
    float _1016 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3174, float3(0.0), isnan(_3174)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3174, float3(0.0), isnan(_3174)), level(0.0)).x;
    float3 _3185 = float3(_1000, _1002, _1008);
    float4 _1019 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3185, float3(0.0), isnan(_3185)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3185, float3(0.0), isnan(_3185)), level(0.0)).xyzw;
    float _1021 = _1019.x;
    float _1023 = _1019.y;
    float _1025 = _1019.z;
    float _1027 = _1019.w;
    float2 _3202 = float2(_1014, _1004);
    float3 _1031 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3202, float2(0.0), isnan(_3202)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3202, float2(0.0), isnan(_3202)), level(0.0)).xyz;
    float _1033 = _1031.x;
    float _1035 = _1031.y;
    float _1037 = _1031.z;
    int _1039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1041 = _1039 != 0;
    float _1043 = _108 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1047 = _1045 != 0;
    float _1049 = _914 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1053 = _1051 != 0;
    float _1055 = fma(_102, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1043);
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1059 = _1057 != 0;
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1063 = _1061 != 0;
    bool _1065 = !_162;
    float _1067 = _1065 ? 0.0 : 1.0;
    bool _1069 = _1041;
    float _1071 = _1000;
    bool _1073 = _1047;
    bool _1075 = _1059;
    float _1077 = _1055;
    if (!_1041)
    {
        float _1079 = -_170;
        float _1081 = (-0.0) + _1079;
        _800 = _1081;
    }
    float _1083 = _800;
    bool _1085 = false;
    float _1087 = _1083;
    if (_1041)
    {
        bool _1089 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _1085 = _1089;
    }
    bool _1091 = _1085;
    float _1093 = _108 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1095 = fma(_114, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1055);
    int _1097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1099 = _1097 != 0;
    float _1101 = fma(_102, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1093);
    float _1103 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1105 = _1091;
    float _1107 = _1101;
    if (_1041)
    {
        float _1109 = -_170;
        float _1111 = _1091 ? _170 : _1109;
        _1087 = _1111;
    }
    float _1113 = _1087;
    float _1115 = fma(_114, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1101);
    if (_1047)
    {
        bool _1117 = (*spvDescriptorSet0.vp_c12)._m0[0].x > 0.5;
        _1105 = _1117;
    }
    bool _1119 = _1105;
    bool _1121 = _1119;
    if (_1053)
    {
        bool _1123 = (*spvDescriptorSet0.vp_c12)._m0[0].z > 0.5;
        _1069 = _1123;
    }
    bool _1125 = _1069;
    if (!_1047)
    {
        _332 = _1067;
    }
    float _1127 = _332;
    float _1129 = 0.0;
    float _1131 = _1127;
    if (!_1099)
    {
        float _1133 = -_176;
        float _1135 = (-0.0) + _1133;
        _1129 = _1135;
    }
    float _1137 = _1129;
    float _1139 = _1137;
    if (!_1053)
    {
        _1071 = _1067;
    }
    float _1141 = _1071;
    float _1143 = _1141;
    if (_1047)
    {
        float _1145 = -_1067;
        float _1147 = _1119 ? _1145 : _1067;
        _1131 = _1147;
    }
    float _1149 = _1131;
    if (_1059)
    {
        bool _1151 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _1121 = _1151;
    }
    bool _1153 = _1121;
    float _1155 = _108 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1053)
    {
        float _1157 = -_1067;
        float _1159 = _1125 ? _1157 : _1067;
        _1143 = _1159;
    }
    float _1161 = _1143;
    float _1163 = _108 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1165 = _1163;
    if (_1063)
    {
        bool _1167 = (*spvDescriptorSet0.vp_c12)._m0[0].z > 0.5;
        _1073 = _1167;
    }
    bool _1169 = _1073;
    float _1171 = fma(_102, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1155);
    int _1173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1175 = _1173 != 0;
    float _1177 = fma(_102, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1163);
    float _1179 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (!_1063)
    {
        float _1181 = -_182;
        float _1183 = (-0.0) + _1181;
        _1165 = _1183;
    }
    float _1185 = _1165;
    float _1187 = _1185;
    if (_1063)
    {
        float _1189 = -_182;
        float _1191 = _1169 ? _182 : _1189;
        _1187 = _1191;
    }
    float _1193 = _1187;
    float _1195 = fma(_114, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1171);
    bool _1197 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1201 = _1197 || _1199;
    bool _1203 = isnan(0.5);
    bool _1205 = _1201 || _1203;
    float _1207 = fma(_114, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1177);
    if (_1099)
    {
        _1179 = (*spvDescriptorSet0.vp_c12)._m0[0].w;
    }
    float _1209 = _1179;
    float _1211 = _1195 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    if (!_1059)
    {
        _312 = _1067;
    }
    float _1213 = _312;
    float _1215 = _1213;
    if (_1059)
    {
        float _1217 = -_1067;
        float _1219 = _1153 ? _1217 : _1067;
        _1215 = _1219;
    }
    float _1221 = _1215;
    if (_1099)
    {
        bool _1223 = _1209 > 0.5;
        _1075 = _1223;
    }
    bool _1225 = _1075;
    float _1227 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _1229 = _1227 + (*spvDescriptorSet0.vp_c12)._m0[1].y;
    float _1231 = fma(_274, _1229, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    if (!_1175)
    {
        _314 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1233 = _314;
    float _1235 = _1233;
    if (_1099)
    {
        float _1237 = -_176;
        float _1239 = _1225 ? _176 : _1237;
        _1139 = _1239;
    }
    float _1241 = _1139;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    if (_1175)
    {
        _1235 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1245 = _1235;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1251 = _1245;
    if (!_1175)
    {
        _316 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1253 = _316;
    float _1255 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1243);
    float _1257 = _1253;
    if (_1175)
    {
        _1257 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1259 = _1257;
    float _1261 = fma((*spvDescriptorSet0.vp_c9)._m0[88].w, (*spvDescriptorSet0.vp_c12)._m0[0].y, _1247);
    if (!_1175)
    {
        _1077 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1263 = _1077;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1269 = _1263;
    if (!_1175)
    {
        _1251 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1271 = _1251;
    float _1273 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1265);
    float _1275 = _1271;
    if (_1175)
    {
        _1269 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1277 = _1269;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_1175)
    {
        _1275 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1281 = _1275;
    float _1283 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1285 = 0;
    if (_1175)
    {
        _1285 = 0;
    }
    int _1287 = _1285;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1291 = _1287;
    if (!_1175)
    {
        _1291 = 2;
    }
    int _1293 = _1291;
    float _1295 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1297 = -_1279;
    float _1299 = fma(_1283, 2.0, _1297);
    float _1301 = _1249 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1303 = fma(_1295, -2.0, _1289);
    float _1305 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    if (!_1175)
    {
        _1107 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1307 = _1107;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1311 = _1293 != 2;
    float _1313 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1315 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1317 = _1307;
    if (_1175)
    {
        _1317 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1319 = _1317;
    float _1321 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1313);
    float _1323 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1255);
    float _1325 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1309);
    float _1327 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1315);
    float _1329 = _1323 * (-0.15915493667125701904296875);
    float _1331 = _1207 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1333 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1321);
    float _1335 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1327);
    float _1337 = _1329 * 6.283185482025146484375;
    float _1339 = sin(_1337);
    float _1341 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1333);
    float _1343 = _1333;
    float _1345 = _1331;
    float _1347 = _1335;
    if (_1311)
    {
        _1343 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1349 = _1343;
    float _1351 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1335);
    float _1353 = _1349;
    if (!_1311)
    {
        _1353 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1355 = _1353;
    float _1357 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    if (_1311)
    {
        _1345 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1359 = _1345;
    float _1361 = _1329 * 6.283185482025146484375;
    float _1363 = cos(_1361);
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1367 = _1359;
    if (_1311)
    {
        _1347 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1369 = _1347;
    float _1371 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1373 = _1369;
    if (!_1311)
    {
        _1367 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1375 = _1367;
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (!_1311)
    {
        _1373 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1379 = _1373;
    float _1381 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1383 = 1.0 / _1351;
    float _1385 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1387 = fma((*spvDescriptorSet0.vp_c9)._m0[88].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1377);
    float _1389 = fma(_1379, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1357);
    float _1391 = -_1365;
    float _1393 = fma(_1371, 2.0, _1391);
    float _1395 = _1241 + 0.5;
    float _1397 = fma(_1385, -2.0, _1381);
    float _1399 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1389);
    float _1401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1403 = _1161 + (-0.5);
    float _1405 = _1395 * _1339;
    float _1407 = _1395 * _1363;
    float _1409 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1049);
    float _1411 = _1399 * (-0.15915493667125701904296875);
    float _1413 = -_1405;
    float _1415 = fma(_1403, _1363, _1413);
    float _1417 = fma(_1403, _1339, _1407);
    float _1419 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1409);
    float _1421 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1423 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1303);
    float _1425 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1299);
    float _1427 = _1415 + 0.5;
    float _1429 = _1341 + _1351;
    float _1431 = _1417 + (-0.5);
    float _1433 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1387);
    float _1435 = _1401 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1439 = _1429 * _1383;
    float _1441 = _1439 * 0.5;
    float _1443 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1261);
    float _1445 = fma(_1435, _1427, _1425);
    float _1447 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1273);
    float _1449 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1325);
    float _1451 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1393);
    float _1453 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1397);
    float _1455 = _1411 * 6.283185482025146484375;
    float _1457 = sin(_1455);
    float _1459 = -_1301;
    float _1461 = -_1423;
    float _1463 = fma(_1459, _1431, _1461);
    float _1465 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1419);
    float _1467 = _1425;
    if (_1205)
    {
        _1467 = 1.0;
    }
    float _1469 = _1467;
    float _1471 = _1411 * 6.283185482025146484375;
    float _1473 = cos(_1471);
    float _1475 = _1469;
    if (!_1205)
    {
        float _1477 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1479 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1481 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1479);
        float _1483 = _1477 * 0.15915493667125701904296875;
        float _1485 = _1483 * 6.283185482025146484375;
        float _1487 = cos(_1485);
        float _1489 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1491 = _1489 * 0.15915493667125701904296875;
        float _1493 = _1483 * 6.283185482025146484375;
        float _1495 = sin(_1493);
        float _1497 = 1.0 / _1487;
        float _1499 = _1491 * 6.283185482025146484375;
        float _1501 = cos(_1499);
        float _1503 = _1495 * _1497;
        float _1505 = 1.0 / _1481;
        float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1509 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1507;
        float _1511 = _1501 * _1503;
        float _1513 = _1491 * 6.283185482025146484375;
        float _1515 = sin(_1513);
        float _1517 = 1.0 / _1511;
        float _1519 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1521 = _1505 * _1519;
        float _1523 = 1.0 / _1509;
        float _1525 = _1515 * _1517;
        float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1529 = fma(_1525, _1521, _1527);
        float _1531 = _1529 * _1523;
        float _1533 = precise::clamp(_1531, 0.0, 1.0);
        float _1535 = -_1533;
        float _1537 = _1535 + 1.0;
        _1475 = _1537;
    }
    float _1539 = _1475;
    float _1541 = _904 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1543 = _1193 + 0.5;
    float _1545 = _1221 + (-0.5);
    float _1547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.gl_Position.x = _988;
    out.gl_Position.y = _990;
    out.gl_Position.z = _1465;
    out.gl_Position.w = _960;
    float _1549 = _1543 * _1457;
    float _1551 = _1543 * _1473;
    float _1553 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1555 = _1231 * _1539;
    float _1557 = -_1549;
    float _1559 = fma(_1545, _1473, _1557);
    float _1561 = fma(_1545, _1457, _1551);
    float _1563 = exp2(_1541);
    float _1565 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1567 = _1421 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1569 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1571 = _1465 + _960;
    float _1573 = -_1443;
    float _1575 = _1573 + 1.0;
    float _1577 = _1559 + 0.5;
    float _1579 = _1561 + (-0.5);
    float _1581 = -_1447;
    float _1583 = _1581 + 1.0;
    float _1585 = -_1449;
    float _1587 = _1585 + 1.0;
    float _1589 = fma(_1553, _1577, _1451);
    float _1591 = _1565 * _1267;
    float _1593 = -_1567;
    float _1595 = -_1453;
    float _1597 = fma(_1593, _1579, _1595);
    float _1599 = -_1569;
    float _1601 = fma(_1599, _1547, -0.0);
    float _1603 = -_1433;
    float _1605 = _1603 + 1.0;
    float _1607 = -_1563;
    float _1609 = _1607 + 1.0;
    float _1611 = _1555 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1613 = -_1583;
    float _1615 = fma(_1415, _1613, _1445);
    float _1617 = fma(_1417, _1587, _1463);
    float _1619 = _1609 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1621 = fma(_1561, _1575, _1597);
    float _1623 = _1571 * 0.5;
    float _1625 = -_1605;
    float _1627 = fma(_1559, _1625, _1589);
    float _1629 = _1619 * _1016;
    float _1631 = -_1619;
    float _1633 = _1631 + 1.0;
    float _1635 = _1611 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1591;
    out.m_60.y = _1601;
    out.m_60.z = _1615;
    out.m_60.w = _1617;
    float _1637 = _1027 * _1629;
    float _1639 = _1037 * _1629;
    float _1641 = _1027 * _1633;
    out.m_62.z = _1623;
    out.m_62.w = _960;
    float _1643 = fma(_1033, _1637, _1021);
    float _1645 = fma(_1035, _1637, _1023);
    float _1647 = fma(_1027, _1639, _1025);
    out.m_64.x = _1627;
    out.m_64.y = _1621;
    out.m_66.x = _1635;
    out.m_68.x = _1643;
    out.m_68.y = _1645;
    out.m_68.z = _1647;
    out.m_68.w = _1641;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

