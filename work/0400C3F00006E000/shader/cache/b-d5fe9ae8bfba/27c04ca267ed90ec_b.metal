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

struct _27
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c4 [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    constant _16* cp_c5 [[id(2)]];
    device _27* cp_s0 [[id(3)]];
    texture2d_array<float> cp_t_tcb_8 [[id(4)]];
    sampler cp_t_tcb_8Smplr [[id(5)]];
    sampler cp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    bool _1690 = false;
    float _48 = as_type<float>(gl_WorkGroupID.x);
    float _50 = as_type<float>(gl_LocalInvocationID.x);
    int _53 = as_type<int>(_48) << 5;
    int _55 = _53 + as_type<int>(_50);
    bool _59 = uint(_55) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    if (_59)
    {
        return;
    }
    bool _61 = 0 < as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].y);
    int _63 = _55 * 16;
    bool _65 = !_61;
    int _67 = 1065353216;
    int _69 = 1065353216;
    int _71 = 1065353216;
    int _73 = 1065353216;
    int _75 = 1065353216;
    int _77 = 1065353216;
    int _79 = 1065353216;
    int _81 = 1065353216;
    int _83 = 1065353216;
    int _85 = 1065353216;
    int _87 = 1065353216;
    int _89 = 1065353216;
    if (!_65)
    {
        int _91 = (-1) + as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].y);
        int _93 = _91 + 1;
        int _95 = int(_61);
        int _97 = _95 | 2;
        int _99 = false ? 4 : 0;
        int _101 = _97 | _99;
        int _103 = false ? 8 : 0;
        int _105 = _101 | _103;
        int _107 = false ? 16 : 0;
        int _109 = _105 | _107;
        int _111 = false ? 32 : 0;
        int _113 = _109 | _111;
        int _115 = false ? 64 : 0;
        int _117 = _113 | _115;
        int _119 = _117 & 2;
        bool _121 = _93 > 3;
        bool _123 = !_121;
        int _125 = 0;
        int _127 = 0;
        uint _130 = 0u;
        bool _132 = false;
        bool _134 = false;
        int _136 = _119;
        uint _138 = 0u;
        if (!_123)
        {
            int _140 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].y) + (-3);
            int _142 = false ? 4 : 0;
            int _144 = 2 | _142;
            int _146 = false ? 8 : 0;
            int _148 = _144 | _146;
            int _150 = false ? 16 : 0;
            int _152 = _148 | _150;
            int _154 = false ? 32 : 0;
            int _156 = _152 | _154;
            int _158 = false ? 64 : 0;
            int _160 = _156 | _158;
            int _162 = _160 & 1;
            _136 = _162;
            do
            {
                int _164 = _125;
                int _166 = _67;
                int _168 = _69;
                int _170 = _71;
                int _172 = _73;
                uint _174 = uint(int(uint(_63) >> uint(2)));
                uint _176 = uint(int(uint(int(_174)) >> uint(2)));
                int _178 = int(_174) & 3;
                float _180 = (*spvDescriptorSet0.cp_c3)._m0[int(_176)][_178];
                int _182 = int(_174) + 1;
                uint _184 = uint(int(uint(_182) >> uint(2)));
                int _186 = _182 & 3;
                float _188 = (*spvDescriptorSet0.cp_c3)._m0[int(_184)][_186];
                int _190 = _164 * 16;
                int _192 = _164 + 1;
                int _194 = _164 + 2;
                int _196 = _192 << 4;
                int _198 = _63 + 8;
                uint _200 = uint(int(uint(_198) >> uint(2)));
                uint _202 = uint(int(uint(int(_200)) >> uint(2)));
                int _204 = int(_200) & 3;
                float _206 = (*spvDescriptorSet0.cp_c3)._m0[int(_202)][_204];
                int _208 = _194 * 16;
                int _210 = _164 + 3;
                int _212 = _190 + 6592;
                uint _214 = uint(int(uint(_212) >> uint(2)));
                uint _216 = uint(int(uint(int(_214)) >> uint(2)));
                int _218 = int(_214) & 3;
                float _220 = (*spvDescriptorSet0.cp_c5)._m0[int(_216)][_218];
                int _222 = int(_214) + 1;
                uint _224 = uint(int(uint(_222) >> uint(2)));
                int _226 = _222 & 3;
                float _228 = (*spvDescriptorSet0.cp_c5)._m0[int(_224)][_226];
                int _230 = _190 + 6600;
                uint _232 = uint(int(uint(_230) >> uint(2)));
                uint _234 = uint(int(uint(int(_232)) >> uint(2)));
                int _236 = int(_232) & 3;
                float _238 = (*spvDescriptorSet0.cp_c5)._m0[int(_234)][_236];
                int _240 = int(_232) + 1;
                uint _242 = uint(int(uint(_240) >> uint(2)));
                int _244 = _240 & 3;
                float _246 = (*spvDescriptorSet0.cp_c5)._m0[int(_242)][_244];
                int _248 = _196 + 6592;
                uint _250 = uint(int(uint(_248) >> uint(2)));
                uint _252 = uint(int(uint(int(_250)) >> uint(2)));
                int _254 = int(_250) & 3;
                float _256 = (*spvDescriptorSet0.cp_c5)._m0[int(_252)][_254];
                int _258 = int(_250) + 1;
                uint _260 = uint(int(uint(_258) >> uint(2)));
                int _262 = _258 & 3;
                float _264 = (*spvDescriptorSet0.cp_c5)._m0[int(_260)][_262];
                int _266 = _208 + 6592;
                uint _268 = uint(int(uint(_266) >> uint(2)));
                uint _270 = uint(int(uint(int(_268)) >> uint(2)));
                int _272 = int(_268) & 3;
                float _274 = (*spvDescriptorSet0.cp_c5)._m0[int(_270)][_272];
                int _276 = int(_268) + 1;
                uint _278 = uint(int(uint(_276) >> uint(2)));
                int _280 = _276 & 3;
                float _282 = (*spvDescriptorSet0.cp_c5)._m0[int(_278)][_280];
                int _284 = _196 + 6600;
                uint _286 = uint(int(uint(_284) >> uint(2)));
                uint _288 = uint(int(uint(int(_286)) >> uint(2)));
                int _290 = int(_286) & 3;
                float _292 = (*spvDescriptorSet0.cp_c5)._m0[int(_288)][_290];
                int _294 = int(_286) + 1;
                uint _296 = uint(int(uint(_294) >> uint(2)));
                int _298 = _294 & 3;
                float _300 = (*spvDescriptorSet0.cp_c5)._m0[int(_296)][_298];
                float _302 = _228 * _188;
                float _304 = fma(_220, _180, _302);
                int _306 = _208 + 6600;
                uint _308 = uint(int(uint(_306) >> uint(2)));
                uint _310 = uint(int(uint(int(_308)) >> uint(2)));
                int _312 = int(_308) & 3;
                float _314 = (*spvDescriptorSet0.cp_c5)._m0[int(_310)][_312];
                int _316 = int(_308) + 1;
                uint _318 = uint(int(uint(_316) >> uint(2)));
                int _320 = _316 & 3;
                float _322 = (*spvDescriptorSet0.cp_c5)._m0[int(_318)][_320];
                float _324 = fma(_238, _206, _304);
                float _326 = _188 * _264;
                float _328 = _324 + _246;
                float _330 = fma(_180, _256, _326);
                int _332 = _190 + 6464;
                uint _334 = uint(int(uint(_332) >> uint(2)));
                uint _336 = uint(int(uint(int(_334)) >> uint(2)));
                int _338 = int(_334) & 3;
                float _340 = (*spvDescriptorSet0.cp_c5)._m0[int(_336)][_338];
                float _342 = trunc(_328);
                int _344 = int(_342);
                float _346 = _188 * _282;
                float _348 = fma(_180, _274, _346);
                float _350 = fma(_206, _292, _330);
                int _352 = _190 + 6656;
                uint _354 = uint(int(uint(_352) >> uint(2)));
                uint _356 = uint(int(uint(int(_354)) >> uint(2)));
                int _358 = int(_354) & 3;
                float _360 = (*spvDescriptorSet0.cp_c5)._m0[int(_356)][_358];
                int _362 = int(_354) + 1;
                uint _364 = uint(int(uint(_362) >> uint(2)));
                int _366 = _362 & 3;
                float _368 = (*spvDescriptorSet0.cp_c5)._m0[int(_364)][_366];
                int _370 = _210 << 4;
                float _372 = _350 + _300;
                float _374 = fma(_206, _314, _348);
                int _376 = _196 + 6464;
                uint _378 = uint(int(uint(_376) >> uint(2)));
                uint _380 = uint(int(uint(int(_378)) >> uint(2)));
                int _382 = int(_378) & 3;
                float _384 = (*spvDescriptorSet0.cp_c5)._m0[int(_380)][_382];
                float _386 = trunc(_372);
                int _388 = int(_386);
                float _390 = _374 + _322;
                int _392 = -as_type<int>(_340);
                int _394 = _344 + _392;
                int _396 = _208 + 6464;
                uint _398 = uint(int(uint(_396) >> uint(2)));
                uint _400 = uint(int(uint(int(_398)) >> uint(2)));
                int _402 = int(_398) & 3;
                float _404 = (*spvDescriptorSet0.cp_c5)._m0[int(_400)][_402];
                float _406 = trunc(_390);
                int _408 = int(_406);
                bool _410 = _394 >= 0;
                int _412 = _190 + 6664;
                uint _414 = uint(int(uint(_412) >> uint(2)));
                uint _416 = uint(int(uint(int(_414)) >> uint(2)));
                int _418 = int(_414) & 3;
                float _420 = (*spvDescriptorSet0.cp_c5)._m0[int(_416)][_418];
                int _422 = int(_414) + 1;
                uint _424 = uint(int(uint(_422) >> uint(2)));
                int _426 = _422 & 3;
                float _428 = (*spvDescriptorSet0.cp_c5)._m0[int(_424)][_426];
                float _430 = _188 * _368;
                float _432 = fma(_180, _360, _430);
                int _434 = _370 + 6592;
                uint _436 = uint(int(uint(_434) >> uint(2)));
                uint _438 = uint(int(uint(int(_436)) >> uint(2)));
                int _440 = int(_436) & 3;
                float _442 = (*spvDescriptorSet0.cp_c5)._m0[int(_438)][_440];
                int _444 = int(_436) + 1;
                uint _446 = uint(int(uint(_444) >> uint(2)));
                int _448 = _444 & 3;
                float _450 = (*spvDescriptorSet0.cp_c5)._m0[int(_446)][_448];
                int _452 = ~as_type<int>(_384);
                int _454 = _388 + _452;
                int _456 = _454 + 1;
                bool _458 = _456 >= 0;
                int _460 = _196 + 6656;
                uint _462 = uint(int(uint(_460) >> uint(2)));
                uint _464 = uint(int(uint(int(_462)) >> uint(2)));
                int _466 = int(_462) & 3;
                float _468 = (*spvDescriptorSet0.cp_c5)._m0[int(_464)][_466];
                int _470 = int(_462) + 1;
                uint _472 = uint(int(uint(_470) >> uint(2)));
                int _474 = _470 & 3;
                float _476 = (*spvDescriptorSet0.cp_c5)._m0[int(_472)][_474];
                int _478 = -as_type<int>(_404);
                int _480 = _408 + _478;
                uint _482 = uint(_408);
                uint _484 = as_type<uint>(_368);
                int _486 = _166;
                int _488 = _168;
                int _490 = _170;
                int _492 = _172;
                int _494 = _192;
                int _496 = as_type<int>(_390);
                if (_410)
                {
                    int _498 = _164 << 4;
                    int _500 = _498 + 6400;
                    _482 = uint(_500);
                }
                uint _502 = _482;
                bool _504 = _480 >= 0;
                int _506 = _370 + 6600;
                uint _508 = uint(int(uint(_506) >> uint(2)));
                uint _510 = uint(int(uint(int(_508)) >> uint(2)));
                int _512 = int(_508) & 3;
                float _514 = (*spvDescriptorSet0.cp_c5)._m0[int(_510)][_512];
                int _516 = int(_508) + 1;
                uint _518 = uint(int(uint(_516) >> uint(2)));
                int _520 = _516 & 3;
                float _522 = (*spvDescriptorSet0.cp_c5)._m0[int(_518)][_520];
                float _524 = fma(_206, _420, _432);
                float _526 = _524 + _428;
                int _528 = _208 + 6656;
                uint _530 = uint(int(uint(_528) >> uint(2)));
                uint _532 = uint(int(uint(int(_530)) >> uint(2)));
                int _534 = int(_530) & 3;
                float _536 = (*spvDescriptorSet0.cp_c5)._m0[int(_532)][_534];
                int _538 = int(_530) + 1;
                uint _540 = uint(int(uint(_538) >> uint(2)));
                int _542 = _538 & 3;
                float _544 = (*spvDescriptorSet0.cp_c5)._m0[int(_540)][_542];
                float _546 = _188 * _450;
                if (_504)
                {
                    int _548 = _194 << 4;
                    int _550 = _548 + 6400;
                    _484 = uint(_550);
                }
                uint _552 = _484;
                float _554 = fma(_180, _442, _546);
                int _556 = _196 + 6664;
                uint _558 = uint(int(uint(_556) >> uint(2)));
                uint _560 = uint(int(uint(int(_558)) >> uint(2)));
                int _562 = int(_558) & 3;
                float _564 = (*spvDescriptorSet0.cp_c5)._m0[int(_560)][_562];
                int _566 = int(_558) + 1;
                uint _568 = uint(int(uint(_566) >> uint(2)));
                int _570 = _566 & 3;
                float _572 = (*spvDescriptorSet0.cp_c5)._m0[int(_568)][_570];
                float _574 = _188 * _476;
                float _576 = fma(_180, _468, _574);
                float _578 = trunc(_526);
                int _580 = int(_578);
                int _582 = _208 + 6664;
                uint _584 = uint(int(uint(_582) >> uint(2)));
                uint _586 = uint(int(uint(int(_584)) >> uint(2)));
                int _588 = int(_584) & 3;
                float _590 = (*spvDescriptorSet0.cp_c5)._m0[int(_586)][_588];
                int _592 = int(_584) + 1;
                uint _594 = uint(int(uint(_592) >> uint(2)));
                int _596 = _592 & 3;
                float _598 = (*spvDescriptorSet0.cp_c5)._m0[int(_594)][_596];
                float _600 = fma(_206, _514, _554);
                int _602 = _190 + 6528;
                uint _604 = uint(int(uint(_602) >> uint(2)));
                uint _606 = uint(int(uint(int(_604)) >> uint(2)));
                int _608 = int(_604) & 3;
                float _610 = (*spvDescriptorSet0.cp_c5)._m0[int(_606)][_608];
                float _612 = _188 * _544;
                uint _614 = as_type<uint>(_384);
                uint _616 = as_type<uint>(_612);
                if (_410)
                {
                    uint _618 = uint(int(uint(int(_502)) >> uint(2)));
                    uint _620 = uint(int(uint(int(_618)) >> uint(2)));
                    int _622 = int(_618) & 3;
                    float _624 = (*spvDescriptorSet0.cp_c5)._m0[int(_620)][_622];
                    _614 = as_type<uint>(_624);
                }
                uint _626 = _614;
                float _628 = fma(_206, _564, _576);
                float _630 = _600 + _522;
                float _632 = fma(_180, _536, _612);
                if (_458)
                {
                    int _634 = _192 << 4;
                    int _636 = _634 + 6400;
                    _616 = uint(_636);
                }
                uint _638 = _616;
                float _640 = _628 + _572;
                float _642 = trunc(_630);
                int _644 = int(_642);
                int _646 = _370 + 6464;
                uint _648 = uint(int(uint(_646) >> uint(2)));
                uint _650 = uint(int(uint(int(_648)) >> uint(2)));
                int _652 = int(_648) & 3;
                float _654 = (*spvDescriptorSet0.cp_c5)._m0[int(_650)][_652];
                float _656 = fma(_206, _590, _632);
                float _658 = _656 + _598;
                float _660 = trunc(_640);
                int _662 = int(_660);
                int _664 = int(_638);
                uint _666 = as_type<uint>(_656);
                if (_458)
                {
                    uint _668 = uint(int(uint(int(_638)) >> uint(2)));
                    uint _670 = uint(int(uint(int(_668)) >> uint(2)));
                    int _672 = int(_668) & 3;
                    float _674 = (*spvDescriptorSet0.cp_c5)._m0[int(_670)][_672];
                    _664 = as_type<int>(_674);
                }
                int _676 = _664;
                int _678 = ~as_type<int>(_610);
                int _680 = _580 + _678;
                int _682 = _680 + 1;
                float _684 = trunc(_658);
                int _686 = int(_684);
                int _688 = _208 + 6528;
                uint _690 = uint(int(uint(_688) >> uint(2)));
                uint _692 = uint(int(uint(int(_690)) >> uint(2)));
                int _694 = int(_690) & 3;
                float _696 = (*spvDescriptorSet0.cp_c5)._m0[int(_692)][_694];
                bool _698 = _394 >= int(_626);
                bool _700 = !_410;
                bool _702 = _698 || _700;
                bool _704 = _682 < 0;
                bool _706 = _704 || _702;
                int _708 = _196 + 6528;
                uint _710 = uint(int(uint(_708) >> uint(2)));
                uint _712 = uint(int(uint(int(_710)) >> uint(2)));
                int _714 = int(_710) & 3;
                float _716 = (*spvDescriptorSet0.cp_c5)._m0[int(_712)][_714];
                int _718 = -as_type<int>(_654);
                int _720 = _644 + _718;
                int _722 = _164 * 4;
                bool _724 = _720 >= 0;
                uint _726 = _552;
                uint _728 = _626;
                if (_504)
                {
                    uint _730 = uint(int(uint(int(_552)) >> uint(2)));
                    uint _732 = uint(int(uint(int(_730)) >> uint(2)));
                    int _734 = int(_730) & 3;
                    float _736 = (*spvDescriptorSet0.cp_c5)._m0[int(_732)][_734];
                    _726 = as_type<uint>(_736);
                }
                uint _738 = _726;
                bool _740 = _456 >= _676;
                bool _742 = !_458;
                bool _744 = _740 || _742;
                if (!_706)
                {
                    int _746 = _164 << 4;
                    int _748 = _746 + 6400;
                    _666 = uint(_748);
                }
                uint _750 = _666;
                int _752 = _370 + 6656;
                uint _754 = uint(int(uint(_752) >> uint(2)));
                uint _756 = uint(int(uint(int(_754)) >> uint(2)));
                int _758 = int(_754) & 3;
                float _760 = (*spvDescriptorSet0.cp_c5)._m0[int(_756)][_758];
                int _762 = int(_754) + 1;
                uint _764 = uint(int(uint(_762) >> uint(2)));
                int _766 = _762 & 3;
                float _768 = (*spvDescriptorSet0.cp_c5)._m0[int(_764)][_766];
                int _770 = -as_type<int>(_696);
                int _772 = _686 + _770;
                uint _774 = as_type<uint>(_696);
                if (_724)
                {
                    int _776 = _210 << 4;
                    int _778 = _776 + 6400;
                    _774 = uint(_778);
                }
                uint _780 = _774;
                int _782 = _370 + 6664;
                uint _784 = uint(int(uint(_782) >> uint(2)));
                uint _786 = uint(int(uint(int(_784)) >> uint(2)));
                int _788 = int(_784) & 3;
                float _790 = (*spvDescriptorSet0.cp_c5)._m0[int(_786)][_788];
                int _792 = int(_784) + 1;
                uint _794 = uint(int(uint(_792) >> uint(2)));
                int _796 = _792 & 3;
                float _798 = (*spvDescriptorSet0.cp_c5)._m0[int(_794)][_796];
                int _800 = ~as_type<int>(_716);
                int _802 = _662 + _800;
                int _804 = _802 + 1;
                bool _806 = _480 >= int(_738);
                bool _808 = !_504;
                bool _810 = _806 || _808;
                int _812 = int(_750);
                uint _814 = _738;
                if (!_706)
                {
                    uint _816 = uint(int(uint(int(_750)) >> uint(2)));
                    uint _818 = uint(int(uint(int(_816)) >> uint(2)));
                    int _820 = int(_816) & 3;
                    float _822 = (*spvDescriptorSet0.cp_c5)._m0[int(_818)][_820];
                    _812 = as_type<int>(_822);
                }
                int _824 = _812;
                bool _826 = _804 < 0;
                bool _828 = _826 || _744;
                bool _830 = _772 < 0;
                bool _832 = _830 || _810;
                bool _834 = _722 == 0;
                float _836 = _188 * _768;
                int _838 = _370 + 6528;
                uint _840 = uint(int(uint(_838) >> uint(2)));
                uint _842 = uint(int(uint(int(_840)) >> uint(2)));
                int _844 = int(_840) & 3;
                float _846 = (*spvDescriptorSet0.cp_c5)._m0[int(_842)][_844];
                float _848 = fma(_180, _760, _836);
                if (!_828)
                {
                    int _850 = _192 << 4;
                    int _852 = _850 + 6400;
                    _814 = uint(_852);
                }
                uint _854 = _814;
                float _856 = fma(_206, _790, _848);
                int _858 = _686;
                int _860 = as_type<int>(_856);
                int _862 = as_type<int>(_790);
                if (_724)
                {
                    uint _864 = uint(int(uint(int(_780)) >> uint(2)));
                    uint _866 = uint(int(uint(int(_864)) >> uint(2)));
                    int _868 = int(_864) & 3;
                    float _870 = (*spvDescriptorSet0.cp_c5)._m0[int(_866)][_868];
                    _858 = as_type<int>(_870);
                }
                int _872 = _858;
                if (!_832)
                {
                    int _874 = _194 << 4;
                    int _876 = _874 + 6400;
                    _728 = uint(_876);
                }
                uint _878 = _728;
                float _880 = _856 + _798;
                float _882 = trunc(_880);
                int _884 = int(_882);
                int _886 = as_type<int>(_590);
                _130 = as_type<uint>(_880);
                if (!_828)
                {
                    uint _888 = uint(int(uint(int(_854)) >> uint(2)));
                    uint _890 = uint(int(uint(int(_888)) >> uint(2)));
                    int _892 = int(_888) & 3;
                    float _894 = (*spvDescriptorSet0.cp_c5)._m0[int(_890)][_892];
                    _886 = as_type<int>(_894);
                }
                int _896 = _886;
                bool _898 = _682 >= _824;
                bool _900 = _898 || _706;
                int _902 = as_type<int>(_514);
                uint _904 = uint(_824);
                if (!_832)
                {
                    uint _906 = uint(int(uint(int(_878)) >> uint(2)));
                    uint _908 = uint(int(uint(int(_906)) >> uint(2)));
                    int _910 = int(_906) & 3;
                    float _912 = (*spvDescriptorSet0.cp_c5)._m0[int(_908)][_910];
                    _902 = as_type<int>(_912);
                }
                int _914 = _902;
                if (_900)
                {
                    _860 = as_type<int>((*spvDescriptorSet0.cp_c5)._m0[2420].z);
                }
                int _916 = _860;
                int _918 = ~as_type<int>(_846);
                int _920 = _884 + _918;
                int _922 = _920 + 1;
                bool _924 = _720 >= _872;
                bool _926 = !_724;
                bool _928 = _924 || _926;
                bool _930 = _922 < 0;
                bool _932 = _930 || _928;
                int _934 = _916;
                int _936 = _872;
                if (!_900)
                {
                    int _938 = _164 << 4;
                    int _940 = _938 + 6400;
                    int _942 = _164 * 100;
                    float _944 = floor(_526);
                    uint _946 = uint(int(uint(_940) >> uint(2)));
                    uint _948 = uint(int(uint(int(_946)) >> uint(2)));
                    int _950 = int(_946) & 3;
                    float _952 = (*spvDescriptorSet0.cp_c5)._m0[int(_948)][_950];
                    float _954 = -_944;
                    float _956 = _526 + _954;
                    int _958 = _682 * as_type<int>(_952);
                    int _960 = _958 + _394;
                    int _962 = _960 * 4;
                    uint _964 = uint(int(uint(_960) >> uint(2)));
                    int _966 = int(_964) + _942;
                    int _968 = 12 & _962;
                    int _970 = _966 << 4;
                    int _972 = _970 + _968;
                    float _974 = floor(_328);
                    uint _976 = uint(int(uint(_972) >> uint(2)));
                    uint _978 = uint(int(uint(int(_976)) >> uint(2)));
                    int _980 = int(_976) & 3;
                    float _982 = (*spvDescriptorSet0.cp_c5)._m0[int(_978)][_980];
                    float _984 = -_974;
                    float _986 = _328 + _984;
                    float _988 = rint(_982);
                    float _990 = precise::max(_988, 0.0);
                    uint _992 = uint(_990);
                    uint _994 = clamp(_992, 0u, 65535u);
                    float3 _4424 = float3(_986, _956, float(int(_994)));
                    float3 _4428 = select(_4424, float3(0.0), isnan(_4424));
                    float _996 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _4428.xy, uint(rint(_4428.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _4428.xy, uint(rint(_4428.z)), level(0.0)).x;
                    int _998 = _164 * 400;
                    int _1000 = _998 + _960;
                    int _1002 = _972 + 32320;
                    uint _1004 = uint(int(uint(_1002) >> uint(2)));
                    uint _1006 = uint(int(uint(int(_1004)) >> uint(2)));
                    int _1008 = int(_1004) & 3;
                    float _1010 = (*spvDescriptorSet0.cp_c5)._m0[int(_1006)][_1008];
                    int _1012 = _1000 << 4;
                    int _1014 = _1012 + 6720;
                    uint _1016 = uint(int(uint(_1014) >> uint(2)));
                    uint _1018 = uint(int(uint(int(_1016)) >> uint(2)));
                    int _1020 = int(_1016) & 3;
                    float _1022 = (*spvDescriptorSet0.cp_c5)._m0[int(_1018)][_1020];
                    int _1024 = int(_1016) + 1;
                    uint _1026 = uint(int(uint(_1024) >> uint(2)));
                    int _1028 = _1024 & 3;
                    float _1030 = (*spvDescriptorSet0.cp_c5)._m0[int(_1026)][_1028];
                    int _1032 = _1014 + 8;
                    uint _1034 = uint(int(uint(_1032) >> uint(2)));
                    uint _1036 = uint(int(uint(int(_1034)) >> uint(2)));
                    int _1038 = int(_1034) & 3;
                    float _1040 = (*spvDescriptorSet0.cp_c5)._m0[int(_1036)][_1038];
                    int _1042 = int(_1034) + 1;
                    uint _1044 = uint(int(uint(_1042) >> uint(2)));
                    int _1046 = _1042 & 3;
                    float _1048 = (*spvDescriptorSet0.cp_c5)._m0[int(_1044)][_1046];
                    float _1050 = _188 * _1030;
                    float _1052 = fma(_180, _1022, _1050);
                    float _1054 = 1.0 / _1010;
                    float _1056 = fma(_206, _1040, _1052);
                    float _1058 = _1056 + _1048;
                    float _1060 = precise::clamp(_1058, 0.0, 1.0);
                    float _1062 = -_1060;
                    float _1064 = _1062 + _996;
                    float _1066 = _1010 * (*spvDescriptorSet0.cp_c5)._m0[2420].x;
                    float _1068 = fma(_1054, (*spvDescriptorSet0.cp_c5)._m0[2420].y, _1064);
                    float _1070 = _1066 * _1068;
                    float _1072 = exp2(_1070);
                    float _1074 = 0.0 + _1072;
                    float _1076 = precise::clamp(_1074, 0.0, 1.0);
                    float _1078 = precise::min(_1076, (*spvDescriptorSet0.cp_c5)._m0[2420].z);
                    _934 = as_type<int>(_1078);
                    _904 = as_type<uint>(_1064);
                    _936 = _1014;
                    _862 = as_type<int>(_1010);
                }
                int _1080 = _934;
                uint _1082 = _904;
                int _1084 = _936;
                int _1086 = _862;
                uint _1088 = _1082;
                int _1090 = _1084;
                if (!_932)
                {
                    int _1092 = _210 << 4;
                    int _1094 = _1092 + 6400;
                    _1088 = uint(_1094);
                }
                uint _1096 = _1088;
                if (_834)
                {
                    _486 = _1080;
                }
                int _1098 = _486;
                bool _1100 = _804 >= _896;
                bool _1102 = _1100 || _828;
                int _1104 = _1086;
                int _1106 = _1098;
                if (!_932)
                {
                    uint _1108 = uint(int(uint(int(_1096)) >> uint(2)));
                    uint _1110 = uint(int(uint(int(_1108)) >> uint(2)));
                    int _1112 = int(_1108) & 3;
                    float _1114 = (*spvDescriptorSet0.cp_c5)._m0[int(_1110)][_1112];
                    _1104 = as_type<int>(_1114);
                }
                int _1116 = _1104;
                bool _1118 = _722 == 4;
                int _1120 = _194 * 4;
                bool _1122 = _722 == 8;
                bool _1124 = _722 == 12;
                int _1126 = _192 << 2;
                bool _1128 = _772 >= _914;
                bool _1130 = _1128 || _832;
                bool _1132 = _1126 == 0;
                if (_1102)
                {
                    _1090 = as_type<int>((*spvDescriptorSet0.cp_c5)._m0[2420].z);
                }
                int _1134 = _1090;
                int _1136 = _1134;
                if (_1118)
                {
                    _488 = _1080;
                }
                int _1138 = _488;
                bool _1140 = _1126 == 12;
                int _1142 = _1138;
                if (_1122)
                {
                    _490 = _1080;
                }
                int _1144 = _490;
                int _1146 = _1144;
                if (_1124)
                {
                    _492 = _1080;
                }
                int _1148 = _492;
                bool _1150 = _1126 == 4;
                bool _1152 = _1126 == 8;
                int _1154 = _1148;
                if (!_1102)
                {
                    int _1156 = _192 << 4;
                    int _1158 = _1156 + 6400;
                    float _1160 = floor(_372);
                    uint _1162 = uint(int(uint(_1158) >> uint(2)));
                    uint _1164 = uint(int(uint(int(_1162)) >> uint(2)));
                    int _1166 = int(_1162) & 3;
                    float _1168 = (*spvDescriptorSet0.cp_c5)._m0[int(_1164)][_1166];
                    int _1170 = _164 * 100;
                    int _1172 = _1170 + 100;
                    float _1174 = -_1160;
                    float _1176 = _372 + _1174;
                    int _1178 = _804 * as_type<int>(_1168);
                    int _1180 = _1178 + _456;
                    int _1182 = _1180 * 4;
                    uint _1184 = uint(int(uint(_1180) >> uint(2)));
                    int _1186 = int(_1184) + _1172;
                    int _1188 = 12 & _1182;
                    int _1190 = _1186 << 4;
                    int _1192 = _1190 + _1188;
                    float _1194 = floor(_640);
                    uint _1196 = uint(int(uint(_1192) >> uint(2)));
                    uint _1198 = uint(int(uint(int(_1196)) >> uint(2)));
                    int _1200 = int(_1196) & 3;
                    float _1202 = (*spvDescriptorSet0.cp_c5)._m0[int(_1198)][_1200];
                    float _1204 = -_1194;
                    float _1206 = _640 + _1204;
                    float _1208 = rint(_1202);
                    float _1210 = precise::max(_1208, 0.0);
                    uint _1212 = uint(_1210);
                    uint _1214 = clamp(_1212, 0u, 65535u);
                    float3 _4767 = float3(_1176, _1206, float(int(_1214)));
                    float3 _4769 = select(_4767, float3(0.0), isnan(_4767));
                    float _1216 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _4769.xy, uint(rint(_4769.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _4769.xy, uint(rint(_4769.z)), level(0.0)).x;
                    int _1218 = _1192 + 32320;
                    uint _1220 = uint(int(uint(_1218) >> uint(2)));
                    uint _1222 = uint(int(uint(int(_1220)) >> uint(2)));
                    int _1224 = int(_1220) & 3;
                    float _1226 = (*spvDescriptorSet0.cp_c5)._m0[int(_1222)][_1224];
                    int _1228 = _164 * 400;
                    int _1230 = _1228 + 400;
                    int _1232 = _1180 + _1230;
                    int _1234 = _1232 << 4;
                    int _1236 = _1234 + 6720;
                    uint _1238 = uint(int(uint(_1236) >> uint(2)));
                    uint _1240 = uint(int(uint(int(_1238)) >> uint(2)));
                    int _1242 = int(_1238) & 3;
                    float _1244 = (*spvDescriptorSet0.cp_c5)._m0[int(_1240)][_1242];
                    int _1246 = int(_1238) + 1;
                    uint _1248 = uint(int(uint(_1246) >> uint(2)));
                    int _1250 = _1246 & 3;
                    float _1252 = (*spvDescriptorSet0.cp_c5)._m0[int(_1248)][_1250];
                    int _1254 = _1236 + 8;
                    uint _1256 = uint(int(uint(_1254) >> uint(2)));
                    uint _1258 = uint(int(uint(int(_1256)) >> uint(2)));
                    int _1260 = int(_1256) & 3;
                    float _1262 = (*spvDescriptorSet0.cp_c5)._m0[int(_1258)][_1260];
                    int _1264 = int(_1256) + 1;
                    uint _1266 = uint(int(uint(_1264) >> uint(2)));
                    int _1268 = _1264 & 3;
                    float _1270 = (*spvDescriptorSet0.cp_c5)._m0[int(_1266)][_1268];
                    float _1272 = 1.0 / _1226;
                    float _1274 = _188 * _1252;
                    float _1276 = fma(_180, _1244, _1274);
                    float _1278 = _1226 * (*spvDescriptorSet0.cp_c5)._m0[2420].x;
                    float _1280 = fma(_206, _1262, _1276);
                    float _1282 = _1280 + _1270;
                    float _1284 = precise::clamp(_1282, 0.0, 1.0);
                    float _1286 = -_1284;
                    float _1288 = _1286 + _1216;
                    float _1290 = fma(_1272, (*spvDescriptorSet0.cp_c5)._m0[2420].y, _1288);
                    float _1292 = _1278 * _1290;
                    float _1294 = exp2(_1292);
                    float _1296 = 0.0 + _1294;
                    float _1298 = precise::clamp(_1296, 0.0, 1.0);
                    float _1300 = precise::min(_1298, (*spvDescriptorSet0.cp_c5)._m0[2420].z);
                    _1136 = as_type<int>(_1300);
                    _494 = as_type<int>(_1294);
                }
                int _1302 = _1136;
                int _1304 = _494;
                bool _1306 = _922 >= _1116;
                bool _1308 = _1306 || _932;
                int _1310 = _1304;
                if (_1152)
                {
                    _1146 = _1302;
                }
                int _1312 = _1146;
                int _1314 = _1312;
                if (_1132)
                {
                    _1106 = _1302;
                }
                int _1316 = _1106;
                int _1318 = _1316;
                if (_1150)
                {
                    _1142 = _1302;
                }
                int _1320 = _1142;
                bool _1322 = _1120 == 0;
                bool _1324 = _1120 == 4;
                bool _1326 = _1120 == 8;
                int _1328 = _1320;
                _134 = _1322;
                if (_1130)
                {
                    _1310 = as_type<int>((*spvDescriptorSet0.cp_c5)._m0[2420].z);
                }
                int _1330 = _1310;
                bool _1332 = _1120 == 12;
                int _1334 = _1330;
                if (!_1130)
                {
                    int _1336 = _194 << 4;
                    int _1338 = _1336 + 6400;
                    float _1340 = floor(_390);
                    uint _1342 = uint(int(uint(_1338) >> uint(2)));
                    uint _1344 = uint(int(uint(int(_1342)) >> uint(2)));
                    int _1346 = int(_1342) & 3;
                    float _1348 = (*spvDescriptorSet0.cp_c5)._m0[int(_1344)][_1346];
                    int _1350 = _164 * 100;
                    int _1352 = _1350 + 100;
                    int _1354 = _1352 + 100;
                    int _1356 = _772 * as_type<int>(_1348);
                    int _1358 = _1356 + _480;
                    float _1360 = -_1340;
                    float _1362 = _390 + _1360;
                    float _1364 = floor(_658);
                    int _1366 = _1358 * 4;
                    uint _1368 = uint(int(uint(_1358) >> uint(2)));
                    int _1370 = int(_1368) + _1354;
                    int _1372 = 12 & _1366;
                    int _1374 = _1370 << 4;
                    int _1376 = _1374 + _1372;
                    uint _1378 = uint(int(uint(_1376) >> uint(2)));
                    uint _1380 = uint(int(uint(int(_1378)) >> uint(2)));
                    int _1382 = int(_1378) & 3;
                    float _1384 = (*spvDescriptorSet0.cp_c5)._m0[int(_1380)][_1382];
                    float _1386 = -_1364;
                    float _1388 = _658 + _1386;
                    float _1390 = rint(_1384);
                    float _1392 = precise::max(_1390, 0.0);
                    uint _1394 = uint(_1392);
                    uint _1396 = clamp(_1394, 0u, 65535u);
                    float3 _5046 = float3(_1362, _1388, float(int(_1396)));
                    float3 _5048 = select(_5046, float3(0.0), isnan(_5046));
                    float _1398 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _5048.xy, uint(rint(_5048.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _5048.xy, uint(rint(_5048.z)), level(0.0)).x;
                    int _1400 = _164 * 400;
                    int _1402 = _1400 + 400;
                    int _1404 = _1376 + 32320;
                    uint _1406 = uint(int(uint(_1404) >> uint(2)));
                    uint _1408 = uint(int(uint(int(_1406)) >> uint(2)));
                    int _1410 = int(_1406) & 3;
                    float _1412 = (*spvDescriptorSet0.cp_c5)._m0[int(_1408)][_1410];
                    int _1414 = _1358 + 400;
                    int _1416 = _1414 + _1402;
                    int _1418 = _1416 << 4;
                    int _1420 = _1418 + 6720;
                    uint _1422 = uint(int(uint(_1420) >> uint(2)));
                    uint _1424 = uint(int(uint(int(_1422)) >> uint(2)));
                    int _1426 = int(_1422) & 3;
                    float _1428 = (*spvDescriptorSet0.cp_c5)._m0[int(_1424)][_1426];
                    int _1430 = int(_1422) + 1;
                    uint _1432 = uint(int(uint(_1430) >> uint(2)));
                    int _1434 = _1430 & 3;
                    float _1436 = (*spvDescriptorSet0.cp_c5)._m0[int(_1432)][_1434];
                    int _1438 = _1420 + 8;
                    uint _1440 = uint(int(uint(_1438) >> uint(2)));
                    uint _1442 = uint(int(uint(int(_1440)) >> uint(2)));
                    int _1444 = int(_1440) & 3;
                    float _1446 = (*spvDescriptorSet0.cp_c5)._m0[int(_1442)][_1444];
                    int _1448 = int(_1440) + 1;
                    uint _1450 = uint(int(uint(_1448) >> uint(2)));
                    int _1452 = _1448 & 3;
                    float _1454 = (*spvDescriptorSet0.cp_c5)._m0[int(_1450)][_1452];
                    float _1456 = _188 * _1436;
                    float _1458 = fma(_180, _1428, _1456);
                    float _1460 = 1.0 / _1412;
                    float _1462 = fma(_206, _1446, _1458);
                    float _1464 = _1462 + _1454;
                    float _1466 = precise::clamp(_1464, 0.0, 1.0);
                    float _1468 = -_1466;
                    float _1470 = _1468 + _1398;
                    float _1472 = _1412 * (*spvDescriptorSet0.cp_c5)._m0[2420].x;
                    float _1474 = fma(_1460, (*spvDescriptorSet0.cp_c5)._m0[2420].y, _1470);
                    float _1476 = _1472 * _1474;
                    float _1478 = exp2(_1476);
                    float _1480 = 0.0 + _1478;
                    float _1482 = precise::clamp(_1480, 0.0, 1.0);
                    float _1484 = precise::min(_1482, (*spvDescriptorSet0.cp_c5)._m0[2420].z);
                    _1334 = as_type<int>(_1484);
                    _496 = as_type<int>(_1478);
                }
                int _1486 = _1334;
                int _1488 = _496;
                int _1490 = _1488;
                if (_1140)
                {
                    _1154 = _1302;
                }
                int _1492 = _1154;
                int _1494 = _1492;
                if (_1322)
                {
                    _1318 = _1486;
                }
                int _1496 = _1318;
                int _1498 = _1496;
                if (_1326)
                {
                    _1314 = _1486;
                }
                int _1500 = _1314;
                int _1502 = _1500;
                if (_1324)
                {
                    _1328 = _1486;
                }
                int _1504 = _1328;
                int _1506 = _1504;
                if (_1332)
                {
                    _1494 = _1486;
                }
                int _1508 = _1494;
                int _1510 = _1508;
                if (_1308)
                {
                    _1490 = as_type<int>((*spvDescriptorSet0.cp_c5)._m0[2420].z);
                }
                int _1512 = _1490;
                int _1514 = _1512;
                if (!_1308)
                {
                    int _1516 = _210 << 4;
                    int _1518 = _1516 + 6400;
                    float _1520 = floor(_630);
                    int _1522 = _164 * 100;
                    int _1524 = _1522 + 100;
                    uint _1526 = uint(int(uint(_1518) >> uint(2)));
                    uint _1528 = uint(int(uint(int(_1526)) >> uint(2)));
                    int _1530 = int(_1526) & 3;
                    float _1532 = (*spvDescriptorSet0.cp_c5)._m0[int(_1528)][_1530];
                    int _1534 = _1524 + 200;
                    int _1536 = _922 * as_type<int>(_1532);
                    int _1538 = _1536 + _720;
                    float _1540 = -_1520;
                    float _1542 = _630 + _1540;
                    int _1544 = _1538 << 2;
                    uint _1546 = uint(int(uint(_1538) >> uint(2)));
                    int _1548 = int(_1546) + _1534;
                    int _1550 = 12 & _1544;
                    int _1552 = _1548 << 4;
                    int _1554 = _1552 + _1550;
                    float _1556 = floor(_880);
                    uint _1558 = uint(int(uint(_1554) >> uint(2)));
                    uint _1560 = uint(int(uint(int(_1558)) >> uint(2)));
                    int _1562 = int(_1558) & 3;
                    float _1564 = (*spvDescriptorSet0.cp_c5)._m0[int(_1560)][_1562];
                    float _1566 = -_1556;
                    float _1568 = _880 + _1566;
                    float _1570 = rint(_1564);
                    float _1572 = precise::max(_1570, 0.0);
                    uint _1574 = uint(_1572);
                    uint _1576 = clamp(_1574, 0u, 65535u);
                    float3 _5325 = float3(_1542, _1568, float(int(_1576)));
                    float3 _5327 = select(_5325, float3(0.0), isnan(_5325));
                    float _1578 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _5327.xy, uint(rint(_5327.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _5327.xy, uint(rint(_5327.z)), level(0.0)).x;
                    int _1580 = _164 * 400;
                    int _1582 = _1580 + 400;
                    int _1584 = _1538 + 800;
                    int _1586 = _1584 + _1582;
                    int _1588 = _1554 + 32320;
                    uint _1590 = uint(int(uint(_1588) >> uint(2)));
                    uint _1592 = uint(int(uint(int(_1590)) >> uint(2)));
                    int _1594 = int(_1590) & 3;
                    float _1596 = (*spvDescriptorSet0.cp_c5)._m0[int(_1592)][_1594];
                    int _1598 = _1586 << 4;
                    int _1600 = _1598 + 6720;
                    uint _1602 = uint(int(uint(_1600) >> uint(2)));
                    uint _1604 = uint(int(uint(int(_1602)) >> uint(2)));
                    int _1606 = int(_1602) & 3;
                    float _1608 = (*spvDescriptorSet0.cp_c5)._m0[int(_1604)][_1606];
                    int _1610 = int(_1602) + 1;
                    uint _1612 = uint(int(uint(_1610) >> uint(2)));
                    int _1614 = _1610 & 3;
                    float _1616 = (*spvDescriptorSet0.cp_c5)._m0[int(_1612)][_1614];
                    int _1618 = _1600 + 8;
                    uint _1620 = uint(int(uint(_1618) >> uint(2)));
                    uint _1622 = uint(int(uint(int(_1620)) >> uint(2)));
                    int _1624 = int(_1620) & 3;
                    float _1626 = (*spvDescriptorSet0.cp_c5)._m0[int(_1622)][_1624];
                    int _1628 = int(_1620) + 1;
                    uint _1630 = uint(int(uint(_1628) >> uint(2)));
                    int _1632 = _1628 & 3;
                    float _1634 = (*spvDescriptorSet0.cp_c5)._m0[int(_1630)][_1632];
                    float _1636 = _188 * _1616;
                    float _1638 = fma(_180, _1608, _1636);
                    float _1640 = 1.0 / _1596;
                    float _1642 = fma(_206, _1626, _1638);
                    float _1644 = _1642 + _1634;
                    float _1646 = precise::clamp(_1644, 0.0, 1.0);
                    float _1648 = -_1646;
                    float _1650 = _1648 + _1578;
                    float _1652 = _1596 * (*spvDescriptorSet0.cp_c5)._m0[2420].x;
                    float _1654 = fma(_1640, (*spvDescriptorSet0.cp_c5)._m0[2420].y, _1650);
                    float _1656 = _1652 * _1654;
                    float _1658 = exp2(_1656);
                    float _1660 = 0.0 + _1658;
                    float _1662 = precise::clamp(_1660, 0.0, 1.0);
                    float _1664 = precise::min(_1662, (*spvDescriptorSet0.cp_c5)._m0[2420].z);
                    _1514 = as_type<int>(_1664);
                }
                int _1666 = _1514;
                int _1668 = _164 + 4;
                int _1670 = _210 << 2;
                bool _1672 = _1668 >= _140;
                bool _1674 = _1670 == 0;
                bool _1676 = _1670 == 4;
                bool _1678 = _1670 == 8;
                bool _1680 = _1670 == 12;
                _125 = _1668;
                _127 = _1668;
                _132 = _1676;
                _138 = uint(_1670);
                if (_1674)
                {
                    _1498 = _1666;
                }
                int _1682 = _1498;
                _67 = _1682;
                _75 = _1682;
                if (_1676)
                {
                    _1506 = _1666;
                }
                int _1684 = _1506;
                _69 = _1684;
                _77 = _1684;
                if (_1678)
                {
                    _1502 = _1666;
                }
                int _1686 = _1502;
                _71 = _1686;
                _79 = _1686;
                if (_1680)
                {
                    _1510 = _1666;
                }
                int _1688 = _1510;
                _73 = _1688;
                _81 = _1688;
                if (_1672)
                {
                    _1690 = true;
                    if (_1690)
                    {
                        break;
                    }
                }
            } while (true);
        }
        _1690 = false;
        int _1692 = _127;
        uint _1694 = _130;
        bool _1696 = _132;
        bool _1698 = _134;
        int _1700 = _136;
        uint _1702 = _138;
        int _1704 = _75;
        int _1706 = _77;
        int _1708 = _79;
        int _1710 = _81;
        int _1712 = ~_1692;
        int _1714 = _1712 + as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].y);
        int _1716 = _1714 + 1;
        bool _1718 = _1716 > 1;
        bool _1720 = !_1718;
        uint _1722 = _1694;
        int _1724 = _1704;
        int _1726 = _1708;
        int _1728 = _1710;
        int _1730 = _1706;
        int _1732 = _1700;
        int _1734 = _1692;
        uint _1736 = _1702;
        int _1738 = _1704;
        int _1740 = _1706;
        int _1742 = _1708;
        int _1744 = _1710;
        if (!_1720)
        {
            uint _1746 = uint(int(uint(_63) >> uint(2)));
            uint _1748 = uint(int(uint(int(_1746)) >> uint(2)));
            int _1750 = int(_1746) & 3;
            float _1752 = (*spvDescriptorSet0.cp_c3)._m0[int(_1748)][_1750];
            int _1754 = int(_1746) + 1;
            uint _1756 = uint(int(uint(_1754) >> uint(2)));
            int _1758 = _1754 & 3;
            float _1760 = (*spvDescriptorSet0.cp_c3)._m0[int(_1756)][_1758];
            int _1762 = _1692 * 16;
            int _1764 = _1692 + 1;
            int _1766 = _1764 << 4;
            int _1768 = _63 + 8;
            uint _1770 = uint(int(uint(_1768) >> uint(2)));
            uint _1772 = uint(int(uint(int(_1770)) >> uint(2)));
            int _1774 = int(_1770) & 3;
            float _1776 = (*spvDescriptorSet0.cp_c3)._m0[int(_1772)][_1774];
            int _1778 = _1762 + 6592;
            uint _1780 = uint(int(uint(_1778) >> uint(2)));
            uint _1782 = uint(int(uint(int(_1780)) >> uint(2)));
            int _1784 = int(_1780) & 3;
            float _1786 = (*spvDescriptorSet0.cp_c5)._m0[int(_1782)][_1784];
            int _1788 = int(_1780) + 1;
            uint _1790 = uint(int(uint(_1788) >> uint(2)));
            int _1792 = _1788 & 3;
            float _1794 = (*spvDescriptorSet0.cp_c5)._m0[int(_1790)][_1792];
            int _1796 = _1762 + 6600;
            uint _1798 = uint(int(uint(_1796) >> uint(2)));
            uint _1800 = uint(int(uint(int(_1798)) >> uint(2)));
            int _1802 = int(_1798) & 3;
            float _1804 = (*spvDescriptorSet0.cp_c5)._m0[int(_1800)][_1802];
            int _1806 = int(_1798) + 1;
            uint _1808 = uint(int(uint(_1806) >> uint(2)));
            int _1810 = _1806 & 3;
            float _1812 = (*spvDescriptorSet0.cp_c5)._m0[int(_1808)][_1810];
            int _1814 = _1766 + 6592;
            uint _1816 = uint(int(uint(_1814) >> uint(2)));
            uint _1818 = uint(int(uint(int(_1816)) >> uint(2)));
            int _1820 = int(_1816) & 3;
            float _1822 = (*spvDescriptorSet0.cp_c5)._m0[int(_1818)][_1820];
            int _1824 = int(_1816) + 1;
            uint _1826 = uint(int(uint(_1824) >> uint(2)));
            int _1828 = _1824 & 3;
            float _1830 = (*spvDescriptorSet0.cp_c5)._m0[int(_1826)][_1828];
            int _1832 = _1766 + 6600;
            uint _1834 = uint(int(uint(_1832) >> uint(2)));
            uint _1836 = uint(int(uint(int(_1834)) >> uint(2)));
            int _1838 = int(_1834) & 3;
            float _1840 = (*spvDescriptorSet0.cp_c5)._m0[int(_1836)][_1838];
            int _1842 = int(_1834) + 1;
            uint _1844 = uint(int(uint(_1842) >> uint(2)));
            int _1846 = _1842 & 3;
            float _1848 = (*spvDescriptorSet0.cp_c5)._m0[int(_1844)][_1846];
            float _1850 = _1760 * _1794;
            int _1852 = _1762 + 6464;
            uint _1854 = uint(int(uint(_1852) >> uint(2)));
            uint _1856 = uint(int(uint(int(_1854)) >> uint(2)));
            int _1858 = int(_1854) & 3;
            float _1860 = (*spvDescriptorSet0.cp_c5)._m0[int(_1856)][_1858];
            float _1862 = fma(_1752, _1786, _1850);
            float _1864 = fma(_1776, _1804, _1862);
            float _1866 = _1760 * _1830;
            int _1868 = _1766 + 6464;
            uint _1870 = uint(int(uint(_1868) >> uint(2)));
            uint _1872 = uint(int(uint(int(_1870)) >> uint(2)));
            int _1874 = int(_1870) & 3;
            float _1876 = (*spvDescriptorSet0.cp_c5)._m0[int(_1872)][_1874];
            float _1878 = _1864 + _1812;
            float _1880 = fma(_1752, _1822, _1866);
            float _1882 = trunc(_1878);
            int _1884 = int(_1882);
            float _1886 = fma(_1776, _1840, _1880);
            int _1888 = _1762 + 6656;
            uint _1890 = uint(int(uint(_1888) >> uint(2)));
            uint _1892 = uint(int(uint(int(_1890)) >> uint(2)));
            int _1894 = int(_1890) & 3;
            float _1896 = (*spvDescriptorSet0.cp_c5)._m0[int(_1892)][_1894];
            int _1898 = int(_1890) + 1;
            uint _1900 = uint(int(uint(_1898) >> uint(2)));
            int _1902 = _1898 & 3;
            float _1904 = (*spvDescriptorSet0.cp_c5)._m0[int(_1900)][_1902];
            float _1906 = _1886 + _1848;
            float _1908 = trunc(_1906);
            int _1910 = int(_1908);
            int _1912 = _1762 + 6664;
            uint _1914 = uint(int(uint(_1912) >> uint(2)));
            uint _1916 = uint(int(uint(int(_1914)) >> uint(2)));
            int _1918 = int(_1914) & 3;
            float _1920 = (*spvDescriptorSet0.cp_c5)._m0[int(_1916)][_1918];
            int _1922 = int(_1914) + 1;
            uint _1924 = uint(int(uint(_1922) >> uint(2)));
            int _1926 = _1922 & 3;
            float _1928 = (*spvDescriptorSet0.cp_c5)._m0[int(_1924)][_1926];
            int _1930 = ~as_type<int>(_1860);
            int _1932 = _1884 + _1930;
            int _1934 = _1932 + 1;
            int _1936 = _1766 + 6656;
            uint _1938 = uint(int(uint(_1936) >> uint(2)));
            uint _1940 = uint(int(uint(int(_1938)) >> uint(2)));
            int _1942 = int(_1938) & 3;
            float _1944 = (*spvDescriptorSet0.cp_c5)._m0[int(_1940)][_1942];
            int _1946 = int(_1938) + 1;
            uint _1948 = uint(int(uint(_1946) >> uint(2)));
            int _1950 = _1946 & 3;
            float _1952 = (*spvDescriptorSet0.cp_c5)._m0[int(_1948)][_1950];
            bool _1954 = _1934 >= 0;
            int _1956 = -as_type<int>(_1876);
            int _1958 = _1910 + _1956;
            int _1960 = _1766 + 6664;
            uint _1962 = uint(int(uint(_1960) >> uint(2)));
            uint _1964 = uint(int(uint(int(_1962)) >> uint(2)));
            int _1966 = int(_1962) & 3;
            float _1968 = (*spvDescriptorSet0.cp_c5)._m0[int(_1964)][_1966];
            int _1970 = int(_1962) + 1;
            uint _1972 = uint(int(uint(_1970) >> uint(2)));
            int _1974 = _1970 & 3;
            float _1976 = (*spvDescriptorSet0.cp_c5)._m0[int(_1972)][_1974];
            float _1978 = _1760 * _1904;
            bool _1980 = _1958 >= 0;
            float _1982 = fma(_1752, _1896, _1978);
            uint _1984 = as_type<uint>(_1876);
            _1736 = uint(_1764);
            if (_1954)
            {
                int _1986 = _1692 << 4;
                int _1988 = _1986 + 6400;
                _1984 = uint(_1988);
            }
            uint _1990 = _1984;
            int _1992 = _1762 + 6528;
            uint _1994 = uint(int(uint(_1992) >> uint(2)));
            uint _1996 = uint(int(uint(int(_1994)) >> uint(2)));
            int _1998 = int(_1994) & 3;
            float _2000 = (*spvDescriptorSet0.cp_c5)._m0[int(_1996)][_1998];
            float _2002 = fma(_1776, _1920, _1982);
            int _2004 = int(_1990);
            if (_1954)
            {
                uint _2006 = uint(int(uint(int(_1990)) >> uint(2)));
                uint _2008 = uint(int(uint(int(_2006)) >> uint(2)));
                int _2010 = int(_2006) & 3;
                float _2012 = (*spvDescriptorSet0.cp_c5)._m0[int(_2008)][_2010];
                _2004 = as_type<int>(_2012);
            }
            int _2014 = _2004;
            float _2016 = _1760 * _1952;
            float _2018 = _2002 + _1928;
            if (_1980)
            {
                int _2020 = _1764 << 4;
                int _2022 = _2020 + 6400;
                _1722 = uint(_2022);
            }
            uint _2024 = _1722;
            float _2026 = fma(_1752, _1944, _2016);
            float _2028 = trunc(_2018);
            int _2030 = int(_2028);
            int _2032 = _1766 + 6528;
            uint _2034 = uint(int(uint(_2032) >> uint(2)));
            uint _2036 = uint(int(uint(int(_2034)) >> uint(2)));
            int _2038 = int(_2034) & 3;
            float _2040 = (*spvDescriptorSet0.cp_c5)._m0[int(_2036)][_2038];
            float _2042 = fma(_1776, _1968, _2026);
            float _2044 = _2042 + _1976;
            int _2046 = int(_2024);
            if (_1980)
            {
                uint _2048 = uint(int(uint(int(_2024)) >> uint(2)));
                uint _2050 = uint(int(uint(int(_2048)) >> uint(2)));
                int _2052 = int(_2048) & 3;
                float _2054 = (*spvDescriptorSet0.cp_c5)._m0[int(_2050)][_2052];
                _2046 = as_type<int>(_2054);
            }
            int _2056 = _2046;
            float _2058 = trunc(_2044);
            int _2060 = int(_2058);
            int _2062 = ~as_type<int>(_2000);
            int _2064 = _2030 + _2062;
            int _2066 = _2064 + 1;
            int _2068 = _1692 * 4;
            bool _2070 = _1934 >= _2014;
            bool _2072 = !_1954;
            bool _2074 = _2070 || _2072;
            bool _2076 = _2066 < 0;
            bool _2078 = _2076 || _2074;
            bool _2080 = _2068 == 4;
            int _2082 = ~as_type<int>(_2040);
            int _2084 = _2060 + _2082;
            int _2086 = _2084 + 1;
            bool _2088 = _2068 == 0;
            bool _2090 = _2068 == 12;
            int _2092 = int(_2078);
            int _2094 = _2090 ? 2 : 0;
            int _2096 = _2092 | _2094;
            int _2098 = _1696 ? 4 : 0;
            int _2100 = _2096 | _2098;
            int _2102 = _2080 ? 8 : 0;
            int _2104 = _2100 | _2102;
            int _2106 = _2088 ? 16 : 0;
            int _2108 = _2104 | _2106;
            int _2110 = _1698 ? 32 : 0;
            int _2112 = _2108 | _2110;
            int _2114 = _1980 ? 64 : 0;
            int _2116 = _2112 | _2114;
            int _2118 = _2116 & 8;
            bool _2120 = _1958 >= _2056;
            bool _2122 = !_1980;
            bool _2124 = _2120 || _2122;
            uint _2126 = as_type<uint>(_2000);
            uint _2128 = uint(_2060);
            int _2130 = _2014;
            int _2132 = _2068;
            if (!_2078)
            {
                int _2134 = _1692 << 4;
                int _2136 = _2134 + 6400;
                _2126 = uint(_2136);
            }
            uint _2138 = _2126;
            bool _2140 = _2086 < 0;
            bool _2142 = _2140 || _2124;
            int _2144 = _1764 << 2;
            int _2146 = int(_2138);
            if (!_2078)
            {
                uint _2148 = uint(int(uint(int(_2138)) >> uint(2)));
                uint _2150 = uint(int(uint(int(_2148)) >> uint(2)));
                int _2152 = int(_2148) & 3;
                float _2154 = (*spvDescriptorSet0.cp_c5)._m0[int(_2150)][_2152];
                _2146 = as_type<int>(_2154);
            }
            int _2156 = _2146;
            if (!_2142)
            {
                int _2158 = _1764 << 4;
                int _2160 = _2158 + 6400;
                _2128 = uint(_2160);
            }
            uint _2162 = _2128;
            int _2164 = int(_2162);
            if (!_2142)
            {
                uint _2166 = uint(int(uint(int(_2162)) >> uint(2)));
                uint _2168 = uint(int(uint(int(_2166)) >> uint(2)));
                int _2170 = int(_2166) & 3;
                float _2172 = (*spvDescriptorSet0.cp_c5)._m0[int(_2168)][_2170];
                _2164 = as_type<int>(_2172);
            }
            int _2174 = _2164;
            bool _2176 = _2066 >= _2156;
            bool _2178 = _2176 || _2078;
            bool _2180 = _2068 == 8;
            if (_2178)
            {
                _2130 = as_type<int>((*spvDescriptorSet0.cp_c5)._m0[2420].z);
            }
            int _2182 = _2130;
            bool _2184 = _2086 >= _2174;
            bool _2186 = _2184 || _2142;
            int _2188 = _2182;
            if (!_2178)
            {
                int _2190 = _1692 << 4;
                int _2192 = _2190 + 6400;
                int _2194 = _1692 * 100;
                float _2196 = floor(_1878);
                uint _2198 = uint(int(uint(_2192) >> uint(2)));
                uint _2200 = uint(int(uint(int(_2198)) >> uint(2)));
                int _2202 = int(_2198) & 3;
                float _2204 = (*spvDescriptorSet0.cp_c5)._m0[int(_2200)][_2202];
                float _2206 = -_2196;
                float _2208 = _1878 + _2206;
                int _2210 = _2066 * as_type<int>(_2204);
                int _2212 = _2210 + _1934;
                int _2214 = _2212 * 4;
                uint _2216 = uint(int(uint(_2212) >> uint(2)));
                int _2218 = int(_2216) + _2194;
                int _2220 = 12 & _2214;
                int _2222 = _2218 << 4;
                int _2224 = _2222 + _2220;
                float _2226 = floor(_2018);
                uint _2228 = uint(int(uint(_2224) >> uint(2)));
                uint _2230 = uint(int(uint(int(_2228)) >> uint(2)));
                int _2232 = int(_2228) & 3;
                float _2234 = (*spvDescriptorSet0.cp_c5)._m0[int(_2230)][_2232];
                float _2236 = -_2226;
                float _2238 = _2018 + _2236;
                float _2240 = rint(_2234);
                float _2242 = precise::max(_2240, 0.0);
                uint _2244 = uint(_2242);
                uint _2246 = clamp(_2244, 0u, 65535u);
                float3 _6361 = float3(_2208, _2238, float(int(_2246)));
                float3 _6363 = select(_6361, float3(0.0), isnan(_6361));
                float _2248 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _6363.xy, uint(rint(_6363.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _6363.xy, uint(rint(_6363.z)), level(0.0)).x;
                int _2250 = _1692 * 400;
                int _2252 = _2250 + _2212;
                int _2254 = _2224 + 32320;
                uint _2256 = uint(int(uint(_2254) >> uint(2)));
                uint _2258 = uint(int(uint(int(_2256)) >> uint(2)));
                int _2260 = int(_2256) & 3;
                float _2262 = (*spvDescriptorSet0.cp_c5)._m0[int(_2258)][_2260];
                int _2264 = _2252 << 4;
                int _2266 = _2264 + 6720;
                uint _2268 = uint(int(uint(_2266) >> uint(2)));
                uint _2270 = uint(int(uint(int(_2268)) >> uint(2)));
                int _2272 = int(_2268) & 3;
                float _2274 = (*spvDescriptorSet0.cp_c5)._m0[int(_2270)][_2272];
                int _2276 = int(_2268) + 1;
                uint _2278 = uint(int(uint(_2276) >> uint(2)));
                int _2280 = _2276 & 3;
                float _2282 = (*spvDescriptorSet0.cp_c5)._m0[int(_2278)][_2280];
                int _2284 = _2266 + 8;
                uint _2286 = uint(int(uint(_2284) >> uint(2)));
                uint _2288 = uint(int(uint(int(_2286)) >> uint(2)));
                int _2290 = int(_2286) & 3;
                float _2292 = (*spvDescriptorSet0.cp_c5)._m0[int(_2288)][_2290];
                int _2294 = int(_2286) + 1;
                uint _2296 = uint(int(uint(_2294) >> uint(2)));
                int _2298 = _2294 & 3;
                float _2300 = (*spvDescriptorSet0.cp_c5)._m0[int(_2296)][_2298];
                float _2302 = _1760 * _2282;
                float _2304 = fma(_1752, _2274, _2302);
                float _2306 = 1.0 / _2262;
                float _2308 = fma(_1776, _2292, _2304);
                float _2310 = _2308 + _2300;
                float _2312 = precise::clamp(_2310, 0.0, 1.0);
                float _2314 = -_2312;
                float _2316 = _2314 + _2248;
                float _2318 = _2262 * (*spvDescriptorSet0.cp_c5)._m0[2420].x;
                float _2320 = fma(_2306, (*spvDescriptorSet0.cp_c5)._m0[2420].y, _2316);
                float _2322 = _2318 * _2320;
                float _2324 = exp2(_2322);
                float _2326 = 0.0 + _2324;
                float _2328 = precise::clamp(_2326, 0.0, 1.0);
                float _2330 = precise::min(_2328, (*spvDescriptorSet0.cp_c5)._m0[2420].z);
                _2188 = as_type<int>(_2330);
                _2132 = _2224;
            }
            int _2332 = _2188;
            int _2334 = _2132;
            int _2336 = _2334;
            if (_2088)
            {
                _1724 = _2332;
            }
            int _2338 = _1724;
            int _2340 = _2338;
            if (_2186)
            {
                _2336 = as_type<int>((*spvDescriptorSet0.cp_c5)._m0[2420].z);
            }
            int _2342 = _2336;
            bool _2344 = _2144 == 0;
            bool _2346 = _2144 == 4;
            bool _2348 = _2144 == 8;
            bool _2350 = _2144 == 12;
            int _2352 = _2342;
            if (!_2186)
            {
                int _2354 = _1764 << 4;
                int _2356 = _2354 + 6400;
                int _2358 = _1764 * 100;
                float _2360 = floor(_2044);
                uint _2362 = uint(int(uint(_2356) >> uint(2)));
                uint _2364 = uint(int(uint(int(_2362)) >> uint(2)));
                int _2366 = int(_2362) & 3;
                float _2368 = (*spvDescriptorSet0.cp_c5)._m0[int(_2364)][_2366];
                float _2370 = -_2360;
                float _2372 = _2044 + _2370;
                int _2374 = _2086 * as_type<int>(_2368);
                int _2376 = _2374 + _1958;
                int _2378 = _2376 << 2;
                uint _2380 = uint(int(uint(_2376) >> uint(2)));
                int _2382 = int(_2380) + _2358;
                int _2384 = 12 & _2378;
                int _2386 = _2382 << 4;
                int _2388 = _2386 + _2384;
                float _2390 = floor(_1906);
                uint _2392 = uint(int(uint(_2388) >> uint(2)));
                uint _2394 = uint(int(uint(int(_2392)) >> uint(2)));
                int _2396 = int(_2392) & 3;
                float _2398 = (*spvDescriptorSet0.cp_c5)._m0[int(_2394)][_2396];
                float _2400 = -_2390;
                float _2402 = _1906 + _2400;
                float _2404 = rint(_2398);
                float _2406 = precise::max(_2404, 0.0);
                uint _2408 = uint(_2406);
                uint _2410 = clamp(_2408, 0u, 65535u);
                float3 _6614 = float3(_2402, _2372, float(int(_2410)));
                float3 _6616 = select(_6614, float3(0.0), isnan(_6614));
                float _2412 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _6616.xy, uint(rint(_6616.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _6616.xy, uint(rint(_6616.z)), level(0.0)).x;
                int _2414 = _1764 * 400;
                int _2416 = _2414 + _2376;
                int _2418 = _2388 + 32320;
                uint _2420 = uint(int(uint(_2418) >> uint(2)));
                uint _2422 = uint(int(uint(int(_2420)) >> uint(2)));
                int _2424 = int(_2420) & 3;
                float _2426 = (*spvDescriptorSet0.cp_c5)._m0[int(_2422)][_2424];
                int _2428 = _2416 << 4;
                int _2430 = _2428 + 6720;
                uint _2432 = uint(int(uint(_2430) >> uint(2)));
                uint _2434 = uint(int(uint(int(_2432)) >> uint(2)));
                int _2436 = int(_2432) & 3;
                float _2438 = (*spvDescriptorSet0.cp_c5)._m0[int(_2434)][_2436];
                int _2440 = int(_2432) + 1;
                uint _2442 = uint(int(uint(_2440) >> uint(2)));
                int _2444 = _2440 & 3;
                float _2446 = (*spvDescriptorSet0.cp_c5)._m0[int(_2442)][_2444];
                int _2448 = _2430 + 8;
                uint _2450 = uint(int(uint(_2448) >> uint(2)));
                uint _2452 = uint(int(uint(int(_2450)) >> uint(2)));
                int _2454 = int(_2450) & 3;
                float _2456 = (*spvDescriptorSet0.cp_c5)._m0[int(_2452)][_2454];
                int _2458 = int(_2450) + 1;
                uint _2460 = uint(int(uint(_2458) >> uint(2)));
                int _2462 = _2458 & 3;
                float _2464 = (*spvDescriptorSet0.cp_c5)._m0[int(_2460)][_2462];
                float _2466 = _1760 * _2446;
                float _2468 = fma(_1752, _2438, _2466);
                float _2470 = 1.0 / _2426;
                float _2472 = fma(_1776, _2456, _2468);
                float _2474 = _2472 + _2464;
                float _2476 = precise::clamp(_2474, 0.0, 1.0);
                float _2478 = -_2476;
                float _2480 = _2478 + _2412;
                float _2482 = _2426 * (*spvDescriptorSet0.cp_c5)._m0[2420].x;
                float _2484 = fma(_2470, (*spvDescriptorSet0.cp_c5)._m0[2420].y, _2480);
                float _2486 = _2482 * _2484;
                float _2488 = exp2(_2486);
                float _2490 = 0.0 + _2488;
                float _2492 = precise::clamp(_2490, 0.0, 1.0);
                float _2494 = precise::min(_2492, (*spvDescriptorSet0.cp_c5)._m0[2420].z);
                _2352 = as_type<int>(_2494);
            }
            int _2496 = _2352;
            bool _2498 = _2118 != 0;
            if (_2344)
            {
                _2340 = _2496;
            }
            int _2500 = _2340;
            _1738 = _2500;
            if (_2180)
            {
                _1726 = _2332;
            }
            int _2502 = _1726;
            int _2504 = _2502;
            if (_2090)
            {
                _1728 = _2332;
            }
            int _2506 = _1728;
            int _2508 = _2506;
            if (_2350)
            {
                _2508 = _2496;
            }
            int _2510 = _2508;
            _1744 = _2510;
            if (_2348)
            {
                _2504 = _2496;
            }
            int _2512 = _2504;
            int _2514 = _1764 + 1;
            _1734 = _2514;
            _1742 = _2512;
            if (_2498)
            {
                _1730 = _2332;
            }
            int _2516 = _1730;
            int _2518 = _2516;
            if (_2346)
            {
                _2518 = _2496;
            }
            int _2520 = _2518;
            int _2522 = int(_2180);
            int _2524 = _2090 ? 2 : 0;
            int _2526 = _2522 | _2524;
            int _2528 = _2344 ? 4 : 0;
            int _2530 = _2526 | _2528;
            int _2532 = _2346 ? 8 : 0;
            int _2534 = _2530 | _2532;
            int _2536 = _2348 ? 16 : 0;
            int _2538 = _2534 | _2536;
            int _2540 = _2350 ? 32 : 0;
            int _2542 = _2538 | _2540;
            int _2544 = _2542 & 64;
            _1732 = _2544;
            _1740 = _2520;
        }
        int _2546 = _1732;
        int _2548 = _1734;
        uint _2550 = _1736;
        int _2552 = _1738;
        int _2554 = _1740;
        int _2556 = _1742;
        int _2558 = _1744;
        bool _2560 = _2546 != 0;
        bool _2562 = _2548 < as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].y);
        bool _2564 = _2562 || _2560;
        bool _2566 = !_2564;
        uint _2568 = _2550;
        int _2570 = _2552;
        int _2572 = _2554;
        int _2574 = _2556;
        _83 = _2552;
        _85 = _2554;
        _87 = _2556;
        _89 = _2558;
        if (!_2566)
        {
            uint _2576 = uint(int(uint(_63) >> uint(2)));
            uint _2578 = uint(int(uint(int(_2576)) >> uint(2)));
            int _2580 = int(_2576) & 3;
            float _2582 = (*spvDescriptorSet0.cp_c3)._m0[int(_2578)][_2580];
            int _2584 = int(_2576) + 1;
            uint _2586 = uint(int(uint(_2584) >> uint(2)));
            int _2588 = _2584 & 3;
            float _2590 = (*spvDescriptorSet0.cp_c3)._m0[int(_2586)][_2588];
            int _2592 = _2548 << 4;
            int _2594 = _63 + 8;
            uint _2596 = uint(int(uint(_2594) >> uint(2)));
            uint _2598 = uint(int(uint(int(_2596)) >> uint(2)));
            int _2600 = int(_2596) & 3;
            float _2602 = (*spvDescriptorSet0.cp_c3)._m0[int(_2598)][_2600];
            int _2604 = _2592 + 6592;
            uint _2606 = uint(int(uint(_2604) >> uint(2)));
            uint _2608 = uint(int(uint(int(_2606)) >> uint(2)));
            int _2610 = int(_2606) & 3;
            float _2612 = (*spvDescriptorSet0.cp_c5)._m0[int(_2608)][_2610];
            int _2614 = int(_2606) + 1;
            uint _2616 = uint(int(uint(_2614) >> uint(2)));
            int _2618 = _2614 & 3;
            float _2620 = (*spvDescriptorSet0.cp_c5)._m0[int(_2616)][_2618];
            int _2622 = _2592 + 6600;
            uint _2624 = uint(int(uint(_2622) >> uint(2)));
            uint _2626 = uint(int(uint(int(_2624)) >> uint(2)));
            int _2628 = int(_2624) & 3;
            float _2630 = (*spvDescriptorSet0.cp_c5)._m0[int(_2626)][_2628];
            int _2632 = int(_2624) + 1;
            uint _2634 = uint(int(uint(_2632) >> uint(2)));
            int _2636 = _2632 & 3;
            float _2638 = (*spvDescriptorSet0.cp_c5)._m0[int(_2634)][_2636];
            int _2640 = _2592 + 6464;
            uint _2642 = uint(int(uint(_2640) >> uint(2)));
            uint _2644 = uint(int(uint(int(_2642)) >> uint(2)));
            int _2646 = int(_2642) & 3;
            float _2648 = (*spvDescriptorSet0.cp_c5)._m0[int(_2644)][_2646];
            int _2650 = _2592 + 6664;
            uint _2652 = uint(int(uint(_2650) >> uint(2)));
            uint _2654 = uint(int(uint(int(_2652)) >> uint(2)));
            int _2656 = int(_2652) & 3;
            float _2658 = (*spvDescriptorSet0.cp_c5)._m0[int(_2654)][_2656];
            int _2660 = int(_2652) + 1;
            uint _2662 = uint(int(uint(_2660) >> uint(2)));
            int _2664 = _2660 & 3;
            float _2666 = (*spvDescriptorSet0.cp_c5)._m0[int(_2662)][_2664];
            float _2668 = _2590 * _2620;
            float _2670 = fma(_2582, _2612, _2668);
            float _2672 = fma(_2602, _2630, _2670);
            float _2674 = _2672 + _2638;
            int _2676 = _2592 + 6656;
            uint _2678 = uint(int(uint(_2676) >> uint(2)));
            uint _2680 = uint(int(uint(int(_2678)) >> uint(2)));
            int _2682 = int(_2678) & 3;
            float _2684 = (*spvDescriptorSet0.cp_c5)._m0[int(_2680)][_2682];
            int _2686 = int(_2678) + 1;
            uint _2688 = uint(int(uint(_2686) >> uint(2)));
            int _2690 = _2686 & 3;
            float _2692 = (*spvDescriptorSet0.cp_c5)._m0[int(_2688)][_2690];
            float _2694 = trunc(_2674);
            int _2696 = int(_2694);
            int _2698 = ~as_type<int>(_2648);
            int _2700 = _2696 + _2698;
            int _2702 = _2700 + 1;
            bool _2704 = _2702 >= 0;
            float _2706 = _2590 * _2692;
            int _2708 = _2592 + 6528;
            uint _2710 = uint(int(uint(_2708) >> uint(2)));
            uint _2712 = uint(int(uint(int(_2710)) >> uint(2)));
            int _2714 = int(_2710) & 3;
            float _2716 = (*spvDescriptorSet0.cp_c5)._m0[int(_2712)][_2714];
            float _2718 = fma(_2582, _2684, _2706);
            float _2720 = fma(_2602, _2658, _2718);
            uint _2722 = as_type<uint>(_2718);
            if (_2704)
            {
                int _2724 = _2548 << 4;
                int _2726 = _2724 + 6400;
                _2568 = uint(_2726);
            }
            uint _2728 = _2568;
            float _2730 = _2720 + _2666;
            float _2732 = trunc(_2730);
            int _2734 = int(_2732);
            int _2736 = int(_2728);
            if (_2704)
            {
                uint _2738 = uint(int(uint(int(_2728)) >> uint(2)));
                uint _2740 = uint(int(uint(int(_2738)) >> uint(2)));
                int _2742 = int(_2738) & 3;
                float _2744 = (*spvDescriptorSet0.cp_c5)._m0[int(_2740)][_2742];
                _2736 = as_type<int>(_2744);
            }
            int _2746 = _2736;
            int _2748 = -as_type<int>(_2716);
            int _2750 = _2734 + _2748;
            int _2752 = _2548 << 2;
            bool _2754 = _2752 == 0;
            bool _2756 = _2752 == 4;
            bool _2758 = _2702 >= _2746;
            bool _2760 = !_2704;
            bool _2762 = _2758 || _2760;
            bool _2764 = _2752 == 8;
            bool _2766 = _2750 < 0;
            bool _2768 = _2766 || _2762;
            bool _2770 = _2752 == 12;
            int _2772 = _2746;
            if (!_2768)
            {
                int _2774 = _2548 << 4;
                int _2776 = _2774 + 6400;
                _2722 = uint(_2776);
            }
            uint _2778 = _2722;
            int _2780 = int(_2778);
            if (!_2768)
            {
                uint _2782 = uint(int(uint(int(_2778)) >> uint(2)));
                uint _2784 = uint(int(uint(int(_2782)) >> uint(2)));
                int _2786 = int(_2782) & 3;
                float _2788 = (*spvDescriptorSet0.cp_c5)._m0[int(_2784)][_2786];
                _2780 = as_type<int>(_2788);
            }
            int _2790 = _2780;
            bool _2792 = _2750 >= _2790;
            bool _2794 = _2792 || _2768;
            if (_2794)
            {
                _2772 = as_type<int>((*spvDescriptorSet0.cp_c5)._m0[2420].z);
            }
            int _2796 = _2772;
            int _2798 = _2796;
            if (!_2794)
            {
                int _2800 = _2548 << 4;
                int _2802 = _2800 + 6400;
                int _2804 = _2548 * 100;
                float _2806 = floor(_2730);
                uint _2808 = uint(int(uint(_2802) >> uint(2)));
                uint _2810 = uint(int(uint(int(_2808)) >> uint(2)));
                int _2812 = int(_2808) & 3;
                float _2814 = (*spvDescriptorSet0.cp_c5)._m0[int(_2810)][_2812];
                float _2816 = -_2806;
                float _2818 = _2816 + _2730;
                int _2820 = _2750 * as_type<int>(_2814);
                int _2822 = _2820 + _2702;
                int _2824 = _2822 * 4;
                uint _2826 = uint(int(uint(_2822) >> uint(2)));
                int _2828 = int(_2826) + _2804;
                int _2830 = 12 & _2824;
                int _2832 = _2828 << 4;
                int _2834 = _2832 + _2830;
                float _2836 = floor(_2674);
                uint _2838 = uint(int(uint(_2834) >> uint(2)));
                uint _2840 = uint(int(uint(int(_2838)) >> uint(2)));
                int _2842 = int(_2838) & 3;
                float _2844 = (*spvDescriptorSet0.cp_c5)._m0[int(_2840)][_2842];
                float _2846 = -_2836;
                float _2848 = _2846 + _2674;
                float _2850 = rint(_2844);
                float _2852 = precise::max(_2850, 0.0);
                uint _2854 = uint(_2852);
                uint _2856 = clamp(_2854, 0u, 65535u);
                float3 _7313 = float3(_2848, _2818, float(int(_2856)));
                float3 _7315 = select(_7313, float3(0.0), isnan(_7313));
                float _2858 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _7315.xy, uint(rint(_7315.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _7315.xy, uint(rint(_7315.z)), level(0.0)).x;
                int _2860 = _2548 * 400;
                int _2862 = _2860 + _2822;
                int _2864 = _2834 + 32320;
                uint _2866 = uint(int(uint(_2864) >> uint(2)));
                uint _2868 = uint(int(uint(int(_2866)) >> uint(2)));
                int _2870 = int(_2866) & 3;
                float _2872 = (*spvDescriptorSet0.cp_c5)._m0[int(_2868)][_2870];
                int _2874 = _2862 << 4;
                int _2876 = _2874 + 6720;
                uint _2878 = uint(int(uint(_2876) >> uint(2)));
                uint _2880 = uint(int(uint(int(_2878)) >> uint(2)));
                int _2882 = int(_2878) & 3;
                float _2884 = (*spvDescriptorSet0.cp_c5)._m0[int(_2880)][_2882];
                int _2886 = int(_2878) + 1;
                uint _2888 = uint(int(uint(_2886) >> uint(2)));
                int _2890 = _2886 & 3;
                float _2892 = (*spvDescriptorSet0.cp_c5)._m0[int(_2888)][_2890];
                int _2894 = _2876 + 8;
                uint _2896 = uint(int(uint(_2894) >> uint(2)));
                uint _2898 = uint(int(uint(int(_2896)) >> uint(2)));
                int _2900 = int(_2896) & 3;
                float _2902 = (*spvDescriptorSet0.cp_c5)._m0[int(_2898)][_2900];
                int _2904 = int(_2896) + 1;
                uint _2906 = uint(int(uint(_2904) >> uint(2)));
                int _2908 = _2904 & 3;
                float _2910 = (*spvDescriptorSet0.cp_c5)._m0[int(_2906)][_2908];
                float _2912 = _2590 * _2892;
                float _2914 = 1.0 / _2872;
                float _2916 = fma(_2582, _2884, _2912);
                float _2918 = fma(_2602, _2902, _2916);
                float _2920 = _2872 * (*spvDescriptorSet0.cp_c5)._m0[2420].x;
                float _2922 = _2918 + _2910;
                float _2924 = precise::clamp(_2922, 0.0, 1.0);
                float _2926 = -_2924;
                float _2928 = _2926 + _2858;
                float _2930 = fma(_2914, (*spvDescriptorSet0.cp_c5)._m0[2420].y, _2928);
                float _2932 = _2920 * _2930;
                float _2934 = exp2(_2932);
                float _2936 = 0.0 + _2934;
                float _2938 = precise::clamp(_2936, 0.0, 1.0);
                float _2940 = precise::min(_2938, (*spvDescriptorSet0.cp_c5)._m0[2420].z);
                _2798 = as_type<int>(_2940);
            }
            int _2942 = _2798;
            if (_2754)
            {
                _2570 = _2942;
            }
            int _2944 = _2570;
            _83 = _2944;
            if (_2756)
            {
                _2572 = _2942;
            }
            int _2946 = _2572;
            _85 = _2946;
            if (_2764)
            {
                _2574 = _2942;
            }
            int _2948 = _2574;
            _87 = _2948;
            if (_2770)
            {
                _89 = _2942;
            }
        }
    }
    int _2950 = _83;
    int _2952 = _85;
    int _2954 = _87;
    int _2956 = _89;
    uint _2958 = uint(int(uint(_63) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_2958)] = uint(_2950);
    int _2960 = _63 + 4;
    uint _2962 = uint(int(uint(_2960) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_2962)] = uint(_2952);
    int _2964 = _63 + 8;
    uint _2966 = uint(int(uint(_2964) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_2966)] = uint(_2954);
    int _2968 = _63 + 12;
    uint _2970 = uint(int(uint(_2968) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_2970)] = uint(_2956);
}

