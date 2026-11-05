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

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct _31
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* vp_c0 [[id(1)]];
    constant _16* vp_c14 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c12 [[id(4)]];
    constant _16* vp_c4 [[id(5)]];
    constant _16* vp_c9 [[id(6)]];
    const device _31* vp_s0 [[id(7)]];
    texture2d<float> vp_t_tcb_C [[id(8)]];
    sampler vp_t_tcb_CSmplr [[id(9)]];
    texture2d<float> vp_t_tcb_8 [[id(10)]];
    sampler vp_t_tcb_8Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_A [[id(12)]];
    sampler vp_t_tcb_ASmplr [[id(13)]];
    sampler vp_t_tcb_8Smplr_w [[id(14)]];
    sampler vp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    uint4 m_52 [[attribute(0)]];
};

static inline __attribute__((always_inline))
int _65(thread const int& _1880, thread const int& _1881, constant _10& support_buffer)
{
    float _1884 = as_type<float>(support_buffer._m4);
    int _1886 = _1881 + as_type<int>(_1884);
    int _1888 = 1 + _1886;
    float _1890 = support_buffer._m5[_1888].x;
    bool _1892 = _1890 == 1.0;
    if (_1892)
    {
        return _1880;
    }
    float _1894 = float(_1880);
    float _1896 = _1894 * _1890;
    int _1898 = int(_1896);
    return _1898;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    bool _690 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = as_type<float>(int(gl_InstanceIndex));
    float _71 = as_type<float>(int(gl_BaseInstance));
    int _73 = as_type<int>(_69) - as_type<int>(_71);
    float _75 = as_type<float>(in.m_52.x);
    int _77 = _73 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _79 = _77 << 6;
    int _81 = _79 + 16;
    uint _84 = uint(int(uint(_79) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_84)];
    float _86 = as_type<float>(_dmw0.x);
    int _88 = _79 + 4;
    uint _90 = uint(int(uint(_88) >> uint(2)));
    float _92 = as_type<float>(_dmw0.y);
    int _94 = _79 + 8;
    uint _96 = uint(int(uint(_94) >> uint(2)));
    float _98 = as_type<float>(_dmw0.z);
    int _100 = _79 + 12;
    uint _102 = uint(int(uint(_100) >> uint(2)));
    float _104 = as_type<float>(_dmw0.w);
    uint _106 = uint(int(uint(_81) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_106)];
    float _108 = as_type<float>(_dmw1.x);
    int _110 = _81 + 4;
    uint _112 = uint(int(uint(_110) >> uint(2)));
    float _114 = as_type<float>(_dmw1.y);
    int _116 = _81 + 8;
    uint _118 = uint(int(uint(_116) >> uint(2)));
    float _120 = as_type<float>(_dmw1.z);
    int _122 = _81 + 12;
    uint _124 = uint(int(uint(_122) >> uint(2)));
    float _126 = as_type<float>(_dmw1.w);
    int _128 = _79 + 52;
    int _130 = _79 + 40;
    uint _132 = uint(int(uint(_128) >> uint(2)));
    float _134 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_132)]);
    int _136 = _130 + 4;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    float _140 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_138)]);
    float _142 = fma(_126, -3.0, 3.0);
    float _144 = floor(_142);
    int _146 = int(_144);
    float _148 = -(*spvDescriptorSet0.vp_c14)._m0[4].x;
    float _150 = _86 + _148;
    float _152 = -(*spvDescriptorSet0.vp_c14)._m0[4].y;
    float _154 = _98 + _152;
    float _156 = _150 * 0.015625;
    float _158 = _154 * 0.015625;
    int _160 = _146 + 1;
    int _162 = as_type<int>(_75);
    int _164 = 0;
    int _166 = _65(_162, _164, (*spvDescriptorSet0.support_buffer));
    int _168 = _146;
    int _170 = 0;
    int _172 = _65(_168, _170, (*spvDescriptorSet0.support_buffer));
    float2 _176 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_166, _172)), 0).xy;
    float _178 = _176.x;
    float _180 = _176.y;
    int _182 = as_type<int>(_75);
    int _184 = 0;
    int _186 = _65(_182, _184, (*spvDescriptorSet0.support_buffer));
    int _188 = _160;
    int _190 = 0;
    int _192 = _65(_188, _190, (*spvDescriptorSet0.support_buffer));
    float2 _194 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_186, _192)), 0).xy;
    float _196 = _194.x;
    float _198 = _194.y;
    float _200 = fma(_104, 6.283185482025146484375, (*spvDescriptorSet0.vp_c14)._m0[3].x);
    float2 _944 = float2(_200, (*spvDescriptorSet0.vp_c14)._m0[3].y);
    float _202 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_944, float2(0.0), isnan(_944)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_944, float2(0.0), isnan(_944)), level(0.0)).x;
    float2 _954 = float2(_156, _158);
    float _204 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_954, float2(0.0), isnan(_954)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_954, float2(0.0), isnan(_954)), level(0.0)).x;
    float _206 = (*spvDescriptorSet0.vp_c14)._m0[2].z * (*spvDescriptorSet0.vp_c14)._m0[1].x;
    float _208 = (*spvDescriptorSet0.vp_c14)._m0[1].z * (*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _210 = -_206;
    float _212 = fma((*spvDescriptorSet0.vp_c14)._m0[1].z, (*spvDescriptorSet0.vp_c14)._m0[2].x, _210);
    float _214 = -_208;
    float _216 = fma((*spvDescriptorSet0.vp_c14)._m0[1].y, (*spvDescriptorSet0.vp_c14)._m0[2].z, _214);
    float _218 = floor(_142);
    float _220 = (*spvDescriptorSet0.vp_c14)._m0[1].y * (*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _222 = _212 * _212;
    float _224 = -_220;
    float _226 = fma((*spvDescriptorSet0.vp_c14)._m0[1].x, (*spvDescriptorSet0.vp_c14)._m0[2].y, _224);
    float _228 = _104 + (-0.5);
    float _230 = fma(_216, _216, _222);
    float _232 = _228 * (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _234 = fma(_226, _226, _230);
    float _236 = -_232;
    float _238 = fma(_236, _232, 1.0);
    float _240 = -_218;
    float _242 = _142 + _240;
    float _244 = sqrt(_238);
    float _246 = _104 * 5.0;
    float _248 = rsqrt(_234);
    float _250 = floor(_246);
    float _252 = -_114;
    float _254 = fma(_212, _248, _252);
    float _256 = -_108;
    float _258 = fma(_216, _248, _256);
    float _260 = -_120;
    float _262 = fma(_226, _248, _260);
    float _264 = -(*spvDescriptorSet0.vp_c14)._m0[6].x;
    float _266 = _86 + _264;
    float _268 = _250 + 10.0;
    float _270 = -(*spvDescriptorSet0.vp_c14)._m0[6].z;
    float _272 = _98 + _270;
    float _274 = fma(_268, (*spvDescriptorSet0.vp_c14)._m0[3].x, _104);
    float _276 = -(*spvDescriptorSet0.vp_c14)._m0[6].y;
    float _278 = _92 + _276;
    float _280 = _274 * 6.283185482025146484375;
    float _282 = (*spvDescriptorSet0.vp_c14)._m0[3].y * 0.00200000009499490261077880859375;
    float _284 = -_178;
    float _286 = _284 + _196;
    float _288 = fma(_242, _286, _178);
    float _290 = -_180;
    float _292 = _290 + _198;
    float _294 = 1.0 / _140;
    float _296 = _134 * _288;
    float _298 = fma(_242, _292, _180);
    float _300 = _134 * _298;
    float _302 = _296 * _232;
    float _304 = -_302;
    float _306 = fma(_300, _244, _304);
    float _308 = _306 * _294;
    float _310 = precise::clamp(_308, 0.0, 1.0);
    float _312 = fma(_310, _254, _114);
    float _314 = fma(_310, _258, _108);
    float _316 = _312 * _312;
    float _318 = fma(_310, _262, _120);
    float _320 = fma(_314, _314, _316);
    float _322 = _266 * _266;
    float _324 = fma(_318, _318, _320);
    float _326 = _272 * _272;
    float _328 = fma(_278, _278, _322);
    float _330 = rsqrt(_324);
    float _332 = _326 + _328;
    bool _336 = _332 >= 9.9999997473787516355514526367188e-05;
    bool _338 = isnan(_332);
    bool _340 = _336 || _338;
    bool _342 = isnan(9.9999997473787516355514526367188e-05);
    bool _344 = _340 || _342;
    float _346 = _318 * _330;
    float _348 = _314 * _330;
    float _350 = _312 * _330;
    float _352 = 0.0;
    float _354 = _98;
    if (_344)
    {
        float _356 = _322 + _326;
        _352 = _356;
    }
    float _358 = _352;
    float _360 = _346 * (*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _362 = _350 * (*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _364 = -_360;
    float _366 = fma(_348, (*spvDescriptorSet0.vp_c14)._m0[2].z, _364);
    float _368 = _348 * (*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _370 = (*spvDescriptorSet0.vp_c14)._m0[6].w * (*spvDescriptorSet0.vp_c14)._m0[6].w;
    float _372 = -_362;
    float _374 = fma(_346, (*spvDescriptorSet0.vp_c14)._m0[2].y, _372);
    float _376 = _366 * _366;
    float _378 = -_368;
    float _380 = fma(_350, (*spvDescriptorSet0.vp_c14)._m0[2].x, _378);
    float _382 = fma(_374, _374, _376);
    float _384 = fma(_380, _380, _382);
    float _386 = rsqrt(_384);
    float _388 = _296 * _244;
    float _390 = _358;
    float _392 = _382;
    float _394 = _376;
    if (_344)
    {
        float _396 = rsqrt(_358);
        _390 = _396;
    }
    float _398 = _390;
    float _400 = _280 * 0.15915493667125701904296875;
    float _402 = 1.0 / _370;
    float _404 = _366 * _386;
    float _406 = _374 * _386;
    float _408 = _380 * _386;
    if (!_344)
    {
        _392 = 0.0;
    }
    float _410 = _392;
    float _412 = _400 * 6.283185482025146484375;
    float _414 = sin(_412);
    float _416 = _410;
    if (_344)
    {
        float _418 = _272 * _398;
        _416 = _418;
    }
    float _420 = _416;
    float _422 = _346 * _404;
    float _424 = _348 * _408;
    float _426 = _350 * _406;
    float _428 = fma(_300, _232, _388);
    float _430 = _332 * _402;
    float _432 = precise::clamp(_430, 0.0, 1.0);
    float _434 = -_422;
    float _436 = fma(_350, _408, _434);
    float _438 = -_424;
    float _440 = fma(_346, _406, _438);
    float _442 = -_426;
    float _444 = fma(_348, _404, _442);
    float _446 = -_432;
    float _448 = _446 + 1.0;
    float _450 = _202 * 0.00999999977648258209228515625;
    float _452 = _428 * _436;
    float _454 = _428 * _440;
    float _456 = _428 * _444;
    float _458 = _448 * (*spvDescriptorSet0.vp_c14)._m0[3].w;
    float _460 = fma(_282, _414, _450);
    if (!_344)
    {
        _394 = 1.0;
    }
    float _462 = _394;
    float _464 = _462;
    if (_344)
    {
        float _466 = _266 * _398;
        _464 = _466;
    }
    float _468 = _464;
    float _470 = fma(_306, _348, _452);
    float _472 = fma(_306, _350, _454);
    float _474 = _306 * _458;
    float _476 = fma(_204, (*spvDescriptorSet0.vp_c14)._m0[3].y, _202);
    float _478 = _460 * (*spvDescriptorSet0.vp_c14)._m0[5].y;
    float _480 = _460 * (*spvDescriptorSet0.vp_c14)._m0[5].x;
    float _482 = fma(_306, _346, _456);
    float _484 = fma(_468, _474, _470);
    float _486 = _472 * _472;
    float _488 = -_478;
    float _490 = fma(_476, (*spvDescriptorSet0.vp_c14)._m0[5].x, _488);
    float _492 = 0.0 + _306;
    float _494 = precise::clamp(_492, 0.0, 1.0);
    float _496 = fma(_420, _474, _482);
    float _498 = fma(_484, _484, _486);
    float _500 = fma(_476, (*spvDescriptorSet0.vp_c14)._m0[5].y, _480);
    float _502 = fma(_494, _490, _484);
    float _504 = fma(_494, _500, _496);
    float _506 = fma(_502, _502, _486);
    float _508 = fma(_496, _496, _498);
    float _510 = fma(_504, _504, _506);
    float _512 = sqrt(_508);
    float _514 = rsqrt(_510);
    bool _516 = 0 != as_type<int>((*spvDescriptorSet0.vp_c12)._m0[4].y);
    float _518 = _512 * _514;
    float _520 = fma(_472, _518, _92);
    float _522 = fma(_502, _518, _86);
    float _524 = _520 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _526 = _520 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _528 = _520 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _530 = fma(_504, _518, _98);
    float _532 = fma(_522, (*spvDescriptorSet0.vp_c4)._m0[0].x, _524);
    float _534 = fma(_522, (*spvDescriptorSet0.vp_c4)._m0[1].x, _526);
    float _536 = fma(_522, (*spvDescriptorSet0.vp_c4)._m0[2].x, _528);
    float _538 = fma(_530, (*spvDescriptorSet0.vp_c4)._m0[0].z, _532);
    float _540 = fma(_530, (*spvDescriptorSet0.vp_c4)._m0[1].z, _534);
    float _542 = fma(_530, (*spvDescriptorSet0.vp_c4)._m0[2].z, _536);
    float _544 = _538 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _546 = _540 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _548 = _542 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _550 = _540;
    int _682;
    int _684;
    int _686;
    int _688;
    if (!_516)
    {
        float _552 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
        float _554 = _530 + _552;
        float _556 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
        float _558 = _522 + _556;
        float _560 = _554 * _554;
        float _562 = fma(_558, _558, _560);
        float _564 = sqrt(_562);
        bool _566 = _564 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _568 = _560;
        if (!_566)
        {
            _354 = _548;
        }
        float _570 = _354;
        float _572 = _570;
        if (!_566)
        {
            _550 = _546;
        }
        float _574 = _550;
        float _576 = _574;
        if (!_566)
        {
            _568 = _544;
        }
        float _578 = _568;
        bool _580 = !_566;
        float _582 = _578;
        if (!_580)
        {
            float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _586 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
            float _588 = _564 + _586;
            float _590 = _520 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _592 = rsqrt(_562);
            float _594 = _588 * _584;
            float _596 = _594 * 0.15915493667125701904296875;
            float _598 = _596 * 6.283185482025146484375;
            float _600 = cos(_598);
            float _602 = _596 * 6.283185482025146484375;
            float _604 = sin(_602);
            float _606 = _600 + (-1.0);
            float _608 = _606 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _610 = fma(_604, _590, (*spvDescriptorSet0.vp_c9)._m0[42].y);
            float _612 = fma(_520, _600, _608);
            float _614 = _592 * _610;
            float _616 = _612 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
            float _618 = fma(_558, _614, (*spvDescriptorSet0.vp_c9)._m0[26].x);
            float _620 = _612 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
            float _622 = _612 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
            float _624 = fma(_554, _614, (*spvDescriptorSet0.vp_c9)._m0[26].z);
            float _626 = fma(_618, (*spvDescriptorSet0.vp_c4)._m0[0].x, _616);
            float _628 = fma(_618, (*spvDescriptorSet0.vp_c4)._m0[1].x, _620);
            float _630 = fma(_618, (*spvDescriptorSet0.vp_c4)._m0[2].x, _622);
            float _632 = fma(_624, (*spvDescriptorSet0.vp_c4)._m0[0].z, _626);
            float _634 = fma(_624, (*spvDescriptorSet0.vp_c4)._m0[1].z, _628);
            float _636 = fma(_624, (*spvDescriptorSet0.vp_c4)._m0[2].z, _630);
            float _638 = _632 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
            float _640 = _634 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
            float _642 = _636 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
            _576 = _640;
            _582 = _638;
            _572 = _642;
        }
        float _644 = _576;
        float _646 = _582;
        float _648 = _572;
        float _650 = _644 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
        float _652 = _644 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
        float _654 = _644 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
        float _656 = _644 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
        float _658 = fma(_646, (*spvDescriptorSet0.vp_c4)._m0[7].x, _650);
        float _660 = fma(_646, (*spvDescriptorSet0.vp_c4)._m0[8].x, _652);
        float _662 = fma(_646, (*spvDescriptorSet0.vp_c4)._m0[9].x, _654);
        float _664 = fma(_646, (*spvDescriptorSet0.vp_c4)._m0[10].x, _656);
        float _666 = fma(_648, (*spvDescriptorSet0.vp_c4)._m0[7].z, _658);
        float _668 = fma(_648, (*spvDescriptorSet0.vp_c4)._m0[8].z, _660);
        float _670 = fma(_648, (*spvDescriptorSet0.vp_c4)._m0[9].z, _662);
        float _672 = fma(_648, (*spvDescriptorSet0.vp_c4)._m0[10].z, _664);
        float _674 = _666 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
        float _676 = _668 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
        float _678 = _670 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
        float _680 = _672 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
        _682 = as_type<int>(_674);
        _684 = as_type<int>(_676);
        _686 = as_type<int>(_678);
        _688 = as_type<int>(_680);
        _690 = true;
    }
    else
    {
        float _692 = _546 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
        float _694 = _546 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
        float _696 = _546 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
        float _698 = _546 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
        float _700 = fma(_544, (*spvDescriptorSet0.vp_c4)._m0[7].x, _692);
        float _702 = fma(_544, (*spvDescriptorSet0.vp_c4)._m0[8].x, _694);
        float _704 = fma(_544, (*spvDescriptorSet0.vp_c4)._m0[9].x, _696);
        float _706 = fma(_544, (*spvDescriptorSet0.vp_c4)._m0[10].x, _698);
        float _708 = fma(_548, (*spvDescriptorSet0.vp_c4)._m0[7].z, _700);
        float _710 = fma(_548, (*spvDescriptorSet0.vp_c4)._m0[8].z, _702);
        float _712 = fma(_548, (*spvDescriptorSet0.vp_c4)._m0[9].z, _704);
        float _714 = fma(_548, (*spvDescriptorSet0.vp_c4)._m0[10].z, _706);
        float _716 = _708 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
        float _718 = _710 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
        float _720 = _712 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
        float _722 = _714 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
        _682 = as_type<int>(_716);
        _684 = as_type<int>(_718);
        _686 = as_type<int>(_720);
        _688 = as_type<int>(_722);
    }
    _690 = false;
    int _724 = _682;
    int _726 = _684;
    int _728 = _686;
    int _730 = _688;
    float _1870 = as_type<float>(_724);
    out.gl_Position.x = _1870;
    float _1873 = as_type<float>(_726);
    out.gl_Position.y = _1873;
    float _1876 = as_type<float>(_728);
    out.gl_Position.z = _1876;
    float _1879 = as_type<float>(_730);
    out.gl_Position.w = _1879;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    bool _690 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = as_type<float>(int(gl_InstanceIndex));
    float _71 = as_type<float>(int(gl_BaseInstance));
    int _73 = as_type<int>(_69) - as_type<int>(_71);
    float _75 = as_type<float>(in.m_52.x);
    int _77 = _73 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _79 = _77 << 6;
    int _81 = _79 + 16;
    uint _84 = uint(int(uint(_79) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_84)];
    float _86 = as_type<float>(_dmw0.x);
    int _88 = _79 + 4;
    uint _90 = uint(int(uint(_88) >> uint(2)));
    float _92 = as_type<float>(_dmw0.y);
    int _94 = _79 + 8;
    uint _96 = uint(int(uint(_94) >> uint(2)));
    float _98 = as_type<float>(_dmw0.z);
    int _100 = _79 + 12;
    uint _102 = uint(int(uint(_100) >> uint(2)));
    float _104 = as_type<float>(_dmw0.w);
    uint _106 = uint(int(uint(_81) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_106)];
    float _108 = as_type<float>(_dmw1.x);
    int _110 = _81 + 4;
    uint _112 = uint(int(uint(_110) >> uint(2)));
    float _114 = as_type<float>(_dmw1.y);
    int _116 = _81 + 8;
    uint _118 = uint(int(uint(_116) >> uint(2)));
    float _120 = as_type<float>(_dmw1.z);
    int _122 = _81 + 12;
    uint _124 = uint(int(uint(_122) >> uint(2)));
    float _126 = as_type<float>(_dmw1.w);
    int _128 = _79 + 52;
    int _130 = _79 + 40;
    uint _132 = uint(int(uint(_128) >> uint(2)));
    float _134 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_132)]);
    int _136 = _130 + 4;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    float _140 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_138)]);
    float _142 = fma(_126, -3.0, 3.0);
    float _144 = floor(_142);
    int _146 = int(_144);
    float _148 = -(*spvDescriptorSet0.vp_c14)._m0[4].x;
    float _150 = _86 + _148;
    float _152 = -(*spvDescriptorSet0.vp_c14)._m0[4].y;
    float _154 = _98 + _152;
    float _156 = _150 * 0.015625;
    float _158 = _154 * 0.015625;
    int _160 = _146 + 1;
    int _162 = as_type<int>(_75);
    int _164 = 0;
    int _166 = _65(_162, _164, (*spvDescriptorSet0.support_buffer));
    int _168 = _146;
    int _170 = 0;
    int _172 = _65(_168, _170, (*spvDescriptorSet0.support_buffer));
    float2 _176 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_166, _172)), 0).xy;
    float _178 = _176.x;
    float _180 = _176.y;
    int _182 = as_type<int>(_75);
    int _184 = 0;
    int _186 = _65(_182, _184, (*spvDescriptorSet0.support_buffer));
    int _188 = _160;
    int _190 = 0;
    int _192 = _65(_188, _190, (*spvDescriptorSet0.support_buffer));
    float2 _194 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_186, _192)), 0).xy;
    float _196 = _194.x;
    float _198 = _194.y;
    float _200 = fma(_104, 6.283185482025146484375, (*spvDescriptorSet0.vp_c14)._m0[3].x);
    float2 _944 = float2(_200, (*spvDescriptorSet0.vp_c14)._m0[3].y);
    float _202 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_944, float2(0.0), isnan(_944)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_944, float2(0.0), isnan(_944)), level(0.0)).x;
    float2 _954 = float2(_156, _158);
    float _204 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_954, float2(0.0), isnan(_954)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_954, float2(0.0), isnan(_954)), level(0.0)).x;
    float _206 = (*spvDescriptorSet0.vp_c14)._m0[2].z * (*spvDescriptorSet0.vp_c14)._m0[1].x;
    float _208 = (*spvDescriptorSet0.vp_c14)._m0[1].z * (*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _210 = -_206;
    float _212 = fma((*spvDescriptorSet0.vp_c14)._m0[1].z, (*spvDescriptorSet0.vp_c14)._m0[2].x, _210);
    float _214 = -_208;
    float _216 = fma((*spvDescriptorSet0.vp_c14)._m0[1].y, (*spvDescriptorSet0.vp_c14)._m0[2].z, _214);
    float _218 = floor(_142);
    float _220 = (*spvDescriptorSet0.vp_c14)._m0[1].y * (*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _222 = _212 * _212;
    float _224 = -_220;
    float _226 = fma((*spvDescriptorSet0.vp_c14)._m0[1].x, (*spvDescriptorSet0.vp_c14)._m0[2].y, _224);
    float _228 = _104 + (-0.5);
    float _230 = fma(_216, _216, _222);
    float _232 = _228 * (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _234 = fma(_226, _226, _230);
    float _236 = -_232;
    float _238 = fma(_236, _232, 1.0);
    float _240 = -_218;
    float _242 = _142 + _240;
    float _244 = sqrt(_238);
    float _246 = _104 * 5.0;
    float _248 = rsqrt(_234);
    float _250 = floor(_246);
    float _252 = -_114;
    float _254 = fma(_212, _248, _252);
    float _256 = -_108;
    float _258 = fma(_216, _248, _256);
    float _260 = -_120;
    float _262 = fma(_226, _248, _260);
    float _264 = -(*spvDescriptorSet0.vp_c14)._m0[6].x;
    float _266 = _86 + _264;
    float _268 = _250 + 10.0;
    float _270 = -(*spvDescriptorSet0.vp_c14)._m0[6].z;
    float _272 = _98 + _270;
    float _274 = fma(_268, (*spvDescriptorSet0.vp_c14)._m0[3].x, _104);
    float _276 = -(*spvDescriptorSet0.vp_c14)._m0[6].y;
    float _278 = _92 + _276;
    float _280 = _274 * 6.283185482025146484375;
    float _282 = (*spvDescriptorSet0.vp_c14)._m0[3].y * 0.00200000009499490261077880859375;
    float _284 = -_178;
    float _286 = _284 + _196;
    float _288 = fma(_242, _286, _178);
    float _290 = -_180;
    float _292 = _290 + _198;
    float _294 = 1.0 / _140;
    float _296 = _134 * _288;
    float _298 = fma(_242, _292, _180);
    float _300 = _134 * _298;
    float _302 = _296 * _232;
    float _304 = -_302;
    float _306 = fma(_300, _244, _304);
    float _308 = _306 * _294;
    float _310 = precise::clamp(_308, 0.0, 1.0);
    float _312 = fma(_310, _254, _114);
    float _314 = fma(_310, _258, _108);
    float _316 = _312 * _312;
    float _318 = fma(_310, _262, _120);
    float _320 = fma(_314, _314, _316);
    float _322 = _266 * _266;
    float _324 = fma(_318, _318, _320);
    float _326 = _272 * _272;
    float _328 = fma(_278, _278, _322);
    float _330 = rsqrt(_324);
    float _332 = _326 + _328;
    bool _336 = _332 >= 9.9999997473787516355514526367188e-05;
    bool _338 = isnan(_332);
    bool _340 = _336 || _338;
    bool _342 = isnan(9.9999997473787516355514526367188e-05);
    bool _344 = _340 || _342;
    float _346 = _318 * _330;
    float _348 = _314 * _330;
    float _350 = _312 * _330;
    float _352 = 0.0;
    float _354 = _98;
    if (_344)
    {
        float _356 = _322 + _326;
        _352 = _356;
    }
    float _358 = _352;
    float _360 = _346 * (*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _362 = _350 * (*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _364 = -_360;
    float _366 = fma(_348, (*spvDescriptorSet0.vp_c14)._m0[2].z, _364);
    float _368 = _348 * (*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _370 = (*spvDescriptorSet0.vp_c14)._m0[6].w * (*spvDescriptorSet0.vp_c14)._m0[6].w;
    float _372 = -_362;
    float _374 = fma(_346, (*spvDescriptorSet0.vp_c14)._m0[2].y, _372);
    float _376 = _366 * _366;
    float _378 = -_368;
    float _380 = fma(_350, (*spvDescriptorSet0.vp_c14)._m0[2].x, _378);
    float _382 = fma(_374, _374, _376);
    float _384 = fma(_380, _380, _382);
    float _386 = rsqrt(_384);
    float _388 = _296 * _244;
    float _390 = _358;
    float _392 = _382;
    float _394 = _376;
    if (_344)
    {
        float _396 = rsqrt(_358);
        _390 = _396;
    }
    float _398 = _390;
    float _400 = _280 * 0.15915493667125701904296875;
    float _402 = 1.0 / _370;
    float _404 = _366 * _386;
    float _406 = _374 * _386;
    float _408 = _380 * _386;
    if (!_344)
    {
        _392 = 0.0;
    }
    float _410 = _392;
    float _412 = _400 * 6.283185482025146484375;
    float _414 = sin(_412);
    float _416 = _410;
    if (_344)
    {
        float _418 = _272 * _398;
        _416 = _418;
    }
    float _420 = _416;
    float _422 = _346 * _404;
    float _424 = _348 * _408;
    float _426 = _350 * _406;
    float _428 = fma(_300, _232, _388);
    float _430 = _332 * _402;
    float _432 = precise::clamp(_430, 0.0, 1.0);
    float _434 = -_422;
    float _436 = fma(_350, _408, _434);
    float _438 = -_424;
    float _440 = fma(_346, _406, _438);
    float _442 = -_426;
    float _444 = fma(_348, _404, _442);
    float _446 = -_432;
    float _448 = _446 + 1.0;
    float _450 = _202 * 0.00999999977648258209228515625;
    float _452 = _428 * _436;
    float _454 = _428 * _440;
    float _456 = _428 * _444;
    float _458 = _448 * (*spvDescriptorSet0.vp_c14)._m0[3].w;
    float _460 = fma(_282, _414, _450);
    if (!_344)
    {
        _394 = 1.0;
    }
    float _462 = _394;
    float _464 = _462;
    if (_344)
    {
        float _466 = _266 * _398;
        _464 = _466;
    }
    float _468 = _464;
    float _470 = fma(_306, _348, _452);
    float _472 = fma(_306, _350, _454);
    float _474 = _306 * _458;
    float _476 = fma(_204, (*spvDescriptorSet0.vp_c14)._m0[3].y, _202);
    float _478 = _460 * (*spvDescriptorSet0.vp_c14)._m0[5].y;
    float _480 = _460 * (*spvDescriptorSet0.vp_c14)._m0[5].x;
    float _482 = fma(_306, _346, _456);
    float _484 = fma(_468, _474, _470);
    float _486 = _472 * _472;
    float _488 = -_478;
    float _490 = fma(_476, (*spvDescriptorSet0.vp_c14)._m0[5].x, _488);
    float _492 = 0.0 + _306;
    float _494 = precise::clamp(_492, 0.0, 1.0);
    float _496 = fma(_420, _474, _482);
    float _498 = fma(_484, _484, _486);
    float _500 = fma(_476, (*spvDescriptorSet0.vp_c14)._m0[5].y, _480);
    float _502 = fma(_494, _490, _484);
    float _504 = fma(_494, _500, _496);
    float _506 = fma(_502, _502, _486);
    float _508 = fma(_496, _496, _498);
    float _510 = fma(_504, _504, _506);
    float _512 = sqrt(_508);
    float _514 = rsqrt(_510);
    bool _516 = 0 != as_type<int>((*spvDescriptorSet0.vp_c12)._m0[4].y);
    float _518 = _512 * _514;
    float _520 = fma(_472, _518, _92);
    float _522 = fma(_502, _518, _86);
    float _524 = _520 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _526 = _520 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _528 = _520 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _530 = fma(_504, _518, _98);
    float _532 = fma(_522, (*spvDescriptorSet0.vp_c4)._m0[0].x, _524);
    float _534 = fma(_522, (*spvDescriptorSet0.vp_c4)._m0[1].x, _526);
    float _536 = fma(_522, (*spvDescriptorSet0.vp_c4)._m0[2].x, _528);
    float _538 = fma(_530, (*spvDescriptorSet0.vp_c4)._m0[0].z, _532);
    float _540 = fma(_530, (*spvDescriptorSet0.vp_c4)._m0[1].z, _534);
    float _542 = fma(_530, (*spvDescriptorSet0.vp_c4)._m0[2].z, _536);
    float _544 = _538 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _546 = _540 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _548 = _542 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _550 = _540;
    int _682;
    int _684;
    int _686;
    int _688;
    if (!_516)
    {
        float _552 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
        float _554 = _530 + _552;
        float _556 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
        float _558 = _522 + _556;
        float _560 = _554 * _554;
        float _562 = fma(_558, _558, _560);
        float _564 = sqrt(_562);
        bool _566 = _564 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _568 = _560;
        if (!_566)
        {
            _354 = _548;
        }
        float _570 = _354;
        float _572 = _570;
        if (!_566)
        {
            _550 = _546;
        }
        float _574 = _550;
        float _576 = _574;
        if (!_566)
        {
            _568 = _544;
        }
        float _578 = _568;
        bool _580 = !_566;
        float _582 = _578;
        if (!_580)
        {
            float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _586 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
            float _588 = _564 + _586;
            float _590 = _520 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _592 = rsqrt(_562);
            float _594 = _588 * _584;
            float _596 = _594 * 0.15915493667125701904296875;
            float _598 = _596 * 6.283185482025146484375;
            float _600 = cos(_598);
            float _602 = _596 * 6.283185482025146484375;
            float _604 = sin(_602);
            float _606 = _600 + (-1.0);
            float _608 = _606 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _610 = fma(_604, _590, (*spvDescriptorSet0.vp_c9)._m0[42].y);
            float _612 = fma(_520, _600, _608);
            float _614 = _592 * _610;
            float _616 = _612 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
            float _618 = fma(_558, _614, (*spvDescriptorSet0.vp_c9)._m0[26].x);
            float _620 = _612 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
            float _622 = _612 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
            float _624 = fma(_554, _614, (*spvDescriptorSet0.vp_c9)._m0[26].z);
            float _626 = fma(_618, (*spvDescriptorSet0.vp_c4)._m0[0].x, _616);
            float _628 = fma(_618, (*spvDescriptorSet0.vp_c4)._m0[1].x, _620);
            float _630 = fma(_618, (*spvDescriptorSet0.vp_c4)._m0[2].x, _622);
            float _632 = fma(_624, (*spvDescriptorSet0.vp_c4)._m0[0].z, _626);
            float _634 = fma(_624, (*spvDescriptorSet0.vp_c4)._m0[1].z, _628);
            float _636 = fma(_624, (*spvDescriptorSet0.vp_c4)._m0[2].z, _630);
            float _638 = _632 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
            float _640 = _634 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
            float _642 = _636 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
            _576 = _640;
            _582 = _638;
            _572 = _642;
        }
        float _644 = _576;
        float _646 = _582;
        float _648 = _572;
        float _650 = _644 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
        float _652 = _644 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
        float _654 = _644 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
        float _656 = _644 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
        float _658 = fma(_646, (*spvDescriptorSet0.vp_c4)._m0[7].x, _650);
        float _660 = fma(_646, (*spvDescriptorSet0.vp_c4)._m0[8].x, _652);
        float _662 = fma(_646, (*spvDescriptorSet0.vp_c4)._m0[9].x, _654);
        float _664 = fma(_646, (*spvDescriptorSet0.vp_c4)._m0[10].x, _656);
        float _666 = fma(_648, (*spvDescriptorSet0.vp_c4)._m0[7].z, _658);
        float _668 = fma(_648, (*spvDescriptorSet0.vp_c4)._m0[8].z, _660);
        float _670 = fma(_648, (*spvDescriptorSet0.vp_c4)._m0[9].z, _662);
        float _672 = fma(_648, (*spvDescriptorSet0.vp_c4)._m0[10].z, _664);
        float _674 = _666 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
        float _676 = _668 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
        float _678 = _670 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
        float _680 = _672 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
        _682 = as_type<int>(_674);
        _684 = as_type<int>(_676);
        _686 = as_type<int>(_678);
        _688 = as_type<int>(_680);
        _690 = true;
    }
    else
    {
        float _692 = _546 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
        float _694 = _546 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
        float _696 = _546 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
        float _698 = _546 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
        float _700 = fma(_544, (*spvDescriptorSet0.vp_c4)._m0[7].x, _692);
        float _702 = fma(_544, (*spvDescriptorSet0.vp_c4)._m0[8].x, _694);
        float _704 = fma(_544, (*spvDescriptorSet0.vp_c4)._m0[9].x, _696);
        float _706 = fma(_544, (*spvDescriptorSet0.vp_c4)._m0[10].x, _698);
        float _708 = fma(_548, (*spvDescriptorSet0.vp_c4)._m0[7].z, _700);
        float _710 = fma(_548, (*spvDescriptorSet0.vp_c4)._m0[8].z, _702);
        float _712 = fma(_548, (*spvDescriptorSet0.vp_c4)._m0[9].z, _704);
        float _714 = fma(_548, (*spvDescriptorSet0.vp_c4)._m0[10].z, _706);
        float _716 = _708 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
        float _718 = _710 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
        float _720 = _712 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
        float _722 = _714 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
        _682 = as_type<int>(_716);
        _684 = as_type<int>(_718);
        _686 = as_type<int>(_720);
        _688 = as_type<int>(_722);
    }
    _690 = false;
    int _724 = _682;
    int _726 = _684;
    int _728 = _686;
    int _730 = _688;
    float _1870 = as_type<float>(_724);
    out.gl_Position.x = _1870;
    float _1873 = as_type<float>(_726);
    out.gl_Position.y = _1873;
    float _1876 = as_type<float>(_728);
    out.gl_Position.z = _1876;
    float _1879 = as_type<float>(_730);
    out.gl_Position.w = _1879;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]], uint dm_vid [[vertex_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_iid = gl_InstanceIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    bool _690 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = as_type<float>(int(gl_InstanceIndex));
    float _71 = as_type<float>(int(gl_BaseInstance));
    int _73 = as_type<int>(_69) - as_type<int>(_71);
    float _75 = as_type<float>(in.m_52.x);
    int _77 = _73 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _79 = _77 << 6;
    int _81 = _79 + 16;
    uint _84 = uint(int(uint(_79) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_84)];
    float _86 = as_type<float>(_dmw0.x);
    int _88 = _79 + 4;
    uint _90 = uint(int(uint(_88) >> uint(2)));
    float _92 = as_type<float>(_dmw0.y);
    int _94 = _79 + 8;
    uint _96 = uint(int(uint(_94) >> uint(2)));
    float _98 = as_type<float>(_dmw0.z);
    int _100 = _79 + 12;
    uint _102 = uint(int(uint(_100) >> uint(2)));
    float _104 = as_type<float>(_dmw0.w);
    uint _106 = uint(int(uint(_81) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_106)];
    float _108 = as_type<float>(_dmw1.x);
    int _110 = _81 + 4;
    uint _112 = uint(int(uint(_110) >> uint(2)));
    float _114 = as_type<float>(_dmw1.y);
    int _116 = _81 + 8;
    uint _118 = uint(int(uint(_116) >> uint(2)));
    float _120 = as_type<float>(_dmw1.z);
    int _122 = _81 + 12;
    uint _124 = uint(int(uint(_122) >> uint(2)));
    float _126 = as_type<float>(_dmw1.w);
    int _128 = _79 + 52;
    int _130 = _79 + 40;
    uint _132 = uint(int(uint(_128) >> uint(2)));
    float _134 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_132)]);
    int _136 = _130 + 4;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    float _140 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_138)]);
    float _142 = fma(_126, -3.0, 3.0);
    float _144 = floor(_142);
    int _146 = int(_144);
    float _148 = -(*spvDescriptorSet0.vp_c14)._m0[4].x;
    float _150 = _86 + _148;
    float _152 = -(*spvDescriptorSet0.vp_c14)._m0[4].y;
    float _154 = _98 + _152;
    float _156 = _150 * 0.015625;
    float _158 = _154 * 0.015625;
    int _160 = _146 + 1;
    int _162 = as_type<int>(_75);
    int _164 = 0;
    int _166 = _65(_162, _164, (*spvDescriptorSet0.support_buffer));
    int _168 = _146;
    int _170 = 0;
    int _172 = _65(_168, _170, (*spvDescriptorSet0.support_buffer));
    float2 _176 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_166, _172)), 0).xy;
    float _178 = _176.x;
    float _180 = _176.y;
    int _182 = as_type<int>(_75);
    int _184 = 0;
    int _186 = _65(_182, _184, (*spvDescriptorSet0.support_buffer));
    int _188 = _160;
    int _190 = 0;
    int _192 = _65(_188, _190, (*spvDescriptorSet0.support_buffer));
    float2 _194 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_186, _192)), 0).xy;
    float _196 = _194.x;
    float _198 = _194.y;
    float _200 = fma(_104, 6.283185482025146484375, (*spvDescriptorSet0.vp_c14)._m0[3].x);
    float2 _944 = float2(_200, (*spvDescriptorSet0.vp_c14)._m0[3].y);
    float _202 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_944, float2(0.0), isnan(_944)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_944, float2(0.0), isnan(_944)), level(0.0)).x;
    float2 _954 = float2(_156, _158);
    float _204 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_954, float2(0.0), isnan(_954)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_954, float2(0.0), isnan(_954)), level(0.0)).x;
    float _206 = (*spvDescriptorSet0.vp_c14)._m0[2].z * (*spvDescriptorSet0.vp_c14)._m0[1].x;
    float _208 = (*spvDescriptorSet0.vp_c14)._m0[1].z * (*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _210 = -_206;
    float _212 = fma((*spvDescriptorSet0.vp_c14)._m0[1].z, (*spvDescriptorSet0.vp_c14)._m0[2].x, _210);
    float _214 = -_208;
    float _216 = fma((*spvDescriptorSet0.vp_c14)._m0[1].y, (*spvDescriptorSet0.vp_c14)._m0[2].z, _214);
    float _218 = floor(_142);
    float _220 = (*spvDescriptorSet0.vp_c14)._m0[1].y * (*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _222 = _212 * _212;
    float _224 = -_220;
    float _226 = fma((*spvDescriptorSet0.vp_c14)._m0[1].x, (*spvDescriptorSet0.vp_c14)._m0[2].y, _224);
    float _228 = _104 + (-0.5);
    float _230 = fma(_216, _216, _222);
    float _232 = _228 * (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _234 = fma(_226, _226, _230);
    float _236 = -_232;
    float _238 = fma(_236, _232, 1.0);
    float _240 = -_218;
    float _242 = _142 + _240;
    float _244 = sqrt(_238);
    float _246 = _104 * 5.0;
    float _248 = rsqrt(_234);
    float _250 = floor(_246);
    float _252 = -_114;
    float _254 = fma(_212, _248, _252);
    float _256 = -_108;
    float _258 = fma(_216, _248, _256);
    float _260 = -_120;
    float _262 = fma(_226, _248, _260);
    float _264 = -(*spvDescriptorSet0.vp_c14)._m0[6].x;
    float _266 = _86 + _264;
    float _268 = _250 + 10.0;
    float _270 = -(*spvDescriptorSet0.vp_c14)._m0[6].z;
    float _272 = _98 + _270;
    float _274 = fma(_268, (*spvDescriptorSet0.vp_c14)._m0[3].x, _104);
    float _276 = -(*spvDescriptorSet0.vp_c14)._m0[6].y;
    float _278 = _92 + _276;
    float _280 = _274 * 6.283185482025146484375;
    float _282 = (*spvDescriptorSet0.vp_c14)._m0[3].y * 0.00200000009499490261077880859375;
    float _284 = -_178;
    float _286 = _284 + _196;
    float _288 = fma(_242, _286, _178);
    float _290 = -_180;
    float _292 = _290 + _198;
    float _294 = 1.0 / _140;
    float _296 = _134 * _288;
    float _298 = fma(_242, _292, _180);
    float _300 = _134 * _298;
    float _302 = _296 * _232;
    float _304 = -_302;
    float _306 = fma(_300, _244, _304);
    float _308 = _306 * _294;
    float _310 = precise::clamp(_308, 0.0, 1.0);
    float _312 = fma(_310, _254, _114);
    float _314 = fma(_310, _258, _108);
    float _316 = _312 * _312;
    float _318 = fma(_310, _262, _120);
    float _320 = fma(_314, _314, _316);
    float _322 = _266 * _266;
    float _324 = fma(_318, _318, _320);
    float _326 = _272 * _272;
    float _328 = fma(_278, _278, _322);
    float _330 = rsqrt(_324);
    float _332 = _326 + _328;
    bool _336 = _332 >= 9.9999997473787516355514526367188e-05;
    bool _338 = isnan(_332);
    bool _340 = _336 || _338;
    bool _342 = isnan(9.9999997473787516355514526367188e-05);
    bool _344 = _340 || _342;
    float _346 = _318 * _330;
    float _348 = _314 * _330;
    float _350 = _312 * _330;
    float _352 = 0.0;
    float _354 = _98;
    if (_344)
    {
        float _356 = _322 + _326;
        _352 = _356;
    }
    float _358 = _352;
    float _360 = _346 * (*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _362 = _350 * (*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _364 = -_360;
    float _366 = fma(_348, (*spvDescriptorSet0.vp_c14)._m0[2].z, _364);
    float _368 = _348 * (*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _370 = (*spvDescriptorSet0.vp_c14)._m0[6].w * (*spvDescriptorSet0.vp_c14)._m0[6].w;
    float _372 = -_362;
    float _374 = fma(_346, (*spvDescriptorSet0.vp_c14)._m0[2].y, _372);
    float _376 = _366 * _366;
    float _378 = -_368;
    float _380 = fma(_350, (*spvDescriptorSet0.vp_c14)._m0[2].x, _378);
    float _382 = fma(_374, _374, _376);
    float _384 = fma(_380, _380, _382);
    float _386 = rsqrt(_384);
    float _388 = _296 * _244;
    float _390 = _358;
    float _392 = _382;
    float _394 = _376;
    if (_344)
    {
        float _396 = rsqrt(_358);
        _390 = _396;
    }
    float _398 = _390;
    float _400 = _280 * 0.15915493667125701904296875;
    float _402 = 1.0 / _370;
    float _404 = _366 * _386;
    float _406 = _374 * _386;
    float _408 = _380 * _386;
    if (!_344)
    {
        _392 = 0.0;
    }
    float _410 = _392;
    float _412 = _400 * 6.283185482025146484375;
    float _414 = sin(_412);
    float _416 = _410;
    if (_344)
    {
        float _418 = _272 * _398;
        _416 = _418;
    }
    float _420 = _416;
    float _422 = _346 * _404;
    float _424 = _348 * _408;
    float _426 = _350 * _406;
    float _428 = fma(_300, _232, _388);
    float _430 = _332 * _402;
    float _432 = precise::clamp(_430, 0.0, 1.0);
    float _434 = -_422;
    float _436 = fma(_350, _408, _434);
    float _438 = -_424;
    float _440 = fma(_346, _406, _438);
    float _442 = -_426;
    float _444 = fma(_348, _404, _442);
    float _446 = -_432;
    float _448 = _446 + 1.0;
    float _450 = _202 * 0.00999999977648258209228515625;
    float _452 = _428 * _436;
    float _454 = _428 * _440;
    float _456 = _428 * _444;
    float _458 = _448 * (*spvDescriptorSet0.vp_c14)._m0[3].w;
    float _460 = fma(_282, _414, _450);
    if (!_344)
    {
        _394 = 1.0;
    }
    float _462 = _394;
    float _464 = _462;
    if (_344)
    {
        float _466 = _266 * _398;
        _464 = _466;
    }
    float _468 = _464;
    float _470 = fma(_306, _348, _452);
    float _472 = fma(_306, _350, _454);
    float _474 = _306 * _458;
    float _476 = fma(_204, (*spvDescriptorSet0.vp_c14)._m0[3].y, _202);
    float _478 = _460 * (*spvDescriptorSet0.vp_c14)._m0[5].y;
    float _480 = _460 * (*spvDescriptorSet0.vp_c14)._m0[5].x;
    float _482 = fma(_306, _346, _456);
    float _484 = fma(_468, _474, _470);
    float _486 = _472 * _472;
    float _488 = -_478;
    float _490 = fma(_476, (*spvDescriptorSet0.vp_c14)._m0[5].x, _488);
    float _492 = 0.0 + _306;
    float _494 = precise::clamp(_492, 0.0, 1.0);
    float _496 = fma(_420, _474, _482);
    float _498 = fma(_484, _484, _486);
    float _500 = fma(_476, (*spvDescriptorSet0.vp_c14)._m0[5].y, _480);
    float _502 = fma(_494, _490, _484);
    float _504 = fma(_494, _500, _496);
    float _506 = fma(_502, _502, _486);
    float _508 = fma(_496, _496, _498);
    float _510 = fma(_504, _504, _506);
    float _512 = sqrt(_508);
    float _514 = rsqrt(_510);
    bool _516 = 0 != as_type<int>((*spvDescriptorSet0.vp_c12)._m0[4].y);
    float _518 = _512 * _514;
    float _520 = fma(_472, _518, _92);
    float _522 = fma(_502, _518, _86);
    float _524 = _520 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _526 = _520 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _528 = _520 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _530 = fma(_504, _518, _98);
    float _532 = fma(_522, (*spvDescriptorSet0.vp_c4)._m0[0].x, _524);
    float _534 = fma(_522, (*spvDescriptorSet0.vp_c4)._m0[1].x, _526);
    float _536 = fma(_522, (*spvDescriptorSet0.vp_c4)._m0[2].x, _528);
    float _538 = fma(_530, (*spvDescriptorSet0.vp_c4)._m0[0].z, _532);
    float _540 = fma(_530, (*spvDescriptorSet0.vp_c4)._m0[1].z, _534);
    float _542 = fma(_530, (*spvDescriptorSet0.vp_c4)._m0[2].z, _536);
    float _544 = _538 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _546 = _540 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _548 = _542 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _550 = _540;
    int _682;
    int _684;
    int _686;
    int _688;
    if (!_516)
    {
        float _552 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
        float _554 = _530 + _552;
        float _556 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
        float _558 = _522 + _556;
        float _560 = _554 * _554;
        float _562 = fma(_558, _558, _560);
        float _564 = sqrt(_562);
        bool _566 = _564 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _568 = _560;
        if (!_566)
        {
            _354 = _548;
        }
        float _570 = _354;
        float _572 = _570;
        if (!_566)
        {
            _550 = _546;
        }
        float _574 = _550;
        float _576 = _574;
        if (!_566)
        {
            _568 = _544;
        }
        float _578 = _568;
        bool _580 = !_566;
        float _582 = _578;
        if (!_580)
        {
            float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _586 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
            float _588 = _564 + _586;
            float _590 = _520 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _592 = rsqrt(_562);
            float _594 = _588 * _584;
            float _596 = _594 * 0.15915493667125701904296875;
            float _598 = _596 * 6.283185482025146484375;
            float _600 = cos(_598);
            float _602 = _596 * 6.283185482025146484375;
            float _604 = sin(_602);
            float _606 = _600 + (-1.0);
            float _608 = _606 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _610 = fma(_604, _590, (*spvDescriptorSet0.vp_c9)._m0[42].y);
            float _612 = fma(_520, _600, _608);
            float _614 = _592 * _610;
            float _616 = _612 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
            float _618 = fma(_558, _614, (*spvDescriptorSet0.vp_c9)._m0[26].x);
            float _620 = _612 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
            float _622 = _612 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
            float _624 = fma(_554, _614, (*spvDescriptorSet0.vp_c9)._m0[26].z);
            float _626 = fma(_618, (*spvDescriptorSet0.vp_c4)._m0[0].x, _616);
            float _628 = fma(_618, (*spvDescriptorSet0.vp_c4)._m0[1].x, _620);
            float _630 = fma(_618, (*spvDescriptorSet0.vp_c4)._m0[2].x, _622);
            float _632 = fma(_624, (*spvDescriptorSet0.vp_c4)._m0[0].z, _626);
            float _634 = fma(_624, (*spvDescriptorSet0.vp_c4)._m0[1].z, _628);
            float _636 = fma(_624, (*spvDescriptorSet0.vp_c4)._m0[2].z, _630);
            float _638 = _632 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
            float _640 = _634 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
            float _642 = _636 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
            _576 = _640;
            _582 = _638;
            _572 = _642;
        }
        float _644 = _576;
        float _646 = _582;
        float _648 = _572;
        float _650 = _644 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
        float _652 = _644 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
        float _654 = _644 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
        float _656 = _644 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
        float _658 = fma(_646, (*spvDescriptorSet0.vp_c4)._m0[7].x, _650);
        float _660 = fma(_646, (*spvDescriptorSet0.vp_c4)._m0[8].x, _652);
        float _662 = fma(_646, (*spvDescriptorSet0.vp_c4)._m0[9].x, _654);
        float _664 = fma(_646, (*spvDescriptorSet0.vp_c4)._m0[10].x, _656);
        float _666 = fma(_648, (*spvDescriptorSet0.vp_c4)._m0[7].z, _658);
        float _668 = fma(_648, (*spvDescriptorSet0.vp_c4)._m0[8].z, _660);
        float _670 = fma(_648, (*spvDescriptorSet0.vp_c4)._m0[9].z, _662);
        float _672 = fma(_648, (*spvDescriptorSet0.vp_c4)._m0[10].z, _664);
        float _674 = _666 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
        float _676 = _668 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
        float _678 = _670 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
        float _680 = _672 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
        _682 = as_type<int>(_674);
        _684 = as_type<int>(_676);
        _686 = as_type<int>(_678);
        _688 = as_type<int>(_680);
        _690 = true;
    }
    else
    {
        float _692 = _546 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
        float _694 = _546 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
        float _696 = _546 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
        float _698 = _546 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
        float _700 = fma(_544, (*spvDescriptorSet0.vp_c4)._m0[7].x, _692);
        float _702 = fma(_544, (*spvDescriptorSet0.vp_c4)._m0[8].x, _694);
        float _704 = fma(_544, (*spvDescriptorSet0.vp_c4)._m0[9].x, _696);
        float _706 = fma(_544, (*spvDescriptorSet0.vp_c4)._m0[10].x, _698);
        float _708 = fma(_548, (*spvDescriptorSet0.vp_c4)._m0[7].z, _700);
        float _710 = fma(_548, (*spvDescriptorSet0.vp_c4)._m0[8].z, _702);
        float _712 = fma(_548, (*spvDescriptorSet0.vp_c4)._m0[9].z, _704);
        float _714 = fma(_548, (*spvDescriptorSet0.vp_c4)._m0[10].z, _706);
        float _716 = _708 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
        float _718 = _710 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
        float _720 = _712 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
        float _722 = _714 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
        _682 = as_type<int>(_716);
        _684 = as_type<int>(_718);
        _686 = as_type<int>(_720);
        _688 = as_type<int>(_722);
    }
    _690 = false;
    int _724 = _682;
    int _726 = _684;
    int _728 = _686;
    int _730 = _688;
    float _1870 = as_type<float>(_724);
    out.gl_Position.x = _1870;
    float _1873 = as_type<float>(_726);
    out.gl_Position.y = _1873;
    float _1876 = as_type<float>(_728);
    out.gl_Position.z = _1876;
    float _1879 = as_type<float>(_730);
    out.gl_Position.w = _1879;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

