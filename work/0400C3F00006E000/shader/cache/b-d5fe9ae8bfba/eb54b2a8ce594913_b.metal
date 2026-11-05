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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_71 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_91 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_61 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_67 [[attribute(7)]];
    float4 m_59 [[attribute(9)]];
    float4 m_55 [[attribute(10)]];
};

static inline __attribute__((always_inline))
void _104(thread const int& _5607, thread const int& _5608, thread const int& _5609, thread const int& _5610, thread int& _5611, thread int& _5612, thread int& _5613, thread int& _5614, thread int& _5615, thread int& _5616, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _5619 = _5608;
    int _5621 = _5609;
    float _5623 = as_type<float>(_5607) + 0.0;
    bool _5625 = _5623 != 0.0;
    bool _5627 = isnan(_5623);
    bool _5629 = _5625 || _5627;
    bool _5631 = isnan(0.0);
    bool _5633 = _5629 || _5631;
    int _5635 = as_type<int>(_5623);
    int _5637 = _5633 ? (-1) : 0;
    if (!_5633)
    {
        float _5639 = as_type<float>(_5607) * 1.0;
        _5635 = as_type<int>(_5639);
    }
    int _5641 = _5635;
    bool _5643 = !_5633;
    int _5645 = _5641;
    if (!_5643)
    {
        float _5647 = as_type<float>(_5607) + 0.0;
        bool _5649 = _5647 >= 0.0;
        bool _5651 = isnan(_5647);
        bool _5653 = _5649 || _5651;
        bool _5655 = isnan(0.0);
        bool _5657 = _5653 || _5655;
        int _5659 = as_type<int>(_5647);
        _5637 = _5657 ? (-1) : 0;
        if (!_5657)
        {
            _5659 = 2147483647;
        }
        int _5661 = _5659;
        bool _5663 = !_5657;
        _5645 = _5661;
        if (!_5663)
        {
            float _5665 = abs(as_type<float>(_5607));
            float _5667 = _5665 + 0.0;
            bool _5669 = _5667 > as_type<float>(0x7f800000u /* inf */);
            bool _5671 = isnan(_5667);
            bool _5673 = _5669 || _5671;
            bool _5675 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _5677 = _5673 || _5675;
            int _5679 = as_type<int>(_5667);
            _5637 = _5677 ? (-1) : 0;
            if (_5677)
            {
                float _5681 = as_type<float>(_5607) + 1.0;
                _5679 = as_type<int>(_5681);
            }
            int _5683 = _5679;
            _5645 = _5683;
            if (!_5677)
            {
                float _5685 = abs(as_type<float>(_5607));
                float _5687 = _5685 + (-0.0);
                float _5689 = 0.0 + _5687;
                bool _5691 = _5689 != as_type<float>(0x7f800000u /* inf */);
                bool _5693 = isnan(_5689);
                bool _5695 = _5691 || _5693;
                bool _5697 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _5699 = _5695 || _5697;
                int _5701 = as_type<int>(_5689);
                _5637 = _5699 ? (-1) : 0;
                if (!_5699)
                {
                    _5701 = _5607;
                }
                int _5703 = _5701;
                bool _5705 = !_5699;
                _5645 = _5703;
                if (!_5705)
                {
                    float _5707 = as_type<float>(_5607) * 18446744073709551616.0;
                    float _5709 = rsqrt(_5707);
                    float _5711 = _5707 * _5709;
                    float _5713 = _5709 * 0.5;
                    float _5715 = -_5711;
                    float _5717 = 0.0 + _5715;
                    float _5719 = fma(_5713, _5717, 0.5);
                    float _5721 = fma(_5711, _5719, _5711);
                    float _5723 = -_5721;
                    float _5725 = 0.0 + _5723;
                    float _5727 = fma(_5721, _5725, _5707);
                    float _5729 = fma(_5713, _5727, _5721);
                    float _5731 = _5729 * 2.3283064365386962890625e-10;
                    _5645 = as_type<int>(_5731);
                    _5619 = as_type<int>(_5721);
                    _5621 = as_type<int>(_5717);
                }
            }
        }
    }
    int _5733 = _5645;
    int _5735 = _5619;
    int _5737 = _5621;
    int _5739 = _5637;
    _5611 = _5733;
    _5612 = _5610;
    _5613 = 0;
    _5614 = _5735;
    _5615 = _5737;
    _5616 = _5739;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1847 = false;
    bool _976 = false;
    bool _660 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = trunc(_108);
    int _112 = int(_110);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    float _120 = as_type<float>(_112);
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _118;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _122 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2207 = as_type<float>(_128);
        out.gl_Position.z = _2207;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_53.w;
    float _134 = float(_112);
    float _136 = -_132;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_132);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    bool _150 = _138 >= _134;
    bool _152 = !_148;
    bool _154 = _150 || _152;
    if (_154)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _120;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _130 = as_type<int>(_158);
    }
    int _160 = _130;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2270 = as_type<float>(_160);
        out.gl_Position.z = _2270;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_48.x;
    float _164 = in.m_48.y;
    float _166 = in.m_48.z;
    float _168 = 1.0 / _134;
    float _170 = in.m_55.x;
    float _172 = in.m_55.y;
    float _174 = in.m_55.z;
    float _176 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _178 = fma(_176, 10.0, 10.0);
    float _180 = in.m_57.y;
    float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _186 = _184 != 0;
    float _188 = in.m_59.x;
    int _190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _192 = _190 != 0;
    float _194 = _138 * _168;
    float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _198 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _200 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _202 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _204 = fma(_194, 0.2000000476837158203125, 1.0);
    float _206 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _198);
    float _208 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _200);
    float _210 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _202);
    float _212 = fma(_170, 2.0, -1.0);
    float _214 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _206);
    float _216 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _208);
    float _218 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _210);
    float _220 = fma(_172, 2.0, -1.0);
    float _222 = _214 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _224 = _216 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _226 = _218 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _228 = in.m_61.x;
    float _230 = in.m_61.y;
    float _232 = in.m_61.z;
    float _234 = -_222;
    float _236 = _234 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _238 = -_224;
    float _240 = _238 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _242 = -_226;
    float _244 = _242 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _246 = fma(_174, 2.0, -1.0);
    float _248 = _236 * _236;
    float _250 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _252 = _222 + _250;
    float _254 = precise::max(_194, 0.949999988079071044921875);
    float _256 = fma(_240, _240, _248);
    float _258 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.10471977293491363525390625;
    float _260 = precise::min(_254, 1.0);
    float _262 = fma(_244, _244, _256);
    float _264 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _266 = _224 + _264;
    float _268 = _258 * _178;
    float _270 = _212 * _204;
    float _272 = rsqrt(_262);
    float _274 = fma(_260, -19.999996185302734375, 19.999996185302734375);
    float _276 = _268 * 0.15915493667125701904296875;
    float _278 = _252 * _252;
    float _280 = _178;
    float _282 = _252;
    float _284 = _188;
    if (_186)
    {
        float _286 = in.m_57.x;
        _280 = _286;
    }
    float _288 = _280;
    bool _290 = _180 > 0.5;
    bool _292 = _290 && _192;
    float _294 = -_212;
    float _296 = _294 + _228;
    float _298 = _276 * 6.283185482025146484375;
    float _300 = sin(_298);
    float _302 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _304 = _226 + _302;
    float _306 = fma(_266, _266, _278);
    float _308 = -_220;
    float _310 = _308 + _230;
    float _312 = fma(_304, _304, _306);
    float _314 = _244 * _272;
    float _316 = _240 * _272;
    float _318 = _236 * _272;
    float _320 = _314 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _322 = rsqrt(_312);
    float _324 = _318 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _326 = -_320;
    float _328 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[10].y, _326);
    float _330 = fma(_300, 0.150000035762786865234375, 1.0499999523162841796875);
    float _332 = -_324;
    float _334 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[9].y, _332);
    float _336 = _316 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _338 = _328 * _328;
    bool _340 = _288 > 0.5;
    bool _342 = _340 && _186;
    float _344 = -_246;
    float _346 = _344 + _232;
    float _348 = -_336;
    float _350 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[8].y, _348);
    float _352 = fma(_334, _334, _338);
    float _354 = _330 * _274;
    float _356 = in.m_59.y;
    float _358 = fma(_350, _350, _352);
    float _360 = _252 * _322;
    float _362 = fma(_296, _354, _270);
    float _364 = _266 * _322;
    float _366 = rsqrt(_358);
    float _368 = -_360;
    float _370 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[18].w, _252);
    float _372 = fma(_310, _354, _220);
    float _374 = -_364;
    float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[18].w, _266);
    if (!_186)
    {
        _282 = _188;
    }
    float _378 = _282;
    float _380 = _370 * _370;
    float _382 = _378;
    if (_342)
    {
        float _384 = -_188;
        float _386 = _384 + 1.0;
        _284 = _386;
    }
    float _388 = _284;
    float _390 = fma(_346, _354, _246);
    float _392 = in.m_63.x;
    float _394 = in.m_63.y;
    float _396 = in.m_63.z;
    float _398 = fma(_376, _376, _380);
    float _400 = _304 * _322;
    if (_186)
    {
        _382 = _388;
    }
    float _402 = _382;
    out.m_65.x = _362;
    out.m_65.y = _372;
    out.m_65.z = _390;
    bool _404 = _372 != 0.0;
    bool _406 = isnan(_372);
    bool _408 = _404 || _406;
    bool _410 = isnan(0.0);
    bool _412 = _408 || _410;
    float _414 = -_400;
    float _416 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[18].w, _304);
    float _418 = _334 * _366;
    float _420 = _350 * _366;
    float _422 = _328 * _366;
    float _424 = fma(_416, _416, _398);
    float _426 = _418 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _428 = _420 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _430 = _422 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _432 = _362 == 0.0;
    bool _434 = !_412;
    bool _436 = _432 && _434;
    float _438 = -_426;
    float _440 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[8].y, _438);
    float _442 = -_428;
    float _444 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[10].y, _442);
    float _446 = -_430;
    float _448 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[9].y, _446);
    float _450 = in.m_67.x;
    float _452 = in.m_67.y;
    float _454 = in.m_67.z;
    float _456 = _440 * _440;
    bool _458 = _390 == 0.0;
    bool _460 = _458 && _436;
    float _462 = sqrt(_424);
    float _464 = fma(_444, _444, _456);
    float _466 = _356;
    if (_292)
    {
        float _468 = -_356;
        float _470 = _468 + 1.0;
        _466 = _470;
    }
    float _472 = _466;
    float _474 = _402 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _476 = fma(_448, _448, _464);
    float _478 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _372);
    float _480 = _472 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _482 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _362);
    float _484 = rsqrt(_476);
    float _486 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _390);
    float _488 = _394;
    float _490 = _392;
    float _492 = _396;
    if (!_460)
    {
        float _494 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[17].y, _394);
        _488 = _494;
    }
    float _496 = _488;
    if (!_460)
    {
        float _498 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[17].y, _392);
        _490 = _498;
    }
    float _500 = _490;
    if (!_460)
    {
        float _502 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[17].y, _396);
        _492 = _502;
    }
    float _504 = _492;
    float _506 = _474 * _196;
    float _508 = _496 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _510 = _322 * _462;
    float _512 = _496 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _514 = _496 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _516 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[8].x, _508);
    float _518 = _452 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _520 = _450 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _522 = _480 * _182;
    float _524 = _454 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _526 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _528 = _440 * _484;
    float _530 = _444 * _484;
    float _532 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _534 = _526 * _510;
    float _536 = _528 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _538 = _448 * _484;
    float _540 = _532 * _510;
    float _542 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[9].x, _512);
    float _544 = fma(_530, (*spvDescriptorSet0.vp_c10)._m0[8].z, _536);
    float _546 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _548 = _534 * _478;
    float _550 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[10].x, _514);
    float _552 = fma(_538, (*spvDescriptorSet0.vp_c10)._m0[10].z, _544);
    float _554 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[8].z, _516);
    out.m_69.x = _506;
    out.m_69.y = _522;
    float _556 = _540 * _482;
    float _558 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[9].z, _542);
    float _560 = _546 * _510;
    float _562 = _548 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _564 = abs(_552);
    float _566 = -_564;
    float _568 = _566 + 1.0;
    float _570 = _560 * _486;
    float _572 = fma(_556, (*spvDescriptorSet0.vp_c10)._m0[9].x, _562);
    float _574 = _548 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _576 = _548 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _578 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[9].z, _572);
    float _580 = fma(_556, (*spvDescriptorSet0.vp_c10)._m0[8].x, _574);
    float _582 = fma(_556, (*spvDescriptorSet0.vp_c10)._m0[10].x, _576);
    int _584 = as_type<int>(_568) + (-218103808);
    float _586 = abs(_552);
    float _588 = fma(_586, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _590 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[8].z, _580);
    float _592 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[10].z, _582);
    bool _594 = uint(_584) >= 1920991232u;
    float _596 = abs(_552);
    float _598 = fma(_596, _588, -0.212114393711090087890625);
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _608 = abs(_552);
    float _610 = fma(_608, _598, 1.570728778839111328125);
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _614 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[10].z, _550);
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _618 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _604 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _624 = _606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _626 = _612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _628 = _616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _630 = _552 < 0.0;
    float _632 = float(_630);
    bool _634 = !_594;
    float _636 = _590;
    float _658;
    if (!_634)
    {
        int _638 = as_type<int>(_568);
        int _640 = as_type<int>(_440);
        int _642 = as_type<int>(_448);
        int _644 = 3456;
        int _646;
        int _648;
        int _650;
        int _652;
        int _654;
        int _656;
        _104(_638, _640, _642, _644, _646, _648, _650, _652, _654, _656, out.gl_Position, out.gl_PointSize);
        _658 = as_type<float>(_646);
        _660 = true;
    }
    else
    {
        float _662 = rsqrt(_568);
        float _664 = _568 * _662;
        float _666 = _662 * 0.5;
        float _668 = -_664;
        float _670 = 0.0 + _668;
        float _672 = fma(_666, _670, 0.5);
        float _674 = fma(_664, _672, _664);
        float _676 = -_674;
        float _678 = 0.0 + _676;
        float _680 = fma(_674, _678, _568);
        float _682 = fma(_666, _680, _674);
        _658 = _682;
    }
    _660 = false;
    float _684 = _658;
    float _686 = _538 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _688 = _528 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _690 = _610 * _684;
    float _692 = -_686;
    float _694 = fma(_530, (*spvDescriptorSet0.vp_c10)._m0[10].z, _692);
    float _696 = _530 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _698 = -_688;
    float _700 = fma(_538, (*spvDescriptorSet0.vp_c10)._m0[9].z, _698);
    float _702 = _694 * _694;
    float _704 = -_696;
    float _706 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[8].z, _704);
    float _708 = _632 * 2.0;
    float _710 = fma(_700, _700, _702);
    float _712 = -_708;
    float _714 = fma(_690, _712, _690);
    float _716 = fma(_706, _706, _710);
    float _718 = fma(_632, 3.1415927410125732421875, _714);
    float _720 = rsqrt(_716);
    float _722 = _718 * 0.15915493667125701904296875;
    float _724 = _722 * 6.283185482025146484375;
    float _726 = cos(_724);
    float _728 = _694 * _720;
    float _730 = _700 * _720;
    float _732 = _706 * _720;
    float _734 = _728 * _728;
    float _736 = _722 * 6.283185482025146484375;
    float _738 = sin(_736);
    float _740 = fma(_730, _730, _734);
    float _742 = -_726;
    float _744 = _742 + 1.0;
    float _746 = fma(_732, _732, _740);
    float _748 = rsqrt(_746);
    float _750 = _732 * _748;
    float _752 = _730 * _748;
    float _754 = _728 * _748;
    float _756 = _750 * _738;
    float _758 = _752 * _744;
    float _760 = _752 * _738;
    float _762 = _754 * _744;
    float _764 = _754 * _738;
    float _766 = -_756;
    float _768 = fma(_754, _758, _766);
    float _770 = _750 * _750;
    float _772 = fma(_750, _762, _760);
    float _774 = fma(_752, _758, _726);
    float _776 = _578 * _768;
    float _778 = -_764;
    float _780 = fma(_750, _758, _778);
    float _782 = _578 * _772;
    float _784 = fma(_744, _770, _726);
    float _786 = fma(_590, _774, _776);
    float _788 = fma(_750, _758, _764);
    float _790 = fma(_590, _780, _782);
    float _792 = fma(_754, _762, _726);
    float _794 = fma(_754, _758, _756);
    float _796 = fma(_592, _788, _786);
    float _798 = fma(_592, _784, _790);
    float _800 = _578 * _792;
    float _802 = -_760;
    float _804 = fma(_750, _762, _802);
    float _806 = _224 + _796;
    float _808 = _226 + _798;
    float _810 = fma(_590, _794, _800);
    float _812 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _814 = _806 + _812;
    float _816 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _818 = _808 + _816;
    float _820 = fma(_592, _804, _810);
    float _822 = _814 * _814;
    float _824 = _818 * _818;
    float _826 = _222 + _820;
    float _828 = _822 + _824;
    float _830 = sqrt(_828);
    bool _832 = _830 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _834 = _810;
    float _836 = _806;
    float _838 = _726;
    float _840 = _822;
    float _842 = _826;
    float _844 = _792;
    float _846 = _814;
    if (!_832)
    {
        _636 = _806;
    }
    float _848 = _636;
    float _850 = _848;
    if (!_832)
    {
        _834 = _824;
    }
    float _852 = _834;
    float _854 = _852;
    if (!_832)
    {
        _836 = _808;
    }
    float _856 = _836;
    float _858 = _856;
    if (!_832)
    {
        _838 = _826;
    }
    float _860 = _838;
    bool _862 = !_832;
    float _864 = _860;
    if (!_862)
    {
        float _866 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _868 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _870 = _830 + _868;
        float _872 = _826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _874 = rsqrt(_828);
        float _876 = _870 * _866;
        float _878 = _876 * 0.15915493667125701904296875;
        float _880 = _878 * 6.283185482025146484375;
        float _882 = sin(_880);
        float _884 = _878 * 6.283185482025146484375;
        float _886 = cos(_884);
        float _888 = fma(_882, _872, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _890 = _874 * _888;
        float _892 = _886 + (-1.0);
        float _894 = _818 * _890;
        float _896 = _892 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = _814 * _890;
        float _900 = _894 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _902 = _894 * _894;
        float _904 = fma(_826, _886, _896);
        float _906 = _898 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _908 = _898 * _898;
        _864 = _904;
        _840 = _908;
        _854 = _902;
        _850 = _906;
        _858 = _900;
    }
    float _910 = _864;
    float _912 = _840;
    float _914 = _854;
    float _916 = _850;
    float _918 = _858;
    float _920 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _922 = _910 + _920;
    out.m_71.x = _618;
    out.m_71.y = _620;
    out.m_71.z = _622;
    float _924 = fma(_922, _922, _912);
    out.m_73.x = _624;
    out.m_73.y = _626;
    out.m_73.z = _628;
    float _926 = _924 + _914;
    out.m_75.x = _554;
    out.m_75.y = _558;
    out.m_75.z = _614;
    float _928 = sqrt(_926);
    bool _930 = _928 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _932 = isnan(_928);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _938 = _934 || _936;
    float _940 = _912;
    if (!_938)
    {
        _940 = 1.0;
    }
    float _942 = _940;
    bool _944 = !_938;
    float _946 = _942;
    if (!_944)
    {
        bool _948 = _928 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _950 = isnan(_928);
        bool _952 = _948 || _950;
        bool _954 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _956 = _952 || _954;
        if (!_956)
        {
            float _958 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _960 = _928 + _958;
            float _962 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _964 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _962;
            float _966 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _968 = _966 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _970 = 1.0 / _964;
            float _972 = _960 * _970;
            float _974 = fma(_972, _968, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _946 = _974;
            _976 = true;
        }
        else
        {
            bool _978 = _928 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _980 = isnan(_928);
            bool _982 = _978 || _980;
            bool _984 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _986 = _982 || _984;
            if (!_986)
            {
                float _988 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _990 = _928 + _988;
                float _992 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _994 = _992 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _996 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _998 = _996 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1000 = 1.0 / _994;
                float _1002 = _990 * _1000;
                float _1004 = fma(_1002, _998, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _946 = _1004;
                _976 = true;
            }
            else
            {
                _946 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _976 = false;
    float _1006 = _946;
    float _1008 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1010 = _910 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1014 = _916 + _1012;
    float _1016 = -_360;
    float _1018 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[18].w, _222);
    float _1020 = -_364;
    float _1022 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[18].w, _224);
    float _1024 = fma(_1010, _1006, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1026 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1028 = _918 + _1026;
    float _1030 = fma(_1014, _1006, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1032 = -_360;
    float _1034 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1024);
    float _1036 = fma(_1028, _1006, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1038 = -_364;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1030);
    float _1042 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1044 = _1034 + _1042;
    float _1046 = -_400;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1036);
    float _1050 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1052 = _1040 + _1050;
    float _1054 = _1044 * _1044;
    float _1056 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1058 = _1048 + _1056;
    float _1060 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1062 = fma(_1052, _1052, _1054);
    float _1064 = precise::max(0.0, _1060);
    float _1066 = fma(_1058, _1058, _1062);
    float _1068 = rsqrt(_1066);
    float _1070 = _1052 * _1068;
    float _1072 = _1058 * _1068;
    float _1074 = _1044 * _1068;
    float _1076 = _1070 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1078 = _1072 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1080 = -_1074;
    float _1082 = -_1064;
    float _1084 = fma(_1080, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1082);
    float _1086 = _1076 * _1076;
    float _1088 = _1078 * _1078;
    float _1090 = _1086 + _1088;
    float _1092 = sqrt(_1090);
    bool _1094 = _1092 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1098 = _1092 + _1096;
    float _1100 = _622;
    float _1102 = _1044;
    float _1104 = _1098;
    float _1106 = _1090;
    float _1108 = _1086;
    if (_1094)
    {
        float _1110 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1100 = _1110;
    }
    float _1112 = _1100;
    if (_1094)
    {
        float _1114 = _1084 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1102 = _1114;
    }
    float _1116 = _1102;
    float _1118 = _1116;
    if (_1094)
    {
        float _1120 = rsqrt(_1090);
        _842 = _1120;
    }
    float _1122 = _842;
    float _1124 = _1122;
    if (_1094)
    {
        float _1126 = _1098 * _1112;
        _1104 = _1126;
    }
    float _1128 = _1104;
    float _1130 = -_400;
    float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[18].w, _226);
    if (_1094)
    {
        float _1134 = _1128 * 0.15915493667125701904296875;
        _844 = _1134;
    }
    float _1136 = _844;
    float _1138 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1140 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1142 = _400;
    if (_1094)
    {
        float _1144 = _1136 * 6.283185482025146484375;
        float _1146 = cos(_1144);
        _1142 = _1146;
    }
    float _1148 = _1142;
    float _1150 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1138);
    float _1152 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1140);
    float _1154 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1150);
    float _1156 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1152);
    float _1158 = fma(_1132, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1160 = _928;
    if (_1094)
    {
        float _1162 = _1136 * 6.283185482025146484375;
        float _1164 = sin(_1162);
        _1160 = _1164;
    }
    float _1166 = _1160;
    float _1168 = _1154 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1170 = _1156 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1172 = fma(_1022, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1174 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1176 = _1170;
    float _1178 = _1168;
    if (_1094)
    {
        float _1180 = _1148 + (-1.0);
        _1174 = _1180;
    }
    float _1182 = _1174;
    float _1184 = 1.0 / _1168;
    float _1186 = _1170 + _1168;
    float _1188 = _1182;
    if (!_1094)
    {
        _1176 = _1076;
    }
    float _1190 = _1176;
    float _1192 = _1190;
    if (_1094)
    {
        float _1194 = _1182 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1106 = _1194;
    }
    float _1196 = _1106;
    if (!_1094)
    {
        _1188 = _1078;
    }
    float _1198 = _1188;
    float _1200 = _1198;
    if (_1094)
    {
        float _1202 = fma(_1166, _1116, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1118 = _1202;
    }
    float _1204 = _1118;
    if (!_1094)
    {
        _1178 = _1088;
    }
    float _1206 = _1178;
    float _1208 = floor(_1172);
    float _1210 = _1206;
    float _1212 = _1208;
    if (_1094)
    {
        float _1214 = _1122 * _1204;
        _846 = _1214;
    }
    float _1216 = _846;
    if (!_1094)
    {
        _1124 = _1084;
    }
    float _1218 = _1124;
    float _1220 = _1218;
    if (_1094)
    {
        float _1222 = fma(_1084, _1148, _1196);
        _1220 = _1222;
    }
    float _1224 = _1220;
    float _1226 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1094)
    {
        float _1228 = _1076 * _1216;
        _1192 = _1228;
    }
    float _1230 = _1192;
    if (_1094)
    {
        float _1232 = _1078 * _1216;
        _1200 = _1232;
    }
    float _1234 = _1200;
    float _1236 = _1186 * _1184;
    float _1238 = _1236 * 0.5;
    float _1240 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1226);
    if (_1094)
    {
        float _1242 = _1230 * _1230;
        _1108 = _1242;
    }
    float _1244 = _1108;
    if (_1094)
    {
        float _1246 = _1234 * _1234;
        _1210 = _1246;
    }
    float _1248 = _1210;
    float _1250 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1240);
    float _1252 = fma(_1224, _1224, _1244);
    float _1254 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1258 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1256);
    float _1260 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1262 = _1252 + _1248;
    float _1264 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1266 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1268 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1270 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1254);
    float _1272 = rsqrt(_1262);
    float _1274 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1266);
    float _1276 = -_1268;
    float _1278 = fma(_1276, _1264, 1.0);
    float _1280 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1270);
    float _1282 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1274);
    float _1284 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1286 = sqrt(_1066);
    float _1288 = _1282 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1290 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1292 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan(0.5);
    bool _1298 = _1294 || _1296;
    float _1300 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1302 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1304 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1300);
    float _1306 = _1272 * _1230;
    float _1308 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1310 = 1.0 / _1258;
    float _1312 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1304);
    float _1314 = _1272 * _1224;
    float _1316 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1308);
    float _1318 = _1272 * _1234;
    float _1320 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1322 = fma(_1286, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1320);
    float _1324 = precise::clamp(_1322, 0.0, 1.0);
    float _1326 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1316);
    float _1328 = floor(_1158);
    float _1330 = _1306 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1332 = -_1324;
    float _1334 = _1332 + 1.0;
    float _1336 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1338 = _1326;
    float _1340 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1298)
    {
        _1338 = 1.0;
    }
    float _1342 = _1338;
    float _1344 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1346 = _1342;
    if (_1298)
    {
        _1340 = 1.0;
    }
    float _1348 = _1340;
    float _1350 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1312);
    float _1352 = -_1330;
    float _1354 = fma(_1314, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1352);
    float _1356 = log2(_1278);
    float _1358 = -_1318;
    float _1360 = fma(_1358, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1354);
    float _1362 = 1.0 / _1350;
    float _1364 = fma(_1360, -0.5, 0.5);
    float _1366 = abs(_1334);
    float _1368 = log2(_1366);
    float _1370 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1302);
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1374 = _1310 * _1372;
    float _1376 = _1348;
    float _1378 = _1350;
    if (!_1298)
    {
        float _1380 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1382 = _1380 * 0.15915493667125701904296875;
        float _1384 = _1382 * 6.283185482025146484375;
        float _1386 = cos(_1384);
        float _1388 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1390 = _1388 * 0.15915493667125701904296875;
        float _1392 = _1382 * 6.283185482025146484375;
        float _1394 = sin(_1392);
        float _1396 = 1.0 / _1386;
        float _1398 = _1390 * 6.283185482025146484375;
        float _1400 = cos(_1398);
        float _1402 = _1394 * _1396;
        float _1404 = _1390 * 6.283185482025146484375;
        float _1406 = sin(_1404);
        float _1408 = _1400 * _1402;
        float _1410 = 1.0 / _1408;
        float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1414 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1412;
        float _1416 = 1.0 / _1414;
        float _1418 = _1406 * _1410;
        float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1422 = fma(_1374, _1418, _1420);
        float _1424 = _1422 * _1416;
        float _1426 = precise::clamp(_1424, 0.0, 1.0);
        _1346 = _1426;
    }
    float _1428 = _1346;
    if (!_1298)
    {
        float _1430 = in.m_77.w;
        bool _1432 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 1;
        bool _1434 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 2;
        bool _1436 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 3;
        int _1438 = as_type<int>(_1430) << 16;
        int _1440 = as_type<int>(_1430) << 8;
        int _1442 = as_type<int>(_1430) << 24;
        int _1444 = _1438 >> 24;
        int _1446 = _1440 >> 24;
        int _1448 = as_type<int>(_1430) >> 24;
        int _1450 = _1442 >> 24;
        float _1452 = float(_1444);
        float _1454 = float(_1446);
        float _1456 = float(_1448);
        float _1458 = _1452 * 0.0078740157186985015869140625;
        float _1460 = float(_1450);
        float _1462 = _1454 * 0.0078740157186985015869140625;
        float _1464 = _1456 * 0.0078740157186985015869140625;
        float _1466 = precise::min(_1458, 1.0);
        float _1468 = _1460 * 0.0078740157186985015869140625;
        float _1470 = precise::min(_1462, 1.0);
        float _1472 = precise::min(_1464, 1.0);
        float _1474 = precise::min(_1468, 1.0);
        float _1476 = precise::max(_1466, -1.0);
        float _1478 = precise::max(_1470, -1.0);
        float _1480 = precise::max(_1472, -1.0);
        float _1482 = precise::max(_1474, -1.0);
        float _1484 = _1482;
        if (_1432)
        {
            _1484 = _1476;
        }
        float _1486 = _1484;
        float _1488 = _1486;
        if (_1434)
        {
            _1488 = _1478;
        }
        float _1490 = _1488;
        float _1492 = _1490;
        if (_1436)
        {
            _1492 = _1480;
        }
        float _1494 = _1492;
        float _1496 = abs(_1494);
        float _1498 = (-0.0) + _1496;
        _1376 = _1498;
    }
    float _1500 = _1376;
    bool _1502 = _1500 != 0.0;
    bool _1504 = isnan(_1500);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan(0.0);
    bool _1510 = _1506 || _1508;
    float _1512 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1344);
    float _1514 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1370);
    float _1516 = sqrt(_1364);
    float _1518 = _1368 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1520 = fma(_1360, 0.5, 0.5);
    float _1522 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1512);
    float _1524 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1514);
    float _1526 = -_1208;
    float _1528 = _1172 + _1526;
    float _1530 = fma(_1520, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1532 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1522);
    float _1534 = exp2(_1518);
    float _1536 = -_1328;
    float _1538 = _1158 + _1536;
    float _1540 = fma(_1520, _1530, -0.212114393711090087890625);
    float _1542 = _1530;
    if (_1510)
    {
        _1542 = _1524;
    }
    float _1544 = _1542;
    float _1546 = _1314 + 1.0;
    float _1548 = _1544;
    if (_1510)
    {
        _1212 = _1532;
    }
    float _1550 = _1212;
    float _1552 = fma(_1520, _1540, 1.570728778839111328125);
    float _1554 = _1550;
    if (!_1510)
    {
        _1548 = 0.0;
    }
    float _1556 = _1548;
    float _1558 = _1516 * 0.636619746685028076171875;
    if (!_1510)
    {
        _1554 = 0.0;
    }
    float _1560 = _1554;
    float _1562 = _1356 * 0.693147182464599609375;
    float2 _4545 = float2(_1528, _1538);
    float _1564 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4545, float2(0.0), isnan(_4545)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4545, float2(0.0), isnan(_4545)), level(0.0)).x;
    float _1566 = _1362 * _1556;
    float _1568 = -_1552;
    float _1570 = fma(_1558, _1568, 1.0);
    float _1572 = _1362 * _1560;
    float _1574 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1576 = -_1314;
    float _1578 = fma(_1534, _1546, _1576);
    float _1580 = fma(_1566, 0.5, 0.5);
    float _1582 = fma(_1572, -0.5, 0.5);
    float _1584 = fma(_1578, 0.5, 0.5);
    float3 _4583 = float3(_1580, _1582, _1574);
    float _1586 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4583, float3(0.0), isnan(_4583)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4583, float3(0.0), isnan(_4583)), level(0.0)).x;
    float3 _4594 = float3(_1580, _1582, _1574);
    float4 _1589 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4594, float3(0.0), isnan(_4594)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4594, float3(0.0), isnan(_4594)), level(0.0)).xyzw;
    float _1591 = _1589.x;
    float _1593 = _1589.y;
    float _1595 = _1589.z;
    float _1597 = _1589.w;
    float2 _4610 = float2(_1570, _1584);
    float3 _1601 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4610, float2(0.0), isnan(_4610)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4610, float2(0.0), isnan(_4610)), level(0.0)).xyz;
    float _1603 = _1601.x;
    float _1605 = _1601.y;
    float _1607 = _1601.z;
    float _1609 = abs(_1374);
    float _1611 = log2(_1609);
    float _1613 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1615 = _1368 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_79.x = _1040;
    out.m_79.y = _1034;
    out.m_79.z = _1048;
    float _1617 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1613);
    bool _1619 = _1286 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1621 = isnan(_1286);
    bool _1623 = _1619 || _1621;
    bool _1625 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1627 = _1623 || _1625;
    bool _1629 = _1374 <= 8000.0;
    bool _1631 = isnan(_1374);
    bool _1633 = _1629 || _1631;
    bool _1635 = isnan(8000.0);
    bool _1637 = _1633 || _1635;
    float _1639 = float(_1637);
    float _1641 = _1611 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1643 = exp2(_1615);
    float _1645 = exp2(_1641);
    float _1647 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1617);
    float _1649 = _1428 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1651 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1647);
    float _1653 = _1649 * _1500;
    float _1655 = in.m_77.x;
    float _1657 = -_1643;
    float _1659 = _1657 + 1.0;
    out.gl_Position.x = _1524;
    out.gl_Position.y = _1532;
    out.gl_Position.z = _1651;
    out.gl_Position.w = _1350;
    float _1661 = _1659 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1663 = _1580;
    float _1665 = _1651;
    if (!_1510)
    {
        _1663 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1667 = _1663;
    float _1669 = fma(_1645, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1671 = precise::clamp(_1669, 0.0, 1.0);
    float _1673 = fma(_1671, -2.0, 3.0);
    float _1675 = _1671 * _1671;
    float _1677 = _1675 * _1673;
    float _1679 = -_1677;
    float _1681 = _1679 + 1.0;
    float _1683 = fma(_1681, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1677);
    float _1685 = _1651 + _1350;
    int _1687 = as_type<int>(_1685);
    float _1689 = 0.0;
    float _1691 = 0.0;
    if (!_1627)
    {
        _1378 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1693 = _1378;
    float _1695 = _1639 * _1683;
    float _1697 = _1685 * 0.5;
    float _1699 = _1693;
    float _1701 = _1693;
    if (!_1510)
    {
        float _1703 = _1667 * 5.0;
        _1687 = as_type<int>(_1703);
    }
    int _1705 = _1687;
    float _1707 = as_type<float>(_1705);
    if (!_1627)
    {
        _1665 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1709 = _1665;
    float _1711 = _1695 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_81.z = _1697;
    out.m_81.w = _1350;
    float _1713 = _1709;
    float _1715 = _1709;
    if (!_1510)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4810 = as_type<float>(_1705);
        out.gl_Position.z = _4810;
    }
    if (_1510)
    {
        _1707 = _1653;
    }
    float _1717 = _1707;
    float _1719 = _1717;
    if (!_1627)
    {
        _1689 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1721 = _1689;
    float _1723 = _1721;
    float _1725 = _1721;
    if (!_1627)
    {
        _1691 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1727 = _1691;
    float _1729 = _1727;
    float _1731 = _1727;
    if (!_1510)
    {
        _1719 = 0.0;
    }
    float _1733 = _1719;
    float _1735 = -_1564;
    float _1737 = _1735 + 1.0;
    float _1739 = _1737 * _1711;
    float _1741 = precise::clamp(_1739, 0.0, 1.0);
    float _1743 = -_1741;
    float _1745 = fma(_1743, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1747 = _1661 * _1586;
    float _1749 = _1745 * _1655;
    float _1751 = -_1661;
    float _1753 = _1751 + 1.0;
    float _1755 = _1597 * _1747;
    float _1757 = _1607 * _1747;
    float _1759 = _1749 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1761 = _1597 * _1753;
    float _1763 = fma(_1603, _1755, _1591);
    float _1765 = fma(_1605, _1755, _1593);
    float _1767 = fma(_1597, _1757, _1595);
    out.m_83.x = _1759;
    float _1769 = _1755;
    float _1771 = _1757;
    if (!_1627)
    {
        _1769 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1773 = _1769;
    float _1775 = _1773;
    float _1777 = _1773;
    if (!_1627)
    {
        _1771 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1779 = _1771;
    out.m_85.x = _1763;
    out.m_85.y = _1765;
    out.m_85.z = _1767;
    out.m_85.w = _1761;
    bool _1781 = !_1627;
    float _1783 = _1779;
    float _1785 = _1779;
    if (!_1781)
    {
        bool _1787 = _1286 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1789 = isnan(_1286);
        bool _1791 = _1787 || _1789;
        bool _1793 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1795 = _1791 || _1793;
        if (!_1795)
        {
            float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1799 = _1286 + _1797;
            float _1801 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1803 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1801;
            float _1805 = 1.0 / _1803;
            float _1807 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1815 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1817 = _1815 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1819 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1821 = _1819 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1823 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1825 = _1823 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1827 = _1799 * _1805;
            float _1829 = precise::clamp(_1827, 0.0, 1.0);
            float _1831 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1833 = _1831 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1835 = fma(_1829, _1809, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1837 = fma(_1829, _1833, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1839 = fma(_1829, _1813, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1841 = fma(_1829, _1817, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1843 = fma(_1829, _1821, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1845 = fma(_1829, _1825, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1731 = _1837;
            _1777 = _1843;
            _1725 = _1835;
            _1715 = _1841;
            _1701 = _1839;
            _1785 = _1845;
            _1847 = true;
        }
        else
        {
            bool _1849 = _1286 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1851 = isnan(_1286);
            bool _1853 = _1849 || _1851;
            bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1857 = _1853 || _1855;
            if (!_1857)
            {
                _1723 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1859 = _1723;
            _1725 = _1859;
            if (!_1857)
            {
                _1729 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1861 = _1729;
            _1731 = _1861;
            if (!_1857)
            {
                _1699 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1863 = _1699;
            _1701 = _1863;
            if (!_1857)
            {
                _1713 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1865 = _1713;
            _1715 = _1865;
            if (!_1857)
            {
                _1775 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1867 = _1775;
            _1777 = _1867;
            if (!_1857)
            {
                _1783 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1869 = _1783;
            bool _1871 = !_1857;
            _1785 = _1869;
            if (!_1871)
            {
                bool _1873 = _1286 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1875 = isnan(_1286);
                bool _1877 = _1873 || _1875;
                bool _1879 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1881 = _1877 || _1879;
                if (!_1881)
                {
                    float _1883 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1885 = _1286 + _1883;
                    float _1887 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1889 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1887;
                    float _1891 = 1.0 / _1889;
                    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1895 = _1893 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1897 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1899 = _1897 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1901 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1913 = _1885 * _1891;
                    float _1915 = precise::clamp(_1913, 0.0, 1.0);
                    float _1917 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1919 = _1917 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1921 = fma(_1915, _1895, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1923 = fma(_1915, _1919, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1925 = fma(_1915, _1899, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1927 = fma(_1915, _1903, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1929 = fma(_1915, _1907, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1931 = fma(_1915, _1911, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1731 = _1923;
                    _1777 = _1929;
                    _1725 = _1921;
                    _1715 = _1927;
                    _1701 = _1925;
                    _1785 = _1931;
                    _1847 = true;
                }
                else
                {
                    _1731 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1777 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1725 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1715 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1701 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1785 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1847 = false;
    float _1933 = _1731;
    float _1935 = _1777;
    float _1937 = _1725;
    float _1939 = _1715;
    float _1941 = _1701;
    float _1943 = _1785;
    float _1945 = fma(_558, -0.5, 0.5);
    float _1947 = precise::clamp(_1945, 0.0, 1.0);
    float _1949 = -_1933;
    float _1951 = _1949 + _1935;
    float _1953 = -_1937;
    float _1955 = _1953 + _1939;
    float _1957 = fma(_1947, _1951, _1933);
    out.m_87.x = 0.0;
    float _1959 = fma(_1947, _1955, _1937);
    float _1961 = -_1941;
    float _1963 = _1961 + _1943;
    float _1965 = _1957 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    bool _1967 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1969 = fma(_1947, _1963, _1941);
    float _1971 = fma(_1959, 0.298911988735198974609375, _1965);
    float _1973 = _1733 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _1975 = _1428 > 0.0;
    bool _1977 = isnan(_1428);
    bool _1979 = _1975 || _1977;
    bool _1981 = isnan(0.0);
    bool _1983 = _1979 || _1981;
    float _1985 = fma(_1969, 0.114477999508380889892578125, _1971);
    out.m_89.x = 0.0;
    float _1987 = -_1985;
    float _1989 = _1959 + _1987;
    out.m_83.w = _1973;
    float _1991 = -_1985;
    float _1993 = _1957 + _1991;
    float _1995 = fma(_1993, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1985);
    float _1997 = -_1985;
    float _1999 = _1969 + _1997;
    float _2001 = fma(_1989, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1985);
    float _2003 = fma(_1999, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1985);
    bool _2005 = !_1967;
    if (!_2005)
    {
        float _2007 = -_1034;
        float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2011 = -_1040;
        float _2013 = _2011 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2015 = -_1048;
        float _2017 = _2015 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2019 = _2009 * _2009;
        float _2021 = fma(_2013, _2013, _2019);
        float _2023 = fma(_2017, _2017, _2021);
        float _2025 = rsqrt(_2023);
        float _2027 = _2009 * _2025;
        float _2029 = _2013 * _2025;
        float _2031 = _2017 * _2025;
        float _2033 = -_1074;
        float _2035 = _2033 + _2027;
        float _2037 = -_1070;
        float _2039 = _2037 + _2029;
        float _2041 = -_1072;
        float _2043 = _2041 + _2031;
        float _2045 = sqrt(_2023);
        float _2047 = _2035 * _2035;
        float _2049 = fma(_2039, _2039, _2047);
        float _2051 = fma(_2043, _2043, _2049);
        float _2053 = rsqrt(_2051);
        float _2055 = -_2045;
        float _2057 = _2055 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2059 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2061 = precise::clamp(_2059, 0.0, 1.0);
        float _2063 = abs(_2061);
        float _2065 = log2(_2063);
        float _2067 = _2035 * _2053;
        float _2069 = _2039 * _2053;
        float _2071 = _2043 * _2053;
        float _2073 = _558 * _2067;
        float _2075 = _558 * _2027;
        float _2077 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2079 = precise::clamp(_2077, 0.0, 1.0);
        float _2081 = fma(_554, _2069, _2073);
        float _2083 = fma(_554, _2029, _2075);
        float _2085 = _2079 * _2079;
        float _2087 = _2065 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2089 = fma(_614, _2071, _2081);
        float _2091 = precise::clamp(_2089, 0.0, 1.0);
        float _2093 = fma(_614, _2031, _2083);
        float _2095 = precise::clamp(_2093, 0.0, 1.0);
        float _2097 = _2085 + (-1.0);
        float _2099 = _2091 * _2091;
        float _2101 = _2029 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2103 = exp2(_2087);
        float _2105 = fma(_2099, _2097, 1.0);
        float _2107 = -_2027;
        float _2109 = -_2101;
        float _2111 = fma(_2107, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2109);
        float _2113 = _2105 * _2105;
        float _2115 = -_2031;
        float _2117 = fma(_2115, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2111);
        float _2119 = 1.0 / _2113;
        float _2121 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2123 = _2117 + _2121;
        float _2125 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2127 = precise::clamp(_2125, 0.0, 1.0);
        float _2129 = _2103 * _2127;
        float _2131 = _2095 * _2129;
        float _2133 = _2085 * _2119;
        float _2135 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2137 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2139 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2141 = _2131 * _2133;
        float _2143 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2145 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2147 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2135;
        out.m_87.y = _2137;
        out.m_87.z = _2139;
        out.m_89.x = _2143;
        out.m_89.y = _2145;
        out.m_89.z = _2147;
    }
    out.m_91.x = _2001;
    out.m_91.y = _1995;
    out.m_91.z = _2003;
    if (_1983)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2149 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2149;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1847 = false;
    bool _976 = false;
    bool _660 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = trunc(_108);
    int _112 = int(_110);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    float _120 = as_type<float>(_112);
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _118;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _122 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2207 = as_type<float>(_128);
        out.gl_Position.z = _2207;
    }
    if (!_116)
    {
        return out;
    }
    float _132 = in.m_53.w;
    float _134 = float(_112);
    float _136 = -_132;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_132);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    bool _150 = _138 >= _134;
    bool _152 = !_148;
    bool _154 = _150 || _152;
    if (_154)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _120;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _130 = as_type<int>(_158);
    }
    int _160 = _130;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2270 = as_type<float>(_160);
        out.gl_Position.z = _2270;
    }
    if (_154)
    {
        return out;
    }
    float _162 = in.m_48.x;
    float _164 = in.m_48.y;
    float _166 = in.m_48.z;
    float _168 = 1.0 / _134;
    float _170 = in.m_55.x;
    float _172 = in.m_55.y;
    float _174 = in.m_55.z;
    float _176 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _178 = fma(_176, 10.0, 10.0);
    float _180 = in.m_57.y;
    float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _186 = _184 != 0;
    float _188 = in.m_59.x;
    int _190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _192 = _190 != 0;
    float _194 = _138 * _168;
    float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _198 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _200 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _202 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _204 = fma(_194, 0.2000000476837158203125, 1.0);
    float _206 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _198);
    float _208 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _200);
    float _210 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _202);
    float _212 = fma(_170, 2.0, -1.0);
    float _214 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _206);
    float _216 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _208);
    float _218 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _210);
    float _220 = fma(_172, 2.0, -1.0);
    float _222 = _214 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _224 = _216 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _226 = _218 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _228 = in.m_61.x;
    float _230 = in.m_61.y;
    float _232 = in.m_61.z;
    float _234 = -_222;
    float _236 = _234 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _238 = -_224;
    float _240 = _238 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _242 = -_226;
    float _244 = _242 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _246 = fma(_174, 2.0, -1.0);
    float _248 = _236 * _236;
    float _250 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _252 = _222 + _250;
    float _254 = precise::max(_194, 0.949999988079071044921875);
    float _256 = fma(_240, _240, _248);
    float _258 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.10471977293491363525390625;
    float _260 = precise::min(_254, 1.0);
    float _262 = fma(_244, _244, _256);
    float _264 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _266 = _224 + _264;
    float _268 = _258 * _178;
    float _270 = _212 * _204;
    float _272 = rsqrt(_262);
    float _274 = fma(_260, -19.999996185302734375, 19.999996185302734375);
    float _276 = _268 * 0.15915493667125701904296875;
    float _278 = _252 * _252;
    float _280 = _178;
    float _282 = _252;
    float _284 = _188;
    if (_186)
    {
        float _286 = in.m_57.x;
        _280 = _286;
    }
    float _288 = _280;
    bool _290 = _180 > 0.5;
    bool _292 = _290 && _192;
    float _294 = -_212;
    float _296 = _294 + _228;
    float _298 = _276 * 6.283185482025146484375;
    float _300 = sin(_298);
    float _302 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _304 = _226 + _302;
    float _306 = fma(_266, _266, _278);
    float _308 = -_220;
    float _310 = _308 + _230;
    float _312 = fma(_304, _304, _306);
    float _314 = _244 * _272;
    float _316 = _240 * _272;
    float _318 = _236 * _272;
    float _320 = _314 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _322 = rsqrt(_312);
    float _324 = _318 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _326 = -_320;
    float _328 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[10].y, _326);
    float _330 = fma(_300, 0.150000035762786865234375, 1.0499999523162841796875);
    float _332 = -_324;
    float _334 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[9].y, _332);
    float _336 = _316 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _338 = _328 * _328;
    bool _340 = _288 > 0.5;
    bool _342 = _340 && _186;
    float _344 = -_246;
    float _346 = _344 + _232;
    float _348 = -_336;
    float _350 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[8].y, _348);
    float _352 = fma(_334, _334, _338);
    float _354 = _330 * _274;
    float _356 = in.m_59.y;
    float _358 = fma(_350, _350, _352);
    float _360 = _252 * _322;
    float _362 = fma(_296, _354, _270);
    float _364 = _266 * _322;
    float _366 = rsqrt(_358);
    float _368 = -_360;
    float _370 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[18].w, _252);
    float _372 = fma(_310, _354, _220);
    float _374 = -_364;
    float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[18].w, _266);
    if (!_186)
    {
        _282 = _188;
    }
    float _378 = _282;
    float _380 = _370 * _370;
    float _382 = _378;
    if (_342)
    {
        float _384 = -_188;
        float _386 = _384 + 1.0;
        _284 = _386;
    }
    float _388 = _284;
    float _390 = fma(_346, _354, _246);
    float _392 = in.m_63.x;
    float _394 = in.m_63.y;
    float _396 = in.m_63.z;
    float _398 = fma(_376, _376, _380);
    float _400 = _304 * _322;
    if (_186)
    {
        _382 = _388;
    }
    float _402 = _382;
    out.m_65.x = _362;
    out.m_65.y = _372;
    out.m_65.z = _390;
    bool _404 = _372 != 0.0;
    bool _406 = isnan(_372);
    bool _408 = _404 || _406;
    bool _410 = isnan(0.0);
    bool _412 = _408 || _410;
    float _414 = -_400;
    float _416 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[18].w, _304);
    float _418 = _334 * _366;
    float _420 = _350 * _366;
    float _422 = _328 * _366;
    float _424 = fma(_416, _416, _398);
    float _426 = _418 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _428 = _420 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _430 = _422 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _432 = _362 == 0.0;
    bool _434 = !_412;
    bool _436 = _432 && _434;
    float _438 = -_426;
    float _440 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[8].y, _438);
    float _442 = -_428;
    float _444 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[10].y, _442);
    float _446 = -_430;
    float _448 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[9].y, _446);
    float _450 = in.m_67.x;
    float _452 = in.m_67.y;
    float _454 = in.m_67.z;
    float _456 = _440 * _440;
    bool _458 = _390 == 0.0;
    bool _460 = _458 && _436;
    float _462 = sqrt(_424);
    float _464 = fma(_444, _444, _456);
    float _466 = _356;
    if (_292)
    {
        float _468 = -_356;
        float _470 = _468 + 1.0;
        _466 = _470;
    }
    float _472 = _466;
    float _474 = _402 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _476 = fma(_448, _448, _464);
    float _478 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _372);
    float _480 = _472 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _482 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _362);
    float _484 = rsqrt(_476);
    float _486 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _390);
    float _488 = _394;
    float _490 = _392;
    float _492 = _396;
    if (!_460)
    {
        float _494 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[17].y, _394);
        _488 = _494;
    }
    float _496 = _488;
    if (!_460)
    {
        float _498 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[17].y, _392);
        _490 = _498;
    }
    float _500 = _490;
    if (!_460)
    {
        float _502 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[17].y, _396);
        _492 = _502;
    }
    float _504 = _492;
    float _506 = _474 * _196;
    float _508 = _496 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _510 = _322 * _462;
    float _512 = _496 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _514 = _496 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _516 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[8].x, _508);
    float _518 = _452 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _520 = _450 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _522 = _480 * _182;
    float _524 = _454 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _526 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _528 = _440 * _484;
    float _530 = _444 * _484;
    float _532 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _534 = _526 * _510;
    float _536 = _528 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _538 = _448 * _484;
    float _540 = _532 * _510;
    float _542 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[9].x, _512);
    float _544 = fma(_530, (*spvDescriptorSet0.vp_c10)._m0[8].z, _536);
    float _546 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _548 = _534 * _478;
    float _550 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[10].x, _514);
    float _552 = fma(_538, (*spvDescriptorSet0.vp_c10)._m0[10].z, _544);
    float _554 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[8].z, _516);
    out.m_69.x = _506;
    out.m_69.y = _522;
    float _556 = _540 * _482;
    float _558 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[9].z, _542);
    float _560 = _546 * _510;
    float _562 = _548 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _564 = abs(_552);
    float _566 = -_564;
    float _568 = _566 + 1.0;
    float _570 = _560 * _486;
    float _572 = fma(_556, (*spvDescriptorSet0.vp_c10)._m0[9].x, _562);
    float _574 = _548 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _576 = _548 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _578 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[9].z, _572);
    float _580 = fma(_556, (*spvDescriptorSet0.vp_c10)._m0[8].x, _574);
    float _582 = fma(_556, (*spvDescriptorSet0.vp_c10)._m0[10].x, _576);
    int _584 = as_type<int>(_568) + (-218103808);
    float _586 = abs(_552);
    float _588 = fma(_586, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _590 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[8].z, _580);
    float _592 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[10].z, _582);
    bool _594 = uint(_584) >= 1920991232u;
    float _596 = abs(_552);
    float _598 = fma(_596, _588, -0.212114393711090087890625);
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _608 = abs(_552);
    float _610 = fma(_608, _598, 1.570728778839111328125);
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _614 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[10].z, _550);
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _618 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _604 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _624 = _606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _626 = _612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _628 = _616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _630 = _552 < 0.0;
    float _632 = float(_630);
    bool _634 = !_594;
    float _636 = _590;
    float _658;
    if (!_634)
    {
        int _638 = as_type<int>(_568);
        int _640 = as_type<int>(_440);
        int _642 = as_type<int>(_448);
        int _644 = 3456;
        int _646;
        int _648;
        int _650;
        int _652;
        int _654;
        int _656;
        _104(_638, _640, _642, _644, _646, _648, _650, _652, _654, _656, out.gl_Position, out.gl_PointSize);
        _658 = as_type<float>(_646);
        _660 = true;
    }
    else
    {
        float _662 = rsqrt(_568);
        float _664 = _568 * _662;
        float _666 = _662 * 0.5;
        float _668 = -_664;
        float _670 = 0.0 + _668;
        float _672 = fma(_666, _670, 0.5);
        float _674 = fma(_664, _672, _664);
        float _676 = -_674;
        float _678 = 0.0 + _676;
        float _680 = fma(_674, _678, _568);
        float _682 = fma(_666, _680, _674);
        _658 = _682;
    }
    _660 = false;
    float _684 = _658;
    float _686 = _538 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _688 = _528 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _690 = _610 * _684;
    float _692 = -_686;
    float _694 = fma(_530, (*spvDescriptorSet0.vp_c10)._m0[10].z, _692);
    float _696 = _530 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _698 = -_688;
    float _700 = fma(_538, (*spvDescriptorSet0.vp_c10)._m0[9].z, _698);
    float _702 = _694 * _694;
    float _704 = -_696;
    float _706 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[8].z, _704);
    float _708 = _632 * 2.0;
    float _710 = fma(_700, _700, _702);
    float _712 = -_708;
    float _714 = fma(_690, _712, _690);
    float _716 = fma(_706, _706, _710);
    float _718 = fma(_632, 3.1415927410125732421875, _714);
    float _720 = rsqrt(_716);
    float _722 = _718 * 0.15915493667125701904296875;
    float _724 = _722 * 6.283185482025146484375;
    float _726 = cos(_724);
    float _728 = _694 * _720;
    float _730 = _700 * _720;
    float _732 = _706 * _720;
    float _734 = _728 * _728;
    float _736 = _722 * 6.283185482025146484375;
    float _738 = sin(_736);
    float _740 = fma(_730, _730, _734);
    float _742 = -_726;
    float _744 = _742 + 1.0;
    float _746 = fma(_732, _732, _740);
    float _748 = rsqrt(_746);
    float _750 = _732 * _748;
    float _752 = _730 * _748;
    float _754 = _728 * _748;
    float _756 = _750 * _738;
    float _758 = _752 * _744;
    float _760 = _752 * _738;
    float _762 = _754 * _744;
    float _764 = _754 * _738;
    float _766 = -_756;
    float _768 = fma(_754, _758, _766);
    float _770 = _750 * _750;
    float _772 = fma(_750, _762, _760);
    float _774 = fma(_752, _758, _726);
    float _776 = _578 * _768;
    float _778 = -_764;
    float _780 = fma(_750, _758, _778);
    float _782 = _578 * _772;
    float _784 = fma(_744, _770, _726);
    float _786 = fma(_590, _774, _776);
    float _788 = fma(_750, _758, _764);
    float _790 = fma(_590, _780, _782);
    float _792 = fma(_754, _762, _726);
    float _794 = fma(_754, _758, _756);
    float _796 = fma(_592, _788, _786);
    float _798 = fma(_592, _784, _790);
    float _800 = _578 * _792;
    float _802 = -_760;
    float _804 = fma(_750, _762, _802);
    float _806 = _224 + _796;
    float _808 = _226 + _798;
    float _810 = fma(_590, _794, _800);
    float _812 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _814 = _806 + _812;
    float _816 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _818 = _808 + _816;
    float _820 = fma(_592, _804, _810);
    float _822 = _814 * _814;
    float _824 = _818 * _818;
    float _826 = _222 + _820;
    float _828 = _822 + _824;
    float _830 = sqrt(_828);
    bool _832 = _830 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _834 = _810;
    float _836 = _806;
    float _838 = _726;
    float _840 = _822;
    float _842 = _826;
    float _844 = _792;
    float _846 = _814;
    if (!_832)
    {
        _636 = _806;
    }
    float _848 = _636;
    float _850 = _848;
    if (!_832)
    {
        _834 = _824;
    }
    float _852 = _834;
    float _854 = _852;
    if (!_832)
    {
        _836 = _808;
    }
    float _856 = _836;
    float _858 = _856;
    if (!_832)
    {
        _838 = _826;
    }
    float _860 = _838;
    bool _862 = !_832;
    float _864 = _860;
    if (!_862)
    {
        float _866 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _868 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _870 = _830 + _868;
        float _872 = _826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _874 = rsqrt(_828);
        float _876 = _870 * _866;
        float _878 = _876 * 0.15915493667125701904296875;
        float _880 = _878 * 6.283185482025146484375;
        float _882 = sin(_880);
        float _884 = _878 * 6.283185482025146484375;
        float _886 = cos(_884);
        float _888 = fma(_882, _872, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _890 = _874 * _888;
        float _892 = _886 + (-1.0);
        float _894 = _818 * _890;
        float _896 = _892 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = _814 * _890;
        float _900 = _894 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _902 = _894 * _894;
        float _904 = fma(_826, _886, _896);
        float _906 = _898 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _908 = _898 * _898;
        _864 = _904;
        _840 = _908;
        _854 = _902;
        _850 = _906;
        _858 = _900;
    }
    float _910 = _864;
    float _912 = _840;
    float _914 = _854;
    float _916 = _850;
    float _918 = _858;
    float _920 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _922 = _910 + _920;
    out.m_71.x = _618;
    out.m_71.y = _620;
    out.m_71.z = _622;
    float _924 = fma(_922, _922, _912);
    out.m_73.x = _624;
    out.m_73.y = _626;
    out.m_73.z = _628;
    float _926 = _924 + _914;
    out.m_75.x = _554;
    out.m_75.y = _558;
    out.m_75.z = _614;
    float _928 = sqrt(_926);
    bool _930 = _928 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _932 = isnan(_928);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _938 = _934 || _936;
    float _940 = _912;
    if (!_938)
    {
        _940 = 1.0;
    }
    float _942 = _940;
    bool _944 = !_938;
    float _946 = _942;
    if (!_944)
    {
        bool _948 = _928 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _950 = isnan(_928);
        bool _952 = _948 || _950;
        bool _954 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _956 = _952 || _954;
        if (!_956)
        {
            float _958 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _960 = _928 + _958;
            float _962 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _964 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _962;
            float _966 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _968 = _966 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _970 = 1.0 / _964;
            float _972 = _960 * _970;
            float _974 = fma(_972, _968, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _946 = _974;
            _976 = true;
        }
        else
        {
            bool _978 = _928 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _980 = isnan(_928);
            bool _982 = _978 || _980;
            bool _984 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _986 = _982 || _984;
            if (!_986)
            {
                float _988 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _990 = _928 + _988;
                float _992 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _994 = _992 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _996 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _998 = _996 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1000 = 1.0 / _994;
                float _1002 = _990 * _1000;
                float _1004 = fma(_1002, _998, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _946 = _1004;
                _976 = true;
            }
            else
            {
                _946 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _976 = false;
    float _1006 = _946;
    float _1008 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1010 = _910 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1014 = _916 + _1012;
    float _1016 = -_360;
    float _1018 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[18].w, _222);
    float _1020 = -_364;
    float _1022 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[18].w, _224);
    float _1024 = fma(_1010, _1006, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1026 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1028 = _918 + _1026;
    float _1030 = fma(_1014, _1006, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1032 = -_360;
    float _1034 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1024);
    float _1036 = fma(_1028, _1006, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1038 = -_364;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1030);
    float _1042 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1044 = _1034 + _1042;
    float _1046 = -_400;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1036);
    float _1050 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1052 = _1040 + _1050;
    float _1054 = _1044 * _1044;
    float _1056 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1058 = _1048 + _1056;
    float _1060 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1062 = fma(_1052, _1052, _1054);
    float _1064 = precise::max(0.0, _1060);
    float _1066 = fma(_1058, _1058, _1062);
    float _1068 = rsqrt(_1066);
    float _1070 = _1052 * _1068;
    float _1072 = _1058 * _1068;
    float _1074 = _1044 * _1068;
    float _1076 = _1070 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1078 = _1072 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1080 = -_1074;
    float _1082 = -_1064;
    float _1084 = fma(_1080, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1082);
    float _1086 = _1076 * _1076;
    float _1088 = _1078 * _1078;
    float _1090 = _1086 + _1088;
    float _1092 = sqrt(_1090);
    bool _1094 = _1092 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1098 = _1092 + _1096;
    float _1100 = _622;
    float _1102 = _1044;
    float _1104 = _1098;
    float _1106 = _1090;
    float _1108 = _1086;
    if (_1094)
    {
        float _1110 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1100 = _1110;
    }
    float _1112 = _1100;
    if (_1094)
    {
        float _1114 = _1084 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1102 = _1114;
    }
    float _1116 = _1102;
    float _1118 = _1116;
    if (_1094)
    {
        float _1120 = rsqrt(_1090);
        _842 = _1120;
    }
    float _1122 = _842;
    float _1124 = _1122;
    if (_1094)
    {
        float _1126 = _1098 * _1112;
        _1104 = _1126;
    }
    float _1128 = _1104;
    float _1130 = -_400;
    float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[18].w, _226);
    if (_1094)
    {
        float _1134 = _1128 * 0.15915493667125701904296875;
        _844 = _1134;
    }
    float _1136 = _844;
    float _1138 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1140 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1142 = _400;
    if (_1094)
    {
        float _1144 = _1136 * 6.283185482025146484375;
        float _1146 = cos(_1144);
        _1142 = _1146;
    }
    float _1148 = _1142;
    float _1150 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1138);
    float _1152 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1140);
    float _1154 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1150);
    float _1156 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1152);
    float _1158 = fma(_1132, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1160 = _928;
    if (_1094)
    {
        float _1162 = _1136 * 6.283185482025146484375;
        float _1164 = sin(_1162);
        _1160 = _1164;
    }
    float _1166 = _1160;
    float _1168 = _1154 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1170 = _1156 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1172 = fma(_1022, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1174 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1176 = _1170;
    float _1178 = _1168;
    if (_1094)
    {
        float _1180 = _1148 + (-1.0);
        _1174 = _1180;
    }
    float _1182 = _1174;
    float _1184 = 1.0 / _1168;
    float _1186 = _1170 + _1168;
    float _1188 = _1182;
    if (!_1094)
    {
        _1176 = _1076;
    }
    float _1190 = _1176;
    float _1192 = _1190;
    if (_1094)
    {
        float _1194 = _1182 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1106 = _1194;
    }
    float _1196 = _1106;
    if (!_1094)
    {
        _1188 = _1078;
    }
    float _1198 = _1188;
    float _1200 = _1198;
    if (_1094)
    {
        float _1202 = fma(_1166, _1116, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1118 = _1202;
    }
    float _1204 = _1118;
    if (!_1094)
    {
        _1178 = _1088;
    }
    float _1206 = _1178;
    float _1208 = floor(_1172);
    float _1210 = _1206;
    float _1212 = _1208;
    if (_1094)
    {
        float _1214 = _1122 * _1204;
        _846 = _1214;
    }
    float _1216 = _846;
    if (!_1094)
    {
        _1124 = _1084;
    }
    float _1218 = _1124;
    float _1220 = _1218;
    if (_1094)
    {
        float _1222 = fma(_1084, _1148, _1196);
        _1220 = _1222;
    }
    float _1224 = _1220;
    float _1226 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1094)
    {
        float _1228 = _1076 * _1216;
        _1192 = _1228;
    }
    float _1230 = _1192;
    if (_1094)
    {
        float _1232 = _1078 * _1216;
        _1200 = _1232;
    }
    float _1234 = _1200;
    float _1236 = _1186 * _1184;
    float _1238 = _1236 * 0.5;
    float _1240 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1226);
    if (_1094)
    {
        float _1242 = _1230 * _1230;
        _1108 = _1242;
    }
    float _1244 = _1108;
    if (_1094)
    {
        float _1246 = _1234 * _1234;
        _1210 = _1246;
    }
    float _1248 = _1210;
    float _1250 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1240);
    float _1252 = fma(_1224, _1224, _1244);
    float _1254 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1258 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1256);
    float _1260 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1262 = _1252 + _1248;
    float _1264 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1266 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1268 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1270 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1254);
    float _1272 = rsqrt(_1262);
    float _1274 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1266);
    float _1276 = -_1268;
    float _1278 = fma(_1276, _1264, 1.0);
    float _1280 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1270);
    float _1282 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1274);
    float _1284 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1286 = sqrt(_1066);
    float _1288 = _1282 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1290 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1292 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan(0.5);
    bool _1298 = _1294 || _1296;
    float _1300 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1302 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1304 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1300);
    float _1306 = _1272 * _1230;
    float _1308 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1310 = 1.0 / _1258;
    float _1312 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1304);
    float _1314 = _1272 * _1224;
    float _1316 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1308);
    float _1318 = _1272 * _1234;
    float _1320 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1322 = fma(_1286, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1320);
    float _1324 = precise::clamp(_1322, 0.0, 1.0);
    float _1326 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1316);
    float _1328 = floor(_1158);
    float _1330 = _1306 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1332 = -_1324;
    float _1334 = _1332 + 1.0;
    float _1336 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1338 = _1326;
    float _1340 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1298)
    {
        _1338 = 1.0;
    }
    float _1342 = _1338;
    float _1344 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1346 = _1342;
    if (_1298)
    {
        _1340 = 1.0;
    }
    float _1348 = _1340;
    float _1350 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1312);
    float _1352 = -_1330;
    float _1354 = fma(_1314, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1352);
    float _1356 = log2(_1278);
    float _1358 = -_1318;
    float _1360 = fma(_1358, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1354);
    float _1362 = 1.0 / _1350;
    float _1364 = fma(_1360, -0.5, 0.5);
    float _1366 = abs(_1334);
    float _1368 = log2(_1366);
    float _1370 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1302);
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1374 = _1310 * _1372;
    float _1376 = _1348;
    float _1378 = _1350;
    if (!_1298)
    {
        float _1380 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1382 = _1380 * 0.15915493667125701904296875;
        float _1384 = _1382 * 6.283185482025146484375;
        float _1386 = cos(_1384);
        float _1388 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1390 = _1388 * 0.15915493667125701904296875;
        float _1392 = _1382 * 6.283185482025146484375;
        float _1394 = sin(_1392);
        float _1396 = 1.0 / _1386;
        float _1398 = _1390 * 6.283185482025146484375;
        float _1400 = cos(_1398);
        float _1402 = _1394 * _1396;
        float _1404 = _1390 * 6.283185482025146484375;
        float _1406 = sin(_1404);
        float _1408 = _1400 * _1402;
        float _1410 = 1.0 / _1408;
        float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1414 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1412;
        float _1416 = 1.0 / _1414;
        float _1418 = _1406 * _1410;
        float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1422 = fma(_1374, _1418, _1420);
        float _1424 = _1422 * _1416;
        float _1426 = precise::clamp(_1424, 0.0, 1.0);
        _1346 = _1426;
    }
    float _1428 = _1346;
    if (!_1298)
    {
        float _1430 = in.m_77.w;
        bool _1432 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 1;
        bool _1434 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 2;
        bool _1436 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 3;
        int _1438 = as_type<int>(_1430) << 16;
        int _1440 = as_type<int>(_1430) << 8;
        int _1442 = as_type<int>(_1430) << 24;
        int _1444 = _1438 >> 24;
        int _1446 = _1440 >> 24;
        int _1448 = as_type<int>(_1430) >> 24;
        int _1450 = _1442 >> 24;
        float _1452 = float(_1444);
        float _1454 = float(_1446);
        float _1456 = float(_1448);
        float _1458 = _1452 * 0.0078740157186985015869140625;
        float _1460 = float(_1450);
        float _1462 = _1454 * 0.0078740157186985015869140625;
        float _1464 = _1456 * 0.0078740157186985015869140625;
        float _1466 = precise::min(_1458, 1.0);
        float _1468 = _1460 * 0.0078740157186985015869140625;
        float _1470 = precise::min(_1462, 1.0);
        float _1472 = precise::min(_1464, 1.0);
        float _1474 = precise::min(_1468, 1.0);
        float _1476 = precise::max(_1466, -1.0);
        float _1478 = precise::max(_1470, -1.0);
        float _1480 = precise::max(_1472, -1.0);
        float _1482 = precise::max(_1474, -1.0);
        float _1484 = _1482;
        if (_1432)
        {
            _1484 = _1476;
        }
        float _1486 = _1484;
        float _1488 = _1486;
        if (_1434)
        {
            _1488 = _1478;
        }
        float _1490 = _1488;
        float _1492 = _1490;
        if (_1436)
        {
            _1492 = _1480;
        }
        float _1494 = _1492;
        float _1496 = abs(_1494);
        float _1498 = (-0.0) + _1496;
        _1376 = _1498;
    }
    float _1500 = _1376;
    bool _1502 = _1500 != 0.0;
    bool _1504 = isnan(_1500);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan(0.0);
    bool _1510 = _1506 || _1508;
    float _1512 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1344);
    float _1514 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1370);
    float _1516 = sqrt(_1364);
    float _1518 = _1368 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1520 = fma(_1360, 0.5, 0.5);
    float _1522 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1512);
    float _1524 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1514);
    float _1526 = -_1208;
    float _1528 = _1172 + _1526;
    float _1530 = fma(_1520, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1532 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1522);
    float _1534 = exp2(_1518);
    float _1536 = -_1328;
    float _1538 = _1158 + _1536;
    float _1540 = fma(_1520, _1530, -0.212114393711090087890625);
    float _1542 = _1530;
    if (_1510)
    {
        _1542 = _1524;
    }
    float _1544 = _1542;
    float _1546 = _1314 + 1.0;
    float _1548 = _1544;
    if (_1510)
    {
        _1212 = _1532;
    }
    float _1550 = _1212;
    float _1552 = fma(_1520, _1540, 1.570728778839111328125);
    float _1554 = _1550;
    if (!_1510)
    {
        _1548 = 0.0;
    }
    float _1556 = _1548;
    float _1558 = _1516 * 0.636619746685028076171875;
    if (!_1510)
    {
        _1554 = 0.0;
    }
    float _1560 = _1554;
    float _1562 = _1356 * 0.693147182464599609375;
    float2 _4545 = float2(_1528, _1538);
    float _1564 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4545, float2(0.0), isnan(_4545)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4545, float2(0.0), isnan(_4545)), level(0.0)).x;
    float _1566 = _1362 * _1556;
    float _1568 = -_1552;
    float _1570 = fma(_1558, _1568, 1.0);
    float _1572 = _1362 * _1560;
    float _1574 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1576 = -_1314;
    float _1578 = fma(_1534, _1546, _1576);
    float _1580 = fma(_1566, 0.5, 0.5);
    float _1582 = fma(_1572, -0.5, 0.5);
    float _1584 = fma(_1578, 0.5, 0.5);
    float3 _4583 = float3(_1580, _1582, _1574);
    float _1586 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4583, float3(0.0), isnan(_4583)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4583, float3(0.0), isnan(_4583)), level(0.0)).x;
    float3 _4594 = float3(_1580, _1582, _1574);
    float4 _1589 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4594, float3(0.0), isnan(_4594)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4594, float3(0.0), isnan(_4594)), level(0.0)).xyzw;
    float _1591 = _1589.x;
    float _1593 = _1589.y;
    float _1595 = _1589.z;
    float _1597 = _1589.w;
    float2 _4610 = float2(_1570, _1584);
    float3 _1601 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4610, float2(0.0), isnan(_4610)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4610, float2(0.0), isnan(_4610)), level(0.0)).xyz;
    float _1603 = _1601.x;
    float _1605 = _1601.y;
    float _1607 = _1601.z;
    float _1609 = abs(_1374);
    float _1611 = log2(_1609);
    float _1613 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1615 = _1368 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_79.x = _1040;
    out.m_79.y = _1034;
    out.m_79.z = _1048;
    float _1617 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1613);
    bool _1619 = _1286 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1621 = isnan(_1286);
    bool _1623 = _1619 || _1621;
    bool _1625 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1627 = _1623 || _1625;
    bool _1629 = _1374 <= 8000.0;
    bool _1631 = isnan(_1374);
    bool _1633 = _1629 || _1631;
    bool _1635 = isnan(8000.0);
    bool _1637 = _1633 || _1635;
    float _1639 = float(_1637);
    float _1641 = _1611 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1643 = exp2(_1615);
    float _1645 = exp2(_1641);
    float _1647 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1617);
    float _1649 = _1428 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1651 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1647);
    float _1653 = _1649 * _1500;
    float _1655 = in.m_77.x;
    float _1657 = -_1643;
    float _1659 = _1657 + 1.0;
    out.gl_Position.x = _1524;
    out.gl_Position.y = _1532;
    out.gl_Position.z = _1651;
    out.gl_Position.w = _1350;
    float _1661 = _1659 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1663 = _1580;
    float _1665 = _1651;
    if (!_1510)
    {
        _1663 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1667 = _1663;
    float _1669 = fma(_1645, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1671 = precise::clamp(_1669, 0.0, 1.0);
    float _1673 = fma(_1671, -2.0, 3.0);
    float _1675 = _1671 * _1671;
    float _1677 = _1675 * _1673;
    float _1679 = -_1677;
    float _1681 = _1679 + 1.0;
    float _1683 = fma(_1681, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1677);
    float _1685 = _1651 + _1350;
    int _1687 = as_type<int>(_1685);
    float _1689 = 0.0;
    float _1691 = 0.0;
    if (!_1627)
    {
        _1378 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1693 = _1378;
    float _1695 = _1639 * _1683;
    float _1697 = _1685 * 0.5;
    float _1699 = _1693;
    float _1701 = _1693;
    if (!_1510)
    {
        float _1703 = _1667 * 5.0;
        _1687 = as_type<int>(_1703);
    }
    int _1705 = _1687;
    float _1707 = as_type<float>(_1705);
    if (!_1627)
    {
        _1665 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1709 = _1665;
    float _1711 = _1695 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_81.z = _1697;
    out.m_81.w = _1350;
    float _1713 = _1709;
    float _1715 = _1709;
    if (!_1510)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4810 = as_type<float>(_1705);
        out.gl_Position.z = _4810;
    }
    if (_1510)
    {
        _1707 = _1653;
    }
    float _1717 = _1707;
    float _1719 = _1717;
    if (!_1627)
    {
        _1689 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1721 = _1689;
    float _1723 = _1721;
    float _1725 = _1721;
    if (!_1627)
    {
        _1691 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1727 = _1691;
    float _1729 = _1727;
    float _1731 = _1727;
    if (!_1510)
    {
        _1719 = 0.0;
    }
    float _1733 = _1719;
    float _1735 = -_1564;
    float _1737 = _1735 + 1.0;
    float _1739 = _1737 * _1711;
    float _1741 = precise::clamp(_1739, 0.0, 1.0);
    float _1743 = -_1741;
    float _1745 = fma(_1743, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1747 = _1661 * _1586;
    float _1749 = _1745 * _1655;
    float _1751 = -_1661;
    float _1753 = _1751 + 1.0;
    float _1755 = _1597 * _1747;
    float _1757 = _1607 * _1747;
    float _1759 = _1749 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1761 = _1597 * _1753;
    float _1763 = fma(_1603, _1755, _1591);
    float _1765 = fma(_1605, _1755, _1593);
    float _1767 = fma(_1597, _1757, _1595);
    out.m_83.x = _1759;
    float _1769 = _1755;
    float _1771 = _1757;
    if (!_1627)
    {
        _1769 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1773 = _1769;
    float _1775 = _1773;
    float _1777 = _1773;
    if (!_1627)
    {
        _1771 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1779 = _1771;
    out.m_85.x = _1763;
    out.m_85.y = _1765;
    out.m_85.z = _1767;
    out.m_85.w = _1761;
    bool _1781 = !_1627;
    float _1783 = _1779;
    float _1785 = _1779;
    if (!_1781)
    {
        bool _1787 = _1286 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1789 = isnan(_1286);
        bool _1791 = _1787 || _1789;
        bool _1793 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1795 = _1791 || _1793;
        if (!_1795)
        {
            float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1799 = _1286 + _1797;
            float _1801 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1803 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1801;
            float _1805 = 1.0 / _1803;
            float _1807 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1815 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1817 = _1815 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1819 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1821 = _1819 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1823 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1825 = _1823 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1827 = _1799 * _1805;
            float _1829 = precise::clamp(_1827, 0.0, 1.0);
            float _1831 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1833 = _1831 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1835 = fma(_1829, _1809, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1837 = fma(_1829, _1833, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1839 = fma(_1829, _1813, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1841 = fma(_1829, _1817, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1843 = fma(_1829, _1821, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1845 = fma(_1829, _1825, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1731 = _1837;
            _1777 = _1843;
            _1725 = _1835;
            _1715 = _1841;
            _1701 = _1839;
            _1785 = _1845;
            _1847 = true;
        }
        else
        {
            bool _1849 = _1286 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1851 = isnan(_1286);
            bool _1853 = _1849 || _1851;
            bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1857 = _1853 || _1855;
            if (!_1857)
            {
                _1723 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1859 = _1723;
            _1725 = _1859;
            if (!_1857)
            {
                _1729 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1861 = _1729;
            _1731 = _1861;
            if (!_1857)
            {
                _1699 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1863 = _1699;
            _1701 = _1863;
            if (!_1857)
            {
                _1713 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1865 = _1713;
            _1715 = _1865;
            if (!_1857)
            {
                _1775 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1867 = _1775;
            _1777 = _1867;
            if (!_1857)
            {
                _1783 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1869 = _1783;
            bool _1871 = !_1857;
            _1785 = _1869;
            if (!_1871)
            {
                bool _1873 = _1286 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1875 = isnan(_1286);
                bool _1877 = _1873 || _1875;
                bool _1879 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1881 = _1877 || _1879;
                if (!_1881)
                {
                    float _1883 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1885 = _1286 + _1883;
                    float _1887 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1889 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1887;
                    float _1891 = 1.0 / _1889;
                    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1895 = _1893 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1897 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1899 = _1897 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1901 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1913 = _1885 * _1891;
                    float _1915 = precise::clamp(_1913, 0.0, 1.0);
                    float _1917 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1919 = _1917 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1921 = fma(_1915, _1895, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1923 = fma(_1915, _1919, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1925 = fma(_1915, _1899, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1927 = fma(_1915, _1903, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1929 = fma(_1915, _1907, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1931 = fma(_1915, _1911, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1731 = _1923;
                    _1777 = _1929;
                    _1725 = _1921;
                    _1715 = _1927;
                    _1701 = _1925;
                    _1785 = _1931;
                    _1847 = true;
                }
                else
                {
                    _1731 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1777 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1725 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1715 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1701 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1785 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1847 = false;
    float _1933 = _1731;
    float _1935 = _1777;
    float _1937 = _1725;
    float _1939 = _1715;
    float _1941 = _1701;
    float _1943 = _1785;
    float _1945 = fma(_558, -0.5, 0.5);
    float _1947 = precise::clamp(_1945, 0.0, 1.0);
    float _1949 = -_1933;
    float _1951 = _1949 + _1935;
    float _1953 = -_1937;
    float _1955 = _1953 + _1939;
    float _1957 = fma(_1947, _1951, _1933);
    out.m_87.x = 0.0;
    float _1959 = fma(_1947, _1955, _1937);
    float _1961 = -_1941;
    float _1963 = _1961 + _1943;
    float _1965 = _1957 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    bool _1967 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1969 = fma(_1947, _1963, _1941);
    float _1971 = fma(_1959, 0.298911988735198974609375, _1965);
    float _1973 = _1733 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _1975 = _1428 > 0.0;
    bool _1977 = isnan(_1428);
    bool _1979 = _1975 || _1977;
    bool _1981 = isnan(0.0);
    bool _1983 = _1979 || _1981;
    float _1985 = fma(_1969, 0.114477999508380889892578125, _1971);
    out.m_89.x = 0.0;
    float _1987 = -_1985;
    float _1989 = _1959 + _1987;
    out.m_83.w = _1973;
    float _1991 = -_1985;
    float _1993 = _1957 + _1991;
    float _1995 = fma(_1993, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1985);
    float _1997 = -_1985;
    float _1999 = _1969 + _1997;
    float _2001 = fma(_1989, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1985);
    float _2003 = fma(_1999, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1985);
    bool _2005 = !_1967;
    if (!_2005)
    {
        float _2007 = -_1034;
        float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2011 = -_1040;
        float _2013 = _2011 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2015 = -_1048;
        float _2017 = _2015 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2019 = _2009 * _2009;
        float _2021 = fma(_2013, _2013, _2019);
        float _2023 = fma(_2017, _2017, _2021);
        float _2025 = rsqrt(_2023);
        float _2027 = _2009 * _2025;
        float _2029 = _2013 * _2025;
        float _2031 = _2017 * _2025;
        float _2033 = -_1074;
        float _2035 = _2033 + _2027;
        float _2037 = -_1070;
        float _2039 = _2037 + _2029;
        float _2041 = -_1072;
        float _2043 = _2041 + _2031;
        float _2045 = sqrt(_2023);
        float _2047 = _2035 * _2035;
        float _2049 = fma(_2039, _2039, _2047);
        float _2051 = fma(_2043, _2043, _2049);
        float _2053 = rsqrt(_2051);
        float _2055 = -_2045;
        float _2057 = _2055 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2059 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2061 = precise::clamp(_2059, 0.0, 1.0);
        float _2063 = abs(_2061);
        float _2065 = log2(_2063);
        float _2067 = _2035 * _2053;
        float _2069 = _2039 * _2053;
        float _2071 = _2043 * _2053;
        float _2073 = _558 * _2067;
        float _2075 = _558 * _2027;
        float _2077 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2079 = precise::clamp(_2077, 0.0, 1.0);
        float _2081 = fma(_554, _2069, _2073);
        float _2083 = fma(_554, _2029, _2075);
        float _2085 = _2079 * _2079;
        float _2087 = _2065 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2089 = fma(_614, _2071, _2081);
        float _2091 = precise::clamp(_2089, 0.0, 1.0);
        float _2093 = fma(_614, _2031, _2083);
        float _2095 = precise::clamp(_2093, 0.0, 1.0);
        float _2097 = _2085 + (-1.0);
        float _2099 = _2091 * _2091;
        float _2101 = _2029 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2103 = exp2(_2087);
        float _2105 = fma(_2099, _2097, 1.0);
        float _2107 = -_2027;
        float _2109 = -_2101;
        float _2111 = fma(_2107, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2109);
        float _2113 = _2105 * _2105;
        float _2115 = -_2031;
        float _2117 = fma(_2115, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2111);
        float _2119 = 1.0 / _2113;
        float _2121 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2123 = _2117 + _2121;
        float _2125 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2127 = precise::clamp(_2125, 0.0, 1.0);
        float _2129 = _2103 * _2127;
        float _2131 = _2095 * _2129;
        float _2133 = _2085 * _2119;
        float _2135 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2137 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2139 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2141 = _2131 * _2133;
        float _2143 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2145 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2147 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2135;
        out.m_87.y = _2137;
        out.m_87.z = _2139;
        out.m_89.x = _2143;
        out.m_89.y = _2145;
        out.m_89.z = _2147;
    }
    out.m_91.x = _2001;
    out.m_91.y = _1995;
    out.m_91.z = _2003;
    if (_1983)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2149 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2149;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1847 = false;
    bool _976 = false;
    bool _660 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = trunc(_108);
    int _112 = int(_110);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    float _120 = as_type<float>(_112);
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _118;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _122 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2207 = as_type<float>(_128);
        out.gl_Position.z = _2207;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_53.w;
    float _134 = float(_112);
    float _136 = -_132;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_132);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    bool _150 = _138 >= _134;
    bool _152 = !_148;
    bool _154 = _150 || _152;
    if (_154)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _120;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _130 = as_type<int>(_158);
    }
    int _160 = _130;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2270 = as_type<float>(_160);
        out.gl_Position.z = _2270;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_48.x;
    float _164 = in.m_48.y;
    float _166 = in.m_48.z;
    float _168 = 1.0 / _134;
    float _170 = in.m_55.x;
    float _172 = in.m_55.y;
    float _174 = in.m_55.z;
    float _176 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _178 = fma(_176, 10.0, 10.0);
    float _180 = in.m_57.y;
    float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _186 = _184 != 0;
    float _188 = in.m_59.x;
    int _190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _192 = _190 != 0;
    float _194 = _138 * _168;
    float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _198 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _200 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _202 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _204 = fma(_194, 0.2000000476837158203125, 1.0);
    float _206 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _198);
    float _208 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _200);
    float _210 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _202);
    float _212 = fma(_170, 2.0, -1.0);
    float _214 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _206);
    float _216 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _208);
    float _218 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _210);
    float _220 = fma(_172, 2.0, -1.0);
    float _222 = _214 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _224 = _216 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _226 = _218 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _228 = in.m_61.x;
    float _230 = in.m_61.y;
    float _232 = in.m_61.z;
    float _234 = -_222;
    float _236 = _234 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _238 = -_224;
    float _240 = _238 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _242 = -_226;
    float _244 = _242 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _246 = fma(_174, 2.0, -1.0);
    float _248 = _236 * _236;
    float _250 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _252 = _222 + _250;
    float _254 = precise::max(_194, 0.949999988079071044921875);
    float _256 = fma(_240, _240, _248);
    float _258 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.10471977293491363525390625;
    float _260 = precise::min(_254, 1.0);
    float _262 = fma(_244, _244, _256);
    float _264 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _266 = _224 + _264;
    float _268 = _258 * _178;
    float _270 = _212 * _204;
    float _272 = rsqrt(_262);
    float _274 = fma(_260, -19.999996185302734375, 19.999996185302734375);
    float _276 = _268 * 0.15915493667125701904296875;
    float _278 = _252 * _252;
    float _280 = _178;
    float _282 = _252;
    float _284 = _188;
    if (_186)
    {
        float _286 = in.m_57.x;
        _280 = _286;
    }
    float _288 = _280;
    bool _290 = _180 > 0.5;
    bool _292 = _290 && _192;
    float _294 = -_212;
    float _296 = _294 + _228;
    float _298 = _276 * 6.283185482025146484375;
    float _300 = sin(_298);
    float _302 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _304 = _226 + _302;
    float _306 = fma(_266, _266, _278);
    float _308 = -_220;
    float _310 = _308 + _230;
    float _312 = fma(_304, _304, _306);
    float _314 = _244 * _272;
    float _316 = _240 * _272;
    float _318 = _236 * _272;
    float _320 = _314 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _322 = rsqrt(_312);
    float _324 = _318 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _326 = -_320;
    float _328 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[10].y, _326);
    float _330 = fma(_300, 0.150000035762786865234375, 1.0499999523162841796875);
    float _332 = -_324;
    float _334 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[9].y, _332);
    float _336 = _316 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _338 = _328 * _328;
    bool _340 = _288 > 0.5;
    bool _342 = _340 && _186;
    float _344 = -_246;
    float _346 = _344 + _232;
    float _348 = -_336;
    float _350 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[8].y, _348);
    float _352 = fma(_334, _334, _338);
    float _354 = _330 * _274;
    float _356 = in.m_59.y;
    float _358 = fma(_350, _350, _352);
    float _360 = _252 * _322;
    float _362 = fma(_296, _354, _270);
    float _364 = _266 * _322;
    float _366 = rsqrt(_358);
    float _368 = -_360;
    float _370 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[18].w, _252);
    float _372 = fma(_310, _354, _220);
    float _374 = -_364;
    float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[18].w, _266);
    if (!_186)
    {
        _282 = _188;
    }
    float _378 = _282;
    float _380 = _370 * _370;
    float _382 = _378;
    if (_342)
    {
        float _384 = -_188;
        float _386 = _384 + 1.0;
        _284 = _386;
    }
    float _388 = _284;
    float _390 = fma(_346, _354, _246);
    float _392 = in.m_63.x;
    float _394 = in.m_63.y;
    float _396 = in.m_63.z;
    float _398 = fma(_376, _376, _380);
    float _400 = _304 * _322;
    if (_186)
    {
        _382 = _388;
    }
    float _402 = _382;
    out.m_65.x = _362;
    out.m_65.y = _372;
    out.m_65.z = _390;
    bool _404 = _372 != 0.0;
    bool _406 = isnan(_372);
    bool _408 = _404 || _406;
    bool _410 = isnan(0.0);
    bool _412 = _408 || _410;
    float _414 = -_400;
    float _416 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[18].w, _304);
    float _418 = _334 * _366;
    float _420 = _350 * _366;
    float _422 = _328 * _366;
    float _424 = fma(_416, _416, _398);
    float _426 = _418 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _428 = _420 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _430 = _422 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _432 = _362 == 0.0;
    bool _434 = !_412;
    bool _436 = _432 && _434;
    float _438 = -_426;
    float _440 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[8].y, _438);
    float _442 = -_428;
    float _444 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[10].y, _442);
    float _446 = -_430;
    float _448 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[9].y, _446);
    float _450 = in.m_67.x;
    float _452 = in.m_67.y;
    float _454 = in.m_67.z;
    float _456 = _440 * _440;
    bool _458 = _390 == 0.0;
    bool _460 = _458 && _436;
    float _462 = sqrt(_424);
    float _464 = fma(_444, _444, _456);
    float _466 = _356;
    if (_292)
    {
        float _468 = -_356;
        float _470 = _468 + 1.0;
        _466 = _470;
    }
    float _472 = _466;
    float _474 = _402 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _476 = fma(_448, _448, _464);
    float _478 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _372);
    float _480 = _472 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _482 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _362);
    float _484 = rsqrt(_476);
    float _486 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _390);
    float _488 = _394;
    float _490 = _392;
    float _492 = _396;
    if (!_460)
    {
        float _494 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[17].y, _394);
        _488 = _494;
    }
    float _496 = _488;
    if (!_460)
    {
        float _498 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[17].y, _392);
        _490 = _498;
    }
    float _500 = _490;
    if (!_460)
    {
        float _502 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[17].y, _396);
        _492 = _502;
    }
    float _504 = _492;
    float _506 = _474 * _196;
    float _508 = _496 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _510 = _322 * _462;
    float _512 = _496 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _514 = _496 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _516 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[8].x, _508);
    float _518 = _452 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _520 = _450 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _522 = _480 * _182;
    float _524 = _454 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _526 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _528 = _440 * _484;
    float _530 = _444 * _484;
    float _532 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _534 = _526 * _510;
    float _536 = _528 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _538 = _448 * _484;
    float _540 = _532 * _510;
    float _542 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[9].x, _512);
    float _544 = fma(_530, (*spvDescriptorSet0.vp_c10)._m0[8].z, _536);
    float _546 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _548 = _534 * _478;
    float _550 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[10].x, _514);
    float _552 = fma(_538, (*spvDescriptorSet0.vp_c10)._m0[10].z, _544);
    float _554 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[8].z, _516);
    out.m_69.x = _506;
    out.m_69.y = _522;
    float _556 = _540 * _482;
    float _558 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[9].z, _542);
    float _560 = _546 * _510;
    float _562 = _548 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _564 = abs(_552);
    float _566 = -_564;
    float _568 = _566 + 1.0;
    float _570 = _560 * _486;
    float _572 = fma(_556, (*spvDescriptorSet0.vp_c10)._m0[9].x, _562);
    float _574 = _548 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _576 = _548 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _578 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[9].z, _572);
    float _580 = fma(_556, (*spvDescriptorSet0.vp_c10)._m0[8].x, _574);
    float _582 = fma(_556, (*spvDescriptorSet0.vp_c10)._m0[10].x, _576);
    int _584 = as_type<int>(_568) + (-218103808);
    float _586 = abs(_552);
    float _588 = fma(_586, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _590 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[8].z, _580);
    float _592 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[10].z, _582);
    bool _594 = uint(_584) >= 1920991232u;
    float _596 = abs(_552);
    float _598 = fma(_596, _588, -0.212114393711090087890625);
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _608 = abs(_552);
    float _610 = fma(_608, _598, 1.570728778839111328125);
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _614 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[10].z, _550);
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _618 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _604 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _624 = _606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _626 = _612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _628 = _616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _630 = _552 < 0.0;
    float _632 = float(_630);
    bool _634 = !_594;
    float _636 = _590;
    float _658;
    if (!_634)
    {
        int _638 = as_type<int>(_568);
        int _640 = as_type<int>(_440);
        int _642 = as_type<int>(_448);
        int _644 = 3456;
        int _646;
        int _648;
        int _650;
        int _652;
        int _654;
        int _656;
        _104(_638, _640, _642, _644, _646, _648, _650, _652, _654, _656, out.gl_Position, out.gl_PointSize);
        _658 = as_type<float>(_646);
        _660 = true;
    }
    else
    {
        float _662 = rsqrt(_568);
        float _664 = _568 * _662;
        float _666 = _662 * 0.5;
        float _668 = -_664;
        float _670 = 0.0 + _668;
        float _672 = fma(_666, _670, 0.5);
        float _674 = fma(_664, _672, _664);
        float _676 = -_674;
        float _678 = 0.0 + _676;
        float _680 = fma(_674, _678, _568);
        float _682 = fma(_666, _680, _674);
        _658 = _682;
    }
    _660 = false;
    float _684 = _658;
    float _686 = _538 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _688 = _528 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _690 = _610 * _684;
    float _692 = -_686;
    float _694 = fma(_530, (*spvDescriptorSet0.vp_c10)._m0[10].z, _692);
    float _696 = _530 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _698 = -_688;
    float _700 = fma(_538, (*spvDescriptorSet0.vp_c10)._m0[9].z, _698);
    float _702 = _694 * _694;
    float _704 = -_696;
    float _706 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[8].z, _704);
    float _708 = _632 * 2.0;
    float _710 = fma(_700, _700, _702);
    float _712 = -_708;
    float _714 = fma(_690, _712, _690);
    float _716 = fma(_706, _706, _710);
    float _718 = fma(_632, 3.1415927410125732421875, _714);
    float _720 = rsqrt(_716);
    float _722 = _718 * 0.15915493667125701904296875;
    float _724 = _722 * 6.283185482025146484375;
    float _726 = cos(_724);
    float _728 = _694 * _720;
    float _730 = _700 * _720;
    float _732 = _706 * _720;
    float _734 = _728 * _728;
    float _736 = _722 * 6.283185482025146484375;
    float _738 = sin(_736);
    float _740 = fma(_730, _730, _734);
    float _742 = -_726;
    float _744 = _742 + 1.0;
    float _746 = fma(_732, _732, _740);
    float _748 = rsqrt(_746);
    float _750 = _732 * _748;
    float _752 = _730 * _748;
    float _754 = _728 * _748;
    float _756 = _750 * _738;
    float _758 = _752 * _744;
    float _760 = _752 * _738;
    float _762 = _754 * _744;
    float _764 = _754 * _738;
    float _766 = -_756;
    float _768 = fma(_754, _758, _766);
    float _770 = _750 * _750;
    float _772 = fma(_750, _762, _760);
    float _774 = fma(_752, _758, _726);
    float _776 = _578 * _768;
    float _778 = -_764;
    float _780 = fma(_750, _758, _778);
    float _782 = _578 * _772;
    float _784 = fma(_744, _770, _726);
    float _786 = fma(_590, _774, _776);
    float _788 = fma(_750, _758, _764);
    float _790 = fma(_590, _780, _782);
    float _792 = fma(_754, _762, _726);
    float _794 = fma(_754, _758, _756);
    float _796 = fma(_592, _788, _786);
    float _798 = fma(_592, _784, _790);
    float _800 = _578 * _792;
    float _802 = -_760;
    float _804 = fma(_750, _762, _802);
    float _806 = _224 + _796;
    float _808 = _226 + _798;
    float _810 = fma(_590, _794, _800);
    float _812 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _814 = _806 + _812;
    float _816 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _818 = _808 + _816;
    float _820 = fma(_592, _804, _810);
    float _822 = _814 * _814;
    float _824 = _818 * _818;
    float _826 = _222 + _820;
    float _828 = _822 + _824;
    float _830 = sqrt(_828);
    bool _832 = _830 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _834 = _810;
    float _836 = _806;
    float _838 = _726;
    float _840 = _822;
    float _842 = _826;
    float _844 = _792;
    float _846 = _814;
    if (!_832)
    {
        _636 = _806;
    }
    float _848 = _636;
    float _850 = _848;
    if (!_832)
    {
        _834 = _824;
    }
    float _852 = _834;
    float _854 = _852;
    if (!_832)
    {
        _836 = _808;
    }
    float _856 = _836;
    float _858 = _856;
    if (!_832)
    {
        _838 = _826;
    }
    float _860 = _838;
    bool _862 = !_832;
    float _864 = _860;
    if (!_862)
    {
        float _866 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _868 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _870 = _830 + _868;
        float _872 = _826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _874 = rsqrt(_828);
        float _876 = _870 * _866;
        float _878 = _876 * 0.15915493667125701904296875;
        float _880 = _878 * 6.283185482025146484375;
        float _882 = sin(_880);
        float _884 = _878 * 6.283185482025146484375;
        float _886 = cos(_884);
        float _888 = fma(_882, _872, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _890 = _874 * _888;
        float _892 = _886 + (-1.0);
        float _894 = _818 * _890;
        float _896 = _892 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = _814 * _890;
        float _900 = _894 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _902 = _894 * _894;
        float _904 = fma(_826, _886, _896);
        float _906 = _898 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _908 = _898 * _898;
        _864 = _904;
        _840 = _908;
        _854 = _902;
        _850 = _906;
        _858 = _900;
    }
    float _910 = _864;
    float _912 = _840;
    float _914 = _854;
    float _916 = _850;
    float _918 = _858;
    float _920 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _922 = _910 + _920;
    out.m_71.x = _618;
    out.m_71.y = _620;
    out.m_71.z = _622;
    float _924 = fma(_922, _922, _912);
    out.m_73.x = _624;
    out.m_73.y = _626;
    out.m_73.z = _628;
    float _926 = _924 + _914;
    out.m_75.x = _554;
    out.m_75.y = _558;
    out.m_75.z = _614;
    float _928 = sqrt(_926);
    bool _930 = _928 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _932 = isnan(_928);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _938 = _934 || _936;
    float _940 = _912;
    if (!_938)
    {
        _940 = 1.0;
    }
    float _942 = _940;
    bool _944 = !_938;
    float _946 = _942;
    if (!_944)
    {
        bool _948 = _928 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _950 = isnan(_928);
        bool _952 = _948 || _950;
        bool _954 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _956 = _952 || _954;
        if (!_956)
        {
            float _958 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _960 = _928 + _958;
            float _962 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _964 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _962;
            float _966 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _968 = _966 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _970 = 1.0 / _964;
            float _972 = _960 * _970;
            float _974 = fma(_972, _968, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _946 = _974;
            _976 = true;
        }
        else
        {
            bool _978 = _928 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _980 = isnan(_928);
            bool _982 = _978 || _980;
            bool _984 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _986 = _982 || _984;
            if (!_986)
            {
                float _988 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _990 = _928 + _988;
                float _992 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _994 = _992 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _996 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _998 = _996 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1000 = 1.0 / _994;
                float _1002 = _990 * _1000;
                float _1004 = fma(_1002, _998, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _946 = _1004;
                _976 = true;
            }
            else
            {
                _946 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _976 = false;
    float _1006 = _946;
    float _1008 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1010 = _910 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1014 = _916 + _1012;
    float _1016 = -_360;
    float _1018 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[18].w, _222);
    float _1020 = -_364;
    float _1022 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[18].w, _224);
    float _1024 = fma(_1010, _1006, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1026 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1028 = _918 + _1026;
    float _1030 = fma(_1014, _1006, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1032 = -_360;
    float _1034 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1024);
    float _1036 = fma(_1028, _1006, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1038 = -_364;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1030);
    float _1042 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1044 = _1034 + _1042;
    float _1046 = -_400;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1036);
    float _1050 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1052 = _1040 + _1050;
    float _1054 = _1044 * _1044;
    float _1056 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1058 = _1048 + _1056;
    float _1060 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1062 = fma(_1052, _1052, _1054);
    float _1064 = precise::max(0.0, _1060);
    float _1066 = fma(_1058, _1058, _1062);
    float _1068 = rsqrt(_1066);
    float _1070 = _1052 * _1068;
    float _1072 = _1058 * _1068;
    float _1074 = _1044 * _1068;
    float _1076 = _1070 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1078 = _1072 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1080 = -_1074;
    float _1082 = -_1064;
    float _1084 = fma(_1080, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1082);
    float _1086 = _1076 * _1076;
    float _1088 = _1078 * _1078;
    float _1090 = _1086 + _1088;
    float _1092 = sqrt(_1090);
    bool _1094 = _1092 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1098 = _1092 + _1096;
    float _1100 = _622;
    float _1102 = _1044;
    float _1104 = _1098;
    float _1106 = _1090;
    float _1108 = _1086;
    if (_1094)
    {
        float _1110 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1100 = _1110;
    }
    float _1112 = _1100;
    if (_1094)
    {
        float _1114 = _1084 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1102 = _1114;
    }
    float _1116 = _1102;
    float _1118 = _1116;
    if (_1094)
    {
        float _1120 = rsqrt(_1090);
        _842 = _1120;
    }
    float _1122 = _842;
    float _1124 = _1122;
    if (_1094)
    {
        float _1126 = _1098 * _1112;
        _1104 = _1126;
    }
    float _1128 = _1104;
    float _1130 = -_400;
    float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[18].w, _226);
    if (_1094)
    {
        float _1134 = _1128 * 0.15915493667125701904296875;
        _844 = _1134;
    }
    float _1136 = _844;
    float _1138 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1140 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1142 = _400;
    if (_1094)
    {
        float _1144 = _1136 * 6.283185482025146484375;
        float _1146 = cos(_1144);
        _1142 = _1146;
    }
    float _1148 = _1142;
    float _1150 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1138);
    float _1152 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1140);
    float _1154 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1150);
    float _1156 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1152);
    float _1158 = fma(_1132, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1160 = _928;
    if (_1094)
    {
        float _1162 = _1136 * 6.283185482025146484375;
        float _1164 = sin(_1162);
        _1160 = _1164;
    }
    float _1166 = _1160;
    float _1168 = _1154 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1170 = _1156 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1172 = fma(_1022, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1174 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1176 = _1170;
    float _1178 = _1168;
    if (_1094)
    {
        float _1180 = _1148 + (-1.0);
        _1174 = _1180;
    }
    float _1182 = _1174;
    float _1184 = 1.0 / _1168;
    float _1186 = _1170 + _1168;
    float _1188 = _1182;
    if (!_1094)
    {
        _1176 = _1076;
    }
    float _1190 = _1176;
    float _1192 = _1190;
    if (_1094)
    {
        float _1194 = _1182 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1106 = _1194;
    }
    float _1196 = _1106;
    if (!_1094)
    {
        _1188 = _1078;
    }
    float _1198 = _1188;
    float _1200 = _1198;
    if (_1094)
    {
        float _1202 = fma(_1166, _1116, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1118 = _1202;
    }
    float _1204 = _1118;
    if (!_1094)
    {
        _1178 = _1088;
    }
    float _1206 = _1178;
    float _1208 = floor(_1172);
    float _1210 = _1206;
    float _1212 = _1208;
    if (_1094)
    {
        float _1214 = _1122 * _1204;
        _846 = _1214;
    }
    float _1216 = _846;
    if (!_1094)
    {
        _1124 = _1084;
    }
    float _1218 = _1124;
    float _1220 = _1218;
    if (_1094)
    {
        float _1222 = fma(_1084, _1148, _1196);
        _1220 = _1222;
    }
    float _1224 = _1220;
    float _1226 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1094)
    {
        float _1228 = _1076 * _1216;
        _1192 = _1228;
    }
    float _1230 = _1192;
    if (_1094)
    {
        float _1232 = _1078 * _1216;
        _1200 = _1232;
    }
    float _1234 = _1200;
    float _1236 = _1186 * _1184;
    float _1238 = _1236 * 0.5;
    float _1240 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1226);
    if (_1094)
    {
        float _1242 = _1230 * _1230;
        _1108 = _1242;
    }
    float _1244 = _1108;
    if (_1094)
    {
        float _1246 = _1234 * _1234;
        _1210 = _1246;
    }
    float _1248 = _1210;
    float _1250 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1240);
    float _1252 = fma(_1224, _1224, _1244);
    float _1254 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1258 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1256);
    float _1260 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1262 = _1252 + _1248;
    float _1264 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1266 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1268 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1270 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1254);
    float _1272 = rsqrt(_1262);
    float _1274 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1266);
    float _1276 = -_1268;
    float _1278 = fma(_1276, _1264, 1.0);
    float _1280 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1270);
    float _1282 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1274);
    float _1284 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1286 = sqrt(_1066);
    float _1288 = _1282 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1290 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1292 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan(0.5);
    bool _1298 = _1294 || _1296;
    float _1300 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1302 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1304 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1300);
    float _1306 = _1272 * _1230;
    float _1308 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1310 = 1.0 / _1258;
    float _1312 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1304);
    float _1314 = _1272 * _1224;
    float _1316 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1308);
    float _1318 = _1272 * _1234;
    float _1320 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1322 = fma(_1286, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1320);
    float _1324 = precise::clamp(_1322, 0.0, 1.0);
    float _1326 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1316);
    float _1328 = floor(_1158);
    float _1330 = _1306 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1332 = -_1324;
    float _1334 = _1332 + 1.0;
    float _1336 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1338 = _1326;
    float _1340 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1298)
    {
        _1338 = 1.0;
    }
    float _1342 = _1338;
    float _1344 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1346 = _1342;
    if (_1298)
    {
        _1340 = 1.0;
    }
    float _1348 = _1340;
    float _1350 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1312);
    float _1352 = -_1330;
    float _1354 = fma(_1314, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1352);
    float _1356 = log2(_1278);
    float _1358 = -_1318;
    float _1360 = fma(_1358, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1354);
    float _1362 = 1.0 / _1350;
    float _1364 = fma(_1360, -0.5, 0.5);
    float _1366 = abs(_1334);
    float _1368 = log2(_1366);
    float _1370 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1302);
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1374 = _1310 * _1372;
    float _1376 = _1348;
    float _1378 = _1350;
    if (!_1298)
    {
        float _1380 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1382 = _1380 * 0.15915493667125701904296875;
        float _1384 = _1382 * 6.283185482025146484375;
        float _1386 = cos(_1384);
        float _1388 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1390 = _1388 * 0.15915493667125701904296875;
        float _1392 = _1382 * 6.283185482025146484375;
        float _1394 = sin(_1392);
        float _1396 = 1.0 / _1386;
        float _1398 = _1390 * 6.283185482025146484375;
        float _1400 = cos(_1398);
        float _1402 = _1394 * _1396;
        float _1404 = _1390 * 6.283185482025146484375;
        float _1406 = sin(_1404);
        float _1408 = _1400 * _1402;
        float _1410 = 1.0 / _1408;
        float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1414 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1412;
        float _1416 = 1.0 / _1414;
        float _1418 = _1406 * _1410;
        float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1422 = fma(_1374, _1418, _1420);
        float _1424 = _1422 * _1416;
        float _1426 = precise::clamp(_1424, 0.0, 1.0);
        _1346 = _1426;
    }
    float _1428 = _1346;
    if (!_1298)
    {
        float _1430 = in.m_77.w;
        bool _1432 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 1;
        bool _1434 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 2;
        bool _1436 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z) == 3;
        int _1438 = as_type<int>(_1430) << 16;
        int _1440 = as_type<int>(_1430) << 8;
        int _1442 = as_type<int>(_1430) << 24;
        int _1444 = _1438 >> 24;
        int _1446 = _1440 >> 24;
        int _1448 = as_type<int>(_1430) >> 24;
        int _1450 = _1442 >> 24;
        float _1452 = float(_1444);
        float _1454 = float(_1446);
        float _1456 = float(_1448);
        float _1458 = _1452 * 0.0078740157186985015869140625;
        float _1460 = float(_1450);
        float _1462 = _1454 * 0.0078740157186985015869140625;
        float _1464 = _1456 * 0.0078740157186985015869140625;
        float _1466 = precise::min(_1458, 1.0);
        float _1468 = _1460 * 0.0078740157186985015869140625;
        float _1470 = precise::min(_1462, 1.0);
        float _1472 = precise::min(_1464, 1.0);
        float _1474 = precise::min(_1468, 1.0);
        float _1476 = precise::max(_1466, -1.0);
        float _1478 = precise::max(_1470, -1.0);
        float _1480 = precise::max(_1472, -1.0);
        float _1482 = precise::max(_1474, -1.0);
        float _1484 = _1482;
        if (_1432)
        {
            _1484 = _1476;
        }
        float _1486 = _1484;
        float _1488 = _1486;
        if (_1434)
        {
            _1488 = _1478;
        }
        float _1490 = _1488;
        float _1492 = _1490;
        if (_1436)
        {
            _1492 = _1480;
        }
        float _1494 = _1492;
        float _1496 = abs(_1494);
        float _1498 = (-0.0) + _1496;
        _1376 = _1498;
    }
    float _1500 = _1376;
    bool _1502 = _1500 != 0.0;
    bool _1504 = isnan(_1500);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan(0.0);
    bool _1510 = _1506 || _1508;
    float _1512 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1344);
    float _1514 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1370);
    float _1516 = sqrt(_1364);
    float _1518 = _1368 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1520 = fma(_1360, 0.5, 0.5);
    float _1522 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1512);
    float _1524 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1514);
    float _1526 = -_1208;
    float _1528 = _1172 + _1526;
    float _1530 = fma(_1520, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1532 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1522);
    float _1534 = exp2(_1518);
    float _1536 = -_1328;
    float _1538 = _1158 + _1536;
    float _1540 = fma(_1520, _1530, -0.212114393711090087890625);
    float _1542 = _1530;
    if (_1510)
    {
        _1542 = _1524;
    }
    float _1544 = _1542;
    float _1546 = _1314 + 1.0;
    float _1548 = _1544;
    if (_1510)
    {
        _1212 = _1532;
    }
    float _1550 = _1212;
    float _1552 = fma(_1520, _1540, 1.570728778839111328125);
    float _1554 = _1550;
    if (!_1510)
    {
        _1548 = 0.0;
    }
    float _1556 = _1548;
    float _1558 = _1516 * 0.636619746685028076171875;
    if (!_1510)
    {
        _1554 = 0.0;
    }
    float _1560 = _1554;
    float _1562 = _1356 * 0.693147182464599609375;
    float2 _4545 = float2(_1528, _1538);
    float _1564 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4545, float2(0.0), isnan(_4545)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4545, float2(0.0), isnan(_4545)), level(0.0)).x;
    float _1566 = _1362 * _1556;
    float _1568 = -_1552;
    float _1570 = fma(_1558, _1568, 1.0);
    float _1572 = _1362 * _1560;
    float _1574 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1576 = -_1314;
    float _1578 = fma(_1534, _1546, _1576);
    float _1580 = fma(_1566, 0.5, 0.5);
    float _1582 = fma(_1572, -0.5, 0.5);
    float _1584 = fma(_1578, 0.5, 0.5);
    float3 _4583 = float3(_1580, _1582, _1574);
    float _1586 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4583, float3(0.0), isnan(_4583)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4583, float3(0.0), isnan(_4583)), level(0.0)).x;
    float3 _4594 = float3(_1580, _1582, _1574);
    float4 _1589 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4594, float3(0.0), isnan(_4594)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4594, float3(0.0), isnan(_4594)), level(0.0)).xyzw;
    float _1591 = _1589.x;
    float _1593 = _1589.y;
    float _1595 = _1589.z;
    float _1597 = _1589.w;
    float2 _4610 = float2(_1570, _1584);
    float3 _1601 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4610, float2(0.0), isnan(_4610)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4610, float2(0.0), isnan(_4610)), level(0.0)).xyz;
    float _1603 = _1601.x;
    float _1605 = _1601.y;
    float _1607 = _1601.z;
    float _1609 = abs(_1374);
    float _1611 = log2(_1609);
    float _1613 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1615 = _1368 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_79.x = _1040;
    out.m_79.y = _1034;
    out.m_79.z = _1048;
    float _1617 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1613);
    bool _1619 = _1286 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1621 = isnan(_1286);
    bool _1623 = _1619 || _1621;
    bool _1625 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1627 = _1623 || _1625;
    bool _1629 = _1374 <= 8000.0;
    bool _1631 = isnan(_1374);
    bool _1633 = _1629 || _1631;
    bool _1635 = isnan(8000.0);
    bool _1637 = _1633 || _1635;
    float _1639 = float(_1637);
    float _1641 = _1611 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1643 = exp2(_1615);
    float _1645 = exp2(_1641);
    float _1647 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1617);
    float _1649 = _1428 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1651 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1647);
    float _1653 = _1649 * _1500;
    float _1655 = in.m_77.x;
    float _1657 = -_1643;
    float _1659 = _1657 + 1.0;
    out.gl_Position.x = _1524;
    out.gl_Position.y = _1532;
    out.gl_Position.z = _1651;
    out.gl_Position.w = _1350;
    float _1661 = _1659 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1663 = _1580;
    float _1665 = _1651;
    if (!_1510)
    {
        _1663 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1667 = _1663;
    float _1669 = fma(_1645, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1671 = precise::clamp(_1669, 0.0, 1.0);
    float _1673 = fma(_1671, -2.0, 3.0);
    float _1675 = _1671 * _1671;
    float _1677 = _1675 * _1673;
    float _1679 = -_1677;
    float _1681 = _1679 + 1.0;
    float _1683 = fma(_1681, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1677);
    float _1685 = _1651 + _1350;
    int _1687 = as_type<int>(_1685);
    float _1689 = 0.0;
    float _1691 = 0.0;
    if (!_1627)
    {
        _1378 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1693 = _1378;
    float _1695 = _1639 * _1683;
    float _1697 = _1685 * 0.5;
    float _1699 = _1693;
    float _1701 = _1693;
    if (!_1510)
    {
        float _1703 = _1667 * 5.0;
        _1687 = as_type<int>(_1703);
    }
    int _1705 = _1687;
    float _1707 = as_type<float>(_1705);
    if (!_1627)
    {
        _1665 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1709 = _1665;
    float _1711 = _1695 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_81.z = _1697;
    out.m_81.w = _1350;
    float _1713 = _1709;
    float _1715 = _1709;
    if (!_1510)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4810 = as_type<float>(_1705);
        out.gl_Position.z = _4810;
    }
    if (_1510)
    {
        _1707 = _1653;
    }
    float _1717 = _1707;
    float _1719 = _1717;
    if (!_1627)
    {
        _1689 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1721 = _1689;
    float _1723 = _1721;
    float _1725 = _1721;
    if (!_1627)
    {
        _1691 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1727 = _1691;
    float _1729 = _1727;
    float _1731 = _1727;
    if (!_1510)
    {
        _1719 = 0.0;
    }
    float _1733 = _1719;
    float _1735 = -_1564;
    float _1737 = _1735 + 1.0;
    float _1739 = _1737 * _1711;
    float _1741 = precise::clamp(_1739, 0.0, 1.0);
    float _1743 = -_1741;
    float _1745 = fma(_1743, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1747 = _1661 * _1586;
    float _1749 = _1745 * _1655;
    float _1751 = -_1661;
    float _1753 = _1751 + 1.0;
    float _1755 = _1597 * _1747;
    float _1757 = _1607 * _1747;
    float _1759 = _1749 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1761 = _1597 * _1753;
    float _1763 = fma(_1603, _1755, _1591);
    float _1765 = fma(_1605, _1755, _1593);
    float _1767 = fma(_1597, _1757, _1595);
    out.m_83.x = _1759;
    float _1769 = _1755;
    float _1771 = _1757;
    if (!_1627)
    {
        _1769 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1773 = _1769;
    float _1775 = _1773;
    float _1777 = _1773;
    if (!_1627)
    {
        _1771 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1779 = _1771;
    out.m_85.x = _1763;
    out.m_85.y = _1765;
    out.m_85.z = _1767;
    out.m_85.w = _1761;
    bool _1781 = !_1627;
    float _1783 = _1779;
    float _1785 = _1779;
    if (!_1781)
    {
        bool _1787 = _1286 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1789 = isnan(_1286);
        bool _1791 = _1787 || _1789;
        bool _1793 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1795 = _1791 || _1793;
        if (!_1795)
        {
            float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1799 = _1286 + _1797;
            float _1801 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1803 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1801;
            float _1805 = 1.0 / _1803;
            float _1807 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1815 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1817 = _1815 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1819 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1821 = _1819 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1823 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1825 = _1823 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1827 = _1799 * _1805;
            float _1829 = precise::clamp(_1827, 0.0, 1.0);
            float _1831 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1833 = _1831 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1835 = fma(_1829, _1809, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1837 = fma(_1829, _1833, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1839 = fma(_1829, _1813, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1841 = fma(_1829, _1817, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1843 = fma(_1829, _1821, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1845 = fma(_1829, _1825, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1731 = _1837;
            _1777 = _1843;
            _1725 = _1835;
            _1715 = _1841;
            _1701 = _1839;
            _1785 = _1845;
            _1847 = true;
        }
        else
        {
            bool _1849 = _1286 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1851 = isnan(_1286);
            bool _1853 = _1849 || _1851;
            bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1857 = _1853 || _1855;
            if (!_1857)
            {
                _1723 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1859 = _1723;
            _1725 = _1859;
            if (!_1857)
            {
                _1729 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1861 = _1729;
            _1731 = _1861;
            if (!_1857)
            {
                _1699 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1863 = _1699;
            _1701 = _1863;
            if (!_1857)
            {
                _1713 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1865 = _1713;
            _1715 = _1865;
            if (!_1857)
            {
                _1775 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1867 = _1775;
            _1777 = _1867;
            if (!_1857)
            {
                _1783 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1869 = _1783;
            bool _1871 = !_1857;
            _1785 = _1869;
            if (!_1871)
            {
                bool _1873 = _1286 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1875 = isnan(_1286);
                bool _1877 = _1873 || _1875;
                bool _1879 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1881 = _1877 || _1879;
                if (!_1881)
                {
                    float _1883 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1885 = _1286 + _1883;
                    float _1887 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1889 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1887;
                    float _1891 = 1.0 / _1889;
                    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1895 = _1893 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1897 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1899 = _1897 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1901 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1913 = _1885 * _1891;
                    float _1915 = precise::clamp(_1913, 0.0, 1.0);
                    float _1917 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1919 = _1917 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1921 = fma(_1915, _1895, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1923 = fma(_1915, _1919, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1925 = fma(_1915, _1899, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1927 = fma(_1915, _1903, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1929 = fma(_1915, _1907, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1931 = fma(_1915, _1911, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1731 = _1923;
                    _1777 = _1929;
                    _1725 = _1921;
                    _1715 = _1927;
                    _1701 = _1925;
                    _1785 = _1931;
                    _1847 = true;
                }
                else
                {
                    _1731 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1777 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1725 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1715 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1701 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1785 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1847 = false;
    float _1933 = _1731;
    float _1935 = _1777;
    float _1937 = _1725;
    float _1939 = _1715;
    float _1941 = _1701;
    float _1943 = _1785;
    float _1945 = fma(_558, -0.5, 0.5);
    float _1947 = precise::clamp(_1945, 0.0, 1.0);
    float _1949 = -_1933;
    float _1951 = _1949 + _1935;
    float _1953 = -_1937;
    float _1955 = _1953 + _1939;
    float _1957 = fma(_1947, _1951, _1933);
    out.m_87.x = 0.0;
    float _1959 = fma(_1947, _1955, _1937);
    float _1961 = -_1941;
    float _1963 = _1961 + _1943;
    float _1965 = _1957 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    bool _1967 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1969 = fma(_1947, _1963, _1941);
    float _1971 = fma(_1959, 0.298911988735198974609375, _1965);
    float _1973 = _1733 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _1975 = _1428 > 0.0;
    bool _1977 = isnan(_1428);
    bool _1979 = _1975 || _1977;
    bool _1981 = isnan(0.0);
    bool _1983 = _1979 || _1981;
    float _1985 = fma(_1969, 0.114477999508380889892578125, _1971);
    out.m_89.x = 0.0;
    float _1987 = -_1985;
    float _1989 = _1959 + _1987;
    out.m_83.w = _1973;
    float _1991 = -_1985;
    float _1993 = _1957 + _1991;
    float _1995 = fma(_1993, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1985);
    float _1997 = -_1985;
    float _1999 = _1969 + _1997;
    float _2001 = fma(_1989, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1985);
    float _2003 = fma(_1999, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1985);
    bool _2005 = !_1967;
    if (!_2005)
    {
        float _2007 = -_1034;
        float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2011 = -_1040;
        float _2013 = _2011 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2015 = -_1048;
        float _2017 = _2015 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2019 = _2009 * _2009;
        float _2021 = fma(_2013, _2013, _2019);
        float _2023 = fma(_2017, _2017, _2021);
        float _2025 = rsqrt(_2023);
        float _2027 = _2009 * _2025;
        float _2029 = _2013 * _2025;
        float _2031 = _2017 * _2025;
        float _2033 = -_1074;
        float _2035 = _2033 + _2027;
        float _2037 = -_1070;
        float _2039 = _2037 + _2029;
        float _2041 = -_1072;
        float _2043 = _2041 + _2031;
        float _2045 = sqrt(_2023);
        float _2047 = _2035 * _2035;
        float _2049 = fma(_2039, _2039, _2047);
        float _2051 = fma(_2043, _2043, _2049);
        float _2053 = rsqrt(_2051);
        float _2055 = -_2045;
        float _2057 = _2055 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2059 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2061 = precise::clamp(_2059, 0.0, 1.0);
        float _2063 = abs(_2061);
        float _2065 = log2(_2063);
        float _2067 = _2035 * _2053;
        float _2069 = _2039 * _2053;
        float _2071 = _2043 * _2053;
        float _2073 = _558 * _2067;
        float _2075 = _558 * _2027;
        float _2077 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2079 = precise::clamp(_2077, 0.0, 1.0);
        float _2081 = fma(_554, _2069, _2073);
        float _2083 = fma(_554, _2029, _2075);
        float _2085 = _2079 * _2079;
        float _2087 = _2065 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2089 = fma(_614, _2071, _2081);
        float _2091 = precise::clamp(_2089, 0.0, 1.0);
        float _2093 = fma(_614, _2031, _2083);
        float _2095 = precise::clamp(_2093, 0.0, 1.0);
        float _2097 = _2085 + (-1.0);
        float _2099 = _2091 * _2091;
        float _2101 = _2029 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2103 = exp2(_2087);
        float _2105 = fma(_2099, _2097, 1.0);
        float _2107 = -_2027;
        float _2109 = -_2101;
        float _2111 = fma(_2107, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2109);
        float _2113 = _2105 * _2105;
        float _2115 = -_2031;
        float _2117 = fma(_2115, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2111);
        float _2119 = 1.0 / _2113;
        float _2121 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2123 = _2117 + _2121;
        float _2125 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2127 = precise::clamp(_2125, 0.0, 1.0);
        float _2129 = _2103 * _2127;
        float _2131 = _2095 * _2129;
        float _2133 = _2085 * _2119;
        float _2135 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2137 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2139 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2141 = _2131 * _2133;
        float _2143 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2145 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2147 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2135;
        out.m_87.y = _2137;
        out.m_87.z = _2139;
        out.m_89.x = _2143;
        out.m_89.y = _2145;
        out.m_89.z = _2147;
    }
    out.m_91.x = _2001;
    out.m_91.y = _1995;
    out.m_91.z = _2003;
    if (_1983)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2149 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2149;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

