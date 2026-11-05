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

struct _29
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c11 [[id(3)]];
    constant _16* fp_c4 [[id(4)]];
    const device _29* fp_s0 [[id(5)]];
    texture2d_array<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
    texture2d<float> fp_t_tcb_14 [[id(12)]];
    sampler fp_t_tcb_14Smplr [[id(13)]];
    texture2d<float> fp_t_tcb_18 [[id(14)]];
    sampler fp_t_tcb_18Smplr [[id(15)]];
    texture3d<float> fp_t_tcb_1C [[id(16)]];
    sampler fp_t_tcb_1CSmplr [[id(17)]];
    texture2d<float> fp_t_tcb_1A [[id(18)]];
    sampler fp_t_tcb_1ASmplr [[id(19)]];
    texture2d_array<float> fp_t_tcb_E [[id(20)]];
    sampler fp_t_tcb_ESmplr [[id(21)]];
    texture3d<float> fp_t_tcb_1E [[id(22)]];
    sampler fp_t_tcb_1ESmplr [[id(23)]];
    texture2d<float> fp_t_tcb_10 [[id(24)]];
    sampler fp_t_tcb_10Smplr [[id(25)]];
    texture2d<float> fp_t_tcb_12 [[id(26)]];
    sampler fp_t_tcb_12Smplr [[id(27)]];
    sampler fp_t_tcb_8Smplr_w [[id(28)]];
    sampler fp_t_tcb_ASmplr_w [[id(29)]];
    sampler fp_t_tcb_CSmplr_w [[id(30)]];
    sampler fp_t_tcb_14Smplr_w [[id(31)]];
    sampler fp_t_tcb_18Smplr_w [[id(32)]];
    sampler fp_t_tcb_1CSmplr_w [[id(33)]];
    sampler fp_t_tcb_1ASmplr_w [[id(34)]];
    sampler fp_t_tcb_ESmplr_w [[id(35)]];
    sampler fp_t_tcb_1ESmplr_w [[id(36)]];
    sampler fp_t_tcb_10Smplr_w [[id(37)]];
    sampler fp_t_tcb_12Smplr_w [[id(38)]];
    constant dm_border_t* dm_border [[id(39)]];
};

struct main0_out
{
    float4 m_77 [[color(0)]];
    float4 m_79 [[color(1)]];
};

