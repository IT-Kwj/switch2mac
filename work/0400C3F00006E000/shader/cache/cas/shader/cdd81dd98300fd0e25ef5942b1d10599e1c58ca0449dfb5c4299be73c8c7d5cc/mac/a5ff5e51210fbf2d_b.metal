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

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    device _21* cp_s0 [[id(0)]];
    device _21* cp_s1 [[id(1)]];
    device _21* cp_s2 [[id(2)]];
    device _21* cp_s3 [[id(3)]];
    device _21* cp_s4 [[id(4)]];
    device _21* cp_s5 [[id(5)]];
    device _21* cp_s6 [[id(6)]];
    device _21* cp_s7 [[id(7)]];
    device _21* cp_s8 [[id(8)]];
    device _21* cp_s9 [[id(9)]];
    device _21* cp_s10 [[id(10)]];
    texture3d<float> cp_t_tcb_12 [[id(11)]];
    sampler cp_t_tcb_12Smplr [[id(12)]];
    sampler cp_t_tcb_12Smplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _1100 = false;
    bool _840 = false;
    bool _364 = false;
    float _62 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    float _66 = as_type<float>(gl_WorkGroupID.x);
    int _69 = as_type<int>(_66) << 5;
    int _71 = _69 + as_type<int>(_64);
    float _73 = trunc(_62);
    int _75 = int(_73);
    bool _79 = _71 >= _75;
    int _81 = 0;
    if (_79)
    {
        _81 = 0;
    }
    int _83 = _81;
    int _85 = _83;
    int _87 = _83;
    if (!_79)
    {
        int _89 = _71 << 4;
        int _91 = _89 + 12;
        uint _94 = uint(int(uint(_91) >> uint(2)));
        float _96 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_94)]);
        float _98 = trunc(_96);
        int _100 = int(_98);
        bool _102 = _100 >= 1;
        int _104 = _102 ? (-1) : 0;
        if (!_102)
        {
            _85 = 0;
        }
        int _106 = _85;
        bool _108 = !_102;
        _87 = _106;
        if (!_108)
        {
            float _110 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _112 = uint(int(uint(_91) >> uint(2)));
            float _114 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_112)]);
            float _116 = float(_100);
            float _118 = -_114;
            float _120 = _110 + _118;
            bool _122 = _120 > _116;
            int _124 = as_type<int>(_110);
            if (!_122)
            {
                bool _126 = _110 >= _114;
                bool _128 = isnan(_110);
                bool _130 = _126 || _128;
                bool _132 = isnan(_114);
                bool _134 = _130 || _132;
                _104 = _134 ? (-1) : 0;
            }
            int _136 = _104;
            if (_122)
            {
                _124 = 0;
            }
            int _138 = _124;
            _87 = _138;
            if (!_122)
            {
                int _140 = ~_136;
                int _142 = (_140 != 0) ? 0 : 1;
                _87 = _142;
            }
        }
    }
    int _144 = _87;
    int _146 = _144 & 1;
    bool _148 = _146 != 0;
    if (!_148)
    {
        return;
    }
    float _150 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _152 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    int _154 = _71 << 4;
    int _156 = _154 + 12;
    float _158 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
    float _160 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    uint _162 = uint(int(uint(_156) >> uint(2)));
    float _164 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_162)]);
    float _166 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _170 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    uint _172 = uint(int(uint(_154) >> uint(2)));
    float _174 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_172)]);
    int _176 = _154 + 4;
    uint _178 = uint(int(uint(_176) >> uint(2)));
    float _180 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_178)]);
    int _182 = _154 + 8;
    uint _184 = uint(int(uint(_182) >> uint(2)));
    float _186 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_184)]);
    uint _188 = uint(int(uint(_154) >> uint(2)));
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_188)]);
    int _192 = _154 + 4;
    uint _194 = uint(int(uint(_192) >> uint(2)));
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_194)]);
    int _198 = _154 + 8;
    uint _200 = uint(int(uint(_198) >> uint(2)));
    float _202 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_200)]);
    float _204 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    uint _208 = uint(int(uint(_154) >> uint(2)));
    float _210 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_208)]);
    int _212 = _154 + 4;
    uint _214 = uint(int(uint(_212) >> uint(2)));
    float _216 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_214)]);
    int _218 = _154 + 8;
    uint _220 = uint(int(uint(_218) >> uint(2)));
    float _222 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_220)]);
    uint _224 = uint(int(uint(_154) >> uint(2)));
    float _226 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_224)]);
    uint _228 = uint(int(uint(_156) >> uint(2)));
    float _230 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_228)]);
    float _232 = abs(_152);
    float _234 = log2(_232);
    float _236 = _150 * _234;
    float _238 = exp2(_236);
    bool _240 = _158 > 0.0;
    float _242 = _150 * _160;
    float _244 = _164 * _150;
    float _246 = _166 * _242;
    float _248 = _174 * _244;
    float _250 = _186 * _244;
    float _252 = _180 * _244;
    float _254 = _168 * _242;
    float _256 = _170 * _242;
    float _258 = _202 + _250;
    float _260 = _196 + _252;
    float _262 = fma(_174, _238, _246);
    float _264 = _190 + _248;
    float _266 = fma(_180, _238, _254);
    float _268 = fma(_186, _238, _256);
    int _270 = as_type<int>(_204) & 512;
    bool _272 = _270 != 0;
    float _274 = _196;
    float _276 = _190;
    float _278 = _238;
    bool _280 = _272;
    int _282 = as_type<int>(_248);
    int _284 = as_type<int>(_248);
    if (!_240)
    {
        _274 = _264;
    }
    float _286 = _274;
    float _288 = _286;
    float _290 = _286;
    if (!_240)
    {
        _276 = _260;
    }
    float _292 = _276;
    float _294 = _292;
    float _296 = _292;
    if (!_240)
    {
        _278 = _258;
    }
    float _298 = _278;
    bool _300 = !_240;
    float _302 = _298;
    float _304 = _298;
    int _306 = as_type<int>(_216);
    int _308 = as_type<int>(_222);
    int _310 = as_type<int>(_216);
    int _312 = as_type<int>(_222);
    if (!_300)
    {
        bool _314 = !_272;
        if (!_314)
        {
            float _316 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _318 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _320 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _322 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _324 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _326 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _328 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _330 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _332 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _334 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _336 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _338 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _340 = _260 * _318;
            float _342 = _260 * _326;
            float _344 = fma(_264, _316, _340);
            float _346 = _260 * _334;
            float _348 = fma(_264, _324, _342);
            float _350 = fma(_258, _320, _344);
            float _352 = fma(_264, _332, _346);
            float _354 = fma(_258, _328, _348);
            float _356 = _322 + _350;
            float _358 = fma(_258, _336, _352);
            float _360 = _330 + _354;
            float _362 = _338 + _358;
            _290 = _356;
            _304 = _362;
            _296 = _360;
            _364 = true;
        }
        else
        {
            int _366 = as_type<int>(_204) & 1024;
            bool _368 = _366 != 0;
            bool _370 = !_368;
            if (!_370)
            {
                float _372 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                uint _374 = uint(int(uint(_154) >> uint(2)));
                float _376 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_374)]);
                int _378 = _154 + 4;
                uint _380 = uint(int(uint(_378) >> uint(2)));
                float _382 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_380)]);
                int _384 = _154 + 8;
                uint _386 = uint(int(uint(_384) >> uint(2)));
                float _388 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_386)]);
                uint _390 = uint(int(uint(_154) >> uint(2)));
                float _392 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_390)]);
                int _394 = _154 + 4;
                uint _396 = uint(int(uint(_394) >> uint(2)));
                float _398 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_396)]);
                int _400 = _154 + 8;
                uint _402 = uint(int(uint(_400) >> uint(2)));
                float _404 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_402)]);
                uint _406 = uint(int(uint(_154) >> uint(2)));
                float _408 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_406)]);
                int _410 = _154 + 4;
                uint _412 = uint(int(uint(_410) >> uint(2)));
                float _414 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_412)]);
                int _416 = _154 + 8;
                uint _418 = uint(int(uint(_416) >> uint(2)));
                float _420 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_418)]);
                float _422 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _424 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _426 = _260 * _382;
                float _428 = _260 * _398;
                float _430 = fma(_264, _376, _426);
                float _432 = _260 * _414;
                float _434 = fma(_264, _392, _428);
                float _436 = fma(_258, _388, _430);
                float _438 = fma(_264, _408, _432);
                float _440 = fma(_258, _404, _434);
                float _442 = _372 + _436;
                float _444 = fma(_258, _420, _438);
                float _446 = _422 + _440;
                float _448 = _424 + _444;
                _290 = _442;
                _304 = _448;
                _296 = _446;
                _364 = true;
            }
            else
            {
                int _450 = as_type<int>(_204) & 2048;
                bool _452 = _450 != 0;
                if (!_452)
                {
                    _288 = _264;
                }
                float _454 = _288;
                _290 = _454;
                if (!_452)
                {
                    _294 = _260;
                }
                float _456 = _294;
                _296 = _456;
                if (!_452)
                {
                    _302 = _258;
                }
                float _458 = _302;
                bool _460 = !_452;
                _304 = _458;
                if (!_460)
                {
                    uint _462 = uint(int(uint(_154) >> uint(2)));
                    float _464 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_462)]);
                    int _466 = _154 + 4;
                    uint _468 = uint(int(uint(_466) >> uint(2)));
                    float _470 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_468)]);
                    int _472 = _154 + 8;
                    uint _474 = uint(int(uint(_472) >> uint(2)));
                    float _476 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_474)]);
                    int _478 = _154 + 12;
                    uint _480 = uint(int(uint(_478) >> uint(2)));
                    float _482 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_480)]);
                    uint _484 = uint(int(uint(_154) >> uint(2)));
                    float _486 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_484)]);
                    int _488 = _154 + 4;
                    uint _490 = uint(int(uint(_488) >> uint(2)));
                    float _492 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_490)]);
                    int _494 = _154 + 8;
                    uint _496 = uint(int(uint(_494) >> uint(2)));
                    float _498 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_496)]);
                    int _500 = _154 + 12;
                    uint _502 = uint(int(uint(_500) >> uint(2)));
                    float _504 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_502)]);
                    uint _506 = uint(int(uint(_154) >> uint(2)));
                    float _508 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_506)]);
                    int _510 = _154 + 4;
                    uint _512 = uint(int(uint(_510) >> uint(2)));
                    float _514 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_512)]);
                    int _516 = _154 + 8;
                    uint _518 = uint(int(uint(_516) >> uint(2)));
                    float _520 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_518)]);
                    int _522 = _154 + 12;
                    uint _524 = uint(int(uint(_522) >> uint(2)));
                    float _526 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_524)]);
                    float _528 = _260 * _470;
                    float _530 = _260 * _492;
                    float _532 = fma(_264, _464, _528);
                    float _534 = _260 * _514;
                    float _536 = fma(_264, _486, _530);
                    float _538 = fma(_264, _508, _534);
                    float _540 = fma(_258, _476, _532);
                    float _542 = fma(_258, _498, _536);
                    float _544 = fma(_258, _520, _538);
                    float _546 = _540 + _482;
                    float _548 = _542 + _504;
                    float _550 = _544 + _526;
                    _290 = _546;
                    _304 = _550;
                    _296 = _548;
                }
            }
        }
    }
    _364 = false;
    float _552 = _290;
    float _554 = _304;
    float _556 = _296;
    float _558 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
    float _560 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[60]);
    float _562 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[62]);
    float _564 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[59]);
    float _566 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[61]);
    float _568 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[63]);
    bool _570 = _558 != 0.0;
    bool _572 = isnan(_558);
    bool _574 = _570 || _572;
    bool _576 = isnan(0.0);
    bool _578 = _574 || _576;
    float _580 = _206 * _560;
    float _582 = _206 * _562;
    float _584 = fma(_564, _552, _580);
    float _586 = fma(_564, _554, _582);
    float _588 = _206 * _566;
    float _590 = _568;
    if (_578)
    {
        float _592 = _226 * _568;
        _590 = _592;
    }
    float _594 = _590;
    float _596 = fma(_564, _556, _588);
    float _598 = -_594;
    bool _600 = _584 >= _598;
    bool _602 = isnan(_584);
    bool _604 = _600 || _602;
    bool _606 = isnan(_598);
    bool _608 = _604 || _606;
    float _610 = _584 + _594;
    float _612 = -_594;
    bool _614 = _586 >= _612;
    bool _616 = isnan(_586);
    bool _618 = _614 || _616;
    bool _620 = isnan(_612);
    bool _622 = _618 || _620;
    float _624 = _586 + _594;
    float _626 = _596 + _594;
    float _628 = -_594;
    bool _630 = _596 >= _628;
    bool _632 = isnan(_596);
    bool _634 = _630 || _632;
    bool _636 = isnan(_628);
    bool _638 = _634 || _636;
    bool _640 = !_608;
    float _642 = -_610;
    float _644 = _640 ? _642 : _610;
    bool _646 = !_622;
    float _648 = -_624;
    float _650 = _646 ? _648 : _624;
    bool _652 = !_638;
    float _654 = -_626;
    float _656 = _652 ? _654 : _626;
    float _658 = _644 * 0.03125;
    float _660 = _650 * 0.03125;
    float _662 = _656 * 0.03125;
    float3 _2255 = float3(_658, _662, _660);
    float3 _666 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, select(_2255, float3(0.0), isnan(_2255)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, select(_2255, float3(0.0), isnan(_2255)), level(0.0)).xyz;
    float _668 = _666.x;
    float _670 = _666.y;
    float _672 = _666.z;
    float _674 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[56]);
    float _676 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[57]);
    float _678 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[58]);
    float _680 = _668 + (-0.5);
    float _682 = _670 + (-0.5);
    float _684 = _672 + (-0.5);
    float _686 = _680 * _674;
    float _688 = _682 * _676;
    float _690 = _684 * _678;
    float _692 = _684;
    float _694 = _682;
    float _696 = _680;
    if (!_240)
    {
        _692 = _686;
    }
    float _698 = _692;
    float _700 = _698;
    float _702 = _698;
    if (!_240)
    {
        _694 = _688;
    }
    float _704 = _694;
    float _706 = _704;
    float _708 = _704;
    if (!_240)
    {
        _696 = _690;
    }
    float _710 = _696;
    bool _712 = !_240;
    float _714 = _710;
    float _716 = _710;
    if (!_712)
    {
        bool _718 = !_272;
        if (!_718)
        {
            float _720 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _722 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _724 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _726 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _728 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _730 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _732 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _734 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _736 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _738 = _724 * _726;
            float _740 = _724 * _728;
            float _742 = _722 * _726;
            float _744 = -_738;
            float _746 = fma(_720, _730, _744);
            float _748 = -_740;
            float _750 = fma(_722, _730, _748);
            float _752 = -_742;
            float _754 = fma(_720, _728, _752);
            float _756 = _734 * _720;
            float _758 = _734 * _746;
            float _760 = _736 * _722;
            float _762 = _732 * _728;
            float _764 = -_756;
            float _766 = fma(_732, _722, _764);
            float _768 = -_758;
            float _770 = fma(_732, _750, _768);
            float _772 = _734 * _730;
            float _774 = _736 * _726;
            float _776 = -_762;
            float _778 = fma(_734, _726, _776);
            float _780 = fma(_736, _754, _770);
            float _782 = -_772;
            float _784 = fma(_736, _728, _782);
            float _786 = -_774;
            float _788 = fma(_732, _730, _786);
            float _790 = _732 * _724;
            float _792 = 1.0 / _780;
            float _794 = -_720;
            float _796 = fma(_794, _730, _738);
            float _798 = -_760;
            float _800 = fma(_734, _724, _798);
            float _802 = -_790;
            float _804 = fma(_736, _720, _802);
            float _806 = _784 * _792;
            float _808 = _788 * _792;
            float _810 = _778 * _792;
            float _812 = _686 * _792;
            float _814 = _688 * _806;
            float _816 = _688 * _808;
            float _818 = _688 * _810;
            float _820 = _796 * _792;
            float _822 = _800 * _792;
            float _824 = fma(_750, _812, _814);
            float _826 = _804 * _792;
            float _828 = _766 * _792;
            float _830 = fma(_686, _820, _816);
            float _832 = fma(_754, _812, _818);
            float _834 = fma(_690, _822, _824);
            float _836 = fma(_690, _826, _830);
            float _838 = fma(_690, _828, _832);
            _716 = _838;
            _702 = _834;
            _708 = _836;
            _840 = true;
        }
        else
        {
            int _842 = as_type<int>(_204) & 1024;
            bool _844 = _842 != 0;
            if (_844)
            {
                _280 = true;
            }
            bool _846 = _280;
            bool _848 = _846;
            if (!_844)
            {
                int _850 = as_type<int>(_204) & 2048;
                bool _852 = _850 != 0;
                _848 = _852;
            }
            bool _854 = _848;
            if (!_854)
            {
                _700 = _686;
            }
            float _856 = _700;
            _702 = _856;
            if (!_854)
            {
                _706 = _688;
            }
            float _858 = _706;
            _708 = _858;
            if (!_854)
            {
                _714 = _690;
            }
            float _860 = _714;
            bool _862 = !_854;
            _716 = _860;
            if (!_862)
            {
                uint _864 = uint(int(uint(_154) >> uint(2)));
                float _866 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_864)]);
                int _868 = _154 + 4;
                uint _870 = uint(int(uint(_868) >> uint(2)));
                float _872 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_870)]);
                int _874 = _154 + 8;
                uint _876 = uint(int(uint(_874) >> uint(2)));
                float _878 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_876)]);
                uint _880 = uint(int(uint(_154) >> uint(2)));
                float _882 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_880)]);
                int _884 = _154 + 4;
                uint _886 = uint(int(uint(_884) >> uint(2)));
                float _888 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_886)]);
                int _890 = _154 + 8;
                uint _892 = uint(int(uint(_890) >> uint(2)));
                float _894 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_892)]);
                uint _896 = uint(int(uint(_154) >> uint(2)));
                float _898 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_896)]);
                int _900 = _154 + 4;
                uint _902 = uint(int(uint(_900) >> uint(2)));
                float _904 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_902)]);
                int _906 = _154 + 8;
                uint _908 = uint(int(uint(_906) >> uint(2)));
                float _910 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_908)]);
                float _912 = _878 * _882;
                float _914 = _878 * _888;
                float _916 = _872 * _882;
                float _918 = -_912;
                float _920 = fma(_866, _894, _918);
                float _922 = -_914;
                float _924 = fma(_872, _894, _922);
                float _926 = -_916;
                float _928 = fma(_866, _888, _926);
                float _930 = _904 * _866;
                float _932 = _904 * _920;
                float _934 = _910 * _872;
                float _936 = _898 * _888;
                float _938 = -_930;
                float _940 = fma(_898, _872, _938);
                float _942 = -_932;
                float _944 = fma(_898, _924, _942);
                float _946 = _904 * _894;
                float _948 = _910 * _882;
                float _950 = -_936;
                float _952 = fma(_904, _882, _950);
                float _954 = fma(_910, _928, _944);
                float _956 = -_946;
                float _958 = fma(_910, _888, _956);
                float _960 = -_948;
                float _962 = fma(_898, _894, _960);
                float _964 = _898 * _878;
                float _966 = 1.0 / _954;
                float _968 = -_866;
                float _970 = fma(_968, _894, _912);
                float _972 = -_934;
                float _974 = fma(_904, _878, _972);
                float _976 = -_964;
                float _978 = fma(_910, _866, _976);
                float _980 = _958 * _966;
                float _982 = _962 * _966;
                float _984 = _952 * _966;
                float _986 = _686 * _966;
                float _988 = _688 * _980;
                float _990 = _688 * _982;
                float _992 = _688 * _984;
                float _994 = _970 * _966;
                float _996 = _974 * _966;
                float _998 = fma(_924, _986, _988);
                float _1000 = _978 * _966;
                float _1002 = _940 * _966;
                float _1004 = fma(_686, _994, _990);
                float _1006 = fma(_928, _986, _992);
                float _1008 = fma(_690, _996, _998);
                float _1010 = fma(_690, _1000, _1004);
                float _1012 = fma(_690, _1002, _1006);
                _716 = _1012;
                _702 = _1008;
                _708 = _1010;
            }
        }
    }
    _840 = false;
    float _1014 = _716;
    float _1016 = _702;
    float _1018 = _708;
    uint _1020 = uint(int(uint(_156) >> uint(2)));
    float _1022 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1020)]);
    float _1024 = fma(_150, _1014, _268);
    float _1026 = fma(_150, _1016, _262);
    int _1028 = _154 + 4;
    float _1030 = fma(_150, _1018, _266);
    int _1032 = _154 + 8;
    float _1034 = _1030 * _1030;
    float _1036 = fma(_1026, _1026, _1034);
    uint _1038 = uint(int(uint(_156) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1038)] = as_type<uint>(_1022);
    uint _1040 = uint(int(uint(_154) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1040)] = as_type<uint>(_264);
    uint _1042 = uint(int(uint(_1028) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1042)] = as_type<uint>(_260);
    uint _1044 = uint(int(uint(_1032) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1044)] = as_type<uint>(_258);
    uint _1046 = uint(int(uint(_154) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1046)] = as_type<uint>(_1026);
    uint _1048 = uint(int(uint(_1028) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1048)] = as_type<uint>(_1030);
    uint _1050 = uint(int(uint(_1032) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1050)] = as_type<uint>(_1024);
    uint _1052 = uint(int(uint(_154) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1052)] = as_type<uint>(_248);
    uint _1054 = uint(int(uint(_1028) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1054)] = as_type<uint>(_252);
    uint _1056 = uint(int(uint(_1032) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1056)] = as_type<uint>(_250);
    float _1058 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1060 = _252 * _252;
    float _1062 = fma(_1024, _1024, _1036);
    float _1064 = fma(_248, _248, _1060);
    float _1066 = sqrt(_1062);
    float _1068 = fma(_250, _250, _1064);
    float _1070 = sqrt(_1068);
    bool _1072 = _1070 >= 9.9999999747524270787835121154785e-07;
    bool _1074 = isnan(_1070);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan(9.9999999747524270787835121154785e-07);
    bool _1080 = _1076 || _1078;
    float _1082 = _1070;
    int _1098;
    if (!_1080)
    {
        bool _1084 = _206 != _230;
        bool _1086 = isnan(_206);
        bool _1088 = _1084 || _1086;
        bool _1090 = isnan(_230);
        bool _1092 = _1088 || _1090;
        if (_1092)
        {
            _282 = as_type<int>(_210);
        }
        int _1094 = _282;
        int _1096 = _1094;
        _1098 = _1094;
        _1100 = _1092;
        if (!_1100)
        {
            float _1102 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1104 = _1102 > 0.0;
            bool _1106 = !_1104;
            if (!_1106)
            {
                float _1108 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1110 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1112 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1114 = _1110 * _1110;
                float _1116 = fma(_1108, _1108, _1114);
                float _1118 = fma(_1112, _1112, _1116);
                float _1120 = rsqrt(_1118);
                float _1122 = _1120 * 9.9999999747524270787835121154785e-07;
                float _1124 = _1108 * _1122;
                float _1126 = _1110 * _1122;
                float _1128 = _1112 * _1122;
                _1098 = as_type<int>(_1124);
                _310 = as_type<int>(_1126);
                _312 = as_type<int>(_1128);
                _1100 = true;
            }
            else
            {
                bool _1130 = _1066 >= 9.9999999747524270787835121154785e-07;
                bool _1132 = isnan(_1066);
                bool _1134 = _1130 || _1132;
                bool _1136 = isnan(9.9999999747524270787835121154785e-07);
                bool _1138 = _1134 || _1136;
                if (!_1138)
                {
                    float _1140 = _260 * _260;
                    float _1142 = fma(_264, _264, _1140);
                    float _1144 = fma(_258, _258, _1142);
                    float _1146 = sqrt(_1144);
                    bool _1148 = _1146 >= 9.9999999747524270787835121154785e-07;
                    bool _1150 = isnan(_1146);
                    bool _1152 = _1148 || _1150;
                    bool _1154 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1156 = _1152 || _1154;
                    int _1158 = as_type<int>(_222);
                    int _1160 = as_type<int>(_1146);
                    if (_1156)
                    {
                        float _1162 = rsqrt(_1144);
                        _1158 = as_type<int>(_1162);
                    }
                    int _1164 = _1158;
                    if (!_1156)
                    {
                        _1096 = 0;
                    }
                    int _1166 = _1096;
                    int _1168 = _1166;
                    if (!_1156)
                    {
                        _1160 = 897988541;
                    }
                    int _1170 = _1160;
                    int _1172 = _1164;
                    int _1174 = _1170;
                    if (_1156)
                    {
                        float _1176 = as_type<float>(_1164) * 9.9999999747524270787835121154785e-07;
                        _1082 = _1176;
                    }
                    float _1178 = _1082;
                    if (!_1156)
                    {
                        _1172 = 0;
                    }
                    int _1180 = _1172;
                    int _1182 = _1180;
                    if (_1156)
                    {
                        float _1184 = _264 * _1178;
                        _1168 = as_type<int>(_1184);
                    }
                    int _1186 = _1168;
                    _1098 = _1186;
                    if (_1156)
                    {
                        float _1188 = _260 * _1178;
                        _1174 = as_type<int>(_1188);
                    }
                    int _1190 = _1174;
                    _310 = _1190;
                    if (_1156)
                    {
                        float _1192 = _258 * _1178;
                        _1182 = as_type<int>(_1192);
                    }
                    int _1194 = _1182;
                    _312 = _1194;
                    _1100 = true;
                }
                else
                {
                    float _1196 = rsqrt(_1062);
                    float _1198 = _1196 * 9.9999999747524270787835121154785e-07;
                    float _1200 = _1026 * _1198;
                    float _1202 = _1030 * _1198;
                    float _1204 = _1024 * _1198;
                    _1098 = as_type<int>(_1200);
                    _310 = as_type<int>(_1202);
                    _312 = as_type<int>(_1204);
                    _1100 = true;
                }
            }
        }
    }
    else
    {
        float _1206 = _1066 * _1058;
        bool _1208 = _1206 >= 0.001000000047497451305389404296875;
        bool _1210 = isnan(_1206);
        bool _1212 = _1208 || _1210;
        bool _1214 = isnan(0.001000000047497451305389404296875);
        bool _1216 = _1212 || _1214;
        bool _1218 = _1206 > 0.0;
        bool _1220 = !_1216;
        bool _1222 = _1218 && _1220;
        bool _1224 = _1070 < 0.001000000047497451305389404296875;
        bool _1226 = _1224 && _1222;
        if (!_1226)
        {
            _306 = as_type<int>(_252);
        }
        int _1228 = _306;
        int _1230 = _1228;
        if (_1226)
        {
            float _1232 = _1026 * _1058;
            _284 = as_type<int>(_1232);
        }
        int _1234 = _284;
        _1098 = _1234;
        if (!_1226)
        {
            _308 = as_type<int>(_250);
        }
        int _1236 = _308;
        _312 = _1236;
        if (_1226)
        {
            float _1238 = _1030 * _1058;
            _1230 = as_type<int>(_1238);
        }
        int _1240 = _1230;
        _310 = _1240;
        if (_1226)
        {
            float _1242 = _1024 * _1058;
            _312 = as_type<int>(_1242);
        }
    }
    _1100 = false;
    int _1244 = _1098;
    int _1246 = _310;
    int _1248 = _312;
    uint _1250 = uint(int(uint(_154) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1250)] = uint(_1244);
    uint _1252 = uint(int(uint(_1028) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1252)] = uint(_1246);
    uint _1254 = uint(int(uint(_1032) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1254)] = uint(_1248);
}

