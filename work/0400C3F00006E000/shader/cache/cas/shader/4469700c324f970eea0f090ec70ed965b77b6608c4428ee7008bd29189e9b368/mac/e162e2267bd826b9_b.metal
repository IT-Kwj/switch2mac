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
    float4 m_69 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_79 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_75 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_83 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_59 [[attribute(9)]];
    float4 m_67 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2011 = false;
    bool _1220 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_48.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    float _118 = as_type<float>(_110);
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _116;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2317 = as_type<float>(_126);
        out.gl_Position.z = _2317;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_53.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = _144;
    if (_140)
    {
        float _148 = float(_110);
        _118 = _148;
    }
    float _150 = _118;
    bool _152 = _144 >= _150;
    bool _154 = !_140;
    bool _156 = _152 || _154;
    float _158 = _150;
    if (_156)
    {
        _158 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _158;
    if (_156)
    {
        out.m_51.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2387 = as_type<float>(_164);
        out.gl_Position.z = _2387;
    }
    if (_156)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = in.m_55.x;
    float _168 = in.m_55.y;
    float _170 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _172 = log2(_170);
    float _174 = in.m_57.x;
    float _176 = in.m_57.y;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _180 = in.m_55.z;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _184 = in.m_57.z;
    float _186 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _188 = _168 * 2.0;
    float _190 = _166 * 2.0;
    float _192 = abs(_176);
    float _194 = abs(_174);
    float _196 = precise::max(_192, _194);
    float _198 = -_178;
    float _200 = fma(_186, 2.0, _198);
    float _202 = _174 * 0.0625;
    float _204 = floor(_188);
    bool _206 = _196 >= 16.0;
    float _208 = _176 * 0.0625;
    float _210 = _180 * 2.0;
    float _212 = _180 + _166;
    float _214 = _206 ? _202 : _174;
    float _216 = _168 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _218 = _206 ? _208 : _176;
    float _220 = _168 + _180;
    float _222 = abs(_214);
    bool _224 = _222 != 0.0;
    bool _226 = isnan(_222);
    bool _228 = _224 || _226;
    bool _230 = isnan(0.0);
    bool _232 = _228 || _230;
    float _234 = floor(_210);
    float _236 = abs(_218);
    bool _238 = _236 == 0.0;
    float _240 = _220 + (-1.0);
    float _242 = abs(_218);
    bool _244 = _242 == 0.0;
    bool _246 = !_232;
    bool _248 = _244 && _246;
    float _250 = _212 + (-1.0);
    float _252 = fma(_216, -2.0, _182);
    float _254 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _256 = _168 + _166;
    float _258 = floor(_190);
    float _260 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _262 = _256 + (-1.0);
    bool _264 = false;
    int _266 = as_type<int>(_216);
    float _268 = _256;
    if (_248)
    {
        bool _270 = as_type<int>(_218) >= 0;
        _264 = _270;
    }
    bool _272 = _264;
    float _274 = _172 * _144;
    bool _276 = _234 > 0.0;
    bool _278 = _234 >= 0.0;
    bool _280 = isnan(_234);
    bool _282 = _278 || _280;
    bool _284 = isnan(0.0);
    bool _286 = _282 || _284;
    int _288 = _272 ? (-1) : 0;
    if (_248)
    {
        int _290 = _272 ? 0 : 1078530011;
        _266 = _290;
    }
    int _292 = _266;
    float _294 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0333333350718021392822265625;
    int _296 = _292;
    if (_248)
    {
        int _298 = int(0x80000000) & as_type<int>(_214);
        int _300 = _292 | _298;
        _268 = as_type<float>(_300);
    }
    float _302 = _268;
    bool _304 = !_232;
    bool _306 = _304 && _238;
    float _308 = _302;
    float _310 = _302;
    if (!_306)
    {
        float _312 = abs(_214);
        bool _314 = _312 != as_type<float>(0x7f800000u /* inf */);
        bool _316 = isnan(_312);
        bool _318 = _314 || _316;
        bool _320 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _322 = _318 || _320;
        float _324 = abs(_218);
        bool _326 = _324 == as_type<float>(0x7f800000u /* inf */);
        float _328 = abs(_218);
        bool _330 = _328 == as_type<float>(0x7f800000u /* inf */);
        bool _332 = !_322;
        bool _334 = _330 && _332;
        if (_334)
        {
            bool _336 = as_type<int>(_218) >= 0;
            _288 = _336 ? (-1) : 0;
        }
        int _338 = _288;
        if (_334)
        {
            _296 = 1075235812;
        }
        int _340 = _296;
        int _342 = _340;
        if (_334)
        {
            int _344 = ~_338;
            int _346 = (_344 != 0) ? _340 : 1061752795;
            _342 = _346;
        }
        int _348 = _342;
        if (_334)
        {
            int _350 = int(0x80000000) & as_type<int>(_214);
            int _352 = _348 | _350;
            _308 = as_type<float>(_352);
        }
        float _354 = _308;
        bool _356 = !_322;
        bool _358 = _356 && _326;
        _310 = _354;
        if (!_358)
        {
            float _360 = abs(_214);
            float _362 = abs(_218);
            float _364 = precise::max(_360, _362);
            float _366 = abs(_214);
            float _368 = abs(_218);
            float _370 = precise::min(_366, _368);
            float _372 = 1.0 / _364;
            float _374 = abs(_214);
            float _376 = abs(_218);
            bool _378 = _374 > _376;
            bool _380 = as_type<int>(_218) >= 0;
            float _382 = _370 * _372;
            float _384 = abs(_214);
            float _386 = abs(_218);
            float _388 = _384 + _386;
            int _390 = as_type<int>(_214) & int(0x80000000);
            float _392 = _382 * _382;
            bool _394 = _388 > as_type<float>(0x7f800000u /* inf */);
            bool _396 = isnan(_388);
            bool _398 = _394 || _396;
            bool _400 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _402 = _398 || _400;
            float _404 = _392 + 11.33538818359375;
            float _406 = fma(_392, _404, 28.84246826171875);
            float _408 = fma(_392, _406, 19.6966705322265625);
            float _410 = fma(_392, -0.82336294651031494140625, -5.674867153167724609375);
            float _412 = fma(_392, _410, -6.565555095672607421875);
            float _414 = 1.0 / _408;
            float _416 = _392 * _412;
            float _418 = _382 * _416;
            float _420 = fma(_418, _414, _382);
            float _422 = _420;
            _310 = _388;
            if (_378)
            {
                float _424 = -_420;
                float _426 = _424 + 1.57079637050628662109375;
                _422 = _426;
            }
            float _428 = _422;
            int _430 = as_type<int>(_428);
            if (!_380)
            {
                float _432 = -_428;
                float _434 = _432 + 3.1415927410125732421875;
                _430 = as_type<int>(_434);
            }
            int _436 = _430;
            if (!_402)
            {
                int _438 = _390 | _436;
                _310 = as_type<float>(_438);
            }
        }
    }
    float _440 = _310;
    float _442 = exp2(_274);
    float _444 = fma(_440, 5.0, _294);
    float _446 = fma(_440, 3.0, _294);
    bool _448 = _258 > 0.0;
    float _450 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _452 = _444 * 0.15915493667125701904296875;
    float _454 = _446 * 0.15915493667125701904296875;
    float _456 = precise::max(_184, -0.5);
    float _458 = -_144;
    float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[76].x, _200);
    bool _462 = _258 >= 0.0;
    bool _464 = isnan(_258);
    bool _466 = _462 || _464;
    bool _468 = isnan(0.0);
    bool _470 = _466 || _468;
    float _472 = _454 * 6.283185482025146484375;
    float _474 = sin(_472);
    float _476 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _252);
    float _478 = precise::min(_456, 0.5);
    float _480 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.16666667163372039794921875;
    int _482 = _470 ? 0 : 1;
    float _484 = -_442;
    float _486 = _484 + 1.0;
    bool _488 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _490 = isnan(0.0);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _496 = _492 || _494;
    float _498 = _452 * 6.283185482025146484375;
    float _500 = sin(_498);
    float _502 = fma(_478, -0.949999988079071044921875, 0.52499997615814208984375);
    float _504 = _180 + (-0.5);
    bool _506 = _204 > 0.0;
    float _508 = in.m_59.y;
    bool _510 = _204 >= 0.0;
    bool _512 = isnan(_204);
    bool _514 = _510 || _512;
    bool _516 = isnan(0.0);
    bool _518 = _514 || _516;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _522 = in.m_59.x;
    int _524 = ~_482;
    int _526 = _524 + 1;
    int _528 = _526 + 1;
    float _530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _532 = _528;
    float _534 = _508;
    float _536 = _522;
    if (!_448)
    {
        int _538 = ~_482;
        int _540 = _538 + 1;
        _532 = _540;
    }
    int _542 = _532;
    float _544 = _496 ? _486 : 0.0;
    float _546 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _520);
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _554 = _552 != 0;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _558 = _556 != 0;
    float _560 = _500 + _474;
    float _562 = in.m_61.x;
    float _564 = in.m_61.y;
    float _566 = in.m_61.z;
    int _568 = _286 ? 0 : 1;
    float _570 = _560 * 0.100000001490116119384765625;
    bool _572 = !_554;
    int _574 = _572 ? 0 : 1;
    float _576 = in.m_63.x;
    float _578 = in.m_63.y;
    float _580 = in.m_63.z;
    bool _582 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _584 = isnan(1.0);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _590 = _586 || _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _594 = 1.0 + _592;
    int _596 = abs(_574);
    float _598 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _546);
    float _600 = 1.0 / _594;
    float _602 = _166 + (-0.5);
    float _604 = float(_542);
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _608 = float(_596);
    int _610 = _518 ? 0 : 1;
    float _612 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[78].w, _606);
    int _614 = ~_568;
    int _616 = _614 + 1;
    int _618 = _616 + 1;
    float _620 = _608 * _604;
    int _622 = _618;
    if (!_276)
    {
        int _624 = ~_568;
        int _626 = _624 + 1;
        _622 = _626;
    }
    int _628 = _622;
    float _630 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _612);
    int _632 = ~_610;
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    float _638 = _620 * (-2.0);
    int _640 = _636;
    if (!_506)
    {
        int _642 = ~_610;
        int _644 = _642 + 1;
        _640 = _644;
    }
    int _646 = _640;
    float _648 = _570 * _502;
    if (_590)
    {
        float _650 = _544 * _600;
        _146 = _650;
    }
    float _652 = _146;
    float _654 = fma(_638, _564, _564);
    float _656 = fma(_254, _638, _254);
    float _658 = _168 + (-0.5);
    bool _660 = !_550;
    int _662 = _660 ? 0 : 1;
    float _664 = _578 * _578;
    bool _666 = !_558;
    int _668 = _666 ? 0 : 1;
    float _670 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[196].y, _654);
    int _672 = abs(_662);
    float _674 = -_576;
    float _676 = -_664;
    float _678 = fma(_576, _674, _676);
    float _680 = _648 * 0.85000002384185791015625;
    int _682 = abs(_668);
    float _684 = fma(_656, _652, _670);
    float _686 = float(_628);
    float _688 = fma(_680, _678, _184);
    float _690 = float(_672);
    float _692 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _694 = float(_646);
    float _696 = fma(_688, 5.0, _480);
    float _698 = float(_682);
    float _700 = _690 * _686;
    float _702 = _696 * 0.15915493667125701904296875;
    bool _704 = _168 > 0.5;
    float _706 = _698 * _694;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _710 = _708 != 0;
    float _712 = _700 * (-2.0);
    float _714 = in.m_65.x;
    float _716 = in.m_65.y;
    float _718 = in.m_65.z;
    float _720 = _706 * (-2.0);
    float _722 = _702 * 6.283185482025146484375;
    float _724 = sin(_722);
    float _726 = fma(_712, _562, _562);
    float _728 = fma(_450, _712, _450);
    float _730 = fma(_720, _566, _566);
    float _732 = fma(_260, _720, _260);
    float _734 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[196].x, _726);
    float _736 = _684 * 0.15915493667125701904296875;
    float _738 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[196].z, _730);
    float _740 = _684;
    float _742 = _578;
    float _744 = _576;
    float _746 = _580;
    if (_710)
    {
        float _748 = in.m_55.x;
        _740 = _748;
    }
    float _750 = _740;
    float _752 = fma(_728, _652, _734);
    float _754 = fma(_732, _652, _738);
    float _756 = _680 * _580;
    float _758 = _736 * 6.283185482025146484375;
    float _760 = sin(_758);
    float _762 = _752 * 0.15915493667125701904296875;
    float _764 = _754 * 0.15915493667125701904296875;
    float _766 = fma(_724, 0.074999988079071044921875, 0.974999964237213134765625);
    float _768 = fma(_576, _756, _174);
    float _770 = fma(_578, _756, _176);
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _774 = _772 != 0;
    float _776 = _736 * 6.283185482025146484375;
    float _778 = cos(_776);
    float _780 = _714 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _782 = _718 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _784 = _768 * _766;
    float _786 = _770 * _766;
    float _788 = _716 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _790 = _782 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _792 = _762 * 6.283185482025146484375;
    float _794 = cos(_792);
    float _796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _688);
    float _798 = _788 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _800 = _786 != 0.0;
    bool _802 = isnan(_786);
    bool _804 = _800 || _802;
    bool _806 = isnan(0.0);
    bool _808 = _804 || _806;
    bool _810 = _750 > 0.5;
    bool _812 = _810 && _710;
    float _814 = _796 * _790;
    bool _816 = _784 == 0.0;
    bool _818 = !_808;
    bool _820 = _816 && _818;
    float _822 = _764 * 6.283185482025146484375;
    float _824 = cos(_822);
    float _826 = 0.0;
    if (_710)
    {
        _826 = _522;
    }
    float _828 = _826;
    bool _830 = _688 == 0.0;
    bool _832 = _830 && _820;
    float _834 = _762 * 6.283185482025146484375;
    float _836 = sin(_834);
    float _838 = _794 * _778;
    float _840 = _794 * _760;
    float _842 = _828;
    if (_812)
    {
        float _844 = -_828;
        float _846 = _844 + 1.0;
        _842 = _846;
    }
    float _848 = _842;
    float _850 = _764 * 6.283185482025146484375;
    float _852 = sin(_850);
    float _854 = in.m_48.x;
    float _856 = in.m_48.y;
    float _858 = in.m_48.z;
    float _860 = _794 * _824;
    float _862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _786);
    float _864 = _778 * _824;
    if (!_832)
    {
        float _866 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[17].y, _578);
        _742 = _866;
    }
    float _868 = _742;
    if (!_832)
    {
        float _870 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[17].y, _576);
        _744 = _870;
    }
    float _872 = _744;
    float _874 = _862 * _798;
    float _876 = _836 * _778;
    float _878 = _836 * _824;
    float _880 = _836 * _760;
    float _882 = _760 * _824;
    float _884 = _780 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _886 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _784);
    float _888 = _860 * _874;
    float _890 = _878 * _874;
    float _892 = fma(_852, _838, _880);
    float _894 = _886 * _884;
    float _896 = fma(_852, _880, _838);
    float _898 = -_874;
    float _900 = _852 * _898;
    float _902 = -_840;
    float _904 = fma(_852, _876, _902);
    float _906 = -_876;
    float _908 = fma(_852, _840, _906);
    float _910 = fma(_892, _894, _888);
    float _912 = fma(_864, _894, _900);
    float _914 = fma(_904, _894, _890);
    float _916 = _856 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _918 = _856 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _920 = fma(_908, _814, _910);
    float _922 = fma(_882, _814, _912);
    float _924 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[4].x, _916);
    float _926 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[6].x, _918);
    float _928 = _920 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _930 = _920 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _932 = fma(_858, (*spvDescriptorSet0.vp_c10)._m0[4].z, _924);
    float _934 = fma(_896, _814, _914);
    float _936 = fma(_858, (*spvDescriptorSet0.vp_c10)._m0[6].z, _926);
    float _938 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[8].x, _928);
    float _940 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[10].x, _930);
    float _942 = _932 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _944 = _936 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _946 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[8].z, _938);
    float _948 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[10].z, _940);
    float _950 = _856 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _952 = _920 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _954 = _942 + _946;
    float _956 = _944 + _948;
    float _958 = -_508;
    float _960 = _958 + 1.0;
    float _962 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[5].x, _950);
    float _964 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _966 = _954 + _964;
    float _968 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _970 = _956 + _968;
    float _972 = _858;
    float _974 = _954;
    float _976 = _956;
    if (!_832)
    {
        float _978 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[17].y, _580);
        _746 = _978;
    }
    float _980 = _746;
    if (_774)
    {
        float _982 = _704 ? _960 : _508;
        _534 = _982;
    }
    float _984 = _534;
    float _986 = _966 * _966;
    float _988 = _970 * _970;
    float _990 = -_868;
    float _992 = _852 * _990;
    float _994 = fma(_858, (*spvDescriptorSet0.vp_c10)._m0[5].z, _962);
    float _996 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[9].x, _952);
    float _998 = _986 + _988;
    float _1000 = _860 * _868;
    float _1002 = _878 * _868;
    float _1004 = fma(_864, _872, _992);
    float _1006 = sqrt(_998);
    float _1008 = _986;
    float _1010 = _988;
    if (_710)
    {
        _536 = _848;
    }
    float _1012 = _536;
    float _1014 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[9].z, _996);
    float _1016 = _994 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1018 = _692 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1020 = _530 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1022 = fma(_892, _872, _1000);
    float _1024 = _1016 + _1014;
    float _1026 = fma(_1018, _984, -0.5);
    float _1028 = fma(_1020, _1012, -0.5);
    float _1030 = fma(_904, _872, _1002);
    float _1032 = fma(_882, _980, _1004);
    float _1034 = fma(_908, _980, _1022);
    float _1036 = -_476;
    float _1038 = fma(_630, _1026, _1036);
    float _1040 = fma(_598, _1028, _460);
    float _1042 = fma(_896, _980, _1030);
    bool _1044 = _1006 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1046 = _1024;
    if (!_1044)
    {
        _972 = _1024;
    }
    float _1048 = _972;
    bool _1050 = !_1044;
    float _1052 = _1048;
    if (!_1050)
    {
        float _1054 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1056 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1058 = _1006 + _1056;
        float _1060 = rsqrt(_998);
        float _1062 = _1058 * _1054;
        float _1064 = _1024 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1066 = _1062 * 0.15915493667125701904296875;
        float _1068 = _1066 * 6.283185482025146484375;
        float _1070 = sin(_1068);
        float _1072 = _1066 * 6.283185482025146484375;
        float _1074 = cos(_1072);
        float _1076 = fma(_1070, _1064, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1078 = _1060 * _1076;
        float _1080 = fma(_966, _1078, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1082 = _1074 + (-1.0);
        float _1084 = fma(_970, _1078, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1086 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1088 = _1080 + _1086;
        float _1090 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1094 = _1084 + _1092;
        float _1096 = _1088 * _1088;
        float _1098 = fma(_1024, _1074, _1090);
        float _1100 = _1094 * _1094;
        _1052 = _1098;
        _1008 = _1096;
        _1010 = _1100;
        _974 = _1080;
        _976 = _1084;
    }
    float _1102 = _1052;
    float _1104 = _1008;
    float _1106 = _1010;
    float _1108 = _974;
    float _1110 = _976;
    float _1112 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1114 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1116 = _1102 + _1114;
    float _1118 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1120 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1122 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1112);
    float _1124 = fma(_1116, _1116, _1104);
    float _1126 = in.m_67.w;
    float _1128 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1118);
    float _1130 = _1124 + _1106;
    float _1132 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1120);
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1136 = sqrt(_1130);
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1148 = fma(_1042, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1132);
    float _1150 = fma(_1042, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1122);
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1154 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1156 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1158 = _1140 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1160 = _1142 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1162 = _1144 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1164 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1166 = _1038 + 0.5;
    float _1168 = _1040 + 0.5;
    float _1170 = fma(_1042, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1128);
    out.m_69.x = _1154;
    out.m_69.y = _1156;
    out.m_69.z = _1158;
    out.m_69.w = _1152;
    bool _1172 = _1136 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1174 = isnan(_1136);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1180 = _1176 || _1178;
    out.m_71.x = _1160;
    out.m_71.y = _1162;
    out.m_71.z = _1164;
    out.m_73.x = _1168;
    out.m_73.y = _1166;
    out.m_75.w = _1126;
    float _1182 = _1152;
    float _1184 = _1156;
    if (!_1180)
    {
        _1046 = 1.0;
    }
    float _1186 = _1046;
    out.m_77.x = _1148;
    out.m_77.y = _1150;
    out.m_77.z = _1170;
    bool _1188 = !_1180;
    float _1190 = _1186;
    if (!_1188)
    {
        bool _1192 = _1136 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1194 = isnan(_1136);
        bool _1196 = _1192 || _1194;
        bool _1198 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1200 = _1196 || _1198;
        if (!_1200)
        {
            float _1202 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1204 = _1136 + _1202;
            float _1206 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1208 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1206;
            float _1210 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1212 = _1210 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1214 = 1.0 / _1208;
            float _1216 = _1204 * _1214;
            float _1218 = fma(_1216, _1212, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1190 = _1218;
            _1220 = true;
        }
        else
        {
            bool _1222 = _1136 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1224 = isnan(_1136);
            bool _1226 = _1222 || _1224;
            bool _1228 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1230 = _1226 || _1228;
            if (!_1230)
            {
                float _1232 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1234 = _1136 + _1232;
                float _1236 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1238 = _1236 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1240 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1242 = _1240 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1244 = 1.0 / _1238;
                float _1246 = _1234 * _1244;
                float _1248 = fma(_1246, _1242, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1190 = _1248;
                _1220 = true;
            }
            else
            {
                _1190 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1220 = false;
    float _1250 = _1190;
    float _1252 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1254 = _1102 + _1252;
    float _1256 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1258 = _1108 + _1256;
    float _1260 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1262 = _1110 + _1260;
    float _1264 = fma(_1254, _1250, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1266 = fma(_1258, _1250, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1268 = fma(_1262, _1250, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1270 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1272 = _1264 + _1270;
    float _1274 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1276 = _1266 + _1274;
    float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1280 = _1268 + _1278;
    float _1282 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1284 = _1272 * _1272;
    float _1286 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1288 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1282);
    float _1290 = fma(_1276, _1276, _1284);
    float _1292 = fma(_1280, _1280, _1290);
    float _1294 = rsqrt(_1292);
    float _1296 = sqrt(_1292);
    float _1298 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1300 = _1276 * _1298;
    float _1302 = _1280 * _1298;
    float _1304 = _1300 * _1300;
    float _1306 = _1302 * _1302;
    float _1308 = _1304 + _1306;
    float _1310 = sqrt(_1308);
    bool _1312 = _1310 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1314 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1316 = _1310 + _1314;
    float _1318 = _1290;
    float _1320 = _1308;
    float _1322 = _1316;
    float _1324 = _1276;
    if (_1312)
    {
        float _1326 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1318 = _1326;
    }
    float _1328 = _1318;
    if (_1312)
    {
        float _1330 = rsqrt(_1308);
        _1320 = _1330;
    }
    float _1332 = _1320;
    if (_1312)
    {
        float _1334 = _1316 * _1328;
        _1322 = _1334;
    }
    float _1336 = _1322;
    if (_1312)
    {
        float _1338 = _1336 * 0.15915493667125701904296875;
        _1182 = _1338;
    }
    float _1340 = _1182;
    float _1342 = _1154;
    float _1344 = _1340;
    if (_1312)
    {
        float _1346 = _1340 * 6.283185482025146484375;
        float _1348 = sin(_1346);
        _1342 = _1348;
    }
    float _1350 = _1342;
    float _1352 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1354 = precise::max(0.0, _1352);
    float _1356 = _1328;
    float _1358 = _1354;
    if (_1312)
    {
        float _1360 = _1340 * 6.283185482025146484375;
        float _1362 = cos(_1360);
        _1356 = _1362;
    }
    float _1364 = _1356;
    float _1366 = -_1298;
    float _1368 = -_1354;
    float _1370 = fma(_1272, _1366, _1368);
    float _1372 = _1370;
    if (_1312)
    {
        float _1374 = _1370 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1184 = _1374;
    }
    float _1376 = _1184;
    float _1378 = _1376;
    if (!_1312)
    {
        _1344 = _1300;
    }
    float _1380 = _1344;
    float _1382 = _1350;
    float _1384 = _1380;
    if (_1312)
    {
        float _1386 = fma(_1350, _1376, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1378 = _1386;
    }
    float _1388 = _1378;
    float _1390 = _1388;
    if (!_1312)
    {
        _1382 = _1302;
    }
    float _1392 = _1382;
    float _1394 = _1392;
    float _1396 = _1364;
    if (_1312)
    {
        float _1398 = _1364 + (-1.0);
        _1358 = _1398;
    }
    float _1400 = _1358;
    float _1402 = _1400;
    if (_1312)
    {
        float _1404 = _1332 * _1388;
        _1390 = _1404;
    }
    float _1406 = _1390;
    if (_1312)
    {
        float _1408 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1402 = _1408;
    }
    float _1410 = _1402;
    float _1412 = _1410;
    if (_1312)
    {
        float _1414 = _1300 * _1406;
        _1384 = _1414;
    }
    float _1416 = _1384;
    if (_1312)
    {
        float _1418 = _1302 * _1406;
        _1394 = _1418;
    }
    float _1420 = _1394;
    float _1422 = fma(_942, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1312)
    {
        float _1424 = fma(_1370, _1364, _1410);
        _1372 = _1424;
    }
    float _1426 = _1372;
    if (!_1312)
    {
        _1412 = _1304;
    }
    float _1428 = _1412;
    float _1430 = _1428;
    if (_1312)
    {
        float _1432 = _1416 * _1416;
        _1430 = _1432;
    }
    float _1434 = _1430;
    if (!_1312)
    {
        _1396 = _1306;
    }
    float _1436 = _1396;
    float _1438 = _1436;
    if (_1312)
    {
        float _1440 = _1420 * _1420;
        _1438 = _1440;
    }
    float _1442 = _1438;
    float _1444 = fma(_1426, _1426, _1434);
    float _1446 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1448 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1450 = floor(_1422);
    float _1452 = _1444 + _1442;
    float _1454 = fma(_944, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1456 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1458 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1446);
    float _1460 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1448);
    float _1462 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1464 = fma(_1296, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1462);
    float _1466 = precise::clamp(_1464, 0.0, 1.0);
    float _1468 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1456);
    float _1470 = rsqrt(_1452);
    float _1472 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1458);
    float _1474 = -_1466;
    float _1476 = _1474 + 1.0;
    float _1478 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1468);
    float _1480 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1460);
    float _1482 = _1472 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1484 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1288);
    float _1486 = _1478 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1488 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1490 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1492 = abs(_1476);
    float _1494 = log2(_1492);
    float _1496 = _1484 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1498 = _1488 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1500 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1490);
    float _1502 = -_1450;
    float _1504 = _1422 + _1502;
    float _1506 = _1470 * _1416;
    float _1508 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1500);
    float _1510 = _1470 * _1426;
    float _1512 = _1470 * _1420;
    float _1514 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1516 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1508);
    float _1518 = floor(_1454);
    float _1520 = -_1498;
    float _1522 = fma(_1520, _1286, 1.0);
    float _1524 = -_1514;
    float _1526 = fma(_1510, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1524);
    float _1528 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1530 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1532 = -_1512;
    float _1534 = fma(_1532, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1526);
    float _1536 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1538 = log2(_1522);
    float _1540 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1528);
    float _1542 = fma(_1534, -0.5, 0.5);
    float _1544 = fma(_1534, 0.5, 0.5);
    float _1546 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1540);
    float _1548 = fma(_1544, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1550 = exp2(_1530);
    float _1552 = -_1518;
    float _1554 = _1454 + _1552;
    float _1556 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1536);
    float _1558 = _1510 + 1.0;
    float _1560 = fma(_1544, _1548, -0.212114393711090087890625);
    float _1562 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1546);
    float _1564 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1556);
    float _1566 = 1.0 / _1516;
    float _1568 = fma(_1544, _1560, 1.570728778839111328125);
    float _1570 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1564);
    float _1572 = _1538 * 0.693147182464599609375;
    float _1574 = sqrt(_1542);
    float _1576 = -_1510;
    float _1578 = fma(_1550, _1558, _1576);
    float _1580 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1582 = fma(_1578, 0.5, 0.5);
    float _1584 = _1570 * _1566;
    float _1586 = _1562 * _1566;
    float _1588 = fma(_1584, 0.5, 0.5);
    float _1590 = fma(_1586, -0.5, 0.5);
    float _1592 = _1574 * 0.636619746685028076171875;
    float2 _4668 = float2(_1504, _1554);
    float _1594 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4668, float2(0.0), isnan(_4668)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4668, float2(0.0), isnan(_4668)), level(0.0)).x;
    float3 _4679 = float3(_1588, _1590, _1580);
    float _1596 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4679, float3(0.0), isnan(_4679)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4679, float3(0.0), isnan(_4679)), level(0.0)).x;
    float _1598 = -_1568;
    float _1600 = fma(_1592, _1598, 1.0);
    float3 _4695 = float3(_1588, _1590, _1580);
    float4 _1603 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4695, float3(0.0), isnan(_4695)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4695, float3(0.0), isnan(_4695)), level(0.0)).xyzw;
    float _1605 = _1603.x;
    float _1607 = _1603.y;
    float _1609 = _1603.z;
    float _1611 = _1603.w;
    float2 _4711 = float2(_1600, _1582);
    float3 _1615 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4711, float2(0.0), isnan(_4711)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4711, float2(0.0), isnan(_4711)), level(0.0)).xyz;
    float _1617 = _1615.x;
    float _1619 = _1615.y;
    float _1621 = _1615.z;
    float _1623 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1625 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1627 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_79.x = _1276;
    out.m_79.y = _1272;
    out.m_79.z = _1280;
    float _1629 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1623);
    float _1631 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1625);
    float _1633 = _1570 + _1516;
    float _1635 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1629);
    float _1637 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1639 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1631);
    float _1641 = _1635 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1643 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1637);
    float _1645 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1639);
    float _1647 = _1633 * 0.5;
    float _1649 = 1.0 / _1641;
    float _1651 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1643);
    float _1653 = _1645 + _1516;
    out.gl_Position.x = _1570;
    out.gl_Position.y = _1562;
    out.gl_Position.z = _1645;
    out.gl_Position.w = _1516;
    float _1655 = _1651 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1657 = _1653 * 0.5;
    float _1659 = _1655 + _1641;
    float _1661 = exp2(_1627);
    bool _1663 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1665 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1667 = _1663 || _1665;
    bool _1669 = isnan(0.5);
    bool _1671 = _1667 || _1669;
    float _1673 = _1659 * _1649;
    float _1675 = _1673 * 0.5;
    float _1677 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1679 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1677);
    float _1681 = 1.0 / _1679;
    if (_1671)
    {
        _1324 = 1.0;
    }
    float _1683 = _1324;
    float _1685 = _1516 * 0.5;
    float _1687 = fma(_1562, -0.5, _1685);
    float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1691 = _1681 * _1689;
    out.m_81.x = _1647;
    out.m_81.y = _1687;
    out.m_81.z = _1657;
    out.m_81.w = _1516;
    float _1693 = abs(_1691);
    float _1695 = log2(_1693);
    float _1697 = _1695 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1699 = exp2(_1697);
    float _1701 = fma(_1699, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1703 = precise::clamp(_1701, 0.0, 1.0);
    float _1705 = in.m_83.x;
    float _1707 = fma(_1703, -2.0, 3.0);
    float _1709 = _1703 * _1703;
    float _1711 = _1709 * _1707;
    bool _1713 = _1691 <= 8000.0;
    bool _1715 = isnan(_1691);
    bool _1717 = _1713 || _1715;
    bool _1719 = isnan(8000.0);
    bool _1721 = _1717 || _1719;
    float _1723 = float(_1721);
    float _1725 = -_1711;
    float _1727 = _1725 + 1.0;
    float _1729 = fma(_1727, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1711);
    float _1731 = _1727;
    float _1733 = _1683;
    if (_1671)
    {
        _1731 = 1.0;
    }
    float _1735 = _1731;
    float _1737 = _1723 * _1729;
    float _1739 = _1735;
    float _1741 = _1617;
    float _1743 = _1705;
    if (!_1671)
    {
        float _1745 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1747 = _1745 * 0.15915493667125701904296875;
        float _1749 = _1747 * 6.283185482025146484375;
        float _1751 = cos(_1749);
        float _1753 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1755 = _1753 * 0.15915493667125701904296875;
        float _1757 = _1747 * 6.283185482025146484375;
        float _1759 = sin(_1757);
        float _1761 = 1.0 / _1751;
        float _1763 = _1755 * 6.283185482025146484375;
        float _1765 = cos(_1763);
        float _1767 = _1759 * _1761;
        float _1769 = _1755 * 6.283185482025146484375;
        float _1771 = sin(_1769);
        float _1773 = _1765 * _1767;
        float _1775 = 1.0 / _1773;
        float _1777 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1779 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1777;
        float _1781 = 1.0 / _1779;
        float _1783 = _1771 * _1775;
        float _1785 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1787 = fma(_1691, _1783, _1785);
        float _1789 = _1787 * _1781;
        float _1791 = precise::clamp(_1789, 0.0, 1.0);
        _1739 = _1791;
    }
    float _1793 = _1739;
    if (!_1671)
    {
        float _1795 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1797 = _1795 * 0.15915493667125701904296875;
        float _1799 = _1797 * 6.283185482025146484375;
        float _1801 = cos(_1799);
        float _1803 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1805 = _1803 * 0.15915493667125701904296875;
        float _1807 = _1797 * 6.283185482025146484375;
        float _1809 = sin(_1807);
        float _1811 = 1.0 / _1801;
        float _1813 = _1805 * 6.283185482025146484375;
        float _1815 = cos(_1813);
        float _1817 = _1809 * _1811;
        float _1819 = _1805 * 6.283185482025146484375;
        float _1821 = sin(_1819);
        float _1823 = _1815 * _1817;
        float _1825 = 1.0 / _1823;
        float _1827 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1829 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1827;
        float _1831 = 1.0 / _1829;
        float _1833 = _1821 * _1825;
        float _1835 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1837 = fma(_1691, _1833, _1835);
        float _1839 = _1837 * _1831;
        float _1841 = precise::clamp(_1839, 0.0, 1.0);
        float _1843 = -_1841;
        float _1845 = _1843 + 1.0;
        _1733 = _1845;
    }
    float _1847 = _1733;
    float _1849 = -_1661;
    float _1851 = _1849 + 1.0;
    float _1853 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1855 = -_1594;
    float _1857 = _1855 + 1.0;
    float _1859 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1861 = _1296 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1863 = isnan(_1296);
    bool _1865 = _1861 || _1863;
    bool _1867 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1869 = _1865 || _1867;
    float _1871 = _1857 * _1853;
    float _1873 = precise::clamp(_1871, 0.0, 1.0);
    float _1875 = _1859 * _1596;
    float _1877 = -_1859;
    float _1879 = _1877 + 1.0;
    float _1881 = -_1873;
    float _1883 = fma(_1881, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1885 = _1611 * _1875;
    float _1887 = _1621 * _1875;
    float _1889 = _1883 * _1705;
    float _1891 = _1611 * _1879;
    float _1893 = fma(_1617, _1885, _1605);
    float _1895 = fma(_1619, _1885, _1607);
    float _1897 = _1889 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1899 = fma(_1611, _1887, _1609);
    float _1901 = _1793 * _1847;
    float _1903 = _1879;
    float _1905 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _1907 = _1889;
    float _1909 = _1859;
    if (!_1869)
    {
        _1903 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1911 = _1903;
    out.m_85.x = _1897;
    float _1913 = _1911;
    float _1915 = _1911;
    if (!_1869)
    {
        _1905 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1917 = _1905;
    float _1919 = _1901 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1921 = _1917;
    float _1923 = _1917;
    if (!_1869)
    {
        _1741 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1925 = _1741;
    out.m_87.x = _1893;
    out.m_87.y = _1895;
    out.m_87.z = _1899;
    out.m_87.w = _1891;
    float _1927 = _1925;
    float _1929 = _1925;
    if (!_1869)
    {
        _1743 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1931 = _1743;
    float _1933 = _1931;
    float _1935 = _1931;
    if (!_1869)
    {
        _1907 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1937 = _1907;
    float _1939 = _1937;
    float _1941 = _1937;
    if (!_1869)
    {
        _1909 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1943 = _1909;
    bool _1945 = !_1869;
    float _1947 = _1943;
    float _1949 = _1943;
    if (!_1945)
    {
        bool _1951 = _1296 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1953 = isnan(_1296);
        bool _1955 = _1951 || _1953;
        bool _1957 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1959 = _1955 || _1957;
        if (!_1959)
        {
            float _1961 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1963 = _1296 + _1961;
            float _1965 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1967 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1965;
            float _1969 = 1.0 / _1967;
            float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1973 = _1971 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1975 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1977 = _1975 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1981 = _1979 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1985 = _1983 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1989 = _1987 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1991 = _1963 * _1969;
            float _1993 = precise::clamp(_1991, 0.0, 1.0);
            float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1999 = fma(_1993, _1973, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2001 = fma(_1993, _1997, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2003 = fma(_1993, _1977, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2005 = fma(_1993, _1981, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2007 = fma(_1993, _1985, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2009 = fma(_1993, _1989, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1923 = _2001;
            _1941 = _2007;
            _1915 = _1999;
            _1935 = _2005;
            _1929 = _2003;
            _1949 = _2009;
            _2011 = true;
        }
        else
        {
            bool _2013 = _1296 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2015 = isnan(_1296);
            bool _2017 = _2013 || _2015;
            bool _2019 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2021 = _2017 || _2019;
            if (!_2021)
            {
                _1913 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2023 = _1913;
            _1915 = _2023;
            if (!_2021)
            {
                _1921 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2025 = _1921;
            _1923 = _2025;
            if (!_2021)
            {
                _1927 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2027 = _1927;
            _1929 = _2027;
            if (!_2021)
            {
                _1933 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2029 = _1933;
            _1935 = _2029;
            if (!_2021)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2031 = _1939;
            _1941 = _2031;
            if (!_2021)
            {
                _1947 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2033 = _1947;
            bool _2035 = !_2021;
            _1949 = _2033;
            if (!_2035)
            {
                bool _2037 = _1296 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2039 = isnan(_1296);
                bool _2041 = _2037 || _2039;
                bool _2043 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2045 = _2041 || _2043;
                if (!_2045)
                {
                    float _2047 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2049 = _1296 + _2047;
                    float _2051 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2053 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2051;
                    float _2055 = 1.0 / _2053;
                    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2063 = _2061 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2067 = _2065 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2071 = _2069 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2077 = _2049 * _2055;
                    float _2079 = precise::clamp(_2077, 0.0, 1.0);
                    float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2083 = _2081 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2085 = fma(_2079, _2059, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2087 = fma(_2079, _2083, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2089 = fma(_2079, _2063, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2091 = fma(_2079, _2067, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2093 = fma(_2079, _2071, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2095 = fma(_2079, _2075, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1923 = _2087;
                    _1941 = _2093;
                    _1915 = _2085;
                    _1935 = _2091;
                    _1929 = _2089;
                    _1949 = _2095;
                    _2011 = true;
                }
                else
                {
                    _1923 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1915 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1935 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1929 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1949 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2011 = false;
    float _2097 = _1923;
    float _2099 = _1941;
    float _2101 = _1915;
    float _2103 = _1935;
    float _2105 = _1929;
    float _2107 = _1949;
    float _2109 = fma(_1150, -0.5, 0.5);
    float _2111 = precise::clamp(_2109, 0.0, 1.0);
    float _2113 = -_2097;
    float _2115 = _2113 + _2099;
    float _2117 = _1919 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2119 = -_2101;
    float _2121 = _2119 + _2103;
    out.m_89.x = 0.0;
    float _2123 = fma(_2111, _2115, _2097);
    float _2125 = fma(_2111, _2121, _2101);
    out.m_51.x = _2117;
    float _2127 = -_2105;
    float _2129 = _2127 + _2107;
    float _2131 = _2123 * 0.586610972881317138671875;
    bool _2133 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2135 = fma(_2111, _2129, _2105);
    float _2137 = fma(_2125, 0.298911988735198974609375, _2131);
    bool _2139 = _1793 > 0.0;
    bool _2141 = isnan(_1793);
    bool _2143 = _2139 || _2141;
    bool _2145 = isnan(0.0);
    bool _2147 = _2143 || _2145;
    float _2149 = fma(_2135, 0.114477999508380889892578125, _2137);
    bool _2151 = _1847 <= 0.0;
    bool _2153 = !_2147;
    bool _2155 = _2151 || _2153;
    float _2157 = -_2149;
    float _2159 = _2125 + _2157;
    float _2161 = -_2149;
    float _2163 = _2123 + _2161;
    float _2165 = -_2149;
    float _2167 = _2135 + _2165;
    float _2169 = fma(_2159, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2149);
    float _2171 = fma(_2163, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2149);
    float _2173 = fma(_2167, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2149);
    bool _2175 = !_2133;
    if (!_2175)
    {
        float _2177 = -_1264;
        float _2179 = _2177 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2181 = -_1266;
        float _2183 = _2181 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2185 = -_1268;
        float _2187 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2189 = _2179 * _2179;
        float _2191 = fma(_2183, _2183, _2189);
        float _2193 = fma(_2187, _2187, _2191);
        float _2195 = sqrt(_2193);
        float _2197 = rsqrt(_2193);
        float _2199 = -_2195;
        float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2203 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2205 = precise::clamp(_2203, 0.0, 1.0);
        float _2207 = _2183 * _2197;
        float _2209 = _2179 * _2197;
        float _2211 = abs(_2205);
        float _2213 = log2(_2211);
        float _2215 = _2187 * _2197;
        float _2217 = _2207 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2219 = _1150 * _2209;
        float _2221 = -_2209;
        float _2223 = -_2217;
        float _2225 = fma(_2221, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2223);
        float _2227 = fma(_1148, _2207, _2219);
        float _2229 = -_2215;
        float _2231 = fma(_2229, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2225);
        float _2233 = fma(_1170, _2215, _2227);
        float _2235 = precise::clamp(_2233, 0.0, 1.0);
        float _2237 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2239 = _2231 + _2237;
        float _2241 = _2213 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2243 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2245 = precise::clamp(_2243, 0.0, 1.0);
        float _2247 = exp2(_2241);
        float _2249 = _2247 * _2245;
        float _2251 = _2235 * _2249;
        float _2253 = _2251 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2255 = _2251 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2257 = _2251 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2253;
        out.m_89.y = _2255;
        out.m_89.z = _2257;
    }
    out.m_91.x = _2169;
    out.m_91.y = _2171;
    out.m_91.z = _2173;
    if (!_2155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2259 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2259;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2011 = false;
    bool _1220 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_48.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    float _118 = as_type<float>(_110);
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _116;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2317 = as_type<float>(_126);
        out.gl_Position.z = _2317;
    }
    if (!_114)
    {
        return out;
    }
    float _130 = in.m_53.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = _144;
    if (_140)
    {
        float _148 = float(_110);
        _118 = _148;
    }
    float _150 = _118;
    bool _152 = _144 >= _150;
    bool _154 = !_140;
    bool _156 = _152 || _154;
    float _158 = _150;
    if (_156)
    {
        _158 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _158;
    if (_156)
    {
        out.m_51.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2387 = as_type<float>(_164);
        out.gl_Position.z = _2387;
    }
    if (_156)
    {
        return out;
    }
    float _166 = in.m_55.x;
    float _168 = in.m_55.y;
    float _170 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _172 = log2(_170);
    float _174 = in.m_57.x;
    float _176 = in.m_57.y;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _180 = in.m_55.z;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _184 = in.m_57.z;
    float _186 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _188 = _168 * 2.0;
    float _190 = _166 * 2.0;
    float _192 = abs(_176);
    float _194 = abs(_174);
    float _196 = precise::max(_192, _194);
    float _198 = -_178;
    float _200 = fma(_186, 2.0, _198);
    float _202 = _174 * 0.0625;
    float _204 = floor(_188);
    bool _206 = _196 >= 16.0;
    float _208 = _176 * 0.0625;
    float _210 = _180 * 2.0;
    float _212 = _180 + _166;
    float _214 = _206 ? _202 : _174;
    float _216 = _168 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _218 = _206 ? _208 : _176;
    float _220 = _168 + _180;
    float _222 = abs(_214);
    bool _224 = _222 != 0.0;
    bool _226 = isnan(_222);
    bool _228 = _224 || _226;
    bool _230 = isnan(0.0);
    bool _232 = _228 || _230;
    float _234 = floor(_210);
    float _236 = abs(_218);
    bool _238 = _236 == 0.0;
    float _240 = _220 + (-1.0);
    float _242 = abs(_218);
    bool _244 = _242 == 0.0;
    bool _246 = !_232;
    bool _248 = _244 && _246;
    float _250 = _212 + (-1.0);
    float _252 = fma(_216, -2.0, _182);
    float _254 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _256 = _168 + _166;
    float _258 = floor(_190);
    float _260 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _262 = _256 + (-1.0);
    bool _264 = false;
    int _266 = as_type<int>(_216);
    float _268 = _256;
    if (_248)
    {
        bool _270 = as_type<int>(_218) >= 0;
        _264 = _270;
    }
    bool _272 = _264;
    float _274 = _172 * _144;
    bool _276 = _234 > 0.0;
    bool _278 = _234 >= 0.0;
    bool _280 = isnan(_234);
    bool _282 = _278 || _280;
    bool _284 = isnan(0.0);
    bool _286 = _282 || _284;
    int _288 = _272 ? (-1) : 0;
    if (_248)
    {
        int _290 = _272 ? 0 : 1078530011;
        _266 = _290;
    }
    int _292 = _266;
    float _294 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0333333350718021392822265625;
    int _296 = _292;
    if (_248)
    {
        int _298 = int(0x80000000) & as_type<int>(_214);
        int _300 = _292 | _298;
        _268 = as_type<float>(_300);
    }
    float _302 = _268;
    bool _304 = !_232;
    bool _306 = _304 && _238;
    float _308 = _302;
    float _310 = _302;
    if (!_306)
    {
        float _312 = abs(_214);
        bool _314 = _312 != as_type<float>(0x7f800000u /* inf */);
        bool _316 = isnan(_312);
        bool _318 = _314 || _316;
        bool _320 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _322 = _318 || _320;
        float _324 = abs(_218);
        bool _326 = _324 == as_type<float>(0x7f800000u /* inf */);
        float _328 = abs(_218);
        bool _330 = _328 == as_type<float>(0x7f800000u /* inf */);
        bool _332 = !_322;
        bool _334 = _330 && _332;
        if (_334)
        {
            bool _336 = as_type<int>(_218) >= 0;
            _288 = _336 ? (-1) : 0;
        }
        int _338 = _288;
        if (_334)
        {
            _296 = 1075235812;
        }
        int _340 = _296;
        int _342 = _340;
        if (_334)
        {
            int _344 = ~_338;
            int _346 = (_344 != 0) ? _340 : 1061752795;
            _342 = _346;
        }
        int _348 = _342;
        if (_334)
        {
            int _350 = int(0x80000000) & as_type<int>(_214);
            int _352 = _348 | _350;
            _308 = as_type<float>(_352);
        }
        float _354 = _308;
        bool _356 = !_322;
        bool _358 = _356 && _326;
        _310 = _354;
        if (!_358)
        {
            float _360 = abs(_214);
            float _362 = abs(_218);
            float _364 = precise::max(_360, _362);
            float _366 = abs(_214);
            float _368 = abs(_218);
            float _370 = precise::min(_366, _368);
            float _372 = 1.0 / _364;
            float _374 = abs(_214);
            float _376 = abs(_218);
            bool _378 = _374 > _376;
            bool _380 = as_type<int>(_218) >= 0;
            float _382 = _370 * _372;
            float _384 = abs(_214);
            float _386 = abs(_218);
            float _388 = _384 + _386;
            int _390 = as_type<int>(_214) & int(0x80000000);
            float _392 = _382 * _382;
            bool _394 = _388 > as_type<float>(0x7f800000u /* inf */);
            bool _396 = isnan(_388);
            bool _398 = _394 || _396;
            bool _400 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _402 = _398 || _400;
            float _404 = _392 + 11.33538818359375;
            float _406 = fma(_392, _404, 28.84246826171875);
            float _408 = fma(_392, _406, 19.6966705322265625);
            float _410 = fma(_392, -0.82336294651031494140625, -5.674867153167724609375);
            float _412 = fma(_392, _410, -6.565555095672607421875);
            float _414 = 1.0 / _408;
            float _416 = _392 * _412;
            float _418 = _382 * _416;
            float _420 = fma(_418, _414, _382);
            float _422 = _420;
            _310 = _388;
            if (_378)
            {
                float _424 = -_420;
                float _426 = _424 + 1.57079637050628662109375;
                _422 = _426;
            }
            float _428 = _422;
            int _430 = as_type<int>(_428);
            if (!_380)
            {
                float _432 = -_428;
                float _434 = _432 + 3.1415927410125732421875;
                _430 = as_type<int>(_434);
            }
            int _436 = _430;
            if (!_402)
            {
                int _438 = _390 | _436;
                _310 = as_type<float>(_438);
            }
        }
    }
    float _440 = _310;
    float _442 = exp2(_274);
    float _444 = fma(_440, 5.0, _294);
    float _446 = fma(_440, 3.0, _294);
    bool _448 = _258 > 0.0;
    float _450 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _452 = _444 * 0.15915493667125701904296875;
    float _454 = _446 * 0.15915493667125701904296875;
    float _456 = precise::max(_184, -0.5);
    float _458 = -_144;
    float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[76].x, _200);
    bool _462 = _258 >= 0.0;
    bool _464 = isnan(_258);
    bool _466 = _462 || _464;
    bool _468 = isnan(0.0);
    bool _470 = _466 || _468;
    float _472 = _454 * 6.283185482025146484375;
    float _474 = sin(_472);
    float _476 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _252);
    float _478 = precise::min(_456, 0.5);
    float _480 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.16666667163372039794921875;
    int _482 = _470 ? 0 : 1;
    float _484 = -_442;
    float _486 = _484 + 1.0;
    bool _488 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _490 = isnan(0.0);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _496 = _492 || _494;
    float _498 = _452 * 6.283185482025146484375;
    float _500 = sin(_498);
    float _502 = fma(_478, -0.949999988079071044921875, 0.52499997615814208984375);
    float _504 = _180 + (-0.5);
    bool _506 = _204 > 0.0;
    float _508 = in.m_59.y;
    bool _510 = _204 >= 0.0;
    bool _512 = isnan(_204);
    bool _514 = _510 || _512;
    bool _516 = isnan(0.0);
    bool _518 = _514 || _516;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _522 = in.m_59.x;
    int _524 = ~_482;
    int _526 = _524 + 1;
    int _528 = _526 + 1;
    float _530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _532 = _528;
    float _534 = _508;
    float _536 = _522;
    if (!_448)
    {
        int _538 = ~_482;
        int _540 = _538 + 1;
        _532 = _540;
    }
    int _542 = _532;
    float _544 = _496 ? _486 : 0.0;
    float _546 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _520);
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _554 = _552 != 0;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _558 = _556 != 0;
    float _560 = _500 + _474;
    float _562 = in.m_61.x;
    float _564 = in.m_61.y;
    float _566 = in.m_61.z;
    int _568 = _286 ? 0 : 1;
    float _570 = _560 * 0.100000001490116119384765625;
    bool _572 = !_554;
    int _574 = _572 ? 0 : 1;
    float _576 = in.m_63.x;
    float _578 = in.m_63.y;
    float _580 = in.m_63.z;
    bool _582 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _584 = isnan(1.0);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _590 = _586 || _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _594 = 1.0 + _592;
    int _596 = abs(_574);
    float _598 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _546);
    float _600 = 1.0 / _594;
    float _602 = _166 + (-0.5);
    float _604 = float(_542);
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _608 = float(_596);
    int _610 = _518 ? 0 : 1;
    float _612 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[78].w, _606);
    int _614 = ~_568;
    int _616 = _614 + 1;
    int _618 = _616 + 1;
    float _620 = _608 * _604;
    int _622 = _618;
    if (!_276)
    {
        int _624 = ~_568;
        int _626 = _624 + 1;
        _622 = _626;
    }
    int _628 = _622;
    float _630 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _612);
    int _632 = ~_610;
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    float _638 = _620 * (-2.0);
    int _640 = _636;
    if (!_506)
    {
        int _642 = ~_610;
        int _644 = _642 + 1;
        _640 = _644;
    }
    int _646 = _640;
    float _648 = _570 * _502;
    if (_590)
    {
        float _650 = _544 * _600;
        _146 = _650;
    }
    float _652 = _146;
    float _654 = fma(_638, _564, _564);
    float _656 = fma(_254, _638, _254);
    float _658 = _168 + (-0.5);
    bool _660 = !_550;
    int _662 = _660 ? 0 : 1;
    float _664 = _578 * _578;
    bool _666 = !_558;
    int _668 = _666 ? 0 : 1;
    float _670 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[196].y, _654);
    int _672 = abs(_662);
    float _674 = -_576;
    float _676 = -_664;
    float _678 = fma(_576, _674, _676);
    float _680 = _648 * 0.85000002384185791015625;
    int _682 = abs(_668);
    float _684 = fma(_656, _652, _670);
    float _686 = float(_628);
    float _688 = fma(_680, _678, _184);
    float _690 = float(_672);
    float _692 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _694 = float(_646);
    float _696 = fma(_688, 5.0, _480);
    float _698 = float(_682);
    float _700 = _690 * _686;
    float _702 = _696 * 0.15915493667125701904296875;
    bool _704 = _168 > 0.5;
    float _706 = _698 * _694;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _710 = _708 != 0;
    float _712 = _700 * (-2.0);
    float _714 = in.m_65.x;
    float _716 = in.m_65.y;
    float _718 = in.m_65.z;
    float _720 = _706 * (-2.0);
    float _722 = _702 * 6.283185482025146484375;
    float _724 = sin(_722);
    float _726 = fma(_712, _562, _562);
    float _728 = fma(_450, _712, _450);
    float _730 = fma(_720, _566, _566);
    float _732 = fma(_260, _720, _260);
    float _734 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[196].x, _726);
    float _736 = _684 * 0.15915493667125701904296875;
    float _738 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[196].z, _730);
    float _740 = _684;
    float _742 = _578;
    float _744 = _576;
    float _746 = _580;
    if (_710)
    {
        float _748 = in.m_55.x;
        _740 = _748;
    }
    float _750 = _740;
    float _752 = fma(_728, _652, _734);
    float _754 = fma(_732, _652, _738);
    float _756 = _680 * _580;
    float _758 = _736 * 6.283185482025146484375;
    float _760 = sin(_758);
    float _762 = _752 * 0.15915493667125701904296875;
    float _764 = _754 * 0.15915493667125701904296875;
    float _766 = fma(_724, 0.074999988079071044921875, 0.974999964237213134765625);
    float _768 = fma(_576, _756, _174);
    float _770 = fma(_578, _756, _176);
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _774 = _772 != 0;
    float _776 = _736 * 6.283185482025146484375;
    float _778 = cos(_776);
    float _780 = _714 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _782 = _718 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _784 = _768 * _766;
    float _786 = _770 * _766;
    float _788 = _716 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _790 = _782 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _792 = _762 * 6.283185482025146484375;
    float _794 = cos(_792);
    float _796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _688);
    float _798 = _788 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _800 = _786 != 0.0;
    bool _802 = isnan(_786);
    bool _804 = _800 || _802;
    bool _806 = isnan(0.0);
    bool _808 = _804 || _806;
    bool _810 = _750 > 0.5;
    bool _812 = _810 && _710;
    float _814 = _796 * _790;
    bool _816 = _784 == 0.0;
    bool _818 = !_808;
    bool _820 = _816 && _818;
    float _822 = _764 * 6.283185482025146484375;
    float _824 = cos(_822);
    float _826 = 0.0;
    if (_710)
    {
        _826 = _522;
    }
    float _828 = _826;
    bool _830 = _688 == 0.0;
    bool _832 = _830 && _820;
    float _834 = _762 * 6.283185482025146484375;
    float _836 = sin(_834);
    float _838 = _794 * _778;
    float _840 = _794 * _760;
    float _842 = _828;
    if (_812)
    {
        float _844 = -_828;
        float _846 = _844 + 1.0;
        _842 = _846;
    }
    float _848 = _842;
    float _850 = _764 * 6.283185482025146484375;
    float _852 = sin(_850);
    float _854 = in.m_48.x;
    float _856 = in.m_48.y;
    float _858 = in.m_48.z;
    float _860 = _794 * _824;
    float _862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _786);
    float _864 = _778 * _824;
    if (!_832)
    {
        float _866 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[17].y, _578);
        _742 = _866;
    }
    float _868 = _742;
    if (!_832)
    {
        float _870 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[17].y, _576);
        _744 = _870;
    }
    float _872 = _744;
    float _874 = _862 * _798;
    float _876 = _836 * _778;
    float _878 = _836 * _824;
    float _880 = _836 * _760;
    float _882 = _760 * _824;
    float _884 = _780 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _886 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _784);
    float _888 = _860 * _874;
    float _890 = _878 * _874;
    float _892 = fma(_852, _838, _880);
    float _894 = _886 * _884;
    float _896 = fma(_852, _880, _838);
    float _898 = -_874;
    float _900 = _852 * _898;
    float _902 = -_840;
    float _904 = fma(_852, _876, _902);
    float _906 = -_876;
    float _908 = fma(_852, _840, _906);
    float _910 = fma(_892, _894, _888);
    float _912 = fma(_864, _894, _900);
    float _914 = fma(_904, _894, _890);
    float _916 = _856 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _918 = _856 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _920 = fma(_908, _814, _910);
    float _922 = fma(_882, _814, _912);
    float _924 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[4].x, _916);
    float _926 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[6].x, _918);
    float _928 = _920 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _930 = _920 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _932 = fma(_858, (*spvDescriptorSet0.vp_c10)._m0[4].z, _924);
    float _934 = fma(_896, _814, _914);
    float _936 = fma(_858, (*spvDescriptorSet0.vp_c10)._m0[6].z, _926);
    float _938 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[8].x, _928);
    float _940 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[10].x, _930);
    float _942 = _932 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _944 = _936 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _946 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[8].z, _938);
    float _948 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[10].z, _940);
    float _950 = _856 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _952 = _920 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _954 = _942 + _946;
    float _956 = _944 + _948;
    float _958 = -_508;
    float _960 = _958 + 1.0;
    float _962 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[5].x, _950);
    float _964 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _966 = _954 + _964;
    float _968 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _970 = _956 + _968;
    float _972 = _858;
    float _974 = _954;
    float _976 = _956;
    if (!_832)
    {
        float _978 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[17].y, _580);
        _746 = _978;
    }
    float _980 = _746;
    if (_774)
    {
        float _982 = _704 ? _960 : _508;
        _534 = _982;
    }
    float _984 = _534;
    float _986 = _966 * _966;
    float _988 = _970 * _970;
    float _990 = -_868;
    float _992 = _852 * _990;
    float _994 = fma(_858, (*spvDescriptorSet0.vp_c10)._m0[5].z, _962);
    float _996 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[9].x, _952);
    float _998 = _986 + _988;
    float _1000 = _860 * _868;
    float _1002 = _878 * _868;
    float _1004 = fma(_864, _872, _992);
    float _1006 = sqrt(_998);
    float _1008 = _986;
    float _1010 = _988;
    if (_710)
    {
        _536 = _848;
    }
    float _1012 = _536;
    float _1014 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[9].z, _996);
    float _1016 = _994 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1018 = _692 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1020 = _530 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1022 = fma(_892, _872, _1000);
    float _1024 = _1016 + _1014;
    float _1026 = fma(_1018, _984, -0.5);
    float _1028 = fma(_1020, _1012, -0.5);
    float _1030 = fma(_904, _872, _1002);
    float _1032 = fma(_882, _980, _1004);
    float _1034 = fma(_908, _980, _1022);
    float _1036 = -_476;
    float _1038 = fma(_630, _1026, _1036);
    float _1040 = fma(_598, _1028, _460);
    float _1042 = fma(_896, _980, _1030);
    bool _1044 = _1006 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1046 = _1024;
    if (!_1044)
    {
        _972 = _1024;
    }
    float _1048 = _972;
    bool _1050 = !_1044;
    float _1052 = _1048;
    if (!_1050)
    {
        float _1054 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1056 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1058 = _1006 + _1056;
        float _1060 = rsqrt(_998);
        float _1062 = _1058 * _1054;
        float _1064 = _1024 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1066 = _1062 * 0.15915493667125701904296875;
        float _1068 = _1066 * 6.283185482025146484375;
        float _1070 = sin(_1068);
        float _1072 = _1066 * 6.283185482025146484375;
        float _1074 = cos(_1072);
        float _1076 = fma(_1070, _1064, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1078 = _1060 * _1076;
        float _1080 = fma(_966, _1078, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1082 = _1074 + (-1.0);
        float _1084 = fma(_970, _1078, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1086 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1088 = _1080 + _1086;
        float _1090 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1094 = _1084 + _1092;
        float _1096 = _1088 * _1088;
        float _1098 = fma(_1024, _1074, _1090);
        float _1100 = _1094 * _1094;
        _1052 = _1098;
        _1008 = _1096;
        _1010 = _1100;
        _974 = _1080;
        _976 = _1084;
    }
    float _1102 = _1052;
    float _1104 = _1008;
    float _1106 = _1010;
    float _1108 = _974;
    float _1110 = _976;
    float _1112 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1114 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1116 = _1102 + _1114;
    float _1118 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1120 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1122 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1112);
    float _1124 = fma(_1116, _1116, _1104);
    float _1126 = in.m_67.w;
    float _1128 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1118);
    float _1130 = _1124 + _1106;
    float _1132 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1120);
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1136 = sqrt(_1130);
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1148 = fma(_1042, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1132);
    float _1150 = fma(_1042, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1122);
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1154 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1156 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1158 = _1140 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1160 = _1142 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1162 = _1144 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1164 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1166 = _1038 + 0.5;
    float _1168 = _1040 + 0.5;
    float _1170 = fma(_1042, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1128);
    out.m_69.x = _1154;
    out.m_69.y = _1156;
    out.m_69.z = _1158;
    out.m_69.w = _1152;
    bool _1172 = _1136 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1174 = isnan(_1136);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1180 = _1176 || _1178;
    out.m_71.x = _1160;
    out.m_71.y = _1162;
    out.m_71.z = _1164;
    out.m_73.x = _1168;
    out.m_73.y = _1166;
    out.m_75.w = _1126;
    float _1182 = _1152;
    float _1184 = _1156;
    if (!_1180)
    {
        _1046 = 1.0;
    }
    float _1186 = _1046;
    out.m_77.x = _1148;
    out.m_77.y = _1150;
    out.m_77.z = _1170;
    bool _1188 = !_1180;
    float _1190 = _1186;
    if (!_1188)
    {
        bool _1192 = _1136 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1194 = isnan(_1136);
        bool _1196 = _1192 || _1194;
        bool _1198 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1200 = _1196 || _1198;
        if (!_1200)
        {
            float _1202 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1204 = _1136 + _1202;
            float _1206 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1208 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1206;
            float _1210 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1212 = _1210 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1214 = 1.0 / _1208;
            float _1216 = _1204 * _1214;
            float _1218 = fma(_1216, _1212, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1190 = _1218;
            _1220 = true;
        }
        else
        {
            bool _1222 = _1136 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1224 = isnan(_1136);
            bool _1226 = _1222 || _1224;
            bool _1228 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1230 = _1226 || _1228;
            if (!_1230)
            {
                float _1232 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1234 = _1136 + _1232;
                float _1236 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1238 = _1236 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1240 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1242 = _1240 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1244 = 1.0 / _1238;
                float _1246 = _1234 * _1244;
                float _1248 = fma(_1246, _1242, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1190 = _1248;
                _1220 = true;
            }
            else
            {
                _1190 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1220 = false;
    float _1250 = _1190;
    float _1252 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1254 = _1102 + _1252;
    float _1256 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1258 = _1108 + _1256;
    float _1260 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1262 = _1110 + _1260;
    float _1264 = fma(_1254, _1250, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1266 = fma(_1258, _1250, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1268 = fma(_1262, _1250, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1270 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1272 = _1264 + _1270;
    float _1274 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1276 = _1266 + _1274;
    float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1280 = _1268 + _1278;
    float _1282 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1284 = _1272 * _1272;
    float _1286 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1288 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1282);
    float _1290 = fma(_1276, _1276, _1284);
    float _1292 = fma(_1280, _1280, _1290);
    float _1294 = rsqrt(_1292);
    float _1296 = sqrt(_1292);
    float _1298 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1300 = _1276 * _1298;
    float _1302 = _1280 * _1298;
    float _1304 = _1300 * _1300;
    float _1306 = _1302 * _1302;
    float _1308 = _1304 + _1306;
    float _1310 = sqrt(_1308);
    bool _1312 = _1310 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1314 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1316 = _1310 + _1314;
    float _1318 = _1290;
    float _1320 = _1308;
    float _1322 = _1316;
    float _1324 = _1276;
    if (_1312)
    {
        float _1326 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1318 = _1326;
    }
    float _1328 = _1318;
    if (_1312)
    {
        float _1330 = rsqrt(_1308);
        _1320 = _1330;
    }
    float _1332 = _1320;
    if (_1312)
    {
        float _1334 = _1316 * _1328;
        _1322 = _1334;
    }
    float _1336 = _1322;
    if (_1312)
    {
        float _1338 = _1336 * 0.15915493667125701904296875;
        _1182 = _1338;
    }
    float _1340 = _1182;
    float _1342 = _1154;
    float _1344 = _1340;
    if (_1312)
    {
        float _1346 = _1340 * 6.283185482025146484375;
        float _1348 = sin(_1346);
        _1342 = _1348;
    }
    float _1350 = _1342;
    float _1352 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1354 = precise::max(0.0, _1352);
    float _1356 = _1328;
    float _1358 = _1354;
    if (_1312)
    {
        float _1360 = _1340 * 6.283185482025146484375;
        float _1362 = cos(_1360);
        _1356 = _1362;
    }
    float _1364 = _1356;
    float _1366 = -_1298;
    float _1368 = -_1354;
    float _1370 = fma(_1272, _1366, _1368);
    float _1372 = _1370;
    if (_1312)
    {
        float _1374 = _1370 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1184 = _1374;
    }
    float _1376 = _1184;
    float _1378 = _1376;
    if (!_1312)
    {
        _1344 = _1300;
    }
    float _1380 = _1344;
    float _1382 = _1350;
    float _1384 = _1380;
    if (_1312)
    {
        float _1386 = fma(_1350, _1376, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1378 = _1386;
    }
    float _1388 = _1378;
    float _1390 = _1388;
    if (!_1312)
    {
        _1382 = _1302;
    }
    float _1392 = _1382;
    float _1394 = _1392;
    float _1396 = _1364;
    if (_1312)
    {
        float _1398 = _1364 + (-1.0);
        _1358 = _1398;
    }
    float _1400 = _1358;
    float _1402 = _1400;
    if (_1312)
    {
        float _1404 = _1332 * _1388;
        _1390 = _1404;
    }
    float _1406 = _1390;
    if (_1312)
    {
        float _1408 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1402 = _1408;
    }
    float _1410 = _1402;
    float _1412 = _1410;
    if (_1312)
    {
        float _1414 = _1300 * _1406;
        _1384 = _1414;
    }
    float _1416 = _1384;
    if (_1312)
    {
        float _1418 = _1302 * _1406;
        _1394 = _1418;
    }
    float _1420 = _1394;
    float _1422 = fma(_942, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1312)
    {
        float _1424 = fma(_1370, _1364, _1410);
        _1372 = _1424;
    }
    float _1426 = _1372;
    if (!_1312)
    {
        _1412 = _1304;
    }
    float _1428 = _1412;
    float _1430 = _1428;
    if (_1312)
    {
        float _1432 = _1416 * _1416;
        _1430 = _1432;
    }
    float _1434 = _1430;
    if (!_1312)
    {
        _1396 = _1306;
    }
    float _1436 = _1396;
    float _1438 = _1436;
    if (_1312)
    {
        float _1440 = _1420 * _1420;
        _1438 = _1440;
    }
    float _1442 = _1438;
    float _1444 = fma(_1426, _1426, _1434);
    float _1446 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1448 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1450 = floor(_1422);
    float _1452 = _1444 + _1442;
    float _1454 = fma(_944, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1456 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1458 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1446);
    float _1460 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1448);
    float _1462 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1464 = fma(_1296, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1462);
    float _1466 = precise::clamp(_1464, 0.0, 1.0);
    float _1468 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1456);
    float _1470 = rsqrt(_1452);
    float _1472 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1458);
    float _1474 = -_1466;
    float _1476 = _1474 + 1.0;
    float _1478 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1468);
    float _1480 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1460);
    float _1482 = _1472 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1484 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1288);
    float _1486 = _1478 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1488 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1490 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1492 = abs(_1476);
    float _1494 = log2(_1492);
    float _1496 = _1484 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1498 = _1488 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1500 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1490);
    float _1502 = -_1450;
    float _1504 = _1422 + _1502;
    float _1506 = _1470 * _1416;
    float _1508 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1500);
    float _1510 = _1470 * _1426;
    float _1512 = _1470 * _1420;
    float _1514 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1516 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1508);
    float _1518 = floor(_1454);
    float _1520 = -_1498;
    float _1522 = fma(_1520, _1286, 1.0);
    float _1524 = -_1514;
    float _1526 = fma(_1510, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1524);
    float _1528 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1530 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1532 = -_1512;
    float _1534 = fma(_1532, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1526);
    float _1536 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1538 = log2(_1522);
    float _1540 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1528);
    float _1542 = fma(_1534, -0.5, 0.5);
    float _1544 = fma(_1534, 0.5, 0.5);
    float _1546 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1540);
    float _1548 = fma(_1544, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1550 = exp2(_1530);
    float _1552 = -_1518;
    float _1554 = _1454 + _1552;
    float _1556 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1536);
    float _1558 = _1510 + 1.0;
    float _1560 = fma(_1544, _1548, -0.212114393711090087890625);
    float _1562 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1546);
    float _1564 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1556);
    float _1566 = 1.0 / _1516;
    float _1568 = fma(_1544, _1560, 1.570728778839111328125);
    float _1570 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1564);
    float _1572 = _1538 * 0.693147182464599609375;
    float _1574 = sqrt(_1542);
    float _1576 = -_1510;
    float _1578 = fma(_1550, _1558, _1576);
    float _1580 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1582 = fma(_1578, 0.5, 0.5);
    float _1584 = _1570 * _1566;
    float _1586 = _1562 * _1566;
    float _1588 = fma(_1584, 0.5, 0.5);
    float _1590 = fma(_1586, -0.5, 0.5);
    float _1592 = _1574 * 0.636619746685028076171875;
    float2 _4668 = float2(_1504, _1554);
    float _1594 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4668, float2(0.0), isnan(_4668)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4668, float2(0.0), isnan(_4668)), level(0.0)).x;
    float3 _4679 = float3(_1588, _1590, _1580);
    float _1596 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4679, float3(0.0), isnan(_4679)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4679, float3(0.0), isnan(_4679)), level(0.0)).x;
    float _1598 = -_1568;
    float _1600 = fma(_1592, _1598, 1.0);
    float3 _4695 = float3(_1588, _1590, _1580);
    float4 _1603 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4695, float3(0.0), isnan(_4695)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4695, float3(0.0), isnan(_4695)), level(0.0)).xyzw;
    float _1605 = _1603.x;
    float _1607 = _1603.y;
    float _1609 = _1603.z;
    float _1611 = _1603.w;
    float2 _4711 = float2(_1600, _1582);
    float3 _1615 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4711, float2(0.0), isnan(_4711)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4711, float2(0.0), isnan(_4711)), level(0.0)).xyz;
    float _1617 = _1615.x;
    float _1619 = _1615.y;
    float _1621 = _1615.z;
    float _1623 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1625 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1627 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_79.x = _1276;
    out.m_79.y = _1272;
    out.m_79.z = _1280;
    float _1629 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1623);
    float _1631 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1625);
    float _1633 = _1570 + _1516;
    float _1635 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1629);
    float _1637 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1639 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1631);
    float _1641 = _1635 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1643 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1637);
    float _1645 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1639);
    float _1647 = _1633 * 0.5;
    float _1649 = 1.0 / _1641;
    float _1651 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1643);
    float _1653 = _1645 + _1516;
    out.gl_Position.x = _1570;
    out.gl_Position.y = _1562;
    out.gl_Position.z = _1645;
    out.gl_Position.w = _1516;
    float _1655 = _1651 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1657 = _1653 * 0.5;
    float _1659 = _1655 + _1641;
    float _1661 = exp2(_1627);
    bool _1663 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1665 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1667 = _1663 || _1665;
    bool _1669 = isnan(0.5);
    bool _1671 = _1667 || _1669;
    float _1673 = _1659 * _1649;
    float _1675 = _1673 * 0.5;
    float _1677 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1679 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1677);
    float _1681 = 1.0 / _1679;
    if (_1671)
    {
        _1324 = 1.0;
    }
    float _1683 = _1324;
    float _1685 = _1516 * 0.5;
    float _1687 = fma(_1562, -0.5, _1685);
    float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1691 = _1681 * _1689;
    out.m_81.x = _1647;
    out.m_81.y = _1687;
    out.m_81.z = _1657;
    out.m_81.w = _1516;
    float _1693 = abs(_1691);
    float _1695 = log2(_1693);
    float _1697 = _1695 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1699 = exp2(_1697);
    float _1701 = fma(_1699, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1703 = precise::clamp(_1701, 0.0, 1.0);
    float _1705 = in.m_83.x;
    float _1707 = fma(_1703, -2.0, 3.0);
    float _1709 = _1703 * _1703;
    float _1711 = _1709 * _1707;
    bool _1713 = _1691 <= 8000.0;
    bool _1715 = isnan(_1691);
    bool _1717 = _1713 || _1715;
    bool _1719 = isnan(8000.0);
    bool _1721 = _1717 || _1719;
    float _1723 = float(_1721);
    float _1725 = -_1711;
    float _1727 = _1725 + 1.0;
    float _1729 = fma(_1727, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1711);
    float _1731 = _1727;
    float _1733 = _1683;
    if (_1671)
    {
        _1731 = 1.0;
    }
    float _1735 = _1731;
    float _1737 = _1723 * _1729;
    float _1739 = _1735;
    float _1741 = _1617;
    float _1743 = _1705;
    if (!_1671)
    {
        float _1745 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1747 = _1745 * 0.15915493667125701904296875;
        float _1749 = _1747 * 6.283185482025146484375;
        float _1751 = cos(_1749);
        float _1753 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1755 = _1753 * 0.15915493667125701904296875;
        float _1757 = _1747 * 6.283185482025146484375;
        float _1759 = sin(_1757);
        float _1761 = 1.0 / _1751;
        float _1763 = _1755 * 6.283185482025146484375;
        float _1765 = cos(_1763);
        float _1767 = _1759 * _1761;
        float _1769 = _1755 * 6.283185482025146484375;
        float _1771 = sin(_1769);
        float _1773 = _1765 * _1767;
        float _1775 = 1.0 / _1773;
        float _1777 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1779 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1777;
        float _1781 = 1.0 / _1779;
        float _1783 = _1771 * _1775;
        float _1785 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1787 = fma(_1691, _1783, _1785);
        float _1789 = _1787 * _1781;
        float _1791 = precise::clamp(_1789, 0.0, 1.0);
        _1739 = _1791;
    }
    float _1793 = _1739;
    if (!_1671)
    {
        float _1795 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1797 = _1795 * 0.15915493667125701904296875;
        float _1799 = _1797 * 6.283185482025146484375;
        float _1801 = cos(_1799);
        float _1803 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1805 = _1803 * 0.15915493667125701904296875;
        float _1807 = _1797 * 6.283185482025146484375;
        float _1809 = sin(_1807);
        float _1811 = 1.0 / _1801;
        float _1813 = _1805 * 6.283185482025146484375;
        float _1815 = cos(_1813);
        float _1817 = _1809 * _1811;
        float _1819 = _1805 * 6.283185482025146484375;
        float _1821 = sin(_1819);
        float _1823 = _1815 * _1817;
        float _1825 = 1.0 / _1823;
        float _1827 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1829 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1827;
        float _1831 = 1.0 / _1829;
        float _1833 = _1821 * _1825;
        float _1835 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1837 = fma(_1691, _1833, _1835);
        float _1839 = _1837 * _1831;
        float _1841 = precise::clamp(_1839, 0.0, 1.0);
        float _1843 = -_1841;
        float _1845 = _1843 + 1.0;
        _1733 = _1845;
    }
    float _1847 = _1733;
    float _1849 = -_1661;
    float _1851 = _1849 + 1.0;
    float _1853 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1855 = -_1594;
    float _1857 = _1855 + 1.0;
    float _1859 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1861 = _1296 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1863 = isnan(_1296);
    bool _1865 = _1861 || _1863;
    bool _1867 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1869 = _1865 || _1867;
    float _1871 = _1857 * _1853;
    float _1873 = precise::clamp(_1871, 0.0, 1.0);
    float _1875 = _1859 * _1596;
    float _1877 = -_1859;
    float _1879 = _1877 + 1.0;
    float _1881 = -_1873;
    float _1883 = fma(_1881, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1885 = _1611 * _1875;
    float _1887 = _1621 * _1875;
    float _1889 = _1883 * _1705;
    float _1891 = _1611 * _1879;
    float _1893 = fma(_1617, _1885, _1605);
    float _1895 = fma(_1619, _1885, _1607);
    float _1897 = _1889 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1899 = fma(_1611, _1887, _1609);
    float _1901 = _1793 * _1847;
    float _1903 = _1879;
    float _1905 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _1907 = _1889;
    float _1909 = _1859;
    if (!_1869)
    {
        _1903 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1911 = _1903;
    out.m_85.x = _1897;
    float _1913 = _1911;
    float _1915 = _1911;
    if (!_1869)
    {
        _1905 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1917 = _1905;
    float _1919 = _1901 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1921 = _1917;
    float _1923 = _1917;
    if (!_1869)
    {
        _1741 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1925 = _1741;
    out.m_87.x = _1893;
    out.m_87.y = _1895;
    out.m_87.z = _1899;
    out.m_87.w = _1891;
    float _1927 = _1925;
    float _1929 = _1925;
    if (!_1869)
    {
        _1743 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1931 = _1743;
    float _1933 = _1931;
    float _1935 = _1931;
    if (!_1869)
    {
        _1907 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1937 = _1907;
    float _1939 = _1937;
    float _1941 = _1937;
    if (!_1869)
    {
        _1909 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1943 = _1909;
    bool _1945 = !_1869;
    float _1947 = _1943;
    float _1949 = _1943;
    if (!_1945)
    {
        bool _1951 = _1296 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1953 = isnan(_1296);
        bool _1955 = _1951 || _1953;
        bool _1957 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1959 = _1955 || _1957;
        if (!_1959)
        {
            float _1961 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1963 = _1296 + _1961;
            float _1965 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1967 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1965;
            float _1969 = 1.0 / _1967;
            float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1973 = _1971 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1975 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1977 = _1975 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1981 = _1979 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1985 = _1983 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1989 = _1987 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1991 = _1963 * _1969;
            float _1993 = precise::clamp(_1991, 0.0, 1.0);
            float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1999 = fma(_1993, _1973, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2001 = fma(_1993, _1997, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2003 = fma(_1993, _1977, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2005 = fma(_1993, _1981, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2007 = fma(_1993, _1985, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2009 = fma(_1993, _1989, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1923 = _2001;
            _1941 = _2007;
            _1915 = _1999;
            _1935 = _2005;
            _1929 = _2003;
            _1949 = _2009;
            _2011 = true;
        }
        else
        {
            bool _2013 = _1296 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2015 = isnan(_1296);
            bool _2017 = _2013 || _2015;
            bool _2019 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2021 = _2017 || _2019;
            if (!_2021)
            {
                _1913 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2023 = _1913;
            _1915 = _2023;
            if (!_2021)
            {
                _1921 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2025 = _1921;
            _1923 = _2025;
            if (!_2021)
            {
                _1927 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2027 = _1927;
            _1929 = _2027;
            if (!_2021)
            {
                _1933 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2029 = _1933;
            _1935 = _2029;
            if (!_2021)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2031 = _1939;
            _1941 = _2031;
            if (!_2021)
            {
                _1947 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2033 = _1947;
            bool _2035 = !_2021;
            _1949 = _2033;
            if (!_2035)
            {
                bool _2037 = _1296 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2039 = isnan(_1296);
                bool _2041 = _2037 || _2039;
                bool _2043 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2045 = _2041 || _2043;
                if (!_2045)
                {
                    float _2047 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2049 = _1296 + _2047;
                    float _2051 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2053 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2051;
                    float _2055 = 1.0 / _2053;
                    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2063 = _2061 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2067 = _2065 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2071 = _2069 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2077 = _2049 * _2055;
                    float _2079 = precise::clamp(_2077, 0.0, 1.0);
                    float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2083 = _2081 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2085 = fma(_2079, _2059, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2087 = fma(_2079, _2083, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2089 = fma(_2079, _2063, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2091 = fma(_2079, _2067, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2093 = fma(_2079, _2071, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2095 = fma(_2079, _2075, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1923 = _2087;
                    _1941 = _2093;
                    _1915 = _2085;
                    _1935 = _2091;
                    _1929 = _2089;
                    _1949 = _2095;
                    _2011 = true;
                }
                else
                {
                    _1923 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1915 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1935 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1929 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1949 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2011 = false;
    float _2097 = _1923;
    float _2099 = _1941;
    float _2101 = _1915;
    float _2103 = _1935;
    float _2105 = _1929;
    float _2107 = _1949;
    float _2109 = fma(_1150, -0.5, 0.5);
    float _2111 = precise::clamp(_2109, 0.0, 1.0);
    float _2113 = -_2097;
    float _2115 = _2113 + _2099;
    float _2117 = _1919 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2119 = -_2101;
    float _2121 = _2119 + _2103;
    out.m_89.x = 0.0;
    float _2123 = fma(_2111, _2115, _2097);
    float _2125 = fma(_2111, _2121, _2101);
    out.m_51.x = _2117;
    float _2127 = -_2105;
    float _2129 = _2127 + _2107;
    float _2131 = _2123 * 0.586610972881317138671875;
    bool _2133 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2135 = fma(_2111, _2129, _2105);
    float _2137 = fma(_2125, 0.298911988735198974609375, _2131);
    bool _2139 = _1793 > 0.0;
    bool _2141 = isnan(_1793);
    bool _2143 = _2139 || _2141;
    bool _2145 = isnan(0.0);
    bool _2147 = _2143 || _2145;
    float _2149 = fma(_2135, 0.114477999508380889892578125, _2137);
    bool _2151 = _1847 <= 0.0;
    bool _2153 = !_2147;
    bool _2155 = _2151 || _2153;
    float _2157 = -_2149;
    float _2159 = _2125 + _2157;
    float _2161 = -_2149;
    float _2163 = _2123 + _2161;
    float _2165 = -_2149;
    float _2167 = _2135 + _2165;
    float _2169 = fma(_2159, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2149);
    float _2171 = fma(_2163, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2149);
    float _2173 = fma(_2167, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2149);
    bool _2175 = !_2133;
    if (!_2175)
    {
        float _2177 = -_1264;
        float _2179 = _2177 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2181 = -_1266;
        float _2183 = _2181 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2185 = -_1268;
        float _2187 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2189 = _2179 * _2179;
        float _2191 = fma(_2183, _2183, _2189);
        float _2193 = fma(_2187, _2187, _2191);
        float _2195 = sqrt(_2193);
        float _2197 = rsqrt(_2193);
        float _2199 = -_2195;
        float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2203 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2205 = precise::clamp(_2203, 0.0, 1.0);
        float _2207 = _2183 * _2197;
        float _2209 = _2179 * _2197;
        float _2211 = abs(_2205);
        float _2213 = log2(_2211);
        float _2215 = _2187 * _2197;
        float _2217 = _2207 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2219 = _1150 * _2209;
        float _2221 = -_2209;
        float _2223 = -_2217;
        float _2225 = fma(_2221, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2223);
        float _2227 = fma(_1148, _2207, _2219);
        float _2229 = -_2215;
        float _2231 = fma(_2229, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2225);
        float _2233 = fma(_1170, _2215, _2227);
        float _2235 = precise::clamp(_2233, 0.0, 1.0);
        float _2237 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2239 = _2231 + _2237;
        float _2241 = _2213 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2243 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2245 = precise::clamp(_2243, 0.0, 1.0);
        float _2247 = exp2(_2241);
        float _2249 = _2247 * _2245;
        float _2251 = _2235 * _2249;
        float _2253 = _2251 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2255 = _2251 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2257 = _2251 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2253;
        out.m_89.y = _2255;
        out.m_89.z = _2257;
    }
    out.m_91.x = _2169;
    out.m_91.y = _2171;
    out.m_91.z = _2173;
    if (!_2155)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2259 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2259;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2011 = false;
    bool _1220 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_48.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    float _118 = as_type<float>(_110);
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _116;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2317 = as_type<float>(_126);
        out.gl_Position.z = _2317;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_53.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = _144;
    if (_140)
    {
        float _148 = float(_110);
        _118 = _148;
    }
    float _150 = _118;
    bool _152 = _144 >= _150;
    bool _154 = !_140;
    bool _156 = _152 || _154;
    float _158 = _150;
    if (_156)
    {
        _158 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _158;
    if (_156)
    {
        out.m_51.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2387 = as_type<float>(_164);
        out.gl_Position.z = _2387;
    }
    if (_156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = in.m_55.x;
    float _168 = in.m_55.y;
    float _170 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _172 = log2(_170);
    float _174 = in.m_57.x;
    float _176 = in.m_57.y;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _180 = in.m_55.z;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _184 = in.m_57.z;
    float _186 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _188 = _168 * 2.0;
    float _190 = _166 * 2.0;
    float _192 = abs(_176);
    float _194 = abs(_174);
    float _196 = precise::max(_192, _194);
    float _198 = -_178;
    float _200 = fma(_186, 2.0, _198);
    float _202 = _174 * 0.0625;
    float _204 = floor(_188);
    bool _206 = _196 >= 16.0;
    float _208 = _176 * 0.0625;
    float _210 = _180 * 2.0;
    float _212 = _180 + _166;
    float _214 = _206 ? _202 : _174;
    float _216 = _168 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _218 = _206 ? _208 : _176;
    float _220 = _168 + _180;
    float _222 = abs(_214);
    bool _224 = _222 != 0.0;
    bool _226 = isnan(_222);
    bool _228 = _224 || _226;
    bool _230 = isnan(0.0);
    bool _232 = _228 || _230;
    float _234 = floor(_210);
    float _236 = abs(_218);
    bool _238 = _236 == 0.0;
    float _240 = _220 + (-1.0);
    float _242 = abs(_218);
    bool _244 = _242 == 0.0;
    bool _246 = !_232;
    bool _248 = _244 && _246;
    float _250 = _212 + (-1.0);
    float _252 = fma(_216, -2.0, _182);
    float _254 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _256 = _168 + _166;
    float _258 = floor(_190);
    float _260 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _262 = _256 + (-1.0);
    bool _264 = false;
    int _266 = as_type<int>(_216);
    float _268 = _256;
    if (_248)
    {
        bool _270 = as_type<int>(_218) >= 0;
        _264 = _270;
    }
    bool _272 = _264;
    float _274 = _172 * _144;
    bool _276 = _234 > 0.0;
    bool _278 = _234 >= 0.0;
    bool _280 = isnan(_234);
    bool _282 = _278 || _280;
    bool _284 = isnan(0.0);
    bool _286 = _282 || _284;
    int _288 = _272 ? (-1) : 0;
    if (_248)
    {
        int _290 = _272 ? 0 : 1078530011;
        _266 = _290;
    }
    int _292 = _266;
    float _294 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0333333350718021392822265625;
    int _296 = _292;
    if (_248)
    {
        int _298 = int(0x80000000) & as_type<int>(_214);
        int _300 = _292 | _298;
        _268 = as_type<float>(_300);
    }
    float _302 = _268;
    bool _304 = !_232;
    bool _306 = _304 && _238;
    float _308 = _302;
    float _310 = _302;
    if (!_306)
    {
        float _312 = abs(_214);
        bool _314 = _312 != as_type<float>(0x7f800000u /* inf */);
        bool _316 = isnan(_312);
        bool _318 = _314 || _316;
        bool _320 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _322 = _318 || _320;
        float _324 = abs(_218);
        bool _326 = _324 == as_type<float>(0x7f800000u /* inf */);
        float _328 = abs(_218);
        bool _330 = _328 == as_type<float>(0x7f800000u /* inf */);
        bool _332 = !_322;
        bool _334 = _330 && _332;
        if (_334)
        {
            bool _336 = as_type<int>(_218) >= 0;
            _288 = _336 ? (-1) : 0;
        }
        int _338 = _288;
        if (_334)
        {
            _296 = 1075235812;
        }
        int _340 = _296;
        int _342 = _340;
        if (_334)
        {
            int _344 = ~_338;
            int _346 = (_344 != 0) ? _340 : 1061752795;
            _342 = _346;
        }
        int _348 = _342;
        if (_334)
        {
            int _350 = int(0x80000000) & as_type<int>(_214);
            int _352 = _348 | _350;
            _308 = as_type<float>(_352);
        }
        float _354 = _308;
        bool _356 = !_322;
        bool _358 = _356 && _326;
        _310 = _354;
        if (!_358)
        {
            float _360 = abs(_214);
            float _362 = abs(_218);
            float _364 = precise::max(_360, _362);
            float _366 = abs(_214);
            float _368 = abs(_218);
            float _370 = precise::min(_366, _368);
            float _372 = 1.0 / _364;
            float _374 = abs(_214);
            float _376 = abs(_218);
            bool _378 = _374 > _376;
            bool _380 = as_type<int>(_218) >= 0;
            float _382 = _370 * _372;
            float _384 = abs(_214);
            float _386 = abs(_218);
            float _388 = _384 + _386;
            int _390 = as_type<int>(_214) & int(0x80000000);
            float _392 = _382 * _382;
            bool _394 = _388 > as_type<float>(0x7f800000u /* inf */);
            bool _396 = isnan(_388);
            bool _398 = _394 || _396;
            bool _400 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _402 = _398 || _400;
            float _404 = _392 + 11.33538818359375;
            float _406 = fma(_392, _404, 28.84246826171875);
            float _408 = fma(_392, _406, 19.6966705322265625);
            float _410 = fma(_392, -0.82336294651031494140625, -5.674867153167724609375);
            float _412 = fma(_392, _410, -6.565555095672607421875);
            float _414 = 1.0 / _408;
            float _416 = _392 * _412;
            float _418 = _382 * _416;
            float _420 = fma(_418, _414, _382);
            float _422 = _420;
            _310 = _388;
            if (_378)
            {
                float _424 = -_420;
                float _426 = _424 + 1.57079637050628662109375;
                _422 = _426;
            }
            float _428 = _422;
            int _430 = as_type<int>(_428);
            if (!_380)
            {
                float _432 = -_428;
                float _434 = _432 + 3.1415927410125732421875;
                _430 = as_type<int>(_434);
            }
            int _436 = _430;
            if (!_402)
            {
                int _438 = _390 | _436;
                _310 = as_type<float>(_438);
            }
        }
    }
    float _440 = _310;
    float _442 = exp2(_274);
    float _444 = fma(_440, 5.0, _294);
    float _446 = fma(_440, 3.0, _294);
    bool _448 = _258 > 0.0;
    float _450 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _452 = _444 * 0.15915493667125701904296875;
    float _454 = _446 * 0.15915493667125701904296875;
    float _456 = precise::max(_184, -0.5);
    float _458 = -_144;
    float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[76].x, _200);
    bool _462 = _258 >= 0.0;
    bool _464 = isnan(_258);
    bool _466 = _462 || _464;
    bool _468 = isnan(0.0);
    bool _470 = _466 || _468;
    float _472 = _454 * 6.283185482025146484375;
    float _474 = sin(_472);
    float _476 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _252);
    float _478 = precise::min(_456, 0.5);
    float _480 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.16666667163372039794921875;
    int _482 = _470 ? 0 : 1;
    float _484 = -_442;
    float _486 = _484 + 1.0;
    bool _488 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _490 = isnan(0.0);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _496 = _492 || _494;
    float _498 = _452 * 6.283185482025146484375;
    float _500 = sin(_498);
    float _502 = fma(_478, -0.949999988079071044921875, 0.52499997615814208984375);
    float _504 = _180 + (-0.5);
    bool _506 = _204 > 0.0;
    float _508 = in.m_59.y;
    bool _510 = _204 >= 0.0;
    bool _512 = isnan(_204);
    bool _514 = _510 || _512;
    bool _516 = isnan(0.0);
    bool _518 = _514 || _516;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _522 = in.m_59.x;
    int _524 = ~_482;
    int _526 = _524 + 1;
    int _528 = _526 + 1;
    float _530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _532 = _528;
    float _534 = _508;
    float _536 = _522;
    if (!_448)
    {
        int _538 = ~_482;
        int _540 = _538 + 1;
        _532 = _540;
    }
    int _542 = _532;
    float _544 = _496 ? _486 : 0.0;
    float _546 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _520);
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _554 = _552 != 0;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _558 = _556 != 0;
    float _560 = _500 + _474;
    float _562 = in.m_61.x;
    float _564 = in.m_61.y;
    float _566 = in.m_61.z;
    int _568 = _286 ? 0 : 1;
    float _570 = _560 * 0.100000001490116119384765625;
    bool _572 = !_554;
    int _574 = _572 ? 0 : 1;
    float _576 = in.m_63.x;
    float _578 = in.m_63.y;
    float _580 = in.m_63.z;
    bool _582 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _584 = isnan(1.0);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _590 = _586 || _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _594 = 1.0 + _592;
    int _596 = abs(_574);
    float _598 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _546);
    float _600 = 1.0 / _594;
    float _602 = _166 + (-0.5);
    float _604 = float(_542);
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _608 = float(_596);
    int _610 = _518 ? 0 : 1;
    float _612 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[78].w, _606);
    int _614 = ~_568;
    int _616 = _614 + 1;
    int _618 = _616 + 1;
    float _620 = _608 * _604;
    int _622 = _618;
    if (!_276)
    {
        int _624 = ~_568;
        int _626 = _624 + 1;
        _622 = _626;
    }
    int _628 = _622;
    float _630 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _612);
    int _632 = ~_610;
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    float _638 = _620 * (-2.0);
    int _640 = _636;
    if (!_506)
    {
        int _642 = ~_610;
        int _644 = _642 + 1;
        _640 = _644;
    }
    int _646 = _640;
    float _648 = _570 * _502;
    if (_590)
    {
        float _650 = _544 * _600;
        _146 = _650;
    }
    float _652 = _146;
    float _654 = fma(_638, _564, _564);
    float _656 = fma(_254, _638, _254);
    float _658 = _168 + (-0.5);
    bool _660 = !_550;
    int _662 = _660 ? 0 : 1;
    float _664 = _578 * _578;
    bool _666 = !_558;
    int _668 = _666 ? 0 : 1;
    float _670 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[196].y, _654);
    int _672 = abs(_662);
    float _674 = -_576;
    float _676 = -_664;
    float _678 = fma(_576, _674, _676);
    float _680 = _648 * 0.85000002384185791015625;
    int _682 = abs(_668);
    float _684 = fma(_656, _652, _670);
    float _686 = float(_628);
    float _688 = fma(_680, _678, _184);
    float _690 = float(_672);
    float _692 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _694 = float(_646);
    float _696 = fma(_688, 5.0, _480);
    float _698 = float(_682);
    float _700 = _690 * _686;
    float _702 = _696 * 0.15915493667125701904296875;
    bool _704 = _168 > 0.5;
    float _706 = _698 * _694;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _710 = _708 != 0;
    float _712 = _700 * (-2.0);
    float _714 = in.m_65.x;
    float _716 = in.m_65.y;
    float _718 = in.m_65.z;
    float _720 = _706 * (-2.0);
    float _722 = _702 * 6.283185482025146484375;
    float _724 = sin(_722);
    float _726 = fma(_712, _562, _562);
    float _728 = fma(_450, _712, _450);
    float _730 = fma(_720, _566, _566);
    float _732 = fma(_260, _720, _260);
    float _734 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[196].x, _726);
    float _736 = _684 * 0.15915493667125701904296875;
    float _738 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[196].z, _730);
    float _740 = _684;
    float _742 = _578;
    float _744 = _576;
    float _746 = _580;
    if (_710)
    {
        float _748 = in.m_55.x;
        _740 = _748;
    }
    float _750 = _740;
    float _752 = fma(_728, _652, _734);
    float _754 = fma(_732, _652, _738);
    float _756 = _680 * _580;
    float _758 = _736 * 6.283185482025146484375;
    float _760 = sin(_758);
    float _762 = _752 * 0.15915493667125701904296875;
    float _764 = _754 * 0.15915493667125701904296875;
    float _766 = fma(_724, 0.074999988079071044921875, 0.974999964237213134765625);
    float _768 = fma(_576, _756, _174);
    float _770 = fma(_578, _756, _176);
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _774 = _772 != 0;
    float _776 = _736 * 6.283185482025146484375;
    float _778 = cos(_776);
    float _780 = _714 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _782 = _718 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _784 = _768 * _766;
    float _786 = _770 * _766;
    float _788 = _716 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _790 = _782 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _792 = _762 * 6.283185482025146484375;
    float _794 = cos(_792);
    float _796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _688);
    float _798 = _788 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _800 = _786 != 0.0;
    bool _802 = isnan(_786);
    bool _804 = _800 || _802;
    bool _806 = isnan(0.0);
    bool _808 = _804 || _806;
    bool _810 = _750 > 0.5;
    bool _812 = _810 && _710;
    float _814 = _796 * _790;
    bool _816 = _784 == 0.0;
    bool _818 = !_808;
    bool _820 = _816 && _818;
    float _822 = _764 * 6.283185482025146484375;
    float _824 = cos(_822);
    float _826 = 0.0;
    if (_710)
    {
        _826 = _522;
    }
    float _828 = _826;
    bool _830 = _688 == 0.0;
    bool _832 = _830 && _820;
    float _834 = _762 * 6.283185482025146484375;
    float _836 = sin(_834);
    float _838 = _794 * _778;
    float _840 = _794 * _760;
    float _842 = _828;
    if (_812)
    {
        float _844 = -_828;
        float _846 = _844 + 1.0;
        _842 = _846;
    }
    float _848 = _842;
    float _850 = _764 * 6.283185482025146484375;
    float _852 = sin(_850);
    float _854 = in.m_48.x;
    float _856 = in.m_48.y;
    float _858 = in.m_48.z;
    float _860 = _794 * _824;
    float _862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _786);
    float _864 = _778 * _824;
    if (!_832)
    {
        float _866 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[17].y, _578);
        _742 = _866;
    }
    float _868 = _742;
    if (!_832)
    {
        float _870 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[17].y, _576);
        _744 = _870;
    }
    float _872 = _744;
    float _874 = _862 * _798;
    float _876 = _836 * _778;
    float _878 = _836 * _824;
    float _880 = _836 * _760;
    float _882 = _760 * _824;
    float _884 = _780 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _886 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _784);
    float _888 = _860 * _874;
    float _890 = _878 * _874;
    float _892 = fma(_852, _838, _880);
    float _894 = _886 * _884;
    float _896 = fma(_852, _880, _838);
    float _898 = -_874;
    float _900 = _852 * _898;
    float _902 = -_840;
    float _904 = fma(_852, _876, _902);
    float _906 = -_876;
    float _908 = fma(_852, _840, _906);
    float _910 = fma(_892, _894, _888);
    float _912 = fma(_864, _894, _900);
    float _914 = fma(_904, _894, _890);
    float _916 = _856 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _918 = _856 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _920 = fma(_908, _814, _910);
    float _922 = fma(_882, _814, _912);
    float _924 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[4].x, _916);
    float _926 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[6].x, _918);
    float _928 = _920 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _930 = _920 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _932 = fma(_858, (*spvDescriptorSet0.vp_c10)._m0[4].z, _924);
    float _934 = fma(_896, _814, _914);
    float _936 = fma(_858, (*spvDescriptorSet0.vp_c10)._m0[6].z, _926);
    float _938 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[8].x, _928);
    float _940 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[10].x, _930);
    float _942 = _932 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _944 = _936 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _946 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[8].z, _938);
    float _948 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[10].z, _940);
    float _950 = _856 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _952 = _920 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _954 = _942 + _946;
    float _956 = _944 + _948;
    float _958 = -_508;
    float _960 = _958 + 1.0;
    float _962 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[5].x, _950);
    float _964 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _966 = _954 + _964;
    float _968 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _970 = _956 + _968;
    float _972 = _858;
    float _974 = _954;
    float _976 = _956;
    if (!_832)
    {
        float _978 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[17].y, _580);
        _746 = _978;
    }
    float _980 = _746;
    if (_774)
    {
        float _982 = _704 ? _960 : _508;
        _534 = _982;
    }
    float _984 = _534;
    float _986 = _966 * _966;
    float _988 = _970 * _970;
    float _990 = -_868;
    float _992 = _852 * _990;
    float _994 = fma(_858, (*spvDescriptorSet0.vp_c10)._m0[5].z, _962);
    float _996 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[9].x, _952);
    float _998 = _986 + _988;
    float _1000 = _860 * _868;
    float _1002 = _878 * _868;
    float _1004 = fma(_864, _872, _992);
    float _1006 = sqrt(_998);
    float _1008 = _986;
    float _1010 = _988;
    if (_710)
    {
        _536 = _848;
    }
    float _1012 = _536;
    float _1014 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[9].z, _996);
    float _1016 = _994 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1018 = _692 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1020 = _530 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1022 = fma(_892, _872, _1000);
    float _1024 = _1016 + _1014;
    float _1026 = fma(_1018, _984, -0.5);
    float _1028 = fma(_1020, _1012, -0.5);
    float _1030 = fma(_904, _872, _1002);
    float _1032 = fma(_882, _980, _1004);
    float _1034 = fma(_908, _980, _1022);
    float _1036 = -_476;
    float _1038 = fma(_630, _1026, _1036);
    float _1040 = fma(_598, _1028, _460);
    float _1042 = fma(_896, _980, _1030);
    bool _1044 = _1006 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1046 = _1024;
    if (!_1044)
    {
        _972 = _1024;
    }
    float _1048 = _972;
    bool _1050 = !_1044;
    float _1052 = _1048;
    if (!_1050)
    {
        float _1054 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1056 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1058 = _1006 + _1056;
        float _1060 = rsqrt(_998);
        float _1062 = _1058 * _1054;
        float _1064 = _1024 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1066 = _1062 * 0.15915493667125701904296875;
        float _1068 = _1066 * 6.283185482025146484375;
        float _1070 = sin(_1068);
        float _1072 = _1066 * 6.283185482025146484375;
        float _1074 = cos(_1072);
        float _1076 = fma(_1070, _1064, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1078 = _1060 * _1076;
        float _1080 = fma(_966, _1078, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1082 = _1074 + (-1.0);
        float _1084 = fma(_970, _1078, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1086 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1088 = _1080 + _1086;
        float _1090 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1094 = _1084 + _1092;
        float _1096 = _1088 * _1088;
        float _1098 = fma(_1024, _1074, _1090);
        float _1100 = _1094 * _1094;
        _1052 = _1098;
        _1008 = _1096;
        _1010 = _1100;
        _974 = _1080;
        _976 = _1084;
    }
    float _1102 = _1052;
    float _1104 = _1008;
    float _1106 = _1010;
    float _1108 = _974;
    float _1110 = _976;
    float _1112 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1114 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1116 = _1102 + _1114;
    float _1118 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1120 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1122 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1112);
    float _1124 = fma(_1116, _1116, _1104);
    float _1126 = in.m_67.w;
    float _1128 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1118);
    float _1130 = _1124 + _1106;
    float _1132 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1120);
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1136 = sqrt(_1130);
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1148 = fma(_1042, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1132);
    float _1150 = fma(_1042, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1122);
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1154 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1156 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1158 = _1140 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1160 = _1142 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1162 = _1144 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1164 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1166 = _1038 + 0.5;
    float _1168 = _1040 + 0.5;
    float _1170 = fma(_1042, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1128);
    out.m_69.x = _1154;
    out.m_69.y = _1156;
    out.m_69.z = _1158;
    out.m_69.w = _1152;
    bool _1172 = _1136 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1174 = isnan(_1136);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1180 = _1176 || _1178;
    out.m_71.x = _1160;
    out.m_71.y = _1162;
    out.m_71.z = _1164;
    out.m_73.x = _1168;
    out.m_73.y = _1166;
    out.m_75.w = _1126;
    float _1182 = _1152;
    float _1184 = _1156;
    if (!_1180)
    {
        _1046 = 1.0;
    }
    float _1186 = _1046;
    out.m_77.x = _1148;
    out.m_77.y = _1150;
    out.m_77.z = _1170;
    bool _1188 = !_1180;
    float _1190 = _1186;
    if (!_1188)
    {
        bool _1192 = _1136 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1194 = isnan(_1136);
        bool _1196 = _1192 || _1194;
        bool _1198 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1200 = _1196 || _1198;
        if (!_1200)
        {
            float _1202 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1204 = _1136 + _1202;
            float _1206 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1208 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1206;
            float _1210 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1212 = _1210 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1214 = 1.0 / _1208;
            float _1216 = _1204 * _1214;
            float _1218 = fma(_1216, _1212, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1190 = _1218;
            _1220 = true;
        }
        else
        {
            bool _1222 = _1136 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1224 = isnan(_1136);
            bool _1226 = _1222 || _1224;
            bool _1228 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1230 = _1226 || _1228;
            if (!_1230)
            {
                float _1232 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1234 = _1136 + _1232;
                float _1236 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1238 = _1236 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1240 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1242 = _1240 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1244 = 1.0 / _1238;
                float _1246 = _1234 * _1244;
                float _1248 = fma(_1246, _1242, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1190 = _1248;
                _1220 = true;
            }
            else
            {
                _1190 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1220 = false;
    float _1250 = _1190;
    float _1252 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1254 = _1102 + _1252;
    float _1256 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1258 = _1108 + _1256;
    float _1260 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1262 = _1110 + _1260;
    float _1264 = fma(_1254, _1250, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1266 = fma(_1258, _1250, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1268 = fma(_1262, _1250, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1270 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1272 = _1264 + _1270;
    float _1274 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1276 = _1266 + _1274;
    float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1280 = _1268 + _1278;
    float _1282 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1284 = _1272 * _1272;
    float _1286 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1288 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1282);
    float _1290 = fma(_1276, _1276, _1284);
    float _1292 = fma(_1280, _1280, _1290);
    float _1294 = rsqrt(_1292);
    float _1296 = sqrt(_1292);
    float _1298 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1300 = _1276 * _1298;
    float _1302 = _1280 * _1298;
    float _1304 = _1300 * _1300;
    float _1306 = _1302 * _1302;
    float _1308 = _1304 + _1306;
    float _1310 = sqrt(_1308);
    bool _1312 = _1310 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1314 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1316 = _1310 + _1314;
    float _1318 = _1290;
    float _1320 = _1308;
    float _1322 = _1316;
    float _1324 = _1276;
    if (_1312)
    {
        float _1326 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1318 = _1326;
    }
    float _1328 = _1318;
    if (_1312)
    {
        float _1330 = rsqrt(_1308);
        _1320 = _1330;
    }
    float _1332 = _1320;
    if (_1312)
    {
        float _1334 = _1316 * _1328;
        _1322 = _1334;
    }
    float _1336 = _1322;
    if (_1312)
    {
        float _1338 = _1336 * 0.15915493667125701904296875;
        _1182 = _1338;
    }
    float _1340 = _1182;
    float _1342 = _1154;
    float _1344 = _1340;
    if (_1312)
    {
        float _1346 = _1340 * 6.283185482025146484375;
        float _1348 = sin(_1346);
        _1342 = _1348;
    }
    float _1350 = _1342;
    float _1352 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1354 = precise::max(0.0, _1352);
    float _1356 = _1328;
    float _1358 = _1354;
    if (_1312)
    {
        float _1360 = _1340 * 6.283185482025146484375;
        float _1362 = cos(_1360);
        _1356 = _1362;
    }
    float _1364 = _1356;
    float _1366 = -_1298;
    float _1368 = -_1354;
    float _1370 = fma(_1272, _1366, _1368);
    float _1372 = _1370;
    if (_1312)
    {
        float _1374 = _1370 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1184 = _1374;
    }
    float _1376 = _1184;
    float _1378 = _1376;
    if (!_1312)
    {
        _1344 = _1300;
    }
    float _1380 = _1344;
    float _1382 = _1350;
    float _1384 = _1380;
    if (_1312)
    {
        float _1386 = fma(_1350, _1376, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1378 = _1386;
    }
    float _1388 = _1378;
    float _1390 = _1388;
    if (!_1312)
    {
        _1382 = _1302;
    }
    float _1392 = _1382;
    float _1394 = _1392;
    float _1396 = _1364;
    if (_1312)
    {
        float _1398 = _1364 + (-1.0);
        _1358 = _1398;
    }
    float _1400 = _1358;
    float _1402 = _1400;
    if (_1312)
    {
        float _1404 = _1332 * _1388;
        _1390 = _1404;
    }
    float _1406 = _1390;
    if (_1312)
    {
        float _1408 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1402 = _1408;
    }
    float _1410 = _1402;
    float _1412 = _1410;
    if (_1312)
    {
        float _1414 = _1300 * _1406;
        _1384 = _1414;
    }
    float _1416 = _1384;
    if (_1312)
    {
        float _1418 = _1302 * _1406;
        _1394 = _1418;
    }
    float _1420 = _1394;
    float _1422 = fma(_942, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1312)
    {
        float _1424 = fma(_1370, _1364, _1410);
        _1372 = _1424;
    }
    float _1426 = _1372;
    if (!_1312)
    {
        _1412 = _1304;
    }
    float _1428 = _1412;
    float _1430 = _1428;
    if (_1312)
    {
        float _1432 = _1416 * _1416;
        _1430 = _1432;
    }
    float _1434 = _1430;
    if (!_1312)
    {
        _1396 = _1306;
    }
    float _1436 = _1396;
    float _1438 = _1436;
    if (_1312)
    {
        float _1440 = _1420 * _1420;
        _1438 = _1440;
    }
    float _1442 = _1438;
    float _1444 = fma(_1426, _1426, _1434);
    float _1446 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1448 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1450 = floor(_1422);
    float _1452 = _1444 + _1442;
    float _1454 = fma(_944, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1456 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1458 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1446);
    float _1460 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1448);
    float _1462 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1464 = fma(_1296, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1462);
    float _1466 = precise::clamp(_1464, 0.0, 1.0);
    float _1468 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1456);
    float _1470 = rsqrt(_1452);
    float _1472 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1458);
    float _1474 = -_1466;
    float _1476 = _1474 + 1.0;
    float _1478 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1468);
    float _1480 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1460);
    float _1482 = _1472 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1484 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1288);
    float _1486 = _1478 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1488 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1490 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1492 = abs(_1476);
    float _1494 = log2(_1492);
    float _1496 = _1484 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1498 = _1488 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1500 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1490);
    float _1502 = -_1450;
    float _1504 = _1422 + _1502;
    float _1506 = _1470 * _1416;
    float _1508 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1500);
    float _1510 = _1470 * _1426;
    float _1512 = _1470 * _1420;
    float _1514 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1516 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1508);
    float _1518 = floor(_1454);
    float _1520 = -_1498;
    float _1522 = fma(_1520, _1286, 1.0);
    float _1524 = -_1514;
    float _1526 = fma(_1510, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1524);
    float _1528 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1530 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1532 = -_1512;
    float _1534 = fma(_1532, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1526);
    float _1536 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1538 = log2(_1522);
    float _1540 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1528);
    float _1542 = fma(_1534, -0.5, 0.5);
    float _1544 = fma(_1534, 0.5, 0.5);
    float _1546 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1540);
    float _1548 = fma(_1544, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1550 = exp2(_1530);
    float _1552 = -_1518;
    float _1554 = _1454 + _1552;
    float _1556 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1536);
    float _1558 = _1510 + 1.0;
    float _1560 = fma(_1544, _1548, -0.212114393711090087890625);
    float _1562 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1546);
    float _1564 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1556);
    float _1566 = 1.0 / _1516;
    float _1568 = fma(_1544, _1560, 1.570728778839111328125);
    float _1570 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1564);
    float _1572 = _1538 * 0.693147182464599609375;
    float _1574 = sqrt(_1542);
    float _1576 = -_1510;
    float _1578 = fma(_1550, _1558, _1576);
    float _1580 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1582 = fma(_1578, 0.5, 0.5);
    float _1584 = _1570 * _1566;
    float _1586 = _1562 * _1566;
    float _1588 = fma(_1584, 0.5, 0.5);
    float _1590 = fma(_1586, -0.5, 0.5);
    float _1592 = _1574 * 0.636619746685028076171875;
    float2 _4668 = float2(_1504, _1554);
    float _1594 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4668, float2(0.0), isnan(_4668)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4668, float2(0.0), isnan(_4668)), level(0.0)).x;
    float3 _4679 = float3(_1588, _1590, _1580);
    float _1596 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4679, float3(0.0), isnan(_4679)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4679, float3(0.0), isnan(_4679)), level(0.0)).x;
    float _1598 = -_1568;
    float _1600 = fma(_1592, _1598, 1.0);
    float3 _4695 = float3(_1588, _1590, _1580);
    float4 _1603 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4695, float3(0.0), isnan(_4695)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4695, float3(0.0), isnan(_4695)), level(0.0)).xyzw;
    float _1605 = _1603.x;
    float _1607 = _1603.y;
    float _1609 = _1603.z;
    float _1611 = _1603.w;
    float2 _4711 = float2(_1600, _1582);
    float3 _1615 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4711, float2(0.0), isnan(_4711)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4711, float2(0.0), isnan(_4711)), level(0.0)).xyz;
    float _1617 = _1615.x;
    float _1619 = _1615.y;
    float _1621 = _1615.z;
    float _1623 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1625 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1627 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_79.x = _1276;
    out.m_79.y = _1272;
    out.m_79.z = _1280;
    float _1629 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1623);
    float _1631 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1625);
    float _1633 = _1570 + _1516;
    float _1635 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1629);
    float _1637 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1639 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1631);
    float _1641 = _1635 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1643 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1637);
    float _1645 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1639);
    float _1647 = _1633 * 0.5;
    float _1649 = 1.0 / _1641;
    float _1651 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1643);
    float _1653 = _1645 + _1516;
    out.gl_Position.x = _1570;
    out.gl_Position.y = _1562;
    out.gl_Position.z = _1645;
    out.gl_Position.w = _1516;
    float _1655 = _1651 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1657 = _1653 * 0.5;
    float _1659 = _1655 + _1641;
    float _1661 = exp2(_1627);
    bool _1663 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1665 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1667 = _1663 || _1665;
    bool _1669 = isnan(0.5);
    bool _1671 = _1667 || _1669;
    float _1673 = _1659 * _1649;
    float _1675 = _1673 * 0.5;
    float _1677 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1679 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1677);
    float _1681 = 1.0 / _1679;
    if (_1671)
    {
        _1324 = 1.0;
    }
    float _1683 = _1324;
    float _1685 = _1516 * 0.5;
    float _1687 = fma(_1562, -0.5, _1685);
    float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1691 = _1681 * _1689;
    out.m_81.x = _1647;
    out.m_81.y = _1687;
    out.m_81.z = _1657;
    out.m_81.w = _1516;
    float _1693 = abs(_1691);
    float _1695 = log2(_1693);
    float _1697 = _1695 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1699 = exp2(_1697);
    float _1701 = fma(_1699, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1703 = precise::clamp(_1701, 0.0, 1.0);
    float _1705 = in.m_83.x;
    float _1707 = fma(_1703, -2.0, 3.0);
    float _1709 = _1703 * _1703;
    float _1711 = _1709 * _1707;
    bool _1713 = _1691 <= 8000.0;
    bool _1715 = isnan(_1691);
    bool _1717 = _1713 || _1715;
    bool _1719 = isnan(8000.0);
    bool _1721 = _1717 || _1719;
    float _1723 = float(_1721);
    float _1725 = -_1711;
    float _1727 = _1725 + 1.0;
    float _1729 = fma(_1727, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1711);
    float _1731 = _1727;
    float _1733 = _1683;
    if (_1671)
    {
        _1731 = 1.0;
    }
    float _1735 = _1731;
    float _1737 = _1723 * _1729;
    float _1739 = _1735;
    float _1741 = _1617;
    float _1743 = _1705;
    if (!_1671)
    {
        float _1745 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1747 = _1745 * 0.15915493667125701904296875;
        float _1749 = _1747 * 6.283185482025146484375;
        float _1751 = cos(_1749);
        float _1753 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1755 = _1753 * 0.15915493667125701904296875;
        float _1757 = _1747 * 6.283185482025146484375;
        float _1759 = sin(_1757);
        float _1761 = 1.0 / _1751;
        float _1763 = _1755 * 6.283185482025146484375;
        float _1765 = cos(_1763);
        float _1767 = _1759 * _1761;
        float _1769 = _1755 * 6.283185482025146484375;
        float _1771 = sin(_1769);
        float _1773 = _1765 * _1767;
        float _1775 = 1.0 / _1773;
        float _1777 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1779 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1777;
        float _1781 = 1.0 / _1779;
        float _1783 = _1771 * _1775;
        float _1785 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1787 = fma(_1691, _1783, _1785);
        float _1789 = _1787 * _1781;
        float _1791 = precise::clamp(_1789, 0.0, 1.0);
        _1739 = _1791;
    }
    float _1793 = _1739;
    if (!_1671)
    {
        float _1795 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1797 = _1795 * 0.15915493667125701904296875;
        float _1799 = _1797 * 6.283185482025146484375;
        float _1801 = cos(_1799);
        float _1803 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1805 = _1803 * 0.15915493667125701904296875;
        float _1807 = _1797 * 6.283185482025146484375;
        float _1809 = sin(_1807);
        float _1811 = 1.0 / _1801;
        float _1813 = _1805 * 6.283185482025146484375;
        float _1815 = cos(_1813);
        float _1817 = _1809 * _1811;
        float _1819 = _1805 * 6.283185482025146484375;
        float _1821 = sin(_1819);
        float _1823 = _1815 * _1817;
        float _1825 = 1.0 / _1823;
        float _1827 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1829 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1827;
        float _1831 = 1.0 / _1829;
        float _1833 = _1821 * _1825;
        float _1835 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1837 = fma(_1691, _1833, _1835);
        float _1839 = _1837 * _1831;
        float _1841 = precise::clamp(_1839, 0.0, 1.0);
        float _1843 = -_1841;
        float _1845 = _1843 + 1.0;
        _1733 = _1845;
    }
    float _1847 = _1733;
    float _1849 = -_1661;
    float _1851 = _1849 + 1.0;
    float _1853 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1855 = -_1594;
    float _1857 = _1855 + 1.0;
    float _1859 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1861 = _1296 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1863 = isnan(_1296);
    bool _1865 = _1861 || _1863;
    bool _1867 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1869 = _1865 || _1867;
    float _1871 = _1857 * _1853;
    float _1873 = precise::clamp(_1871, 0.0, 1.0);
    float _1875 = _1859 * _1596;
    float _1877 = -_1859;
    float _1879 = _1877 + 1.0;
    float _1881 = -_1873;
    float _1883 = fma(_1881, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1885 = _1611 * _1875;
    float _1887 = _1621 * _1875;
    float _1889 = _1883 * _1705;
    float _1891 = _1611 * _1879;
    float _1893 = fma(_1617, _1885, _1605);
    float _1895 = fma(_1619, _1885, _1607);
    float _1897 = _1889 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1899 = fma(_1611, _1887, _1609);
    float _1901 = _1793 * _1847;
    float _1903 = _1879;
    float _1905 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _1907 = _1889;
    float _1909 = _1859;
    if (!_1869)
    {
        _1903 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1911 = _1903;
    out.m_85.x = _1897;
    float _1913 = _1911;
    float _1915 = _1911;
    if (!_1869)
    {
        _1905 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1917 = _1905;
    float _1919 = _1901 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1921 = _1917;
    float _1923 = _1917;
    if (!_1869)
    {
        _1741 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1925 = _1741;
    out.m_87.x = _1893;
    out.m_87.y = _1895;
    out.m_87.z = _1899;
    out.m_87.w = _1891;
    float _1927 = _1925;
    float _1929 = _1925;
    if (!_1869)
    {
        _1743 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1931 = _1743;
    float _1933 = _1931;
    float _1935 = _1931;
    if (!_1869)
    {
        _1907 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1937 = _1907;
    float _1939 = _1937;
    float _1941 = _1937;
    if (!_1869)
    {
        _1909 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1943 = _1909;
    bool _1945 = !_1869;
    float _1947 = _1943;
    float _1949 = _1943;
    if (!_1945)
    {
        bool _1951 = _1296 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1953 = isnan(_1296);
        bool _1955 = _1951 || _1953;
        bool _1957 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1959 = _1955 || _1957;
        if (!_1959)
        {
            float _1961 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1963 = _1296 + _1961;
            float _1965 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1967 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1965;
            float _1969 = 1.0 / _1967;
            float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1973 = _1971 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1975 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1977 = _1975 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1981 = _1979 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1985 = _1983 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1989 = _1987 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1991 = _1963 * _1969;
            float _1993 = precise::clamp(_1991, 0.0, 1.0);
            float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1999 = fma(_1993, _1973, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2001 = fma(_1993, _1997, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2003 = fma(_1993, _1977, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2005 = fma(_1993, _1981, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2007 = fma(_1993, _1985, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2009 = fma(_1993, _1989, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1923 = _2001;
            _1941 = _2007;
            _1915 = _1999;
            _1935 = _2005;
            _1929 = _2003;
            _1949 = _2009;
            _2011 = true;
        }
        else
        {
            bool _2013 = _1296 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2015 = isnan(_1296);
            bool _2017 = _2013 || _2015;
            bool _2019 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2021 = _2017 || _2019;
            if (!_2021)
            {
                _1913 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2023 = _1913;
            _1915 = _2023;
            if (!_2021)
            {
                _1921 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2025 = _1921;
            _1923 = _2025;
            if (!_2021)
            {
                _1927 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2027 = _1927;
            _1929 = _2027;
            if (!_2021)
            {
                _1933 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2029 = _1933;
            _1935 = _2029;
            if (!_2021)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2031 = _1939;
            _1941 = _2031;
            if (!_2021)
            {
                _1947 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2033 = _1947;
            bool _2035 = !_2021;
            _1949 = _2033;
            if (!_2035)
            {
                bool _2037 = _1296 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2039 = isnan(_1296);
                bool _2041 = _2037 || _2039;
                bool _2043 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2045 = _2041 || _2043;
                if (!_2045)
                {
                    float _2047 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2049 = _1296 + _2047;
                    float _2051 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2053 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2051;
                    float _2055 = 1.0 / _2053;
                    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2063 = _2061 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2067 = _2065 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2071 = _2069 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2077 = _2049 * _2055;
                    float _2079 = precise::clamp(_2077, 0.0, 1.0);
                    float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2083 = _2081 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2085 = fma(_2079, _2059, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2087 = fma(_2079, _2083, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2089 = fma(_2079, _2063, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2091 = fma(_2079, _2067, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2093 = fma(_2079, _2071, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2095 = fma(_2079, _2075, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1923 = _2087;
                    _1941 = _2093;
                    _1915 = _2085;
                    _1935 = _2091;
                    _1929 = _2089;
                    _1949 = _2095;
                    _2011 = true;
                }
                else
                {
                    _1923 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1915 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1935 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1929 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1949 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2011 = false;
    float _2097 = _1923;
    float _2099 = _1941;
    float _2101 = _1915;
    float _2103 = _1935;
    float _2105 = _1929;
    float _2107 = _1949;
    float _2109 = fma(_1150, -0.5, 0.5);
    float _2111 = precise::clamp(_2109, 0.0, 1.0);
    float _2113 = -_2097;
    float _2115 = _2113 + _2099;
    float _2117 = _1919 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2119 = -_2101;
    float _2121 = _2119 + _2103;
    out.m_89.x = 0.0;
    float _2123 = fma(_2111, _2115, _2097);
    float _2125 = fma(_2111, _2121, _2101);
    out.m_51.x = _2117;
    float _2127 = -_2105;
    float _2129 = _2127 + _2107;
    float _2131 = _2123 * 0.586610972881317138671875;
    bool _2133 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2135 = fma(_2111, _2129, _2105);
    float _2137 = fma(_2125, 0.298911988735198974609375, _2131);
    bool _2139 = _1793 > 0.0;
    bool _2141 = isnan(_1793);
    bool _2143 = _2139 || _2141;
    bool _2145 = isnan(0.0);
    bool _2147 = _2143 || _2145;
    float _2149 = fma(_2135, 0.114477999508380889892578125, _2137);
    bool _2151 = _1847 <= 0.0;
    bool _2153 = !_2147;
    bool _2155 = _2151 || _2153;
    float _2157 = -_2149;
    float _2159 = _2125 + _2157;
    float _2161 = -_2149;
    float _2163 = _2123 + _2161;
    float _2165 = -_2149;
    float _2167 = _2135 + _2165;
    float _2169 = fma(_2159, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2149);
    float _2171 = fma(_2163, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2149);
    float _2173 = fma(_2167, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2149);
    bool _2175 = !_2133;
    if (!_2175)
    {
        float _2177 = -_1264;
        float _2179 = _2177 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2181 = -_1266;
        float _2183 = _2181 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2185 = -_1268;
        float _2187 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2189 = _2179 * _2179;
        float _2191 = fma(_2183, _2183, _2189);
        float _2193 = fma(_2187, _2187, _2191);
        float _2195 = sqrt(_2193);
        float _2197 = rsqrt(_2193);
        float _2199 = -_2195;
        float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2203 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2205 = precise::clamp(_2203, 0.0, 1.0);
        float _2207 = _2183 * _2197;
        float _2209 = _2179 * _2197;
        float _2211 = abs(_2205);
        float _2213 = log2(_2211);
        float _2215 = _2187 * _2197;
        float _2217 = _2207 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2219 = _1150 * _2209;
        float _2221 = -_2209;
        float _2223 = -_2217;
        float _2225 = fma(_2221, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2223);
        float _2227 = fma(_1148, _2207, _2219);
        float _2229 = -_2215;
        float _2231 = fma(_2229, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2225);
        float _2233 = fma(_1170, _2215, _2227);
        float _2235 = precise::clamp(_2233, 0.0, 1.0);
        float _2237 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2239 = _2231 + _2237;
        float _2241 = _2213 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2243 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2245 = precise::clamp(_2243, 0.0, 1.0);
        float _2247 = exp2(_2241);
        float _2249 = _2247 * _2245;
        float _2251 = _2235 * _2249;
        float _2253 = _2251 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2255 = _2251 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2257 = _2251 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2253;
        out.m_89.y = _2255;
        out.m_89.z = _2257;
    }
    out.m_91.x = _2169;
    out.m_91.y = _2171;
    out.m_91.z = _2173;
    if (!_2155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2259 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2259;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

