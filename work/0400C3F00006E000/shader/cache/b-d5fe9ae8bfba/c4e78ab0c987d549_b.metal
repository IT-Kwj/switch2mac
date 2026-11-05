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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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

struct _31
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c7 [[id(1)]];
    constant _16* fp_c11 [[id(2)]];
    constant _16* fp_c4 [[id(3)]];
    constant _16* fp_c13 [[id(4)]];
    const device _31* fp_s0 [[id(5)]];
    texture3d<float> fp_t_tcb_1C [[id(6)]];
    sampler fp_t_tcb_1CSmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
    texture2d<float> fp_t_tcb_E [[id(12)]];
    sampler fp_t_tcb_ESmplr [[id(13)]];
    texture2d<float> fp_t_tcb_1A [[id(14)]];
    sampler fp_t_tcb_1ASmplr [[id(15)]];
    texture2d<float> fp_t_tcb_10 [[id(16)]];
    sampler fp_t_tcb_10Smplr [[id(17)]];
    texture2d<float> fp_t_tcb_14 [[id(18)]];
    sampler fp_t_tcb_14Smplr [[id(19)]];
    texture2d_array<float> fp_t_tcb_12 [[id(20)]];
    sampler fp_t_tcb_12Smplr [[id(21)]];
    sampler fp_t_tcb_1CSmplr_w [[id(22)]];
    sampler fp_t_tcb_8Smplr_w [[id(23)]];
    sampler fp_t_tcb_CSmplr_w [[id(24)]];
    sampler fp_t_tcb_ESmplr_w [[id(25)]];
    sampler fp_t_tcb_1ASmplr_w [[id(26)]];
    sampler fp_t_tcb_10Smplr_w [[id(27)]];
    sampler fp_t_tcb_14Smplr_w [[id(28)]];
    sampler fp_t_tcb_12Smplr_w [[id(29)]];
    constant dm_border_t* dm_border [[id(30)]];
};

struct main0_out
{
    float4 m_75 [[color(0)]];
    float4 m_77 [[color(1)]];
};