struct main0_in
{
    float4 m_68 [[user(locn1)]];
    float4 m_72 [[user(locn3)]];
    float4 m_70 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _86 = as_type<int>((*spvDescriptorSet0.fp_c7)._m0[11].z) * as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].z);
    int _88 = _86 + as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].w);
    int _90 = _88 * 96;
    int _92 = _90 + 80;
    uint _95 = uint(int(uint(_92) >> uint(2)));
    float _98 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_95)]);
    int _100 = _90 + 16;
    int _102 = _90 + 24;
    uint _104 = uint(int(uint(_100) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_104)];
    float _106 = as_type<float>(_dmw1.x);
    int _108 = _100 + 4;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    float _112 = as_type<float>(_dmw1.y);
    uint _114 = uint(int(uint(_102) >> uint(2)));
    float _116 = as_type<float>(_dmw1.z);
    int _118 = _102 + 4;
    uint _120 = uint(int(uint(_118) >> uint(2)));
    float _122 = as_type<float>(_dmw1.w);
    float _124 = gl_FragCoord.w;
    float _126 = in.m_68.z;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_68.w;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = 1.0 / _124;
    float _140 = _138 * _130;
    float _142 = _138 * _136;
    int _144 = as_type<int>(_98) << 6;
    int _146 = _144 + 25904;
    uint _148 = uint(int(uint(_146) >> uint(2)));
    uint _150 = uint(int(uint(int(_148)) >> uint(2)));
    int _152 = int(_148) & 3;
    float _154 = (*spvDescriptorSet0.fp_c9)._m0[int(_150)][_152];
    int _156 = int(_148) + 1;
    uint _158 = uint(int(uint(_156) >> uint(2)));
    int _160 = _156 & 3;
    float _162 = (*spvDescriptorSet0.fp_c9)._m0[int(_158)][_160];
    float _164 = fma(_140, _106, _116);
    float _166 = fma(_142, _112, _122);
    float _168 = _164 * _154;
    float _170 = _166 * _162;
    float2 _1435;
    _1435.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_168, _170));
    _1435.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_168, _170));
    float _172 = _1435.x;
    float _174 = _172 * 256.0;
    int _176 = int(_174);
    float _178 = in.m_70.z;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = in.m_70.x;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = in.m_70.y;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    int _196 = _90 + 8;
    uint _198 = uint(int(uint(_90) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_198)];
    float _200 = as_type<float>(_dmw0.x);
    int _202 = _90 + 4;
    uint _204 = uint(int(uint(_202) >> uint(2)));
    float _206 = as_type<float>(_dmw0.y);
    int _208 = _90 + 68;
    int _210 = _90 + 64;
    uint _212 = uint(int(uint(_196) >> uint(2)));
    float _214 = as_type<float>(_dmw0.z);
    int _216 = _196 + 4;
    uint _218 = uint(int(uint(_216) >> uint(2)));
    float _220 = as_type<float>(_dmw0.w);
    uint _222 = uint(int(uint(_208) >> uint(2)));
    float _224 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_222)]);
    uint _226 = uint(int(uint(_210) >> uint(2)));
    float _228 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_226)]);
    float _230 = _138 * _182;
    float _232 = _138 * _188;
    float _234 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _236 = _230 + _234;
    float _238 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _240 = _232 + _238;
    float _242 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _244 = _232 + _242;
    float _246 = _236 * _236;
    float _248 = fma(_240, _240, _246);
    float _250 = sqrt(_248);
    bool _254 = _250 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _256 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _258 = _250 + _256;
    float _260 = _246;
    float _262 = _258;
    float _264 = as_type<float>(_90);
    if (_254)
    {
        float _266 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _260 = _266;
    }
    float _268 = _260;
    float _270 = 0.0;
    if (_254)
    {
        float _272 = rsqrt(_248);
        _270 = _272;
    }
    float _274 = _270;
    float _276 = _274;
    if (_254)
    {
        float _278 = _258 * _268;
        _262 = _278;
    }
    float _280 = _262;
    float _282 = 0.0;
    if (_254)
    {
        float _284 = _280 * 0.15915493667125701904296875;
        _282 = _284;
    }
    float _286 = _282;
    float _288 = _138 * _194;
    float _290 = 0.0;
    float _292 = _194;
    if (_254)
    {
        float _294 = _286 * 6.283185482025146484375;
        float _296 = cos(_294);
        _290 = _296;
    }
    float _298 = _290;
    if (_254)
    {
        float _300 = _288 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _292 = _300;
    }
    float _302 = _292;
    float _304 = _268;
    float _306 = _302;
    if (_254)
    {
        float _308 = _286 * 6.283185482025146484375;
        float _310 = sin(_308);
        _304 = _310;
    }
    float _312 = _304;
    float _314 = 0.0;
    if (_254)
    {
        float _316 = _298 + (-1.0);
        _314 = _316;
    }
    float _318 = _314;
    float _320 = 0.0;
    float _322 = _318;
    if (_254)
    {
        float _324 = _318 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _320 = _324;
    }
    float _326 = _320;
    if (!_254)
    {
        _322 = _232;
    }
    float _328 = _322;
    float _330 = 0.0;
    float _332 = _312;
    float _334 = _328;
    if (_254)
    {
        float _336 = fma(_312, _302, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _330 = _336;
    }
    float _338 = _330;
    if (!_254)
    {
        _332 = _288;
    }
    float _340 = _332;
    float _342 = _340;
    if (_254)
    {
        float _344 = fma(_288, _298, _326);
        _342 = _344;
    }
    float _346 = _342;
    if (!_254)
    {
        _306 = _230;
    }
    float _348 = _306;
    float _350 = _348;
    if (_254)
    {
        float _352 = _274 * _338;
        _276 = _352;
    }
    float _354 = _276;
    float _356 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _358 = _346 + _356;
    float _360 = 1.4012984643248170709237295832899e-45;
    if (_254)
    {
        float _362 = fma(_240, _354, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _334 = _362;
    }
    float _364 = _334;
    if (_254)
    {
        float _366 = fma(_236, _354, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _350 = _366;
    }
    float _368 = _350;
    float _370 = _358 * _358;
    float _372 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _374 = _364 + _372;
    float _376 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _378 = _368 + _376;
    int _380 = 1 & as_type<int>((*spvDescriptorSet0.fp_c9)._m0[40].w);
    bool _382 = _380 != 0;
    float _384 = fma(_374, _374, _370);
    float _386 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _388 = fma(_378, _378, _384);
    float _390 = precise::max(0.0, _386);
    float _392 = rsqrt(_388);
    float _394 = _392 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _396 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _398 = _288 + _396;
    float _400 = _374 * _394;
    float _402 = _378 * _394;
    float _404 = _398 * _398;
    float _406 = -_394;
    float _408 = -_390;
    float _410 = fma(_358, _406, _408);
    float _412 = _400 * _400;
    float _414 = _402 * _402;
    float _416 = fma(_244, _244, _404);
    float _418 = _412 + _414;
    float _420 = sqrt(_418);
    bool _422 = _420 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _424 = _404;
    float _426 = _410;
    float _428 = _402;
    if (!_422)
    {
        _360 = _414;
    }
    float _430 = _360;
    float _432 = _430;
    if (!_422)
    {
        _424 = _412;
    }
    float _434 = _424;
    float _436 = _434;
    if (!_422)
    {
        _264 = _400;
    }
    float _438 = _264;
    bool _440 = !_422;
    float _442 = _438;
    if (!_440)
    {
        float _444 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _446 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _448 = _420 + _446;
        float _450 = rsqrt(_418);
        float _452 = _448 * _444;
        float _454 = _410 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _456 = _452 * 0.15915493667125701904296875;
        float _458 = _456 * 6.283185482025146484375;
        float _460 = sin(_458);
        float _462 = _456 * 6.283185482025146484375;
        float _464 = cos(_462);
        float _466 = fma(_460, _454, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _468 = _450 * _466;
        float _470 = _464 + (-1.0);
        float _472 = _402 * _468;
        float _474 = _470 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _476 = _400 * _468;
        float _478 = _472 * _472;
        float _480 = fma(_410, _464, _474);
        float _482 = _476 * _476;
        _426 = _480;
        _436 = _482;
        _432 = _478;
        _442 = _476;
        _428 = _472;
    }
    float _484 = _426;
    float _486 = _436;
    float _488 = _432;
    float _490 = _442;
    float _492 = _428;
    float _494 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _496 = _230 + _494;
    float _498 = in.m_72.y;
    float _500 = gl_FragCoord.w;
    float _502 = _498 * _500;
    float _504 = fma(_142, _206, _220);
    float _506 = fma(_496, _496, _416);
    float _508 = in.m_72.x;
    float _510 = gl_FragCoord.w;
    float _512 = _508 * _510;
    float _514 = in.m_72.z;
    float _516 = gl_FragCoord.w;
    float _518 = _514 * _516;
    float _520 = _230 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _522 = in.m_74.w;
    float _524 = gl_FragCoord.w;
    float _526 = _522 * _524;
    float _528 = fma(_484, _484, _486);
    float _530 = fma(_230, 6.2500002968590706586837768554688e-05, 0.5);
    float _532 = precise::clamp(_530, 0.0, 1.0);
    float _534 = fma(_140, _200, _214);
    float _536 = fma(_232, 6.2500002968590706586837768554688e-05, 0.5);
    float _538 = precise::clamp(_536, 0.0, 1.0);
    int _540 = _144 + 25912;
    uint _542 = uint(int(uint(_540) >> uint(2)));
    uint _544 = uint(int(uint(int(_542)) >> uint(2)));
    int _546 = int(_542) & 3;
    float _548 = (*spvDescriptorSet0.fp_c9)._m0[int(_544)][_546];
    int _550 = int(_542) + 1;
    uint _552 = uint(int(uint(_550) >> uint(2)));
    int _554 = _550 & 3;
    float _556 = (*spvDescriptorSet0.fp_c9)._m0[int(_552)][_554];
    float _558 = _232 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _560 = _288 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _562 = _528 + _488;
    float _564 = _520 * (*spvDescriptorSet0.fp_c11)._m0[30].z;
    float _566 = _558 * (*spvDescriptorSet0.fp_c11)._m0[30].x;
    float _568 = _560 * (*spvDescriptorSet0.fp_c11)._m0[30].y;
    int _570 = _144 + 25920;
    uint _572 = uint(int(uint(_570) >> uint(2)));
    uint _574 = uint(int(uint(int(_572)) >> uint(2)));
    int _576 = int(_572) & 3;
    float _578 = (*spvDescriptorSet0.fp_c9)._m0[int(_574)][_576];
    int _580 = int(_572) + 1;
    uint _582 = uint(int(uint(_580) >> uint(2)));
    int _584 = _580 & 3;
    float _586 = (*spvDescriptorSet0.fp_c9)._m0[int(_582)][_584];
    float _588 = fma(_564, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].z);
    float _590 = fma(_566, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].x);
    float _592 = fma(_568, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].y);
    float _594 = gl_FragCoord.x;
    float _596 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _598 = _594 / _596;
    float _600 = gl_FragCoord.y;
    float _602 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _604 = _600 / _602;
    float _606 = rsqrt(_562);
    float _608 = float(uint(_176));
    int _610 = _144 + 25936;
    uint _612 = uint(int(uint(_610) >> uint(2)));
    uint _614 = uint(int(uint(int(_612)) >> uint(2)));
    int _616 = int(_612) & 3;
    float _618 = (*spvDescriptorSet0.fp_c9)._m0[int(_614)][_616];
    int _620 = int(_612) + 1;
    uint _622 = uint(int(uint(_620) >> uint(2)));
    int _624 = _620 & 3;
    float _626 = (*spvDescriptorSet0.fp_c9)._m0[int(_622)][_624];
    float _628 = _504 * _162;
    float _630 = _534 * _154;
    float _632 = sqrt(_506);
    float _634 = _166 * _556;
    float _636 = _138 * _512;
    float _638 = _164 * _548;
    int _640 = _144 + 25952;
    uint _642 = uint(int(uint(_640) >> uint(2)));
    uint _644 = uint(int(uint(int(_642)) >> uint(2)));
    int _646 = int(_642) & 3;
    float _648 = (*spvDescriptorSet0.fp_c9)._m0[int(_644)][_646];
    float _650 = _606 * _490;
    float _652 = _606 * _484;
    float _654 = _166 * _586;
    float _656 = _138 * _502;
    float _658 = _608 * 0.00390625;
    float _660 = _138 * _518;
    float _662 = _138 * _526;
    float _664 = _164 * _578;
    float _666 = _606 * _492;
    int _668 = _144 + 25944;
    uint _670 = uint(int(uint(_668) >> uint(2)));
    uint _672 = uint(int(uint(int(_670)) >> uint(2)));
    int _674 = int(_670) & 3;
    float _676 = (*spvDescriptorSet0.fp_c9)._m0[int(_672)][_674];
    float _678 = precise::max(_224, _618);
    float _680 = precise::max(_678, _658);
    float _682 = _650 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _684 = _598 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float2 _2239;
    _2239.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_630, _628));
    _2239.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_630, _628));
    float _686 = _2239.x;
    float _688 = _686 * 256.0;
    int _690 = int(_688);
    float2 _2249;
    _2249.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_638, _634));
    _2249.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_638, _634));
    float _692 = _2249.x;
    float _694 = _692 * 256.0;
    int _696 = int(_694);
    float2 _2259;
    _2259.x = spvDescriptorSet0.fp_t_tcb_C.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_664, _654));
    _2259.y = spvDescriptorSet0.fp_t_tcb_C.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_664, _654));
    float _698 = _2259.x;
    float _700 = _698 * 256.0;
    int _702 = int(_700);
    float _704 = _604 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float _706 = -_682;
    float _708 = fma(_652, (*spvDescriptorSet0.fp_c9)._m0[69].y, _706);
    float _710 = rint(_648);
    float _712 = precise::max(_710, 0.0);
    uint _714 = uint(_712);
    uint _716 = clamp(_714, 0u, 65535u);
    float2 _2289 = float2(_684, _704);
    float2 _720 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2289, float2(0.0), isnan(_2289))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2289, float2(0.0), isnan(_2289))).xy;
    float _722 = _720.x;
    float _724 = _720.y;
    float2 _2303 = float2(_684, _704);
    float _726 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2303, float2(0.0), isnan(_2303))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2303, float2(0.0), isnan(_2303))).x;
    float3 _2312 = float3(_590, _592, _588);
    float _728 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_2312, float3(0.0), isnan(_2312))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_2312, float3(0.0), isnan(_2312))).x;
    float3 _2325 = float3(_168, _170, float(int(_716)));
    float3 _2327 = select(_2325, float3(0.0), isnan(_2325));
    float2 _730 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2327.xy, uint(rint(_2327.z)), level(_680)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2327.xy, uint(rint(_2327.z)), level(_680)).yz;
    float _732 = _730.x;
    float _734 = _730.y;
    float _736 = -_666;
    float _738 = fma(_736, (*spvDescriptorSet0.fp_c9)._m0[69].z, _708);
    float _740 = _662 * (*spvDescriptorSet0.fp_c9)._m0[62].y;
    float _742 = fma(_738, 0.5, 0.5);
    float _744 = fma(_738, -0.5, 0.5);
    float _746 = precise::max(_228, _618);
    float _748 = fma(_742, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _750 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _752 = fma(_632, (*spvDescriptorSet0.fp_c9)._m0[63].x, _750);
    float _754 = precise::clamp(_752, 0.0, 1.0);
    float _756 = (-1.0) + (*spvDescriptorSet0.fp_c9)._m0[62].z;
    float _758 = precise::max(_224, _626);
    float _760 = fma(_742, _748, -0.212114393711090087890625);
    float _762 = -_754;
    float _764 = _762 + 1.0;
    float _766 = precise::max(_224, _676);
    float _768 = -_740;
    float _770 = fma(_756, _768, 1.0);
    float _772 = fma(_742, _760, 1.570728778839111328125);
    float _774 = sqrt(_744);
    float _776 = abs(_764);
    float _778 = log2(_776);
    float _780 = log2(_770);
    float _782 = float(uint(_690));
    float _784 = float(uint(_696));
    float _786 = _656 * _656;
    float _788 = float(uint(_702));
    float _790 = _782 * 0.00390625;
    float _792 = _784 * 0.00390625;
    float _794 = fma(_636, _636, _786);
    float _796 = fma(_722, 2.0, -1.0);
    float _798 = precise::max(_746, _790);
    float _800 = fma(_724, 2.0, -1.0);
    float _802 = precise::max(_758, _792);
    float _804 = fma(_660, _660, _794);
    float _806 = _788 * 0.00390625;
    float _808 = fma(_796, (*spvDescriptorSet0.fp_c9)._m0[983].z, _684);
    float _810 = fma(_800, (*spvDescriptorSet0.fp_c9)._m0[983].w, _704);
    float _812 = gl_FragCoord.x;
    float _814 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _816 = _812 / _814;
    float _818 = gl_FragCoord.y;
    float _820 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _822 = _818 / _820;
    float3 _2472 = float3(_638, _634, float(int(_716)));
    float3 _2474 = select(_2472, float3(0.0), isnan(_2472));
    float3 _826 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2474.xy, uint(rint(_2474.z)), level(_802)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2474.xy, uint(rint(_2474.z)), level(_802)).xyz;
    float _828 = _826.x;
    float _830 = _826.y;
    float _832 = _826.z;
    float _834 = precise::max(_766, _806);
    float _836 = _778 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    bool _838 = !_382;
    float _840 = _838 ? _684 : _808;
    float _842 = rsqrt(_804);
    float3 _2505 = float3(_664, _654, float(int(_716)));
    float3 _2507 = select(_2505, float3(0.0), isnan(_2505));
    float3 _844 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2507.xy, uint(rint(_2507.z)), level(_834)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2507.xy, uint(rint(_2507.z)), level(_834)).xyz;
    float _846 = _844.x;
    float _848 = _844.y;
    float _850 = _844.z;
    float2 _2520 = float2(_538, _532);
    float _852 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2520, float2(0.0), isnan(_2520))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2520, float2(0.0), isnan(_2520))).x;
    float3 _2531 = float3(_630, _628, float(int(_716)));
    float3 _2533 = select(_2531, float3(0.0), isnan(_2531));
    float _854 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2533.xy, uint(rint(_2533.z)), level(_798)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2533.xy, uint(rint(_2533.z)), level(_798)).x;
    bool _856 = !_382;
    float _858 = _856 ? _704 : _810;
    float _860 = exp2(_836);
    float3 _2549 = float3(_840, _858, float(1));
    float3 _2551 = select(_2549, float3(0.0), isnan(_2549));
    float2 _862 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2551.xy, uint(rint(_2551.z))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2551.xy, uint(rint(_2551.z))).xy;
    float _864 = _862.x;
    float _866 = _862.y;
    float3 _2562 = float3(_840, _858, float(0));
    float3 _2564 = select(_2562, float3(0.0), isnan(_2562));
    float _868 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2564.xy, uint(rint(_2564.z))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2564.xy, uint(rint(_2564.z))).z;
    float _870 = _636 * _842;
    float _872 = _652 + 1.0;
    float _874 = _780 * 0.693147182464599609375;
    float _876 = _774 * 0.636619746685028076171875;
    float _878 = _656 * _842;
    float _880 = _660 * _842;
    float _882 = _874 * (*spvDescriptorSet0.fp_c9)._m0[62].w;
    float _884 = -_772;
    float _886 = fma(_876, _884, 1.0);
    float _888 = -_652;
    float _890 = fma(_860, _872, _888);
    float _892 = -_704;
    float _894 = _892 + 1.0;
    float _896 = _816 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _898 = _822 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float _900 = _684 + (*spvDescriptorSet0.fp_c9)._m0[992].x;
    float _902 = fma(_890, 0.5, 0.5);
    float _904 = _894 + (*spvDescriptorSet0.fp_c9)._m0[992].y;
    float3 _2626 = float3(_896, _898, _882);
    float _906 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_2626, float3(0.0), isnan(_2626))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_2626, float3(0.0), isnan(_2626))).x;
    float2 _2634 = float2(_808, _810);
    float4 _909 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2634, float2(0.0), isnan(_2634))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2634, float2(0.0), isnan(_2634))).xyzw;
    float _911 = _909.x;
    float _913 = _909.y;
    float _915 = _909.z;
    float _917 = _909.w;
    float2 _2650 = float2(_886, _902);
    float3 _919 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2650, float2(0.0), isnan(_2650))), spvDescriptorSet0.dm_border, 10u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2650, float2(0.0), isnan(_2650))).xyz;
    float _921 = _919.x;
    float _923 = _919.y;
    float _925 = _919.z;
    float _927 = fma(_900, 2.0, -1.0);
    float _929 = fma(_904, 2.0, -1.0);
    float _931 = -_726;
    float _933 = fma(_931, (*spvDescriptorSet0.fp_c4)._m0[14].w, 1.0);
    float _935 = -(*spvDescriptorSet0.fp_c9)._m0[1007].y;
    float _937 = _935 + (*spvDescriptorSet0.fp_c9)._m0[1006].y;
    float _939 = fma(_878, 0.5, 0.5);
    float _941 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _943 = _288 + _941;
    float _945 = -(*spvDescriptorSet0.fp_c9)._m0[1007].x;
    float _947 = _945 + (*spvDescriptorSet0.fp_c9)._m0[1006].x;
    float _949 = fma(_939, _937, (*spvDescriptorSet0.fp_c9)._m0[1007].y);
    float _951 = 1.0 / _933;
    float _953 = -(*spvDescriptorSet0.fp_c9)._m0[1007].z;
    float _955 = _953 + (*spvDescriptorSet0.fp_c9)._m0[1006].z;
    float _957 = fma(_939, _947, (*spvDescriptorSet0.fp_c9)._m0[1007].x);
    float _959 = _949 * 0.715200006961822509765625;
    float _961 = _943 * _943;
    float _963 = fma(_939, _955, (*spvDescriptorSet0.fp_c9)._m0[1007].z);
    float _965 = _878 * _878;
    float _967 = fma(_957, 0.2125999927520751953125, _959);
    float _969 = fma(_240, _240, _961);
    float _971 = precise::max(0.0, _878);
    float _973 = fma(_870, _870, _965);
    float _975 = fma(_963, 0.072200000286102294921875, _967);
    float _977 = fma(_236, _236, _969);
    float _979 = fma(_880, _880, _973);
    float _981 = precise::clamp(_979, 0.0, 1.0);
    float _983 = _778 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _985 = 1.0 / _975;
    float _987 = precise::min(_971, 0.100000001490116119384765625);
    float _989 = -(*spvDescriptorSet0.fp_c9)._m0[1001].x;
    float _991 = _989 + (*spvDescriptorSet0.fp_c9)._m0[1000].x;
    float _993 = fma(_981, 0.5, 0.5);
    float _995 = fma(_939, _991, (*spvDescriptorSet0.fp_c9)._m0[1001].x);
    float _997 = fma(_987, 10.0, -1.0);
    float _999 = _929 * (*spvDescriptorSet0.fp_c4)._m0[17].y;
    float _1001 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _1003 = _951 * _1001;
    float _1005 = _927 * (*spvDescriptorSet0.fp_c4)._m0[17].x;
    float _1007 = -(*spvDescriptorSet0.fp_c9)._m0[1001].y;
    float _1009 = _1007 + (*spvDescriptorSet0.fp_c9)._m0[1000].y;
    float _1011 = -(*spvDescriptorSet0.fp_c9)._m0[1001].z;
    float _1013 = _1011 + (*spvDescriptorSet0.fp_c9)._m0[1000].z;
    float _1015 = _1003 * _999;
    float _1017 = precise::max(_728, 0.25);
    float _1019 = _985 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1021 = precise::clamp(_1019, 0.0, 1.0);
    float _1023 = fma(_939, _1009, (*spvDescriptorSet0.fp_c9)._m0[1001].y);
    float _1025 = fma(_939, _1013, (*spvDescriptorSet0.fp_c9)._m0[1001].z);
    float _1027 = fma(_1021, (*spvDescriptorSet0.fp_c9)._m0[39].y, (*spvDescriptorSet0.fp_c9)._m0[39].x);
    float _1029 = _1017 + _997;
    float _1031 = sqrt(_977);
    float _1033 = _1023 * 0.31830990314483642578125;
    float _1035 = _1027 * 0.31830990314483642578125;
    float _1037 = -(*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _1039 = _1015 * _1037;
    float _1041 = -(*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _1043 = _1041 + 1.0;
    float _1045 = _732 + (*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _1047 = precise::clamp(_1045, 0.0, 1.0);
    float _1049 = _957 * _1035;
    float _1051 = _949 * _1035;
    float _1053 = _963 * _1035;
    float _1055 = _995 * 0.31830990314483642578125;
    float _1057 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].x, _1043);
    float _1059 = _734 * 0.2820948064327239990234375;
    float _1061 = _828 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1063 = _1003 * _1005;
    float _1065 = _830 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1067 = -(*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _1069 = _1015 * _1067;
    float _1071 = _832 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1073 = -_1063;
    float _1075 = fma(_1073, (*spvDescriptorSet0.fp_c4)._m0[12].x, _1039);
    float _1077 = _1025 * 0.31830990314483642578125;
    float _1079 = -_1063;
    float _1081 = fma(_1079, (*spvDescriptorSet0.fp_c4)._m0[11].x, _1069);
    float _1083 = precise::max(_1061, _1055);
    float _1085 = fma(_1003, (*spvDescriptorSet0.fp_c4)._m0[12].z, _1075);
    float _1087 = precise::max(_1065, _1033);
    float _1089 = fma(_1003, (*spvDescriptorSet0.fp_c4)._m0[11].z, _1081);
    float _1091 = precise::max(_1071, _1077);
    float _1093 = _1085 + (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _1095 = -(*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _1097 = _1015 * _1095;
    float _1099 = _1089 + (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _1101 = 0.0 + _852;
    float _1103 = precise::clamp(_1101, 0.0, 1.0);
    float _1105 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _1107 = _1093 + _1105;
    float _1109 = -_1063;
    float _1111 = fma(_1109, (*spvDescriptorSet0.fp_c4)._m0[13].x, _1097);
    float _1113 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _1115 = _1099 + _1113;
    float _1117 = _1107 * _1107;
    float _1119 = _866 * 2.0;
    float _1121 = precise::clamp(_1119, 0.0, 1.0);
    float _1123 = _854 * _1103;
    float _1125 = fma(_1003, (*spvDescriptorSet0.fp_c4)._m0[13].z, _1111);
    float _1127 = fma(_1115, _1115, _1117);
    float _1129 = -_1057;
    float _1131 = fma(_1129, (*spvDescriptorSet0.fp_c11)._m0[36].z, 1.0);
    float _1133 = fma(_1121, 0.60000002384185791015625, 0.89999997615814208984375);
    float _1135 = precise::clamp(_1133, 0.0, 1.0);
    float _1137 = _1125 + (*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _1139 = fma(_1121, -0.00040000001899898052215576171875, 0.00040000001899898052215576171875);
    float _1141 = fma(_1135, -0.449999988079071044921875, 1.0);
    float _1143 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _1145 = _1137 + _1143;
    float _1147 = -_864;
    float _1149 = _1147 + 1.0;
    float _1151 = precise::max(0.0, _1131);
    float _1153 = _1139 * _1141;
    float _1155 = _1029 * 4.0;
    float _1157 = precise::clamp(_1155, 0.0, 1.0);
    float _1159 = fma(_1145, _1145, _1127);
    float _1161 = exp2(_983);
    float _1163 = _846 * 0.4774648249149322509765625;
    float _1165 = -_1149;
    float _1167 = fma(_1165, (*spvDescriptorSet0.fp_c11)._m0[46].z, 1.0);
    float _1169 = -_1153;
    float _1171 = _1139 + _1169;
    float _1173 = _848 * 0.4774648249149322509765625;
    float _1175 = _1163 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1177 = _850 * 0.4774648249149322509765625;
    float _1179 = fma(_1151, _1171, _1153);
    float _1181 = precise::min(_1167, 1.0);
    float _1183 = sqrt(_1159);
    float _1185 = _1173 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1187 = _1177 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1189 = precise::max(_1175, _1049);
    float _1191 = _1123 * _1157;
    float _1193 = precise::min(_868, _1181);
    float _1195 = -_1139;
    float _1197 = _1195 + _1179;
    float _1199 = precise::max(_1185, _1051);
    float _1201 = 1.0 / (*spvDescriptorSet0.fp_c11)._m0[40].x;
    float _1203 = precise::max(_1187, _1053);
    float _1205 = fma(_1191, _1197, _1139);
    float _1207 = precise::min(_993, _1193);
    float _1209 = fma(_1047, _1083, _1189);
    float _1211 = -_1161;
    float _1213 = _1211 + 1.0;
    float _1215 = fma(_1047, _1087, _1199);
    float _1217 = fma(_1047, _1091, _1203);
    float _1219 = _1205 * _1207;
    float _1221 = fma(_1059, (*spvDescriptorSet0.fp_c9)._m0[991].x, _1209);
    float _1223 = _1213 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1225 = _917 * _906;
    float _1227 = -_1031;
    float _1229 = _1183 + _1227;
    float _1231 = fma(_1059, (*spvDescriptorSet0.fp_c9)._m0[991].y, _1215);
    float _1233 = fma(_1059, (*spvDescriptorSet0.fp_c9)._m0[991].z, _1217);
    float _1235 = _1221 * _1219;
    float _1237 = -_1223;
    float _1239 = _1237 + 1.0;
    float _1241 = _1223 * _1225;
    float _1243 = _1231 * _1219;
    float _1245 = _1233 * _1219;
    float _1247 = _917 * _1239;
    float _1249 = precise::max(0.0, _1235);
    float _1251 = fma(_921, _1241, _911);
    float _1253 = _1229 * _1201;
    float _1255 = precise::clamp(_1253, 0.0, 1.0);
    float _1257 = precise::max(0.0, _1243);
    float _1259 = fma(_923, _1241, _913);
    float _1261 = precise::max(0.0, _1245);
    float _1263 = fma(_1247, _1249, _1251);
    float _1265 = fma(_925, _1241, _915);
    float _1267 = -_1255;
    float _1269 = _1267 + 1.0;
    float _1271 = fma(_1247, _1257, _1259);
    float _1273 = fma(_1247, _1261, _1265);
    float _1275 = -_1269;
    float _1277 = fma(_1275, _1269, 1.0);
    out.m_77.x = _1263;
    out.m_77.y = _1271;
    out.m_77.z = _1273;
    out.m_77.w = _1277;
    out.m_79.x = (*spvDescriptorSet0.fp_c11)._m0[44].z;
    return out;
}

