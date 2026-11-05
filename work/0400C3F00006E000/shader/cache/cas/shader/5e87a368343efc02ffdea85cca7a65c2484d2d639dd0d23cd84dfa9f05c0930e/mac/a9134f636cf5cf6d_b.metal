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
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c8 [[id(3)]];
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
    bool _566 = false;
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
    int _95 = _93 * 48;
    int _97 = _95 + 16;
    uint _100 = uint(int(uint(_97) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_100)];
    float _102 = as_type<float>(_dmw1.x);
    int _104 = _97 + 4;
    uint _106 = uint(int(uint(_104) >> uint(2)));
    float _108 = as_type<float>(_dmw1.y);
    int _110 = _97 + 8;
    uint _112 = uint(int(uint(_110) >> uint(2)));
    float _114 = as_type<float>(_dmw1.z);
    int _116 = _97 + 12;
    uint _118 = uint(int(uint(_116) >> uint(2)));
    float _120 = as_type<float>(_dmw1.w);
    int _122 = _95 + 32;
    uint _124 = uint(int(uint(_95) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_124)];
    float _126 = as_type<float>(_dmw0.x);
    int _128 = _95 + 4;
    uint _130 = uint(int(uint(_128) >> uint(2)));
    float _132 = as_type<float>(_dmw0.y);
    int _134 = _95 + 8;
    uint _136 = uint(int(uint(_134) >> uint(2)));
    float _138 = as_type<float>(_dmw0.z);
    int _140 = _95 + 12;
    uint _142 = uint(int(uint(_140) >> uint(2)));
    float _144 = as_type<float>(_dmw0.w);
    uint _146 = uint(int(uint(_122) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_146)];
    float _148 = as_type<float>(_dmw2.x);
    int _150 = _122 + 4;
    uint _152 = uint(int(uint(_150) >> uint(2)));
    float _154 = as_type<float>(_dmw2.y);
    int _156 = _122 + 8;
    uint _158 = uint(int(uint(_156) >> uint(2)));
    float _160 = as_type<float>(_dmw2.z);
    int _162 = as_type<int>(_82) & 1;
    bool _166 = _162 != 0;
    int _168 = as_type<int>(_82) & 2;
    bool _170 = _168 != 0;
    bool _172 = !_170;
    float _174 = _172 ? 1.0 : (-1.0);
    float _176 = _108 * _108;
    float _178 = fma(_102, _102, _176);
    float _180 = fma(_114, _114, _178);
    float _182 = rsqrt(_180);
    float _184 = _114 * _182;
    float _186 = _108 * _182;
    float _188 = _102 * _182;
    float _190 = _148 * _184;
    float _192 = _160 * _186;
    float _194 = -_190;
    float _196 = fma(_160, _188, _194);
    float _198 = -_192;
    float _200 = fma(_154, _184, _198);
    float _202 = _154 * _188;
    float _204 = _196 * _196;
    float _206 = -_202;
    float _208 = fma(_148, _186, _206);
    float _210 = fma(_200, _200, _204);
    float _212 = fma(_208, _208, _210);
    float _214 = rsqrt(_212);
    float _216 = abs(_144);
    float _218 = _216 * _174;
    float _220 = _218 * 0.5;
    float _222 = _200 * _214;
    float _224 = _208 * _214;
    float _226 = _196 * _214;
    float _228 = _208;
    float _230 = _144;
    float _232 = _226;
    float _234 = _188;
    float _236 = as_type<float>(_91);
    if (!_166)
    {
        _228 = _222;
    }
    float _238 = _228;
    float _240 = _238;
    if (!_166)
    {
        _230 = _224;
    }
    float _242 = _230;
    bool _244 = !_166;
    float _246 = _242;
    if (!_244)
    {
        float _248 = _184 * _222;
        float _250 = _186 * _224;
        float _252 = -_248;
        float _254 = fma(_188, _224, _252);
        float _256 = _188 * _226;
        float _258 = -_250;
        float _260 = fma(_184, _226, _258);
        float _262 = _254 * _254;
        float _264 = -_256;
        float _266 = fma(_186, _222, _264);
        float _268 = fma(_260, _260, _262);
        float _270 = fma(_266, _266, _268);
        float _272 = rsqrt(_270);
        float _274 = _260 * _272;
        float _276 = _254 * _272;
        float _278 = _266 * _272;
        _240 = _274;
        _246 = _278;
        _232 = _276;
    }
    float _280 = _240;
    float _282 = _246;
    float _284 = _232;
    float _286 = -_220;
    float _288 = fma(_280, _286, _126);
    float _290 = -_220;
    float _292 = fma(_282, _290, _138);
    float _294 = -_220;
    float _296 = fma(_284, _294, _132);
    float _298 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _300 = _288 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _304 = _292 + _302;
    int _306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _308 = _306 != 0;
    float _310 = _300 * _300;
    float _312 = _304 * _304;
    float _314 = _310 + _312;
    float _316 = sqrt(_314);
    bool _318 = _316 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _320 = _284;
    float _322 = _312;
    float _324 = _288;
    float _326 = _292;
    float _328 = _300;
    float _330 = _304;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_318)
    {
        _320 = _310;
    }
    float _334 = _320;
    float _336 = _334;
    if (!_318)
    {
        _234 = _296;
    }
    float _338 = _234;
    bool _340 = !_318;
    float _342 = _338;
    if (!_340)
    {
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _346 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _348 = _316 + _346;
        float _350 = _296 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _352 = rsqrt(_314);
        float _354 = _348 * _344;
        float _356 = _354 * 0.15915493667125701904296875;
        float _358 = _356 * 6.283185482025146484375;
        float _360 = sin(_358);
        float _362 = _356 * 6.283185482025146484375;
        float _364 = cos(_362);
        float _366 = fma(_360, _350, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _368 = _352 * _366;
        float _370 = _364 + (-1.0);
        float _372 = fma(_300, _368, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _374 = fma(_304, _368, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _376 = _370 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _378 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _380 = _372 + _378;
        float _382 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _384 = _374 + _382;
        float _386 = fma(_296, _364, _376);
        float _388 = _380 * _380;
        float _390 = _384 * _384;
        _342 = _386;
        _336 = _388;
        _322 = _390;
        _324 = _372;
        _326 = _374;
    }
    float _392 = _342;
    float _394 = _336;
    float _396 = _322;
    float _398 = _324;
    float _400 = _326;
    float _402 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _404 = _392 + _402;
    float _406 = 0.0;
    float _408 = _396;
    if (_308)
    {
        _406 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    }
    float _410 = _406;
    float _412 = _410;
    if (_308)
    {
        _328 = (*spvDescriptorSet0.vp_c8)._m0[29].x;
    }
    float _414 = _328;
    float _416 = fma(_404, _404, _394);
    float _418 = 0.0;
    float _420 = _414;
    if (_308)
    {
        _418 = (*spvDescriptorSet0.vp_c8)._m0[29].z;
    }
    float _422 = _418;
    float _424 = _422;
    if (_308)
    {
        float _426 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _428 = _410 + _426;
        _412 = _428;
    }
    float _430 = _412;
    float _432 = _416 + _396;
    float _434 = _432;
    if (_308)
    {
        float _436 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _438 = _414 + _436;
        _420 = _438;
    }
    float _440 = _420;
    float _442 = _440;
    if (_308)
    {
        float _444 = _430 * _430;
        _408 = _444;
    }
    float _446 = _408;
    if (_308)
    {
        float _448 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _450 = _422 + _448;
        _424 = _450;
    }
    float _452 = _424;
    float _454 = _452;
    if (_308)
    {
        float _456 = fma(_440, _440, _446);
        _330 = _456;
    }
    float _458 = _330;
    float _460 = sqrt(_432);
    float _462 = (*spvDescriptorSet0.vp_c12)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _464 = (*spvDescriptorSet0.vp_c12)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _466 = 0.0;
    float _468 = (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _470 = (*spvDescriptorSet0.vp_c12)._m0[3].x;
    if (_308)
    {
        float _472 = fma(_452, _452, _458);
        _466 = _472;
    }
    float _474 = _466;
    float _476 = (*spvDescriptorSet0.vp_c12)._m0[2].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _478 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _480 = (*spvDescriptorSet0.vp_c12)._m0[3].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _482 = (*spvDescriptorSet0.vp_c12)._m0[3].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _484 = (*spvDescriptorSet0.vp_c12)._m0[3].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _486 = _474;
    if (_308)
    {
        float _488 = rsqrt(_474);
        _486 = _488;
    }
    float _490 = _486;
    out.m_56.x = _462;
    out.m_56.y = _464;
    out.m_56.z = _476;
    out.m_56.w = _478;
    if (!_308)
    {
        _468 = 0.0;
    }
    float _492 = _468;
    bool _494 = _460 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _496 = isnan(_460);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _502 = _498 || _500;
    out.m_58.x = _480;
    out.m_58.y = _482;
    out.m_58.z = _484;
    float _504 = _492;
    if (!_308)
    {
        _470 = 0.0;
    }
    float _506 = _470;
    float _508 = _506;
    if (!_308)
    {
        _434 = 0.0;
    }
    float _510 = _434;
    float _512 = 0.0;
    float _514 = _510;
    if (_308)
    {
        float _516 = _490 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _512 = _516;
    }
    float _518 = _512;
    if (_308)
    {
        float _520 = _440 * _518;
        _504 = _520;
    }
    float _522 = _504;
    if (_308)
    {
        float _524 = _430 * _518;
        _508 = _524;
    }
    float _526 = _508;
    if (_308)
    {
        float _528 = _452 * _518;
        _514 = _528;
    }
    float _530 = _514;
    if (!_502)
    {
        _442 = 1.0;
    }
    float _532 = _442;
    bool _534 = !_502;
    float _536 = _532;
    if (!_534)
    {
        bool _538 = _460 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _540 = isnan(_460);
        bool _542 = _538 || _540;
        bool _544 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _546 = _542 || _544;
        if (!_546)
        {
            float _548 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _550 = _460 + _548;
            float _552 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _554 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _552;
            float _556 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _558 = _556 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _560 = 1.0 / _554;
            float _562 = _550 * _560;
            float _564 = fma(_562, _558, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _536 = _564;
            _566 = true;
        }
        else
        {
            bool _568 = _460 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _570 = isnan(_460);
            bool _572 = _568 || _570;
            bool _574 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _576 = _572 || _574;
            if (!_576)
            {
                float _578 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _580 = _460 + _578;
                float _582 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _584 = _582 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _586 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _588 = _586 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _590 = 1.0 / _584;
                float _592 = _580 * _590;
                float _594 = fma(_592, _588, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _536 = _594;
                _566 = true;
            }
            else
            {
                _536 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _566 = false;
    float _596 = _536;
    float _598 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _600 = _392 + _598;
    float _602 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _604 = _398 + _602;
    float _606 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _608 = _400 + _606;
    float _610 = fma(_600, _596, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _612 = fma(_604, _596, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _614 = fma(_608, _596, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _616 = _610 + _526;
    float _618 = _612 + _522;
    float _620 = _614 + _530;
    float _622 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _624 = _616 + _622;
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _628 = _618 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _632 = _620 + _630;
    float _634 = _624 * _624;
    float _636 = fma(_628, _628, _634);
    float _638 = fma(_632, _632, _636);
    float _640 = rsqrt(_638);
    float _642 = sqrt(_638);
    float _644 = _640 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _646 = _628 * _644;
    float _648 = _632 * _644;
    float _650 = _646 * _646;
    float _652 = _648 * _648;
    float _654 = _650 + _652;
    float _656 = sqrt(_654);
    bool _658 = _656 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _660 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _662 = _656 + _660;
    float _664 = _482;
    float _666 = _654;
    float _668 = _662;
    float _670 = _624;
    float _672 = _644;
    float _674 = _646;
    if (_658)
    {
        float _676 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _664 = _676;
    }
    float _678 = _664;
    if (_658)
    {
        float _680 = rsqrt(_654);
        _666 = _680;
    }
    float _682 = _666;
    float _684 = _678;
    if (_658)
    {
        float _686 = _662 * _678;
        _668 = _686;
    }
    float _688 = _668;
    if (_658)
    {
        float _690 = _688 * 0.15915493667125701904296875;
        _684 = _690;
    }
    float _692 = _684;
    float _694 = _632;
    float _696 = _692;
    if (_658)
    {
        float _698 = _692 * 6.283185482025146484375;
        float _700 = sin(_698);
        _694 = _700;
    }
    float _702 = _694;
    float _704 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _706 = precise::max(0.0, _704);
    float _708 = _614;
    float _710 = _706;
    if (_658)
    {
        float _712 = _692 * 6.283185482025146484375;
        float _714 = cos(_712);
        _708 = _714;
    }
    float _716 = _708;
    float _718 = -_644;
    float _720 = -_706;
    float _722 = fma(_624, _718, _720);
    if (_658)
    {
        float _724 = _722 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _670 = _724;
    }
    float _726 = _670;
    float _728 = _726;
    if (!_658)
    {
        _696 = _650;
    }
    float _730 = _696;
    float _732 = _702;
    float _734 = _730;
    if (_658)
    {
        float _736 = fma(_702, _726, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _728 = _736;
    }
    float _738 = _728;
    float _740 = _738;
    if (!_658)
    {
        _732 = _722;
    }
    float _742 = _732;
    float _744 = _742;
    if (_658)
    {
        float _746 = _716 + (-1.0);
        _710 = _746;
    }
    float _748 = _710;
    float _750 = _748;
    if (_658)
    {
        float _752 = _682 * _738;
        _454 = _752;
    }
    float _754 = _454;
    if (!_658)
    {
        _740 = _648;
    }
    float _756 = _740;
    float _758 = _756;
    if (_658)
    {
        float _760 = _748 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _672 = _760;
    }
    float _762 = _672;
    if (_658)
    {
        float _764 = _646 * _754;
        _674 = _764;
    }
    float _766 = _674;
    if (_658)
    {
        float _768 = _648 * _754;
        _758 = _768;
    }
    float _770 = _758;
    if (!_658)
    {
        _750 = _652;
    }
    float _772 = _750;
    float _774 = _772;
    if (_658)
    {
        float _776 = fma(_722, _716, _762);
        _744 = _776;
    }
    float _778 = _744;
    if (_658)
    {
        float _780 = _766 * _766;
        _734 = _780;
    }
    float _782 = _734;
    if (_658)
    {
        float _784 = _770 * _770;
        _774 = _784;
    }
    float _786 = _774;
    float _788 = _616 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _790 = fma(_778, _778, _782);
    float _792 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _794 = fma(_642, (*spvDescriptorSet0.vp_c15)._m0[23].w, _792);
    float _796 = precise::clamp(_794, 0.0, 1.0);
    float _798 = _790 + _786;
    float _800 = _616 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _802 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[1].x, _788);
    float _804 = -_796;
    float _806 = _804 + 1.0;
    float _808 = rsqrt(_798);
    float _810 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[2].x, _800);
    float _812 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[1].z, _802);
    float _814 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[2].z, _810);
    float _816 = _616 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _818 = _616 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _820 = abs(_806);
    float _822 = log2(_820);
    float _824 = _812 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _826 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[0].x, _816);
    float _828 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[3].x, _818);
    float _830 = _814 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _832 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _834 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[0].z, _826);
    float _836 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[3].z, _828);
    float _838 = _808 * _766;
    float _840 = _808 * _778;
    float _842 = _834 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _844 = _824 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _846 = _838 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _848 = _836 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _850 = _808 * _770;
    float _852 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[7].x, _844);
    float _854 = -_846;
    float _856 = fma(_840, (*spvDescriptorSet0.vp_c15)._m0[21].y, _854);
    float _858 = _830 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _860 = _824 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _862 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[7].z, _852);
    float _864 = -_850;
    float _866 = fma(_864, (*spvDescriptorSet0.vp_c15)._m0[21].z, _856);
    float _868 = -_858;
    float _870 = fma(_868, _832, 1.0);
    float _872 = _822 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _874 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[7].w, _862);
    float _876 = fma(_866, -0.5, 0.5);
    float _878 = _824 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _880 = fma(_866, 0.5, 0.5);
    float _882 = 1.0 / _874;
    float _884 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[5].x, _860);
    float _886 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[4].x, _878);
    float _888 = fma(_880, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _890 = _840 + 1.0;
    float _892 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[5].z, _884);
    float _894 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[4].z, _886);
    float _896 = fma(_880, _888, -0.212114393711090087890625);
    float _898 = log2(_870);
    float _900 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[5].w, _892);
    float _902 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[4].w, _894);
    float _904 = fma(_880, _896, 1.570728778839111328125);
    float _906 = exp2(_872);
    float _908 = _902 * _882;
    float _910 = _900 * _882;
    float _912 = fma(_908, 0.5, 0.5);
    float _914 = fma(_910, -0.5, 0.5);
    float _916 = sqrt(_876);
    float _918 = _898 * 0.693147182464599609375;
    float _920 = _918 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _922 = -_840;
    float _924 = fma(_906, _890, _922);
    float _926 = fma(_924, 0.5, 0.5);
    float _928 = _916 * 0.636619746685028076171875;
    float _930 = -_904;
    float _932 = fma(_928, _930, 1.0);
    float3 _3044 = float3(_912, _914, _920);
    float _934 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3044, float3(0.0), isnan(_3044)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3044, float3(0.0), isnan(_3044)), level(0.0)).x;
    float3 _3055 = float3(_912, _914, _920);
    float4 _937 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3055, float3(0.0), isnan(_3055)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3055, float3(0.0), isnan(_3055)), level(0.0)).xyzw;
    float _939 = _937.x;
    float _941 = _937.y;
    float _943 = _937.z;
    float _945 = _937.w;
    float2 _3072 = float2(_932, _926);
    float3 _949 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3072, float2(0.0), isnan(_3072)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3072, float2(0.0), isnan(_3072)), level(0.0)).xyz;
    float _951 = _949.x;
    float _953 = _949.y;
    float _955 = _949.z;
    int _957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _959 = _957 != 0;
    float _961 = _132 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _965 = _963 != 0;
    float _967 = _132 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _969 = fma(_126, (*spvDescriptorSet0.vp_c8)._m0[2].x, _961);
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _973 = _971 != 0;
    float _975 = fma(_126, (*spvDescriptorSet0.vp_c8)._m0[3].x, _967);
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _979 = _977 != 0;
    float _981 = fma(_138, (*spvDescriptorSet0.vp_c8)._m0[2].z, _969);
    bool _983 = !_170;
    float _985 = _983 ? 0.0 : 1.0;
    float _987 = fma(_138, (*spvDescriptorSet0.vp_c8)._m0[3].z, _975);
    float _989 = _824 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _991 = false;
    float _993 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _995 = _959;
    float _997 = _914;
    bool _999 = _965;
    float _1001 = _985;
    float _1003 = _975;
    float _1005 = _987;
    if (_959)
    {
        bool _1007 = (*spvDescriptorSet0.vp_c12)._m0[0].x > 0.5;
        _991 = _1007;
    }
    bool _1009 = _991;
    float _1011 = _987 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1015 = _1013 != 0;
    float _1017 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[6].x, _989);
    bool _1019 = _1009;
    bool _1021 = _1015;
    if (!_959)
    {
        _993 = _985;
    }
    float _1023 = _993;
    float _1025 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1027 = _1023;
    if (_959)
    {
        float _1029 = -_985;
        float _1031 = _1009 ? _1029 : _985;
        _1027 = _1031;
    }
    float _1033 = _1027;
    float _1035 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1017);
    if (_965)
    {
        bool _1037 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _1019 = _1037;
    }
    bool _1039 = _1019;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1043 = _1041 != 0;
    bool _1045 = _1039;
    if (!_965)
    {
        float _1047 = -_120;
        float _1049 = (-0.0) + _1047;
        _332 = _1049;
    }
    float _1051 = _332;
    float _1053 = _1051;
    if (_965)
    {
        float _1055 = -_120;
        float _1057 = _1039 ? _120 : _1055;
        _1053 = _1057;
    }
    float _1059 = _1053;
    if (_973)
    {
        bool _1061 = (*spvDescriptorSet0.vp_c12)._m0[0].z > 0.5;
        _995 = _1061;
    }
    bool _1063 = _995;
    if (_979)
    {
        bool _1065 = (*spvDescriptorSet0.vp_c12)._m0[0].z > 0.5;
        _1045 = _1065;
    }
    bool _1067 = _1045;
    if (!_973)
    {
        _997 = _985;
    }
    float _1069 = _997;
    float _1071 = _1069;
    if (_973)
    {
        float _1073 = -_985;
        float _1075 = _1063 ? _1073 : _985;
        _1071 = _1075;
    }
    float _1077 = _1071;
    float _1079 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    if (_1015)
    {
        bool _1081 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _999 = _1081;
    }
    bool _1083 = _999;
    float _1085 = _132 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1089 = _1087 != 0;
    float _1091 = _132 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1093 = fma(_126, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1085);
    float _1095 = 1.0 / _1079;
    float _1097 = fma(_126, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1091);
    bool _1099 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1101 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan(0.5);
    bool _1107 = _1103 || _1105;
    float _1109 = fma(_138, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1093);
    float _1111 = fma(_138, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1097);
    float _1113 = 0.0;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (_1043)
    {
        _1113 = (*spvDescriptorSet0.vp_c12)._m0[0].w;
    }
    float _1117 = _1113;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1121 = _1117;
    if (_1015)
    {
        float _1123 = -_985;
        float _1125 = _1083 ? _1123 : _985;
        _1001 = _1125;
    }
    float _1127 = _1001;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (_1043)
    {
        bool _1131 = _1117 > 0.5;
        _1021 = _1131;
    }
    bool _1133 = _1021;
    float _1135 = fma((*spvDescriptorSet0.vp_c9)._m0[88].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1119);
    float _1137 = float(_91);
    float _1139 = fma((*spvDescriptorSet0.vp_c9)._m0[88].w, (*spvDescriptorSet0.vp_c12)._m0[0].y, _1129);
    float _1141 = _1137;
    if (!_1043)
    {
        float _1143 = -_120;
        float _1145 = (-0.0) + _1143;
        _236 = _1145;
    }
    float _1147 = _236;
    float _1149 = _1147;
    if (!_979)
    {
        float _1151 = -_120;
        float _1153 = (-0.0) + _1151;
        _1115 = _1153;
    }
    float _1155 = _1115;
    float _1157 = _1155;
    if (_979)
    {
        float _1159 = -_120;
        float _1161 = _1067 ? _120 : _1159;
        _1157 = _1161;
    }
    float _1163 = _1157;
    float _1165 = _1137 * _1095;
    if (_1043)
    {
        float _1167 = -_120;
        float _1169 = _1133 ? _120 : _1167;
        _1149 = _1169;
    }
    float _1171 = _1149;
    float _1173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (!_1089)
    {
        _1141 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1175 = _1141;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1179 = _1175;
    if (!_1089)
    {
        _1121 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1181 = _1121;
    float _1183 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1185 = _1181;
    if (_1089)
    {
        _1179 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1187 = _1179;
    float _1189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1089)
    {
        _1185 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1191 = _1185;
    float _1193 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1177);
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_1089)
    {
        _1003 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1197 = _1003;
    float _1199 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1183);
    float _1201 = _1197;
    if (_1089)
    {
        _1201 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1203 = _1201;
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1207 = 0;
    if (_1089)
    {
        _1207 = 0;
    }
    int _1209 = _1207;
    float _1211 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1205);
    int _1213 = _1209;
    if (!_1089)
    {
        _1213 = 2;
    }
    int _1215 = _1213;
    float _1217 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _1219 = (*spvDescriptorSet0.vp_c12)._m0[1].y + _1217;
    bool _1221 = _1215 != 2;
    float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1225 = fma(_1219, _1165, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _1227 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1233 = _1109 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1235 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1237 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1239 = _1233;
    if (!_1089)
    {
        _1195 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1241 = _1195;
    float _1243 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1245 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1193);
    float _1247 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1235);
    float _1249 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1237);
    float _1251 = _981 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1253 = _1245;
    float _1255 = _1241;
    if (!_1089)
    {
        _1239 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1257 = _1239;
    float _1259 = _1245 * (-0.15915493667125701904296875);
    float _1261 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1249);
    float _1263 = _1257;
    if (_1089)
    {
        _1263 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1265 = _1263;
    float _1267 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1247);
    if (_1221)
    {
        _1253 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1269 = _1253;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1273 = _1269;
    float _1275 = _1271;
    if (!_1221)
    {
        _1273 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1277 = _1273;
    float _1279 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1281 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1261);
    if (_1221)
    {
        _1005 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1283 = _1005;
    float _1285 = _1259 * 6.283185482025146484375;
    float _1287 = sin(_1285);
    float _1289 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1229);
    float _1291 = fma(_1279, -2.0, _1271);
    float _1293 = _1283;
    if (_1221)
    {
        _1275 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1295 = _1275;
    float _1297 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1267);
    float _1299 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1289);
    float _1301 = _1295;
    if (!_1221)
    {
        _1301 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1303 = _1301;
    float _1305 = 1.0 / _1281;
    if (!_1221)
    {
        _1293 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1307 = _1293;
    float _1309 = _1299 * (-0.15915493667125701904296875);
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1313 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_1089)
    {
        _1255 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1315 = _1255;
    float _1317 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1319 = _1297 + _1281;
    float _1321 = _1259 * 6.283185482025146484375;
    float _1323 = cos(_1321);
    float _1325 = -_1311;
    float _1327 = fma(_1313, 2.0, _1325);
    float _1329 = _1171 + 0.5;
    float _1331 = _1077 + (-0.5);
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1335 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1337 = _1329 * _1287;
    float _1339 = _1309 * 6.283185482025146484375;
    float _1341 = sin(_1339);
    float _1343 = _1319 * _1305;
    float _1345 = _1343 * 0.5;
    float _1347 = -_1231;
    float _1349 = fma(_1335, 2.0, _1347);
    float _1351 = fma(_1317, -2.0, _1333);
    float _1353 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1135);
    float _1355 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1357 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1355);
    float _1359 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1139);
    float _1361 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1199);
    float _1363 = _1309 * 6.283185482025146484375;
    float _1365 = cos(_1363);
    float _1367 = _1329 * _1323;
    float _1369 = _1127 + (-0.5);
    float _1371 = _1163 + 0.5;
    float _1373 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1349);
    float _1375 = -_1337;
    float _1377 = fma(_1331, _1323, _1375);
    float _1379 = fma(_1331, _1287, _1367);
    float _1381 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1327);
    float _1383 = _1371 * _1341;
    float _1385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1387 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1211);
    float _1389 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1291);
    float _1391 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1351);
    float _1393 = _1379 + (-0.5);
    float _1395 = _1371 * _1365;
    float _1397 = 1.0 / _1357;
    float _1399 = -_1383;
    float _1401 = fma(_1369, _1365, _1399);
    float _1403 = _1173 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1405 = _1377 + 0.5;
    float _1407 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1409 = _1401 + 0.5;
    float _1411 = fma(_1369, _1341, _1395);
    float _1413 = fma(_1243, _1405, _1373);
    float _1415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1417 = -_1403;
    float _1419 = -_1389;
    float _1421 = fma(_1417, _1393, _1419);
    float _1423 = fma(_1407, _1409, _1381);
    float _1425 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1427 = _1389;
    float _1429 = _1393;
    if (_1107)
    {
        _1427 = 1.0;
    }
    float _1431 = _1427;
    float _1433 = _1411 + (-0.5);
    float _1435 = _1431;
    if (_1107)
    {
        _1429 = 1.0;
    }
    float _1437 = _1429;
    float _1439 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1441 = _1397 * _1439;
    float _1443 = _1437;
    if (!_1107)
    {
        float _1445 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1449 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1447;
        float _1451 = _1445 * 0.15915493667125701904296875;
        float _1453 = _1451 * 6.283185482025146484375;
        float _1455 = cos(_1453);
        float _1457 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1459 = _1457 * 0.15915493667125701904296875;
        float _1461 = _1451 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        float _1465 = 1.0 / _1455;
        float _1467 = _1459 * 6.283185482025146484375;
        float _1469 = cos(_1467);
        float _1471 = _1463 * _1465;
        float _1473 = _1459 * 6.283185482025146484375;
        float _1475 = sin(_1473);
        float _1477 = _1469 * _1471;
        float _1479 = 1.0 / _1449;
        float _1481 = 1.0 / _1477;
        float _1483 = _1475 * _1481;
        float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1487 = fma(_1441, _1483, _1485);
        float _1489 = _1487 * _1479;
        float _1491 = precise::clamp(_1489, 0.0, 1.0);
        _1435 = _1491;
    }
    float _1493 = _1435;
    if (!_1107)
    {
        float _1495 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1497 = _1495 * 0.15915493667125701904296875;
        float _1499 = _1497 * 6.283185482025146484375;
        float _1501 = cos(_1499);
        float _1503 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1505 = _1503 * 0.15915493667125701904296875;
        float _1507 = _1497 * 6.283185482025146484375;
        float _1509 = sin(_1507);
        float _1511 = 1.0 / _1501;
        float _1513 = _1505 * 6.283185482025146484375;
        float _1515 = cos(_1513);
        float _1517 = _1509 * _1511;
        float _1519 = _1505 * 6.283185482025146484375;
        float _1521 = sin(_1519);
        float _1523 = _1515 * _1517;
        float _1525 = 1.0 / _1523;
        float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1529 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1527;
        float _1531 = 1.0 / _1529;
        float _1533 = _1521 * _1525;
        float _1535 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1537 = fma(_1441, _1533, _1535);
        float _1539 = _1537 * _1531;
        float _1541 = precise::clamp(_1539, 0.0, 1.0);
        float _1543 = -_1541;
        float _1545 = _1543 + 1.0;
        _1443 = _1545;
    }
    float _1547 = _1443;
    float _1549 = -_1425;
    float _1551 = -_1391;
    float _1553 = fma(_1549, _1433, _1551);
    float _1555 = _822 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1557 = _1493 * _1547;
    float _1559 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1035);
    float _1561 = -_1387;
    float _1563 = _1561 + 1.0;
    float _1565 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1567 = _1557 * _1225;
    float _1569 = exp2(_1555);
    float _1571 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1573 = fma(_1379, _1563, _1421);
    float _1575 = -_1359;
    float _1577 = _1575 + 1.0;
    float _1579 = _1565 * _1025;
    float _1581 = -_1571;
    float _1583 = fma(_1581, _1415, -0.0);
    float _1585 = _874 * 0.5;
    float _1587 = -_1361;
    float _1589 = _1587 + 1.0;
    out.gl_Position.x = _902;
    out.gl_Position.y = _900;
    out.gl_Position.z = _1559;
    out.gl_Position.w = _874;
    float _1591 = _902 + _874;
    float _1593 = fma(_900, -0.5, _1585);
    float _1595 = fma(_1411, _1577, _1553);
    float _1597 = -_1353;
    float _1599 = _1597 + 1.0;
    float _1601 = _1559 + _874;
    float _1603 = _1567 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1605 = -_1589;
    float _1607 = fma(_1377, _1605, _1413);
    float _1609 = -_1569;
    float _1611 = _1609 + 1.0;
    float _1613 = -_1599;
    float _1615 = fma(_1401, _1613, _1423);
    float _1617 = _1601 * 0.5;
    float _1619 = _1611 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1621 = _1591 * 0.5;
    float _1623 = _1603 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1579;
    out.m_60.y = _1583;
    out.m_60.z = _1607;
    out.m_60.w = _1573;
    float _1625 = _1619 * _934;
    float _1627 = -_1619;
    float _1629 = _1627 + 1.0;
    out.m_62.x = _1621;
    out.m_62.y = _1593;
    out.m_62.z = _1617;
    out.m_62.w = _874;
    float _1631 = _945 * _1625;
    float _1633 = _955 * _1625;
    float _1635 = _945 * _1629;
    out.m_64.x = _1615;
    out.m_64.y = _1595;
    float _1637 = fma(_951, _1631, _939);
    float _1639 = fma(_953, _1631, _941);
    float _1641 = fma(_945, _1633, _943);
    out.m_66.x = _1623;
    out.m_68.x = _1637;
    out.m_68.y = _1639;
    out.m_68.z = _1641;
    out.m_68.w = _1635;
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
    bool _566 = false;
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
    int _95 = _93 * 48;
    int _97 = _95 + 16;
    uint _100 = uint(int(uint(_97) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_100)];
    float _102 = as_type<float>(_dmw1.x);
    int _104 = _97 + 4;
    uint _106 = uint(int(uint(_104) >> uint(2)));
    float _108 = as_type<float>(_dmw1.y);
    int _110 = _97 + 8;
    uint _112 = uint(int(uint(_110) >> uint(2)));
    float _114 = as_type<float>(_dmw1.z);
    int _116 = _97 + 12;
    uint _118 = uint(int(uint(_116) >> uint(2)));
    float _120 = as_type<float>(_dmw1.w);
    int _122 = _95 + 32;
    uint _124 = uint(int(uint(_95) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_124)];
    float _126 = as_type<float>(_dmw0.x);
    int _128 = _95 + 4;
    uint _130 = uint(int(uint(_128) >> uint(2)));
    float _132 = as_type<float>(_dmw0.y);
    int _134 = _95 + 8;
    uint _136 = uint(int(uint(_134) >> uint(2)));
    float _138 = as_type<float>(_dmw0.z);
    int _140 = _95 + 12;
    uint _142 = uint(int(uint(_140) >> uint(2)));
    float _144 = as_type<float>(_dmw0.w);
    uint _146 = uint(int(uint(_122) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_146)];
    float _148 = as_type<float>(_dmw2.x);
    int _150 = _122 + 4;
    uint _152 = uint(int(uint(_150) >> uint(2)));
    float _154 = as_type<float>(_dmw2.y);
    int _156 = _122 + 8;
    uint _158 = uint(int(uint(_156) >> uint(2)));
    float _160 = as_type<float>(_dmw2.z);
    int _162 = as_type<int>(_82) & 1;
    bool _166 = _162 != 0;
    int _168 = as_type<int>(_82) & 2;
    bool _170 = _168 != 0;
    bool _172 = !_170;
    float _174 = _172 ? 1.0 : (-1.0);
    float _176 = _108 * _108;
    float _178 = fma(_102, _102, _176);
    float _180 = fma(_114, _114, _178);
    float _182 = rsqrt(_180);
    float _184 = _114 * _182;
    float _186 = _108 * _182;
    float _188 = _102 * _182;
    float _190 = _148 * _184;
    float _192 = _160 * _186;
    float _194 = -_190;
    float _196 = fma(_160, _188, _194);
    float _198 = -_192;
    float _200 = fma(_154, _184, _198);
    float _202 = _154 * _188;
    float _204 = _196 * _196;
    float _206 = -_202;
    float _208 = fma(_148, _186, _206);
    float _210 = fma(_200, _200, _204);
    float _212 = fma(_208, _208, _210);
    float _214 = rsqrt(_212);
    float _216 = abs(_144);
    float _218 = _216 * _174;
    float _220 = _218 * 0.5;
    float _222 = _200 * _214;
    float _224 = _208 * _214;
    float _226 = _196 * _214;
    float _228 = _208;
    float _230 = _144;
    float _232 = _226;
    float _234 = _188;
    float _236 = as_type<float>(_91);
    if (!_166)
    {
        _228 = _222;
    }
    float _238 = _228;
    float _240 = _238;
    if (!_166)
    {
        _230 = _224;
    }
    float _242 = _230;
    bool _244 = !_166;
    float _246 = _242;
    if (!_244)
    {
        float _248 = _184 * _222;
        float _250 = _186 * _224;
        float _252 = -_248;
        float _254 = fma(_188, _224, _252);
        float _256 = _188 * _226;
        float _258 = -_250;
        float _260 = fma(_184, _226, _258);
        float _262 = _254 * _254;
        float _264 = -_256;
        float _266 = fma(_186, _222, _264);
        float _268 = fma(_260, _260, _262);
        float _270 = fma(_266, _266, _268);
        float _272 = rsqrt(_270);
        float _274 = _260 * _272;
        float _276 = _254 * _272;
        float _278 = _266 * _272;
        _240 = _274;
        _246 = _278;
        _232 = _276;
    }
    float _280 = _240;
    float _282 = _246;
    float _284 = _232;
    float _286 = -_220;
    float _288 = fma(_280, _286, _126);
    float _290 = -_220;
    float _292 = fma(_282, _290, _138);
    float _294 = -_220;
    float _296 = fma(_284, _294, _132);
    float _298 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _300 = _288 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _304 = _292 + _302;
    int _306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _308 = _306 != 0;
    float _310 = _300 * _300;
    float _312 = _304 * _304;
    float _314 = _310 + _312;
    float _316 = sqrt(_314);
    bool _318 = _316 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _320 = _284;
    float _322 = _312;
    float _324 = _288;
    float _326 = _292;
    float _328 = _300;
    float _330 = _304;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_318)
    {
        _320 = _310;
    }
    float _334 = _320;
    float _336 = _334;
    if (!_318)
    {
        _234 = _296;
    }
    float _338 = _234;
    bool _340 = !_318;
    float _342 = _338;
    if (!_340)
    {
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _346 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _348 = _316 + _346;
        float _350 = _296 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _352 = rsqrt(_314);
        float _354 = _348 * _344;
        float _356 = _354 * 0.15915493667125701904296875;
        float _358 = _356 * 6.283185482025146484375;
        float _360 = sin(_358);
        float _362 = _356 * 6.283185482025146484375;
        float _364 = cos(_362);
        float _366 = fma(_360, _350, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _368 = _352 * _366;
        float _370 = _364 + (-1.0);
        float _372 = fma(_300, _368, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _374 = fma(_304, _368, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _376 = _370 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _378 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _380 = _372 + _378;
        float _382 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _384 = _374 + _382;
        float _386 = fma(_296, _364, _376);
        float _388 = _380 * _380;
        float _390 = _384 * _384;
        _342 = _386;
        _336 = _388;
        _322 = _390;
        _324 = _372;
        _326 = _374;
    }
    float _392 = _342;
    float _394 = _336;
    float _396 = _322;
    float _398 = _324;
    float _400 = _326;
    float _402 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _404 = _392 + _402;
    float _406 = 0.0;
    float _408 = _396;
    if (_308)
    {
        _406 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    }
    float _410 = _406;
    float _412 = _410;
    if (_308)
    {
        _328 = (*spvDescriptorSet0.vp_c8)._m0[29].x;
    }
    float _414 = _328;
    float _416 = fma(_404, _404, _394);
    float _418 = 0.0;
    float _420 = _414;
    if (_308)
    {
        _418 = (*spvDescriptorSet0.vp_c8)._m0[29].z;
    }
    float _422 = _418;
    float _424 = _422;
    if (_308)
    {
        float _426 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _428 = _410 + _426;
        _412 = _428;
    }
    float _430 = _412;
    float _432 = _416 + _396;
    float _434 = _432;
    if (_308)
    {
        float _436 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _438 = _414 + _436;
        _420 = _438;
    }
    float _440 = _420;
    float _442 = _440;
    if (_308)
    {
        float _444 = _430 * _430;
        _408 = _444;
    }
    float _446 = _408;
    if (_308)
    {
        float _448 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _450 = _422 + _448;
        _424 = _450;
    }
    float _452 = _424;
    float _454 = _452;
    if (_308)
    {
        float _456 = fma(_440, _440, _446);
        _330 = _456;
    }
    float _458 = _330;
    float _460 = sqrt(_432);
    float _462 = (*spvDescriptorSet0.vp_c12)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _464 = (*spvDescriptorSet0.vp_c12)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _466 = 0.0;
    float _468 = (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _470 = (*spvDescriptorSet0.vp_c12)._m0[3].x;
    if (_308)
    {
        float _472 = fma(_452, _452, _458);
        _466 = _472;
    }
    float _474 = _466;
    float _476 = (*spvDescriptorSet0.vp_c12)._m0[2].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _478 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _480 = (*spvDescriptorSet0.vp_c12)._m0[3].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _482 = (*spvDescriptorSet0.vp_c12)._m0[3].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _484 = (*spvDescriptorSet0.vp_c12)._m0[3].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _486 = _474;
    if (_308)
    {
        float _488 = rsqrt(_474);
        _486 = _488;
    }
    float _490 = _486;
    out.m_56.x = _462;
    out.m_56.y = _464;
    out.m_56.z = _476;
    out.m_56.w = _478;
    if (!_308)
    {
        _468 = 0.0;
    }
    float _492 = _468;
    bool _494 = _460 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _496 = isnan(_460);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _502 = _498 || _500;
    out.m_58.x = _480;
    out.m_58.y = _482;
    out.m_58.z = _484;
    float _504 = _492;
    if (!_308)
    {
        _470 = 0.0;
    }
    float _506 = _470;
    float _508 = _506;
    if (!_308)
    {
        _434 = 0.0;
    }
    float _510 = _434;
    float _512 = 0.0;
    float _514 = _510;
    if (_308)
    {
        float _516 = _490 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _512 = _516;
    }
    float _518 = _512;
    if (_308)
    {
        float _520 = _440 * _518;
        _504 = _520;
    }
    float _522 = _504;
    if (_308)
    {
        float _524 = _430 * _518;
        _508 = _524;
    }
    float _526 = _508;
    if (_308)
    {
        float _528 = _452 * _518;
        _514 = _528;
    }
    float _530 = _514;
    if (!_502)
    {
        _442 = 1.0;
    }
    float _532 = _442;
    bool _534 = !_502;
    float _536 = _532;
    if (!_534)
    {
        bool _538 = _460 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _540 = isnan(_460);
        bool _542 = _538 || _540;
        bool _544 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _546 = _542 || _544;
        if (!_546)
        {
            float _548 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _550 = _460 + _548;
            float _552 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _554 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _552;
            float _556 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _558 = _556 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _560 = 1.0 / _554;
            float _562 = _550 * _560;
            float _564 = fma(_562, _558, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _536 = _564;
            _566 = true;
        }
        else
        {
            bool _568 = _460 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _570 = isnan(_460);
            bool _572 = _568 || _570;
            bool _574 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _576 = _572 || _574;
            if (!_576)
            {
                float _578 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _580 = _460 + _578;
                float _582 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _584 = _582 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _586 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _588 = _586 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _590 = 1.0 / _584;
                float _592 = _580 * _590;
                float _594 = fma(_592, _588, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _536 = _594;
                _566 = true;
            }
            else
            {
                _536 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _566 = false;
    float _596 = _536;
    float _598 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _600 = _392 + _598;
    float _602 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _604 = _398 + _602;
    float _606 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _608 = _400 + _606;
    float _610 = fma(_600, _596, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _612 = fma(_604, _596, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _614 = fma(_608, _596, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _616 = _610 + _526;
    float _618 = _612 + _522;
    float _620 = _614 + _530;
    float _622 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _624 = _616 + _622;
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _628 = _618 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _632 = _620 + _630;
    float _634 = _624 * _624;
    float _636 = fma(_628, _628, _634);
    float _638 = fma(_632, _632, _636);
    float _640 = rsqrt(_638);
    float _642 = sqrt(_638);
    float _644 = _640 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _646 = _628 * _644;
    float _648 = _632 * _644;
    float _650 = _646 * _646;
    float _652 = _648 * _648;
    float _654 = _650 + _652;
    float _656 = sqrt(_654);
    bool _658 = _656 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _660 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _662 = _656 + _660;
    float _664 = _482;
    float _666 = _654;
    float _668 = _662;
    float _670 = _624;
    float _672 = _644;
    float _674 = _646;
    if (_658)
    {
        float _676 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _664 = _676;
    }
    float _678 = _664;
    if (_658)
    {
        float _680 = rsqrt(_654);
        _666 = _680;
    }
    float _682 = _666;
    float _684 = _678;
    if (_658)
    {
        float _686 = _662 * _678;
        _668 = _686;
    }
    float _688 = _668;
    if (_658)
    {
        float _690 = _688 * 0.15915493667125701904296875;
        _684 = _690;
    }
    float _692 = _684;
    float _694 = _632;
    float _696 = _692;
    if (_658)
    {
        float _698 = _692 * 6.283185482025146484375;
        float _700 = sin(_698);
        _694 = _700;
    }
    float _702 = _694;
    float _704 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _706 = precise::max(0.0, _704);
    float _708 = _614;
    float _710 = _706;
    if (_658)
    {
        float _712 = _692 * 6.283185482025146484375;
        float _714 = cos(_712);
        _708 = _714;
    }
    float _716 = _708;
    float _718 = -_644;
    float _720 = -_706;
    float _722 = fma(_624, _718, _720);
    if (_658)
    {
        float _724 = _722 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _670 = _724;
    }
    float _726 = _670;
    float _728 = _726;
    if (!_658)
    {
        _696 = _650;
    }
    float _730 = _696;
    float _732 = _702;
    float _734 = _730;
    if (_658)
    {
        float _736 = fma(_702, _726, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _728 = _736;
    }
    float _738 = _728;
    float _740 = _738;
    if (!_658)
    {
        _732 = _722;
    }
    float _742 = _732;
    float _744 = _742;
    if (_658)
    {
        float _746 = _716 + (-1.0);
        _710 = _746;
    }
    float _748 = _710;
    float _750 = _748;
    if (_658)
    {
        float _752 = _682 * _738;
        _454 = _752;
    }
    float _754 = _454;
    if (!_658)
    {
        _740 = _648;
    }
    float _756 = _740;
    float _758 = _756;
    if (_658)
    {
        float _760 = _748 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _672 = _760;
    }
    float _762 = _672;
    if (_658)
    {
        float _764 = _646 * _754;
        _674 = _764;
    }
    float _766 = _674;
    if (_658)
    {
        float _768 = _648 * _754;
        _758 = _768;
    }
    float _770 = _758;
    if (!_658)
    {
        _750 = _652;
    }
    float _772 = _750;
    float _774 = _772;
    if (_658)
    {
        float _776 = fma(_722, _716, _762);
        _744 = _776;
    }
    float _778 = _744;
    if (_658)
    {
        float _780 = _766 * _766;
        _734 = _780;
    }
    float _782 = _734;
    if (_658)
    {
        float _784 = _770 * _770;
        _774 = _784;
    }
    float _786 = _774;
    float _788 = _616 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _790 = fma(_778, _778, _782);
    float _792 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _794 = fma(_642, (*spvDescriptorSet0.vp_c15)._m0[23].w, _792);
    float _796 = precise::clamp(_794, 0.0, 1.0);
    float _798 = _790 + _786;
    float _800 = _616 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _802 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[1].x, _788);
    float _804 = -_796;
    float _806 = _804 + 1.0;
    float _808 = rsqrt(_798);
    float _810 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[2].x, _800);
    float _812 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[1].z, _802);
    float _814 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[2].z, _810);
    float _816 = _616 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _818 = _616 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _820 = abs(_806);
    float _822 = log2(_820);
    float _824 = _812 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _826 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[0].x, _816);
    float _828 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[3].x, _818);
    float _830 = _814 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _832 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _834 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[0].z, _826);
    float _836 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[3].z, _828);
    float _838 = _808 * _766;
    float _840 = _808 * _778;
    float _842 = _834 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _844 = _824 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _846 = _838 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _848 = _836 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _850 = _808 * _770;
    float _852 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[7].x, _844);
    float _854 = -_846;
    float _856 = fma(_840, (*spvDescriptorSet0.vp_c15)._m0[21].y, _854);
    float _858 = _830 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _860 = _824 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _862 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[7].z, _852);
    float _864 = -_850;
    float _866 = fma(_864, (*spvDescriptorSet0.vp_c15)._m0[21].z, _856);
    float _868 = -_858;
    float _870 = fma(_868, _832, 1.0);
    float _872 = _822 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _874 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[7].w, _862);
    float _876 = fma(_866, -0.5, 0.5);
    float _878 = _824 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _880 = fma(_866, 0.5, 0.5);
    float _882 = 1.0 / _874;
    float _884 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[5].x, _860);
    float _886 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[4].x, _878);
    float _888 = fma(_880, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _890 = _840 + 1.0;
    float _892 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[5].z, _884);
    float _894 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[4].z, _886);
    float _896 = fma(_880, _888, -0.212114393711090087890625);
    float _898 = log2(_870);
    float _900 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[5].w, _892);
    float _902 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[4].w, _894);
    float _904 = fma(_880, _896, 1.570728778839111328125);
    float _906 = exp2(_872);
    float _908 = _902 * _882;
    float _910 = _900 * _882;
    float _912 = fma(_908, 0.5, 0.5);
    float _914 = fma(_910, -0.5, 0.5);
    float _916 = sqrt(_876);
    float _918 = _898 * 0.693147182464599609375;
    float _920 = _918 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _922 = -_840;
    float _924 = fma(_906, _890, _922);
    float _926 = fma(_924, 0.5, 0.5);
    float _928 = _916 * 0.636619746685028076171875;
    float _930 = -_904;
    float _932 = fma(_928, _930, 1.0);
    float3 _3044 = float3(_912, _914, _920);
    float _934 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3044, float3(0.0), isnan(_3044)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3044, float3(0.0), isnan(_3044)), level(0.0)).x;
    float3 _3055 = float3(_912, _914, _920);
    float4 _937 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3055, float3(0.0), isnan(_3055)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3055, float3(0.0), isnan(_3055)), level(0.0)).xyzw;
    float _939 = _937.x;
    float _941 = _937.y;
    float _943 = _937.z;
    float _945 = _937.w;
    float2 _3072 = float2(_932, _926);
    float3 _949 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3072, float2(0.0), isnan(_3072)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3072, float2(0.0), isnan(_3072)), level(0.0)).xyz;
    float _951 = _949.x;
    float _953 = _949.y;
    float _955 = _949.z;
    int _957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _959 = _957 != 0;
    float _961 = _132 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _965 = _963 != 0;
    float _967 = _132 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _969 = fma(_126, (*spvDescriptorSet0.vp_c8)._m0[2].x, _961);
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _973 = _971 != 0;
    float _975 = fma(_126, (*spvDescriptorSet0.vp_c8)._m0[3].x, _967);
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _979 = _977 != 0;
    float _981 = fma(_138, (*spvDescriptorSet0.vp_c8)._m0[2].z, _969);
    bool _983 = !_170;
    float _985 = _983 ? 0.0 : 1.0;
    float _987 = fma(_138, (*spvDescriptorSet0.vp_c8)._m0[3].z, _975);
    float _989 = _824 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _991 = false;
    float _993 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _995 = _959;
    float _997 = _914;
    bool _999 = _965;
    float _1001 = _985;
    float _1003 = _975;
    float _1005 = _987;
    if (_959)
    {
        bool _1007 = (*spvDescriptorSet0.vp_c12)._m0[0].x > 0.5;
        _991 = _1007;
    }
    bool _1009 = _991;
    float _1011 = _987 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1015 = _1013 != 0;
    float _1017 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[6].x, _989);
    bool _1019 = _1009;
    bool _1021 = _1015;
    if (!_959)
    {
        _993 = _985;
    }
    float _1023 = _993;
    float _1025 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1027 = _1023;
    if (_959)
    {
        float _1029 = -_985;
        float _1031 = _1009 ? _1029 : _985;
        _1027 = _1031;
    }
    float _1033 = _1027;
    float _1035 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1017);
    if (_965)
    {
        bool _1037 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _1019 = _1037;
    }
    bool _1039 = _1019;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1043 = _1041 != 0;
    bool _1045 = _1039;
    if (!_965)
    {
        float _1047 = -_120;
        float _1049 = (-0.0) + _1047;
        _332 = _1049;
    }
    float _1051 = _332;
    float _1053 = _1051;
    if (_965)
    {
        float _1055 = -_120;
        float _1057 = _1039 ? _120 : _1055;
        _1053 = _1057;
    }
    float _1059 = _1053;
    if (_973)
    {
        bool _1061 = (*spvDescriptorSet0.vp_c12)._m0[0].z > 0.5;
        _995 = _1061;
    }
    bool _1063 = _995;
    if (_979)
    {
        bool _1065 = (*spvDescriptorSet0.vp_c12)._m0[0].z > 0.5;
        _1045 = _1065;
    }
    bool _1067 = _1045;
    if (!_973)
    {
        _997 = _985;
    }
    float _1069 = _997;
    float _1071 = _1069;
    if (_973)
    {
        float _1073 = -_985;
        float _1075 = _1063 ? _1073 : _985;
        _1071 = _1075;
    }
    float _1077 = _1071;
    float _1079 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    if (_1015)
    {
        bool _1081 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _999 = _1081;
    }
    bool _1083 = _999;
    float _1085 = _132 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1089 = _1087 != 0;
    float _1091 = _132 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1093 = fma(_126, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1085);
    float _1095 = 1.0 / _1079;
    float _1097 = fma(_126, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1091);
    bool _1099 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1101 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan(0.5);
    bool _1107 = _1103 || _1105;
    float _1109 = fma(_138, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1093);
    float _1111 = fma(_138, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1097);
    float _1113 = 0.0;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (_1043)
    {
        _1113 = (*spvDescriptorSet0.vp_c12)._m0[0].w;
    }
    float _1117 = _1113;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1121 = _1117;
    if (_1015)
    {
        float _1123 = -_985;
        float _1125 = _1083 ? _1123 : _985;
        _1001 = _1125;
    }
    float _1127 = _1001;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (_1043)
    {
        bool _1131 = _1117 > 0.5;
        _1021 = _1131;
    }
    bool _1133 = _1021;
    float _1135 = fma((*spvDescriptorSet0.vp_c9)._m0[88].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1119);
    float _1137 = float(_91);
    float _1139 = fma((*spvDescriptorSet0.vp_c9)._m0[88].w, (*spvDescriptorSet0.vp_c12)._m0[0].y, _1129);
    float _1141 = _1137;
    if (!_1043)
    {
        float _1143 = -_120;
        float _1145 = (-0.0) + _1143;
        _236 = _1145;
    }
    float _1147 = _236;
    float _1149 = _1147;
    if (!_979)
    {
        float _1151 = -_120;
        float _1153 = (-0.0) + _1151;
        _1115 = _1153;
    }
    float _1155 = _1115;
    float _1157 = _1155;
    if (_979)
    {
        float _1159 = -_120;
        float _1161 = _1067 ? _120 : _1159;
        _1157 = _1161;
    }
    float _1163 = _1157;
    float _1165 = _1137 * _1095;
    if (_1043)
    {
        float _1167 = -_120;
        float _1169 = _1133 ? _120 : _1167;
        _1149 = _1169;
    }
    float _1171 = _1149;
    float _1173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (!_1089)
    {
        _1141 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1175 = _1141;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1179 = _1175;
    if (!_1089)
    {
        _1121 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1181 = _1121;
    float _1183 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1185 = _1181;
    if (_1089)
    {
        _1179 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1187 = _1179;
    float _1189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1089)
    {
        _1185 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1191 = _1185;
    float _1193 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1177);
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_1089)
    {
        _1003 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1197 = _1003;
    float _1199 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1183);
    float _1201 = _1197;
    if (_1089)
    {
        _1201 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1203 = _1201;
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1207 = 0;
    if (_1089)
    {
        _1207 = 0;
    }
    int _1209 = _1207;
    float _1211 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1205);
    int _1213 = _1209;
    if (!_1089)
    {
        _1213 = 2;
    }
    int _1215 = _1213;
    float _1217 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _1219 = (*spvDescriptorSet0.vp_c12)._m0[1].y + _1217;
    bool _1221 = _1215 != 2;
    float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1225 = fma(_1219, _1165, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _1227 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1233 = _1109 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1235 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1237 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1239 = _1233;
    if (!_1089)
    {
        _1195 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1241 = _1195;
    float _1243 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1245 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1193);
    float _1247 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1235);
    float _1249 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1237);
    float _1251 = _981 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1253 = _1245;
    float _1255 = _1241;
    if (!_1089)
    {
        _1239 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1257 = _1239;
    float _1259 = _1245 * (-0.15915493667125701904296875);
    float _1261 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1249);
    float _1263 = _1257;
    if (_1089)
    {
        _1263 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1265 = _1263;
    float _1267 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1247);
    if (_1221)
    {
        _1253 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1269 = _1253;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1273 = _1269;
    float _1275 = _1271;
    if (!_1221)
    {
        _1273 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1277 = _1273;
    float _1279 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1281 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1261);
    if (_1221)
    {
        _1005 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1283 = _1005;
    float _1285 = _1259 * 6.283185482025146484375;
    float _1287 = sin(_1285);
    float _1289 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1229);
    float _1291 = fma(_1279, -2.0, _1271);
    float _1293 = _1283;
    if (_1221)
    {
        _1275 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1295 = _1275;
    float _1297 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1267);
    float _1299 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1289);
    float _1301 = _1295;
    if (!_1221)
    {
        _1301 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1303 = _1301;
    float _1305 = 1.0 / _1281;
    if (!_1221)
    {
        _1293 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1307 = _1293;
    float _1309 = _1299 * (-0.15915493667125701904296875);
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1313 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_1089)
    {
        _1255 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1315 = _1255;
    float _1317 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1319 = _1297 + _1281;
    float _1321 = _1259 * 6.283185482025146484375;
    float _1323 = cos(_1321);
    float _1325 = -_1311;
    float _1327 = fma(_1313, 2.0, _1325);
    float _1329 = _1171 + 0.5;
    float _1331 = _1077 + (-0.5);
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1335 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1337 = _1329 * _1287;
    float _1339 = _1309 * 6.283185482025146484375;
    float _1341 = sin(_1339);
    float _1343 = _1319 * _1305;
    float _1345 = _1343 * 0.5;
    float _1347 = -_1231;
    float _1349 = fma(_1335, 2.0, _1347);
    float _1351 = fma(_1317, -2.0, _1333);
    float _1353 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1135);
    float _1355 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1357 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1355);
    float _1359 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1139);
    float _1361 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1199);
    float _1363 = _1309 * 6.283185482025146484375;
    float _1365 = cos(_1363);
    float _1367 = _1329 * _1323;
    float _1369 = _1127 + (-0.5);
    float _1371 = _1163 + 0.5;
    float _1373 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1349);
    float _1375 = -_1337;
    float _1377 = fma(_1331, _1323, _1375);
    float _1379 = fma(_1331, _1287, _1367);
    float _1381 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1327);
    float _1383 = _1371 * _1341;
    float _1385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1387 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1211);
    float _1389 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1291);
    float _1391 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1351);
    float _1393 = _1379 + (-0.5);
    float _1395 = _1371 * _1365;
    float _1397 = 1.0 / _1357;
    float _1399 = -_1383;
    float _1401 = fma(_1369, _1365, _1399);
    float _1403 = _1173 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1405 = _1377 + 0.5;
    float _1407 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1409 = _1401 + 0.5;
    float _1411 = fma(_1369, _1341, _1395);
    float _1413 = fma(_1243, _1405, _1373);
    float _1415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1417 = -_1403;
    float _1419 = -_1389;
    float _1421 = fma(_1417, _1393, _1419);
    float _1423 = fma(_1407, _1409, _1381);
    float _1425 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1427 = _1389;
    float _1429 = _1393;
    if (_1107)
    {
        _1427 = 1.0;
    }
    float _1431 = _1427;
    float _1433 = _1411 + (-0.5);
    float _1435 = _1431;
    if (_1107)
    {
        _1429 = 1.0;
    }
    float _1437 = _1429;
    float _1439 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1441 = _1397 * _1439;
    float _1443 = _1437;
    if (!_1107)
    {
        float _1445 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1449 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1447;
        float _1451 = _1445 * 0.15915493667125701904296875;
        float _1453 = _1451 * 6.283185482025146484375;
        float _1455 = cos(_1453);
        float _1457 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1459 = _1457 * 0.15915493667125701904296875;
        float _1461 = _1451 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        float _1465 = 1.0 / _1455;
        float _1467 = _1459 * 6.283185482025146484375;
        float _1469 = cos(_1467);
        float _1471 = _1463 * _1465;
        float _1473 = _1459 * 6.283185482025146484375;
        float _1475 = sin(_1473);
        float _1477 = _1469 * _1471;
        float _1479 = 1.0 / _1449;
        float _1481 = 1.0 / _1477;
        float _1483 = _1475 * _1481;
        float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1487 = fma(_1441, _1483, _1485);
        float _1489 = _1487 * _1479;
        float _1491 = precise::clamp(_1489, 0.0, 1.0);
        _1435 = _1491;
    }
    float _1493 = _1435;
    if (!_1107)
    {
        float _1495 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1497 = _1495 * 0.15915493667125701904296875;
        float _1499 = _1497 * 6.283185482025146484375;
        float _1501 = cos(_1499);
        float _1503 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1505 = _1503 * 0.15915493667125701904296875;
        float _1507 = _1497 * 6.283185482025146484375;
        float _1509 = sin(_1507);
        float _1511 = 1.0 / _1501;
        float _1513 = _1505 * 6.283185482025146484375;
        float _1515 = cos(_1513);
        float _1517 = _1509 * _1511;
        float _1519 = _1505 * 6.283185482025146484375;
        float _1521 = sin(_1519);
        float _1523 = _1515 * _1517;
        float _1525 = 1.0 / _1523;
        float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1529 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1527;
        float _1531 = 1.0 / _1529;
        float _1533 = _1521 * _1525;
        float _1535 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1537 = fma(_1441, _1533, _1535);
        float _1539 = _1537 * _1531;
        float _1541 = precise::clamp(_1539, 0.0, 1.0);
        float _1543 = -_1541;
        float _1545 = _1543 + 1.0;
        _1443 = _1545;
    }
    float _1547 = _1443;
    float _1549 = -_1425;
    float _1551 = -_1391;
    float _1553 = fma(_1549, _1433, _1551);
    float _1555 = _822 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1557 = _1493 * _1547;
    float _1559 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1035);
    float _1561 = -_1387;
    float _1563 = _1561 + 1.0;
    float _1565 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1567 = _1557 * _1225;
    float _1569 = exp2(_1555);
    float _1571 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1573 = fma(_1379, _1563, _1421);
    float _1575 = -_1359;
    float _1577 = _1575 + 1.0;
    float _1579 = _1565 * _1025;
    float _1581 = -_1571;
    float _1583 = fma(_1581, _1415, -0.0);
    float _1585 = _874 * 0.5;
    float _1587 = -_1361;
    float _1589 = _1587 + 1.0;
    out.gl_Position.x = _902;
    out.gl_Position.y = _900;
    out.gl_Position.z = _1559;
    out.gl_Position.w = _874;
    float _1591 = _902 + _874;
    float _1593 = fma(_900, -0.5, _1585);
    float _1595 = fma(_1411, _1577, _1553);
    float _1597 = -_1353;
    float _1599 = _1597 + 1.0;
    float _1601 = _1559 + _874;
    float _1603 = _1567 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1605 = -_1589;
    float _1607 = fma(_1377, _1605, _1413);
    float _1609 = -_1569;
    float _1611 = _1609 + 1.0;
    float _1613 = -_1599;
    float _1615 = fma(_1401, _1613, _1423);
    float _1617 = _1601 * 0.5;
    float _1619 = _1611 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1621 = _1591 * 0.5;
    float _1623 = _1603 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1579;
    out.m_60.y = _1583;
    out.m_60.z = _1607;
    out.m_60.w = _1573;
    float _1625 = _1619 * _934;
    float _1627 = -_1619;
    float _1629 = _1627 + 1.0;
    out.m_62.x = _1621;
    out.m_62.y = _1593;
    out.m_62.z = _1617;
    out.m_62.w = _874;
    float _1631 = _945 * _1625;
    float _1633 = _955 * _1625;
    float _1635 = _945 * _1629;
    out.m_64.x = _1615;
    out.m_64.y = _1595;
    float _1637 = fma(_951, _1631, _939);
    float _1639 = fma(_953, _1631, _941);
    float _1641 = fma(_945, _1633, _943);
    out.m_66.x = _1623;
    out.m_68.x = _1637;
    out.m_68.y = _1639;
    out.m_68.z = _1641;
    out.m_68.w = _1635;
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
    bool _566 = false;
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
    int _95 = _93 * 48;
    int _97 = _95 + 16;
    uint _100 = uint(int(uint(_97) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_100)];
    float _102 = as_type<float>(_dmw1.x);
    int _104 = _97 + 4;
    uint _106 = uint(int(uint(_104) >> uint(2)));
    float _108 = as_type<float>(_dmw1.y);
    int _110 = _97 + 8;
    uint _112 = uint(int(uint(_110) >> uint(2)));
    float _114 = as_type<float>(_dmw1.z);
    int _116 = _97 + 12;
    uint _118 = uint(int(uint(_116) >> uint(2)));
    float _120 = as_type<float>(_dmw1.w);
    int _122 = _95 + 32;
    uint _124 = uint(int(uint(_95) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_124)];
    float _126 = as_type<float>(_dmw0.x);
    int _128 = _95 + 4;
    uint _130 = uint(int(uint(_128) >> uint(2)));
    float _132 = as_type<float>(_dmw0.y);
    int _134 = _95 + 8;
    uint _136 = uint(int(uint(_134) >> uint(2)));
    float _138 = as_type<float>(_dmw0.z);
    int _140 = _95 + 12;
    uint _142 = uint(int(uint(_140) >> uint(2)));
    float _144 = as_type<float>(_dmw0.w);
    uint _146 = uint(int(uint(_122) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.vp_s0)._m0[int(_146)];
    float _148 = as_type<float>(_dmw2.x);
    int _150 = _122 + 4;
    uint _152 = uint(int(uint(_150) >> uint(2)));
    float _154 = as_type<float>(_dmw2.y);
    int _156 = _122 + 8;
    uint _158 = uint(int(uint(_156) >> uint(2)));
    float _160 = as_type<float>(_dmw2.z);
    int _162 = as_type<int>(_82) & 1;
    bool _166 = _162 != 0;
    int _168 = as_type<int>(_82) & 2;
    bool _170 = _168 != 0;
    bool _172 = !_170;
    float _174 = _172 ? 1.0 : (-1.0);
    float _176 = _108 * _108;
    float _178 = fma(_102, _102, _176);
    float _180 = fma(_114, _114, _178);
    float _182 = rsqrt(_180);
    float _184 = _114 * _182;
    float _186 = _108 * _182;
    float _188 = _102 * _182;
    float _190 = _148 * _184;
    float _192 = _160 * _186;
    float _194 = -_190;
    float _196 = fma(_160, _188, _194);
    float _198 = -_192;
    float _200 = fma(_154, _184, _198);
    float _202 = _154 * _188;
    float _204 = _196 * _196;
    float _206 = -_202;
    float _208 = fma(_148, _186, _206);
    float _210 = fma(_200, _200, _204);
    float _212 = fma(_208, _208, _210);
    float _214 = rsqrt(_212);
    float _216 = abs(_144);
    float _218 = _216 * _174;
    float _220 = _218 * 0.5;
    float _222 = _200 * _214;
    float _224 = _208 * _214;
    float _226 = _196 * _214;
    float _228 = _208;
    float _230 = _144;
    float _232 = _226;
    float _234 = _188;
    float _236 = as_type<float>(_91);
    if (!_166)
    {
        _228 = _222;
    }
    float _238 = _228;
    float _240 = _238;
    if (!_166)
    {
        _230 = _224;
    }
    float _242 = _230;
    bool _244 = !_166;
    float _246 = _242;
    if (!_244)
    {
        float _248 = _184 * _222;
        float _250 = _186 * _224;
        float _252 = -_248;
        float _254 = fma(_188, _224, _252);
        float _256 = _188 * _226;
        float _258 = -_250;
        float _260 = fma(_184, _226, _258);
        float _262 = _254 * _254;
        float _264 = -_256;
        float _266 = fma(_186, _222, _264);
        float _268 = fma(_260, _260, _262);
        float _270 = fma(_266, _266, _268);
        float _272 = rsqrt(_270);
        float _274 = _260 * _272;
        float _276 = _254 * _272;
        float _278 = _266 * _272;
        _240 = _274;
        _246 = _278;
        _232 = _276;
    }
    float _280 = _240;
    float _282 = _246;
    float _284 = _232;
    float _286 = -_220;
    float _288 = fma(_280, _286, _126);
    float _290 = -_220;
    float _292 = fma(_282, _290, _138);
    float _294 = -_220;
    float _296 = fma(_284, _294, _132);
    float _298 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _300 = _288 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _304 = _292 + _302;
    int _306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _308 = _306 != 0;
    float _310 = _300 * _300;
    float _312 = _304 * _304;
    float _314 = _310 + _312;
    float _316 = sqrt(_314);
    bool _318 = _316 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _320 = _284;
    float _322 = _312;
    float _324 = _288;
    float _326 = _292;
    float _328 = _300;
    float _330 = _304;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_318)
    {
        _320 = _310;
    }
    float _334 = _320;
    float _336 = _334;
    if (!_318)
    {
        _234 = _296;
    }
    float _338 = _234;
    bool _340 = !_318;
    float _342 = _338;
    if (!_340)
    {
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _346 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _348 = _316 + _346;
        float _350 = _296 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _352 = rsqrt(_314);
        float _354 = _348 * _344;
        float _356 = _354 * 0.15915493667125701904296875;
        float _358 = _356 * 6.283185482025146484375;
        float _360 = sin(_358);
        float _362 = _356 * 6.283185482025146484375;
        float _364 = cos(_362);
        float _366 = fma(_360, _350, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _368 = _352 * _366;
        float _370 = _364 + (-1.0);
        float _372 = fma(_300, _368, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _374 = fma(_304, _368, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _376 = _370 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _378 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _380 = _372 + _378;
        float _382 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _384 = _374 + _382;
        float _386 = fma(_296, _364, _376);
        float _388 = _380 * _380;
        float _390 = _384 * _384;
        _342 = _386;
        _336 = _388;
        _322 = _390;
        _324 = _372;
        _326 = _374;
    }
    float _392 = _342;
    float _394 = _336;
    float _396 = _322;
    float _398 = _324;
    float _400 = _326;
    float _402 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _404 = _392 + _402;
    float _406 = 0.0;
    float _408 = _396;
    if (_308)
    {
        _406 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    }
    float _410 = _406;
    float _412 = _410;
    if (_308)
    {
        _328 = (*spvDescriptorSet0.vp_c8)._m0[29].x;
    }
    float _414 = _328;
    float _416 = fma(_404, _404, _394);
    float _418 = 0.0;
    float _420 = _414;
    if (_308)
    {
        _418 = (*spvDescriptorSet0.vp_c8)._m0[29].z;
    }
    float _422 = _418;
    float _424 = _422;
    if (_308)
    {
        float _426 = -(*spvDescriptorSet0.vp_c10)._m0[5].w;
        float _428 = _410 + _426;
        _412 = _428;
    }
    float _430 = _412;
    float _432 = _416 + _396;
    float _434 = _432;
    if (_308)
    {
        float _436 = -(*spvDescriptorSet0.vp_c10)._m0[4].w;
        float _438 = _414 + _436;
        _420 = _438;
    }
    float _440 = _420;
    float _442 = _440;
    if (_308)
    {
        float _444 = _430 * _430;
        _408 = _444;
    }
    float _446 = _408;
    if (_308)
    {
        float _448 = -(*spvDescriptorSet0.vp_c10)._m0[6].w;
        float _450 = _422 + _448;
        _424 = _450;
    }
    float _452 = _424;
    float _454 = _452;
    if (_308)
    {
        float _456 = fma(_440, _440, _446);
        _330 = _456;
    }
    float _458 = _330;
    float _460 = sqrt(_432);
    float _462 = (*spvDescriptorSet0.vp_c12)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _464 = (*spvDescriptorSet0.vp_c12)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _466 = 0.0;
    float _468 = (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _470 = (*spvDescriptorSet0.vp_c12)._m0[3].x;
    if (_308)
    {
        float _472 = fma(_452, _452, _458);
        _466 = _472;
    }
    float _474 = _466;
    float _476 = (*spvDescriptorSet0.vp_c12)._m0[2].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _478 = (*spvDescriptorSet0.vp_c12)._m0[2].w * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _480 = (*spvDescriptorSet0.vp_c12)._m0[3].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _482 = (*spvDescriptorSet0.vp_c12)._m0[3].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _484 = (*spvDescriptorSet0.vp_c12)._m0[3].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _486 = _474;
    if (_308)
    {
        float _488 = rsqrt(_474);
        _486 = _488;
    }
    float _490 = _486;
    out.m_56.x = _462;
    out.m_56.y = _464;
    out.m_56.z = _476;
    out.m_56.w = _478;
    if (!_308)
    {
        _468 = 0.0;
    }
    float _492 = _468;
    bool _494 = _460 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _496 = isnan(_460);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _502 = _498 || _500;
    out.m_58.x = _480;
    out.m_58.y = _482;
    out.m_58.z = _484;
    float _504 = _492;
    if (!_308)
    {
        _470 = 0.0;
    }
    float _506 = _470;
    float _508 = _506;
    if (!_308)
    {
        _434 = 0.0;
    }
    float _510 = _434;
    float _512 = 0.0;
    float _514 = _510;
    if (_308)
    {
        float _516 = _490 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _512 = _516;
    }
    float _518 = _512;
    if (_308)
    {
        float _520 = _440 * _518;
        _504 = _520;
    }
    float _522 = _504;
    if (_308)
    {
        float _524 = _430 * _518;
        _508 = _524;
    }
    float _526 = _508;
    if (_308)
    {
        float _528 = _452 * _518;
        _514 = _528;
    }
    float _530 = _514;
    if (!_502)
    {
        _442 = 1.0;
    }
    float _532 = _442;
    bool _534 = !_502;
    float _536 = _532;
    if (!_534)
    {
        bool _538 = _460 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _540 = isnan(_460);
        bool _542 = _538 || _540;
        bool _544 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _546 = _542 || _544;
        if (!_546)
        {
            float _548 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _550 = _460 + _548;
            float _552 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _554 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _552;
            float _556 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _558 = _556 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _560 = 1.0 / _554;
            float _562 = _550 * _560;
            float _564 = fma(_562, _558, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _536 = _564;
            _566 = true;
        }
        else
        {
            bool _568 = _460 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _570 = isnan(_460);
            bool _572 = _568 || _570;
            bool _574 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _576 = _572 || _574;
            if (!_576)
            {
                float _578 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _580 = _460 + _578;
                float _582 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _584 = _582 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _586 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _588 = _586 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _590 = 1.0 / _584;
                float _592 = _580 * _590;
                float _594 = fma(_592, _588, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _536 = _594;
                _566 = true;
            }
            else
            {
                _536 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _566 = false;
    float _596 = _536;
    float _598 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _600 = _392 + _598;
    float _602 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _604 = _398 + _602;
    float _606 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _608 = _400 + _606;
    float _610 = fma(_600, _596, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _612 = fma(_604, _596, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _614 = fma(_608, _596, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _616 = _610 + _526;
    float _618 = _612 + _522;
    float _620 = _614 + _530;
    float _622 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _624 = _616 + _622;
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _628 = _618 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _632 = _620 + _630;
    float _634 = _624 * _624;
    float _636 = fma(_628, _628, _634);
    float _638 = fma(_632, _632, _636);
    float _640 = rsqrt(_638);
    float _642 = sqrt(_638);
    float _644 = _640 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _646 = _628 * _644;
    float _648 = _632 * _644;
    float _650 = _646 * _646;
    float _652 = _648 * _648;
    float _654 = _650 + _652;
    float _656 = sqrt(_654);
    bool _658 = _656 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _660 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _662 = _656 + _660;
    float _664 = _482;
    float _666 = _654;
    float _668 = _662;
    float _670 = _624;
    float _672 = _644;
    float _674 = _646;
    if (_658)
    {
        float _676 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _664 = _676;
    }
    float _678 = _664;
    if (_658)
    {
        float _680 = rsqrt(_654);
        _666 = _680;
    }
    float _682 = _666;
    float _684 = _678;
    if (_658)
    {
        float _686 = _662 * _678;
        _668 = _686;
    }
    float _688 = _668;
    if (_658)
    {
        float _690 = _688 * 0.15915493667125701904296875;
        _684 = _690;
    }
    float _692 = _684;
    float _694 = _632;
    float _696 = _692;
    if (_658)
    {
        float _698 = _692 * 6.283185482025146484375;
        float _700 = sin(_698);
        _694 = _700;
    }
    float _702 = _694;
    float _704 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _706 = precise::max(0.0, _704);
    float _708 = _614;
    float _710 = _706;
    if (_658)
    {
        float _712 = _692 * 6.283185482025146484375;
        float _714 = cos(_712);
        _708 = _714;
    }
    float _716 = _708;
    float _718 = -_644;
    float _720 = -_706;
    float _722 = fma(_624, _718, _720);
    if (_658)
    {
        float _724 = _722 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _670 = _724;
    }
    float _726 = _670;
    float _728 = _726;
    if (!_658)
    {
        _696 = _650;
    }
    float _730 = _696;
    float _732 = _702;
    float _734 = _730;
    if (_658)
    {
        float _736 = fma(_702, _726, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _728 = _736;
    }
    float _738 = _728;
    float _740 = _738;
    if (!_658)
    {
        _732 = _722;
    }
    float _742 = _732;
    float _744 = _742;
    if (_658)
    {
        float _746 = _716 + (-1.0);
        _710 = _746;
    }
    float _748 = _710;
    float _750 = _748;
    if (_658)
    {
        float _752 = _682 * _738;
        _454 = _752;
    }
    float _754 = _454;
    if (!_658)
    {
        _740 = _648;
    }
    float _756 = _740;
    float _758 = _756;
    if (_658)
    {
        float _760 = _748 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _672 = _760;
    }
    float _762 = _672;
    if (_658)
    {
        float _764 = _646 * _754;
        _674 = _764;
    }
    float _766 = _674;
    if (_658)
    {
        float _768 = _648 * _754;
        _758 = _768;
    }
    float _770 = _758;
    if (!_658)
    {
        _750 = _652;
    }
    float _772 = _750;
    float _774 = _772;
    if (_658)
    {
        float _776 = fma(_722, _716, _762);
        _744 = _776;
    }
    float _778 = _744;
    if (_658)
    {
        float _780 = _766 * _766;
        _734 = _780;
    }
    float _782 = _734;
    if (_658)
    {
        float _784 = _770 * _770;
        _774 = _784;
    }
    float _786 = _774;
    float _788 = _616 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _790 = fma(_778, _778, _782);
    float _792 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _794 = fma(_642, (*spvDescriptorSet0.vp_c15)._m0[23].w, _792);
    float _796 = precise::clamp(_794, 0.0, 1.0);
    float _798 = _790 + _786;
    float _800 = _616 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _802 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[1].x, _788);
    float _804 = -_796;
    float _806 = _804 + 1.0;
    float _808 = rsqrt(_798);
    float _810 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[2].x, _800);
    float _812 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[1].z, _802);
    float _814 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[2].z, _810);
    float _816 = _616 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _818 = _616 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _820 = abs(_806);
    float _822 = log2(_820);
    float _824 = _812 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _826 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[0].x, _816);
    float _828 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[3].x, _818);
    float _830 = _814 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _832 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _834 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[0].z, _826);
    float _836 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[3].z, _828);
    float _838 = _808 * _766;
    float _840 = _808 * _778;
    float _842 = _834 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _844 = _824 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _846 = _838 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _848 = _836 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _850 = _808 * _770;
    float _852 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[7].x, _844);
    float _854 = -_846;
    float _856 = fma(_840, (*spvDescriptorSet0.vp_c15)._m0[21].y, _854);
    float _858 = _830 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _860 = _824 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _862 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[7].z, _852);
    float _864 = -_850;
    float _866 = fma(_864, (*spvDescriptorSet0.vp_c15)._m0[21].z, _856);
    float _868 = -_858;
    float _870 = fma(_868, _832, 1.0);
    float _872 = _822 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _874 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[7].w, _862);
    float _876 = fma(_866, -0.5, 0.5);
    float _878 = _824 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _880 = fma(_866, 0.5, 0.5);
    float _882 = 1.0 / _874;
    float _884 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[5].x, _860);
    float _886 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[4].x, _878);
    float _888 = fma(_880, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _890 = _840 + 1.0;
    float _892 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[5].z, _884);
    float _894 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[4].z, _886);
    float _896 = fma(_880, _888, -0.212114393711090087890625);
    float _898 = log2(_870);
    float _900 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[5].w, _892);
    float _902 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[4].w, _894);
    float _904 = fma(_880, _896, 1.570728778839111328125);
    float _906 = exp2(_872);
    float _908 = _902 * _882;
    float _910 = _900 * _882;
    float _912 = fma(_908, 0.5, 0.5);
    float _914 = fma(_910, -0.5, 0.5);
    float _916 = sqrt(_876);
    float _918 = _898 * 0.693147182464599609375;
    float _920 = _918 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _922 = -_840;
    float _924 = fma(_906, _890, _922);
    float _926 = fma(_924, 0.5, 0.5);
    float _928 = _916 * 0.636619746685028076171875;
    float _930 = -_904;
    float _932 = fma(_928, _930, 1.0);
    float3 _3044 = float3(_912, _914, _920);
    float _934 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3044, float3(0.0), isnan(_3044)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3044, float3(0.0), isnan(_3044)), level(0.0)).x;
    float3 _3055 = float3(_912, _914, _920);
    float4 _937 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3055, float3(0.0), isnan(_3055)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3055, float3(0.0), isnan(_3055)), level(0.0)).xyzw;
    float _939 = _937.x;
    float _941 = _937.y;
    float _943 = _937.z;
    float _945 = _937.w;
    float2 _3072 = float2(_932, _926);
    float3 _949 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3072, float2(0.0), isnan(_3072)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3072, float2(0.0), isnan(_3072)), level(0.0)).xyz;
    float _951 = _949.x;
    float _953 = _949.y;
    float _955 = _949.z;
    int _957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _959 = _957 != 0;
    float _961 = _132 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _965 = _963 != 0;
    float _967 = _132 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _969 = fma(_126, (*spvDescriptorSet0.vp_c8)._m0[2].x, _961);
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _973 = _971 != 0;
    float _975 = fma(_126, (*spvDescriptorSet0.vp_c8)._m0[3].x, _967);
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _979 = _977 != 0;
    float _981 = fma(_138, (*spvDescriptorSet0.vp_c8)._m0[2].z, _969);
    bool _983 = !_170;
    float _985 = _983 ? 0.0 : 1.0;
    float _987 = fma(_138, (*spvDescriptorSet0.vp_c8)._m0[3].z, _975);
    float _989 = _824 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _991 = false;
    float _993 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _995 = _959;
    float _997 = _914;
    bool _999 = _965;
    float _1001 = _985;
    float _1003 = _975;
    float _1005 = _987;
    if (_959)
    {
        bool _1007 = (*spvDescriptorSet0.vp_c12)._m0[0].x > 0.5;
        _991 = _1007;
    }
    bool _1009 = _991;
    float _1011 = _987 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1015 = _1013 != 0;
    float _1017 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[6].x, _989);
    bool _1019 = _1009;
    bool _1021 = _1015;
    if (!_959)
    {
        _993 = _985;
    }
    float _1023 = _993;
    float _1025 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1027 = _1023;
    if (_959)
    {
        float _1029 = -_985;
        float _1031 = _1009 ? _1029 : _985;
        _1027 = _1031;
    }
    float _1033 = _1027;
    float _1035 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1017);
    if (_965)
    {
        bool _1037 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _1019 = _1037;
    }
    bool _1039 = _1019;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1043 = _1041 != 0;
    bool _1045 = _1039;
    if (!_965)
    {
        float _1047 = -_120;
        float _1049 = (-0.0) + _1047;
        _332 = _1049;
    }
    float _1051 = _332;
    float _1053 = _1051;
    if (_965)
    {
        float _1055 = -_120;
        float _1057 = _1039 ? _120 : _1055;
        _1053 = _1057;
    }
    float _1059 = _1053;
    if (_973)
    {
        bool _1061 = (*spvDescriptorSet0.vp_c12)._m0[0].z > 0.5;
        _995 = _1061;
    }
    bool _1063 = _995;
    if (_979)
    {
        bool _1065 = (*spvDescriptorSet0.vp_c12)._m0[0].z > 0.5;
        _1045 = _1065;
    }
    bool _1067 = _1045;
    if (!_973)
    {
        _997 = _985;
    }
    float _1069 = _997;
    float _1071 = _1069;
    if (_973)
    {
        float _1073 = -_985;
        float _1075 = _1063 ? _1073 : _985;
        _1071 = _1075;
    }
    float _1077 = _1071;
    float _1079 = (*spvDescriptorSet0.vp_c12)._m0[4].y + (-1.0);
    if (_1015)
    {
        bool _1081 = (*spvDescriptorSet0.vp_c12)._m0[0].y > 0.5;
        _999 = _1081;
    }
    bool _1083 = _999;
    float _1085 = _132 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1089 = _1087 != 0;
    float _1091 = _132 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1093 = fma(_126, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1085);
    float _1095 = 1.0 / _1079;
    float _1097 = fma(_126, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1091);
    bool _1099 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1101 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan(0.5);
    bool _1107 = _1103 || _1105;
    float _1109 = fma(_138, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1093);
    float _1111 = fma(_138, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1097);
    float _1113 = 0.0;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (_1043)
    {
        _1113 = (*spvDescriptorSet0.vp_c12)._m0[0].w;
    }
    float _1117 = _1113;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1121 = _1117;
    if (_1015)
    {
        float _1123 = -_985;
        float _1125 = _1083 ? _1123 : _985;
        _1001 = _1125;
    }
    float _1127 = _1001;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (_1043)
    {
        bool _1131 = _1117 > 0.5;
        _1021 = _1131;
    }
    bool _1133 = _1021;
    float _1135 = fma((*spvDescriptorSet0.vp_c9)._m0[88].z, (*spvDescriptorSet0.vp_c12)._m0[0].x, _1119);
    float _1137 = float(_91);
    float _1139 = fma((*spvDescriptorSet0.vp_c9)._m0[88].w, (*spvDescriptorSet0.vp_c12)._m0[0].y, _1129);
    float _1141 = _1137;
    if (!_1043)
    {
        float _1143 = -_120;
        float _1145 = (-0.0) + _1143;
        _236 = _1145;
    }
    float _1147 = _236;
    float _1149 = _1147;
    if (!_979)
    {
        float _1151 = -_120;
        float _1153 = (-0.0) + _1151;
        _1115 = _1153;
    }
    float _1155 = _1115;
    float _1157 = _1155;
    if (_979)
    {
        float _1159 = -_120;
        float _1161 = _1067 ? _120 : _1159;
        _1157 = _1161;
    }
    float _1163 = _1157;
    float _1165 = _1137 * _1095;
    if (_1043)
    {
        float _1167 = -_120;
        float _1169 = _1133 ? _120 : _1167;
        _1149 = _1169;
    }
    float _1171 = _1149;
    float _1173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (!_1089)
    {
        _1141 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1175 = _1141;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1179 = _1175;
    if (!_1089)
    {
        _1121 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1181 = _1121;
    float _1183 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1185 = _1181;
    if (_1089)
    {
        _1179 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1187 = _1179;
    float _1189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1089)
    {
        _1185 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1191 = _1185;
    float _1193 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1177);
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_1089)
    {
        _1003 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1197 = _1003;
    float _1199 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1183);
    float _1201 = _1197;
    if (_1089)
    {
        _1201 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1203 = _1201;
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1207 = 0;
    if (_1089)
    {
        _1207 = 0;
    }
    int _1209 = _1207;
    float _1211 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1205);
    int _1213 = _1209;
    if (!_1089)
    {
        _1213 = 2;
    }
    int _1215 = _1213;
    float _1217 = -(*spvDescriptorSet0.vp_c12)._m0[1].x;
    float _1219 = (*spvDescriptorSet0.vp_c12)._m0[1].y + _1217;
    bool _1221 = _1215 != 2;
    float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1225 = fma(_1219, _1165, (*spvDescriptorSet0.vp_c12)._m0[1].x);
    float _1227 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1233 = _1109 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1235 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1237 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1239 = _1233;
    if (!_1089)
    {
        _1195 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1241 = _1195;
    float _1243 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1245 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1193);
    float _1247 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1235);
    float _1249 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1237);
    float _1251 = _981 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1253 = _1245;
    float _1255 = _1241;
    if (!_1089)
    {
        _1239 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1257 = _1239;
    float _1259 = _1245 * (-0.15915493667125701904296875);
    float _1261 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1249);
    float _1263 = _1257;
    if (_1089)
    {
        _1263 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1265 = _1263;
    float _1267 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1247);
    if (_1221)
    {
        _1253 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1269 = _1253;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1273 = _1269;
    float _1275 = _1271;
    if (!_1221)
    {
        _1273 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1277 = _1273;
    float _1279 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1281 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1261);
    if (_1221)
    {
        _1005 = (*spvDescriptorSet0.vp_c12)._m0[0].y;
    }
    float _1283 = _1005;
    float _1285 = _1259 * 6.283185482025146484375;
    float _1287 = sin(_1285);
    float _1289 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1229);
    float _1291 = fma(_1279, -2.0, _1271);
    float _1293 = _1283;
    if (_1221)
    {
        _1275 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1295 = _1275;
    float _1297 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1267);
    float _1299 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1289);
    float _1301 = _1295;
    if (!_1221)
    {
        _1301 = (*spvDescriptorSet0.vp_c12)._m0[0].z;
    }
    float _1303 = _1301;
    float _1305 = 1.0 / _1281;
    if (!_1221)
    {
        _1293 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1307 = _1293;
    float _1309 = _1299 * (-0.15915493667125701904296875);
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1313 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_1089)
    {
        _1255 = (*spvDescriptorSet0.vp_c12)._m0[0].x;
    }
    float _1315 = _1255;
    float _1317 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1319 = _1297 + _1281;
    float _1321 = _1259 * 6.283185482025146484375;
    float _1323 = cos(_1321);
    float _1325 = -_1311;
    float _1327 = fma(_1313, 2.0, _1325);
    float _1329 = _1171 + 0.5;
    float _1331 = _1077 + (-0.5);
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1335 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1337 = _1329 * _1287;
    float _1339 = _1309 * 6.283185482025146484375;
    float _1341 = sin(_1339);
    float _1343 = _1319 * _1305;
    float _1345 = _1343 * 0.5;
    float _1347 = -_1231;
    float _1349 = fma(_1335, 2.0, _1347);
    float _1351 = fma(_1317, -2.0, _1333);
    float _1353 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1135);
    float _1355 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1357 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1355);
    float _1359 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1139);
    float _1361 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1199);
    float _1363 = _1309 * 6.283185482025146484375;
    float _1365 = cos(_1363);
    float _1367 = _1329 * _1323;
    float _1369 = _1127 + (-0.5);
    float _1371 = _1163 + 0.5;
    float _1373 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1349);
    float _1375 = -_1337;
    float _1377 = fma(_1331, _1323, _1375);
    float _1379 = fma(_1331, _1287, _1367);
    float _1381 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1327);
    float _1383 = _1371 * _1341;
    float _1385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1387 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1211);
    float _1389 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1291);
    float _1391 = fma((*spvDescriptorSet0.vp_c12)._m0[4].x, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1351);
    float _1393 = _1379 + (-0.5);
    float _1395 = _1371 * _1365;
    float _1397 = 1.0 / _1357;
    float _1399 = -_1383;
    float _1401 = fma(_1369, _1365, _1399);
    float _1403 = _1173 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1405 = _1377 + 0.5;
    float _1407 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1409 = _1401 + 0.5;
    float _1411 = fma(_1369, _1341, _1395);
    float _1413 = fma(_1243, _1405, _1373);
    float _1415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1417 = -_1403;
    float _1419 = -_1389;
    float _1421 = fma(_1417, _1393, _1419);
    float _1423 = fma(_1407, _1409, _1381);
    float _1425 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1427 = _1389;
    float _1429 = _1393;
    if (_1107)
    {
        _1427 = 1.0;
    }
    float _1431 = _1427;
    float _1433 = _1411 + (-0.5);
    float _1435 = _1431;
    if (_1107)
    {
        _1429 = 1.0;
    }
    float _1437 = _1429;
    float _1439 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1441 = _1397 * _1439;
    float _1443 = _1437;
    if (!_1107)
    {
        float _1445 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1449 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1447;
        float _1451 = _1445 * 0.15915493667125701904296875;
        float _1453 = _1451 * 6.283185482025146484375;
        float _1455 = cos(_1453);
        float _1457 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1459 = _1457 * 0.15915493667125701904296875;
        float _1461 = _1451 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        float _1465 = 1.0 / _1455;
        float _1467 = _1459 * 6.283185482025146484375;
        float _1469 = cos(_1467);
        float _1471 = _1463 * _1465;
        float _1473 = _1459 * 6.283185482025146484375;
        float _1475 = sin(_1473);
        float _1477 = _1469 * _1471;
        float _1479 = 1.0 / _1449;
        float _1481 = 1.0 / _1477;
        float _1483 = _1475 * _1481;
        float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1487 = fma(_1441, _1483, _1485);
        float _1489 = _1487 * _1479;
        float _1491 = precise::clamp(_1489, 0.0, 1.0);
        _1435 = _1491;
    }
    float _1493 = _1435;
    if (!_1107)
    {
        float _1495 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1497 = _1495 * 0.15915493667125701904296875;
        float _1499 = _1497 * 6.283185482025146484375;
        float _1501 = cos(_1499);
        float _1503 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1505 = _1503 * 0.15915493667125701904296875;
        float _1507 = _1497 * 6.283185482025146484375;
        float _1509 = sin(_1507);
        float _1511 = 1.0 / _1501;
        float _1513 = _1505 * 6.283185482025146484375;
        float _1515 = cos(_1513);
        float _1517 = _1509 * _1511;
        float _1519 = _1505 * 6.283185482025146484375;
        float _1521 = sin(_1519);
        float _1523 = _1515 * _1517;
        float _1525 = 1.0 / _1523;
        float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1529 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1527;
        float _1531 = 1.0 / _1529;
        float _1533 = _1521 * _1525;
        float _1535 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1537 = fma(_1441, _1533, _1535);
        float _1539 = _1537 * _1531;
        float _1541 = precise::clamp(_1539, 0.0, 1.0);
        float _1543 = -_1541;
        float _1545 = _1543 + 1.0;
        _1443 = _1545;
    }
    float _1547 = _1443;
    float _1549 = -_1425;
    float _1551 = -_1391;
    float _1553 = fma(_1549, _1433, _1551);
    float _1555 = _822 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1557 = _1493 * _1547;
    float _1559 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1035);
    float _1561 = -_1387;
    float _1563 = _1561 + 1.0;
    float _1565 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1567 = _1557 * _1225;
    float _1569 = exp2(_1555);
    float _1571 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1573 = fma(_1379, _1563, _1421);
    float _1575 = -_1359;
    float _1577 = _1575 + 1.0;
    float _1579 = _1565 * _1025;
    float _1581 = -_1571;
    float _1583 = fma(_1581, _1415, -0.0);
    float _1585 = _874 * 0.5;
    float _1587 = -_1361;
    float _1589 = _1587 + 1.0;
    out.gl_Position.x = _902;
    out.gl_Position.y = _900;
    out.gl_Position.z = _1559;
    out.gl_Position.w = _874;
    float _1591 = _902 + _874;
    float _1593 = fma(_900, -0.5, _1585);
    float _1595 = fma(_1411, _1577, _1553);
    float _1597 = -_1353;
    float _1599 = _1597 + 1.0;
    float _1601 = _1559 + _874;
    float _1603 = _1567 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1605 = -_1589;
    float _1607 = fma(_1377, _1605, _1413);
    float _1609 = -_1569;
    float _1611 = _1609 + 1.0;
    float _1613 = -_1599;
    float _1615 = fma(_1401, _1613, _1423);
    float _1617 = _1601 * 0.5;
    float _1619 = _1611 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1621 = _1591 * 0.5;
    float _1623 = _1603 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1579;
    out.m_60.y = _1583;
    out.m_60.z = _1607;
    out.m_60.w = _1573;
    float _1625 = _1619 * _934;
    float _1627 = -_1619;
    float _1629 = _1627 + 1.0;
    out.m_62.x = _1621;
    out.m_62.y = _1593;
    out.m_62.z = _1617;
    out.m_62.w = _874;
    float _1631 = _945 * _1625;
    float _1633 = _955 * _1625;
    float _1635 = _945 * _1629;
    out.m_64.x = _1615;
    out.m_64.y = _1595;
    float _1637 = fma(_951, _1631, _939);
    float _1639 = fma(_953, _1631, _941);
    float _1641 = fma(_945, _1633, _943);
    out.m_66.x = _1623;
    out.m_68.x = _1637;
    out.m_68.y = _1639;
    out.m_68.z = _1641;
    out.m_68.w = _1635;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