struct main0_in
{
    float4 m_68 [[user(locn0)]];
    float4 m_64 [[user(locn4)]];
    float4 m_70 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _84 = as_type<int>((*spvDescriptorSet0.fp_c7)._m0[11].z) * as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].z);
    int _86 = _84 + as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].w);
    int _88 = _86 * 96;
    int _90 = _88 + 80;
    uint _93 = uint(int(uint(_88) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_93)];
    float _96 = as_type<float>(_dmw0.x);
    int _98 = _88 + 4;
    uint _100 = uint(int(uint(_98) >> uint(2)));
    float _102 = as_type<float>(_dmw0.y);
    uint _104 = uint(int(uint(_90) >> uint(2)));
    float _106 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_104)]);
    int _108 = _88 + 8;
    int _110 = _88 + 16;
    int _112 = _88 + 24;
    uint _114 = uint(int(uint(_108) >> uint(2)));
    float _116 = as_type<float>(_dmw0.z);
    int _118 = _108 + 4;
    uint _120 = uint(int(uint(_118) >> uint(2)));
    float _122 = as_type<float>(_dmw0.w);
    uint _124 = uint(int(uint(_110) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_124)];
    float _126 = as_type<float>(_dmw1.x);
    int _128 = _110 + 4;
    uint _130 = uint(int(uint(_128) >> uint(2)));
    float _132 = as_type<float>(_dmw1.y);
    uint _134 = uint(int(uint(_112) >> uint(2)));
    float _136 = as_type<float>(_dmw1.z);
    int _138 = _112 + 4;
    uint _140 = uint(int(uint(_138) >> uint(2)));
    float _142 = as_type<float>(_dmw1.w);
    float _144 = gl_FragCoord.w;
    float _146 = in.m_64.z;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_66.x;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_66.z;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_66.y;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_64.w;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = 1.0 / _144;
    float _178 = _176 * _150;
    float _180 = _176 * _156;
    float _182 = _176 * _162;
    float _184 = _176 * _168;
    int _186 = as_type<int>(_106) << 6;
    int _188 = _186 + 25904;
    uint _190 = uint(int(uint(_188) >> uint(2)));
    uint _192 = uint(int(uint(int(_190)) >> uint(2)));
    int _194 = int(_190) & 3;
    float _196 = (*spvDescriptorSet0.fp_c9)._m0[int(_192)][_194];
    int _198 = int(_190) + 1;
    uint _200 = uint(int(uint(_198) >> uint(2)));
    int _202 = _198 & 3;
    float _204 = (*spvDescriptorSet0.fp_c9)._m0[int(_200)][_202];
    int _206 = _186 + 25920;
    uint _208 = uint(int(uint(_206) >> uint(2)));
    uint _210 = uint(int(uint(int(_208)) >> uint(2)));
    int _212 = int(_208) & 3;
    float _214 = (*spvDescriptorSet0.fp_c9)._m0[int(_210)][_212];
    int _216 = int(_208) + 1;
    uint _218 = uint(int(uint(_216) >> uint(2)));
    int _220 = _216 & 3;
    float _222 = (*spvDescriptorSet0.fp_c9)._m0[int(_218)][_220];
    float _224 = fma(_178, _96, _116);
    float _226 = _180 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _228 = fma(_178, _126, _136);
    float _230 = _182 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _232 = _176 * _174;
    float _234 = _184 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _236 = _226 * (*spvDescriptorSet0.fp_c11)._m0[30].x;
    float _238 = _230 * (*spvDescriptorSet0.fp_c11)._m0[30].z;
    float _240 = fma(_232, _102, _122);
    float _242 = _234 * (*spvDescriptorSet0.fp_c11)._m0[30].y;
    float _244 = fma(_232, _132, _142);
    float _246 = fma(_236, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].x);
    float _248 = fma(_238, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].z);
    float _250 = fma(_242, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].y);
    float _252 = _224 * _196;
    float _254 = _240 * _204;
    float _256 = _228 * _196;
    float _258 = _244 * _204;
    float3 _1685 = float3(_246, _250, _248);
    float _260 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_1685, float3(0.0), isnan(_1685))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_1685, float3(0.0), isnan(_1685))).x;
    float _262 = _228 * _214;
    float _264 = _244 * _222;
    float2 _1704;
    _1704.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_256, _258));
    _1704.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_256, _258));
    float _266 = _1704.x;
    float _268 = _266 * 256.0;
    int _270 = int(_268);
    float2 _1715;
    _1715.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_252, _254));
    _1715.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_252, _254));
    float _272 = _1715.x;
    float _274 = _272 * 256.0;
    int _276 = int(_274);
    float2 _1725;
    _1725.x = spvDescriptorSet0.fp_t_tcb_C.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_262, _264));
    _1725.y = spvDescriptorSet0.fp_t_tcb_C.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_262, _264));
    float _278 = _1725.x;
    float _280 = _278 * 256.0;
    int _282 = int(_280);
    float _284 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _286 = _182 + _284;
    float _288 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _290 = _180 + _288;
    float _292 = _286 * _286;
    float _294 = fma(_290, _290, _292);
    float _296 = sqrt(_294);
    bool _300 = _296 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _302 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _304 = _296 + _302;
    float _306 = _290;
    float _308 = _304;
    float _310 = _250;
    float _312 = _292;
    float _314 = _224;
    if (_300)
    {
        float _316 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _306 = _316;
    }
    float _318 = _306;
    if (_300)
    {
        float _320 = _304 * _318;
        _308 = _320;
    }
    float _322 = _308;
    if (_300)
    {
        float _324 = _322 * 0.15915493667125701904296875;
        _310 = _324;
    }
    float _326 = _310;
    float _328 = _322;
    if (_300)
    {
        float _330 = _326 * 6.283185482025146484375;
        float _332 = cos(_330);
        _328 = _332;
    }
    float _334 = _328;
    float _336 = _318;
    if (_300)
    {
        float _338 = _326 * 6.283185482025146484375;
        float _340 = sin(_338);
        _336 = _340;
    }
    float _342 = _336;
    float _344 = _174;
    if (_300)
    {
        float _346 = rsqrt(_294);
        _344 = _346;
    }
    float _348 = _344;
    if (_300)
    {
        float _350 = _184 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _312 = _350;
    }
    float _352 = _312;
    float _354 = _352;
    float _356 = _334;
    if (_300)
    {
        float _358 = _334 + (-1.0);
        _314 = _358;
    }
    float _360 = _314;
    float _362 = _360;
    if (_300)
    {
        float _364 = _360 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _362 = _364;
    }
    float _366 = _362;
    float _368 = _342;
    if (_300)
    {
        float _370 = fma(_342, _352, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _354 = _370;
    }
    float _372 = _354;
    float _374 = _372;
    if (!_300)
    {
        _368 = _184;
    }
    float _376 = _368;
    float _378 = _376;
    if (_300)
    {
        float _380 = fma(_184, _334, _366);
        _378 = _380;
    }
    float _382 = _378;
    float _384 = 0.0;
    if (_300)
    {
        float _386 = _348 * _372;
        _384 = _386;
    }
    float _388 = _384;
    float _390 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _392 = _180 + _390;
    if (!_300)
    {
        _374 = _180;
    }
    float _394 = _374;
    float _396 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _398 = _382 + _396;
    float _400 = _394;
    if (_300)
    {
        float _402 = fma(_392, _388, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _400 = _402;
    }
    float _404 = _400;
    if (!_300)
    {
        _356 = _182;
    }
    float _406 = _356;
    float _408 = _406;
    if (_300)
    {
        float _410 = fma(_286, _388, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _408 = _410;
    }
    float _412 = _408;
    float _414 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _416 = _404 + _414;
    float _418 = _398 * _398;
    float _420 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _422 = _412 + _420;
    float _424 = fma(_416, _416, _418);
    float _426 = fma(_422, _422, _424);
    float _428 = rsqrt(_426);
    float _430 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _432 = _184 + _430;
    float _434 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _436 = _180 + _434;
    float _438 = _428 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _440 = _416 * _438;
    float _442 = _422 * _438;
    float _444 = _432 * _432;
    float _446 = _440 * _440;
    float _448 = _442 * _442;
    float _450 = fma(_436, _436, _444);
    float _452 = _446 + _448;
    float _454 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _456 = _182 + _454;
    float _458 = sqrt(_452);
    float _460 = fma(_456, _456, _450);
    float _462 = sqrt(_460);
    int _464 = _88 + 64;
    float _466 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    bool _468 = _458 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    uint _470 = uint(int(uint(_464) >> uint(2)));
    packed_uint2 _dmw2 = *(const device packed_uint2*)&(*spvDescriptorSet0.fp_s0)._m0[int(_470)];
    float _472 = as_type<float>(_dmw2.x);
    int _474 = _88 + 68;
    float _476 = precise::max(0.0, _466);
    uint _478 = uint(int(uint(_474) >> uint(2)));
    float _480 = as_type<float>(_dmw2.y);
    float _482 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _484 = fma(_462, (*spvDescriptorSet0.fp_c9)._m0[63].x, _482);
    float _486 = precise::clamp(_484, 0.0, 1.0);
    float _488 = -_438;
    float _490 = -_476;
    float _492 = fma(_398, _488, _490);
    float _494 = -_486;
    float _496 = _494 + 1.0;
    bool _498 = !_468;
    float _500 = _492;
    float _502 = _446;
    float _504 = _448;
    float _506 = _440;
    float _508 = _442;
    if (!_498)
    {
        float _510 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _512 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _514 = _458 + _512;
        float _516 = _492 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _518 = rsqrt(_452);
        float _520 = _514 * _510;
        float _522 = _520 * 0.15915493667125701904296875;
        float _524 = _522 * 6.283185482025146484375;
        float _526 = sin(_524);
        float _528 = _522 * 6.283185482025146484375;
        float _530 = cos(_528);
        float _532 = fma(_526, _516, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _534 = _518 * _532;
        float _536 = _530 + (-1.0);
        float _538 = _440 * _534;
        float _540 = _442 * _534;
        float _542 = _536 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _544 = _540 * _540;
        float _546 = fma(_492, _530, _542);
        float _548 = _538 * _538;
        _500 = _546;
        _502 = _548;
        _504 = _544;
        _506 = _538;
        _508 = _540;
    }
    float _550 = _500;
    float _552 = _502;
    float _554 = _504;
    float _556 = _506;
    float _558 = _508;
    float _560 = fma(_550, _550, _552);
    float _562 = abs(_496);
    float _564 = log2(_562);
    int _566 = _186 + 25936;
    uint _568 = uint(int(uint(_566) >> uint(2)));
    uint _570 = uint(int(uint(int(_568)) >> uint(2)));
    int _572 = int(_568) & 3;
    float _574 = (*spvDescriptorSet0.fp_c9)._m0[int(_570)][_572];
    float _576 = in.m_68.z;
    float _578 = gl_FragCoord.w;
    float _580 = _576 * _578;
    float _582 = _560 + _554;
    float _584 = float(uint(_276));
    float _586 = float(uint(_282));
    float _588 = rsqrt(_582);
    int _590 = _186 + 25944;
    uint _592 = uint(int(uint(_590) >> uint(2)));
    uint _594 = uint(int(uint(int(_592)) >> uint(2)));
    int _596 = int(_592) & 3;
    float _598 = (*spvDescriptorSet0.fp_c9)._m0[int(_594)][_596];
    float _600 = _564 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    int _602 = _186 + 25952;
    uint _604 = uint(int(uint(_602) >> uint(2)));
    uint _606 = uint(int(uint(int(_604)) >> uint(2)));
    int _608 = int(_604) & 3;
    float _610 = (*spvDescriptorSet0.fp_c9)._m0[int(_606)][_608];
    float _612 = exp2(_600);
    float _614 = _588 * _556;
    float _616 = _588 * _550;
    float _618 = _588 * _558;
    float _620 = precise::max(_472, _574);
    float _622 = _614 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _624 = _616 + 1.0;
    float _626 = -_622;
    float _628 = fma(_616, (*spvDescriptorSet0.fp_c9)._m0[69].y, _626);
    float _630 = float(uint(_270));
    float _632 = _176 * _580;
    float _634 = precise::max(_480, _574);
    float _636 = -_618;
    float _638 = fma(_636, (*spvDescriptorSet0.fp_c9)._m0[69].z, _628);
    float _640 = -_616;
    float _642 = fma(_612, _624, _640);
    float _644 = _630 * 0.00390625;
    float _646 = precise::max(_480, _598);
    float _648 = rint(_610);
    float _650 = precise::max(_648, 0.0);
    uint _652 = uint(_650);
    uint _654 = clamp(_652, 0u, 65535u);
    float _656 = in.m_68.w;
    float _658 = gl_FragCoord.w;
    float _660 = _656 * _658;
    float _662 = fma(_642, 0.5, 0.5);
    float _664 = precise::max(_634, _644);
    float _666 = in.m_68.x;
    float _668 = gl_FragCoord.w;
    float _670 = _666 * _668;
    float _672 = in.m_68.y;
    float _674 = gl_FragCoord.w;
    float _676 = _672 * _674;
    float _678 = fma(_638, 0.5, 0.5);
    float _680 = fma(_638, -0.5, 0.5);
    float _682 = fma(_678, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _684 = sqrt(_680);
    float _686 = fma(_678, _682, -0.212114393711090087890625);
    float _688 = fma(_678, _686, 1.570728778839111328125);
    float _690 = _584 * 0.00390625;
    float _692 = _586 * 0.00390625;
    float _694 = precise::max(_620, _690);
    float _696 = precise::max(_646, _692);
    float _698 = _684 * 0.636619746685028076171875;
    float _700 = _176 * _660;
    float _702 = fma(_180, 6.2500002968590706586837768554688e-05, 0.5);
    float _704 = precise::clamp(_702, 0.0, 1.0);
    float _706 = fma(_182, 6.2500002968590706586837768554688e-05, 0.5);
    float _708 = precise::clamp(_706, 0.0, 1.0);
    float _710 = _176 * _670;
    float _712 = _176 * _676;
    float _714 = -_688;
    float _716 = fma(_698, _714, 1.0);
    float2 _2381 = float2(_710, _712);
    float3 _720 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2381, float2(0.0), isnan(_2381))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2381, float2(0.0), isnan(_2381))).xyz;
    float _722 = _720.x;
    float _724 = _720.y;
    float _726 = _720.z;
    float2 _2397 = float2(_704, _708);
    float _728 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2397, float2(0.0), isnan(_2397))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2397, float2(0.0), isnan(_2397))).x;
    float2 _2405 = float2(_632, _700);
    float3 _730 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2405, float2(0.0), isnan(_2405))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2405, float2(0.0), isnan(_2405))).xyz;
    float _732 = _730.x;
    float _734 = _730.y;
    float _736 = _730.z;
    float2 _2419 = float2(_716, _662);
    float3 _738 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2419, float2(0.0), isnan(_2419))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2419, float2(0.0), isnan(_2419))).xyz;
    float _740 = _738.x;
    float _742 = _738.y;
    float _744 = _738.z;
    float3 _2436 = float3(_256, _258, float(int(_654)));
    float3 _2438 = select(_2436, float3(0.0), isnan(_2436));
    float _746 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2438.xy, uint(rint(_2438.z)), level(_664)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2438.xy, uint(rint(_2438.z)), level(_664)).z;
    float3 _2448 = float3(_252, _254, float(int(_654)));
    float3 _2450 = select(_2448, float3(0.0), isnan(_2448));
    float _748 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2450.xy, uint(rint(_2450.z)), level(_694)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2450.xy, uint(rint(_2450.z)), level(_694)).x;
    float3 _2460 = float3(_262, _264, float(int(_654)));
    float3 _2462 = select(_2460, float3(0.0), isnan(_2460));
    float3 _750 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2462.xy, uint(rint(_2462.z)), level(_696)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2462.xy, uint(rint(_2462.z)), level(_696)).xyz;
    float _752 = _750.x;
    float _754 = _750.y;
    float _756 = _750.z;
    float _758 = in.m_70.y;
    float _760 = gl_FragCoord.w;
    float _762 = _758 * _760;
    float _764 = in.m_70.x;
    float _766 = gl_FragCoord.w;
    float _768 = _764 * _766;
    float _770 = in.m_70.z;
    float _772 = gl_FragCoord.w;
    float _774 = _770 * _772;
    float _776 = spvFAdd(_462, 9.9999997473787516355514526367188e-06);
    float _778 = 1.0 / _776;
    float _780 = _176 * _762;
    float _782 = _176 * _768;
    float _784 = _456 * _778;
    float _786 = _780 * _780;
    float _788 = spvFAdd(_462, 9.9999997473787516355514526367188e-06);
    float _790 = _436 * _778;
    float _792 = _176 * _774;
    float _794 = fma(_782, _782, _786);
    float _796 = 1.0 / _788;
    float _798 = fma(_792, _792, _794);
    float _800 = rsqrt(_798);
    float _802 = _432 * _796;
    float _804 = _780 * _800;
    float _806 = _782 * _800;
    float _808 = 1.0 / _788;
    float _810 = _792 * _800;
    float _812 = _806 * _790;
    float _814 = in.m_72.w;
    float _816 = gl_FragCoord.w;
    float _818 = _814 * _816;
    float _820 = _802 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _822 = in.m_72.z;
    float _824 = gl_FragCoord.w;
    float _826 = _822 * _824;
    float _828 = fma(_790, (*spvDescriptorSet0.fp_c9)._m0[69].x, _820);
    float _830 = _432 * _808;
    float _832 = -_830;
    float _834 = -_812;
    float _836 = fma(_804, _832, _834);
    float _838 = -_784;
    float _840 = fma(_810, _838, _836);
    float _842 = precise::clamp(_840, 0.0, 1.0);
    float _844 = fma(_784, (*spvDescriptorSet0.fp_c9)._m0[69].z, _828);
    float _846 = in.m_72.y;
    float _848 = gl_FragCoord.w;
    float _850 = _846 * _848;
    float _852 = in.m_72.x;
    float _854 = gl_FragCoord.w;
    float _856 = _852 * _854;
    float _858 = _176 * _826;
    float _860 = _184 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _862 = fma(_180, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _860);
    float _864 = fma(_182, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _862);
    float _866 = _176 * _850;
    float _868 = _176 * _818;
    float _870 = _184 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _872 = _176 * _856;
    float _874 = fma(_180, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _870);
    float _876 = _864 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _878 = fma(_182, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _874);
    float _880 = trunc(_876);
    int _882 = int(_880);
    float _884 = _878 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _886 = trunc(_884);
    int _888 = int(_886);
    int _890 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _892 = _882 + _890;
    int _894 = _892 + 1;
    bool _896 = _894 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    int _898 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _900 = _888 + _898;
    int _902 = _900 + 1;
    int _904 = _894 | _902;
    bool _906 = _904 < 0;
    bool _908 = _906 || _896;
    bool _910 = _902 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _912 = _910 || _908;
    float _914 = _722 * _732;
    float _916 = _726 * _736;
    float _918 = _724 * _734;
    float _920 = -_868;
    float _922 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _924 = _920 + _922;
    float _926 = _722;
    if (_912)
    {
        _926 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _928 = _926;
    float _930 = _928;
    if (!_912)
    {
        int _932 = _902 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _934 = _932 + _894;
        float _936 = floor(_884);
        int _938 = _934 << 2;
        int _940 = _934 >> 2;
        int _942 = 12 & _938;
        float _944 = floor(_876);
        int _946 = _940 << 4;
        int _948 = _946 + _942;
        int _950 = _948 + 16256;
        uint _952 = uint(int(uint(_950) >> uint(2)));
        uint _954 = uint(int(uint(int(_952)) >> uint(2)));
        int _956 = int(_952) & 3;
        float _958 = (*spvDescriptorSet0.fp_c9)._m0[int(_954)][_956];
        float _960 = -_936;
        float _962 = _884 + _960;
        float _964 = -_944;
        float _966 = _876 + _964;
        float _968 = rint(_958);
        float _970 = precise::max(_968, 0.0);
        uint _972 = uint(_970);
        uint _974 = clamp(_972, 0u, 65535u);
        float3 _2800 = float3(_966, _962, float(int(_974)));
        float3 _2802 = select(_2800, float3(0.0), isnan(_2800));
        float _976 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, _2802.xy, uint(rint(_2802.z))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, _2802.xy, uint(rint(_2802.z))).x;
        int _978 = _934 << 4;
        int _980 = _978 + 17904;
        int _982 = _948 + 24304;
        uint _984 = uint(int(uint(_982) >> uint(2)));
        uint _986 = uint(int(uint(int(_984)) >> uint(2)));
        int _988 = int(_984) & 3;
        float _990 = (*spvDescriptorSet0.fp_c9)._m0[int(_986)][_988];
        uint _992 = uint(int(uint(_980) >> uint(2)));
        uint _994 = uint(int(uint(int(_992)) >> uint(2)));
        int _996 = int(_992) & 3;
        float _998 = (*spvDescriptorSet0.fp_c9)._m0[int(_994)][_996];
        int _1000 = int(_992) + 1;
        uint _1002 = uint(int(uint(_1000) >> uint(2)));
        int _1004 = _1000 & 3;
        float _1006 = (*spvDescriptorSet0.fp_c9)._m0[int(_1002)][_1004];
        int _1008 = _980 + 8;
        uint _1010 = uint(int(uint(_1008) >> uint(2)));
        uint _1012 = uint(int(uint(int(_1010)) >> uint(2)));
        int _1014 = int(_1010) & 3;
        float _1016 = (*spvDescriptorSet0.fp_c9)._m0[int(_1012)][_1014];
        int _1018 = int(_1010) + 1;
        uint _1020 = uint(int(uint(_1018) >> uint(2)));
        int _1022 = _1018 & 3;
        float _1024 = (*spvDescriptorSet0.fp_c9)._m0[int(_1020)][_1022];
        float _1026 = _184 * _1006;
        float _1028 = fma(_180, _998, _1026);
        float _1030 = 1.0 / _990;
        float _1032 = fma(_182, _1016, _1028);
        float _1034 = _1032 + _1024;
        float _1036 = precise::clamp(_1034, 0.0, 1.0);
        float _1038 = _990 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _1040 = -_1036;
        float _1042 = _1040 + _976;
        float _1044 = fma(_1030, (*spvDescriptorSet0.fp_c13)._m0[4].w, _1042);
        float _1046 = _1038 * _1044;
        float _1048 = exp2(_1046);
        float _1050 = 0.0 + _1048;
        float _1052 = precise::clamp(_1050, 0.0, 1.0);
        float _1054 = precise::min(_1052, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _930 = _1054;
    }
    float _1056 = _930;
    float _1058 = precise::max(0.0, _804);
    float _1060 = _924 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _1062 = precise::clamp(_1060, 0.0, 1.0);
    float _1064 = -_1056;
    float _1066 = _1064 + 1.0;
    float _1068 = precise::min(_1058, 0.100000001490116119384765625);
    float _1070 = precise::max(_260, 0.25);
    float _1072 = fma(_1062, _1066, _1056);
    float _1074 = fma(_1068, 10.0, -1.0);
    float _1076 = _752 * 0.4774648249149322509765625;
    float _1078 = _1070 + _1074;
    float _1080 = fma(_844, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _1082 = -(*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _1084 = _1082 + 1.0;
    float _1086 = abs(_432);
    bool _1088 = _1086 > 0.00999999977648258209228515625;
    float _1090 = _842 * (-9.27999973297119140625);
    float _1092 = fma(_1080, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1094 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].y, _1084);
    float _1096 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].z, _1084);
    float _1098 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _1100 = fma(_1098, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1102 = _1094 * (*spvDescriptorSet0.fp_c11)._m0[39].w;
    float _1104 = abs(_1092);
    float _1106 = log2(_1104);
    float _1108 = _1088 ? _432 : 0.00999999977648258209228515625;
    float _1110 = _462 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _1112 = _1078 * 4.0;
    float _1114 = precise::clamp(_1112, 0.0, 1.0);
    float _1116 = precise::min(_1102, (*spvDescriptorSet0.fp_c11)._m0[13].x);
    float _1118 = fma((*spvDescriptorSet0.fp_c11)._m0[45].w, 2.0, -0.5);
    float _1120 = precise::clamp(_1118, 0.0, 1.0);
    float _1122 = _1108 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _1124 = _754 * 0.4774648249149322509765625;
    float _1126 = exp2(_1090);
    float _1128 = -_1116;
    float _1130 = _1128 + 1.0;
    float _1132 = _564 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1134 = precise::max(_1122, -127.0);
    float _1136 = _756 * 0.4774648249149322509765625;
    float _1138 = _1120 * _1130;
    float _1140 = _1106 * 1.5;
    float _1142 = -_1134;
    float _1144 = exp2(_1142);
    float _1146 = _746 * 0.2820948064327239990234375;
    float _1148 = -(*spvDescriptorSet0.fp_c11)._m0[13].y;
    float _1150 = _1148 + (*spvDescriptorSet0.fp_c11)._m0[13].z;
    float _1152 = fma(_1138, _1150, (*spvDescriptorSet0.fp_c11)._m0[13].y);
    float _1154 = exp2(_1140);
    float _1156 = -(*spvDescriptorSet0.fp_c11)._m0[45].w;
    float _1158 = fma(_1152, (*spvDescriptorSet0.fp_c11)._m0[45].w, _1156);
    float _1160 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _1162 = 1.0 / _1134;
    float _1164 = -_1144;
    float _1166 = _1164 + 1.0;
    float _1168 = -_1160;
    float _1170 = exp2(_1168);
    float _1172 = _1154 * 12.56637096405029296875;
    float _1174 = 1.0 / _1172;
    float _1176 = _1170 * _1166;
    float _1178 = _866 * 0.18672408163547515869140625;
    float _1180 = exp2(_1132);
    float _1182 = _1176 * _1162;
    float _1184 = fma(_872, 0.095146648585796356201171875, _1178);
    float _1186 = _1182 * _1110;
    float _1188 = fma(_858, 0.0364394821226596832275390625, _1184);
    float _1190 = _1146 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1192 = -_1186;
    float _1194 = exp2(_1192);
    float _1196 = precise::max(_1188, 0.00999999977648258209228515625);
    float _1198 = _1100 * _1174;
    float _1200 = 0.0 + _728;
    float _1202 = precise::clamp(_1200, 0.0, 1.0);
    float _1204 = fma(_1076, (*spvDescriptorSet0.fp_c9)._m0[68].x, _1190);
    float _1206 = -_1180;
    float _1208 = _1206 + 1.0;
    float _1210 = _748 * _1202;
    float _1212 = _1146 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _1214 = 1.0 / _1196;
    float _1216 = _1208 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1218 = _1210 * _1114;
    float _1220 = fma(_1124, (*spvDescriptorSet0.fp_c9)._m0[68].y, _1212);
    float _1222 = _1146 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _1224 = fma(_1218, _1158, (*spvDescriptorSet0.fp_c11)._m0[45].w);
    float _1226 = _1220 * 0.586610972881317138671875;
    float _1228 = fma(_1136, (*spvDescriptorSet0.fp_c9)._m0[68].z, _1222);
    float _1230 = -_1224;
    float _1232 = _1230 + 1.0;
    float _1234 = fma(_1204, 0.298911988735198974609375, _1226);
    float _1236 = -_1194;
    float _1238 = _1236 + 1.0;
    float _1240 = _1232 * _1232;
    float _1242 = fma(_1228, 0.114477999508380889892578125, _1234);
    float _1244 = fma(_1224, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _1246 = _1238 * _1198;
    float _1248 = _1242 * _1214;
    float _1250 = precise::min(_1240, _1126);
    float _1252 = _1096 + (-1.0);
    float _1254 = fma(_1224, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _1256 = fma(_1224, -0.572000026702880859375, 1.03999996185302734375);
    float _1258 = precise::min(_1248, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1260 = fma(_1232, _1250, _1244);
    float _1262 = fma(_1218, _1252, 1.0);
    float _1264 = precise::min(_1072, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _1266 = -_1216;
    float _1268 = _1266 + 1.0;
    float _1270 = fma(_1260, 1.03999996185302734375, _1254);
    float _1272 = precise::clamp(_1270, 0.0, 1.0);
    float _1274 = fma(_1260, -1.03999996185302734375, _1256);
    float _1276 = precise::clamp(_1274, 0.0, 1.0);
    float _1278 = _1258 * 0.31830990314483642578125;
    float _1280 = _1264 * _1246;
    float _1282 = _1262 * _1272;
    float _1284 = _1216 * _1194;
    float _1286 = fma(_1276, 0.039999999105930328369140625, _1282);
    float _1288 = _1194 * _1268;
    float _1290 = _1286 * _1278;
    float _1292 = _1280 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1294 = (*spvDescriptorSet0.fp_c11)._m0[35].x * 1.60000002384185791015625;
    float _1296 = _872 * _1290;
    float _1298 = fma(_740, _1284, _1292);
    float _1300 = _1280 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1302 = _866 * _1290;
    float _1304 = _858 * _1290;
    float _1306 = precise::max(0.0, _1296);
    float _1308 = _914 * _1294;
    float _1310 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _1312 = _462 + _1310;
    float _1314 = _918 * _1294;
    float _1316 = _1280 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1318 = fma(_742, _1284, _1300);
    float _1320 = _916 * _1294;
    float _1322 = fma(_1288, _1306, _1298);
    float _1324 = _1312 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _1326 = precise::clamp(_1324, 0.0, 1.0);
    float _1328 = precise::max(0.0, _1308);
    float _1330 = fma(_744, _1284, _1316);
    float _1332 = precise::max(0.0, _1302);
    float _1334 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _1336 = _462 + _1334;
    float _1338 = precise::max(0.0, _1314);
    float _1340 = _1288 * _1328;
    float _1342 = precise::max(0.0, _1320);
    float _1344 = _1336 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _1346 = precise::clamp(_1344, 0.0, 1.0);
    float _1348 = precise::max(0.0, _1304);
    float _1350 = fma(_1288, _1332, _1318);
    float _1352 = _1288 * _1338;
    float _1354 = _1288 * _1342;
    float _1356 = fma(_1326, _1340, _1322);
    float _1358 = fma(_1288, _1348, _1330);
    float _1360 = fma(_1346, _1340, _1322);
    float _1362 = fma(_1326, _1352, _1350);
    float _1364 = fma(_1346, _1352, _1350);
    float _1366 = fma(_1326, _1354, _1358);
    float _1368 = fma(_1346, _1354, _1358);
    out.m_75.x = _1356;
    out.m_75.y = _1362;
    out.m_75.z = _1366;
    out.m_75.w = 1.0;
    out.m_77.x = _1360;
    out.m_77.y = _1364;
    out.m_77.z = _1368;
    out.m_77.w = 1.0;
    return out;
}

